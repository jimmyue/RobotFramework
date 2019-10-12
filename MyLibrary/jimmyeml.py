import sys
sys.path.append('..')
from robot.api import logger
import yagmail

class jimmyeml(object):
	def __init__(self):
		pass

	def sendeml(self,emailist,subject,contents,attachment=0):
		"""
		Uses the input `emailist、subject、contents、attachment` to send email

		`emailist、contents、attachment` could be list

		No attachments are added by default

		For example,send email without attachments:
		| ${emailist} | Set Variable | test@126.com |
		| ${subject}  | Set Variable | Mail Subject |
		| ${contents} | Set Variable | This a test email! |

		When you do the following,then emil will send without attachments:
		| sendeml | ${emailist} | ${subject} | ${contents} |


		Also, you can send email with attachments like this:
		| ${emailist}   | create list  | test1@126.com  | test2@126.com |
		| ${subject}    | Set Variable | Mail Subject   |
		| ${contents}   | create list  | Dear all:      | This a test email! |
		| ${attachment} | create list  | D//attachment1 | D//attachment2 |

		When you do the following,then emil will send with attachments:
		| sendeml | ${emailist} | ${subject} | ${contents} | ${attachment} |
		"""
		yag = yagmail.SMTP(user='cmssystem@way-s.cn',password='cms#2018!',host='smtp.263.net')
		try:
			if attachment==0:
				yag.send(emailist,subject,contents)
			else:
				yag.send(emailist,subject,contents,attachment)
			print('\nThe mail was sent successfully!')
		except Exception as e:
			print (str(e))
