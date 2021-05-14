Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFB0380573
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 10:49:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF0FD1785;
	Fri, 14 May 2021 10:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF0FD1785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620982145;
	bh=1y4wPA7ZP57WAj/XMZFmMtfogr4IUEPS1OLybOVksDs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oqm933a0S3leuo+yaK8OrosiTQ20oZSfVNqFi3FSz9JYoAYTaTYskalmgUBAC8vAD
	 8Tr/Is7EKCbtE1lOAQilTcNlE6GpBbyZLbdhmtCFsSmSNk7uEXSdo/TmMMX4XsOFaj
	 Xd0dvW3alzvWdzsV+NYBRooUnXB7U0NDvQoXb6wo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D484F8026B;
	Fri, 14 May 2021 10:47:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6851EF80240; Fri, 14 May 2021 10:47:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=HTML_MESSAGE,PRX_APP_ATTACH,
 PRX_BODY_135,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1D4CF8012A
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 10:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1D4CF8012A
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 14E8lOKJ1014027,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 14E8lOKJ1014027
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 May 2021 16:47:24 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 14 May 2021 16:47:23 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 14 May 2021 16:47:22 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::3132:fefa:293c:f022]) by
 RTEXMBS01.realtek.com.tw ([fe80::3132:fefa:293c:f022%13]) with mapi id
 15.01.2106.013; Fri, 14 May 2021 16:47:22 +0800
From: Pshou <pshou@realtek.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Add some CLOVE SSIDs of ALC293
Thread-Topic: Add some CLOVE SSIDs of ALC293
Thread-Index: AddIna1jdp39yg0SQx+ey7VhdONXlQ==
Date: Fri, 14 May 2021 08:47:22 +0000
Message-ID: <5814caa848754d58815c49cdff04893c@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.210]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2021/5/14_=3F=3F_06:00:00?=
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: multipart/mixed;
 boundary="_004_5814caa848754d58815c49cdff04893crealtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 05/14/2021 08:31:58
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163651 [May 14 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: pshou@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 445 445 d5f7ae5578b0f01c45f955a2a751ac25953290c9
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {Tracking_susp_attach_format}
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 05/14/2021 08:35:00
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 05/14/2021 08:31:58
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163651 [May 14 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: pshou@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 445 445 d5f7ae5578b0f01c45f955a2a751ac25953290c9
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {Tracking_susp_attach_format}
X-KSE-AntiSpam-Info: realtek.com:7.1.1; 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 05/14/2021 08:35:00
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>, Kailang <kailang@realtek.com>,
 Steve Wang <chirowang@realtek.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--_004_5814caa848754d58815c49cdff04893crealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


From: Pshou
Sent: Friday, May 14, 2021 1:23 PM
To: 'alsa-devel@alsa-project.org' <alsa-devel@alsa-project.org>
Cc: Kailang <kailang@realtek.com>; 'Takashi Iwai' <tiwai@suse.de>; Steve Wa=
ng <chirowang@realtek.com>
Subject: Add some CLOVE SSIDs of ALC293


Hi Alsa-devel ML:



Can you help me add some source code to patch_realtek.c?



Add some CLEVO SSID of alc293.



Best regards

Pshou


--_004_5814caa848754d58815c49cdff04893crealtekcom_
Content-Type: application/octet-stream;
	name="0001-Add-some-Clove-SSIDs-of-ALC293.patch"
Content-Description: 0001-Add-some-Clove-SSIDs-of-ALC293.patch
Content-Disposition: attachment;
	filename="0001-Add-some-Clove-SSIDs-of-ALC293.patch"; size=3773;
	creation-date="Thu, 13 May 2021 16:46:29 GMT";
	modification-date="Fri, 14 May 2021 08:35:00 GMT"
Content-Transfer-Encoding: base64

RnJvbTogUGVpU2VuIEhvdSA8cHNob3VAcmVhbHRlay5jb20+DQpTdWJqZWN0OiBBTFNBOiBoZGEv
cmVhbHRlazogQWRkIHNvbWUgQ0xPVkUgU1NJRHMgb2YgQUxDMjkzDQoNCkZpeCAidXNlIGFzIGhl
YWRzZXQgbWljLCB3aXRob3V0IGl0cyBvd24gamFjayBkZXRlY3QiIHByb2JsZW4uDQoNClNpZ25l
ZC1vZmYtYnk6IFBlaVNlbiBIb3UgPHBzaG91QHJlYWx0ZWsuY29tPgpkaWZmIC0tZ2l0IGEvc291
bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsu
YwppbmRleCAzZTI2OWRlLi41NTJlMmNiIDEwMDY0NAotLS0gYS9zb3VuZC9wY2kvaGRhL3BhdGNo
X3JlYWx0ZWsuYworKysgYi9zb3VuZC9wY2kvaGRhL3BhdGNoX3JlYWx0ZWsuYwpAQCAtODM4NSwx
MiArODM4NSwxOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2Zp
eHVwX3RibFtdID0gewogCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDUwYjgsICJDbGV2byBOSzUw
U1oiLCBBTEMyOTNfRklYVVBfU1lTVEVNNzZfTUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FV
SVJLKDB4MTU1OCwgMHg1MGQ1LCAiQ2xldm8gTlA1MEQ1IiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2
X01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDE1NTgsIDB4NTBmMCwgIkNsZXZv
IE5INTBBW0NERl0iLCBBTEMyOTNfRklYVVBfU1lTVEVNNzZfTUlDX05PX1BSRVNFTkNFKSwKKwlT
TkRfUENJX1FVSVJLKDB4MTU1OCwgMHg1MGYyLCAiQ2xldm8gTkg1MEVbUFJdIiwgQUxDMjkzX0ZJ
WFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDE1NTgsIDB4
NTBmMywgIkNsZXZvIE5INThEUFEiLCBBTEMyOTNfRklYVVBfU1lTVEVNNzZfTUlDX05PX1BSRVNF
TkNFKSwKKwlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg1MGY1LCAiQ2xldm8gTkg1NUVQWSIsIEFM
QzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0UpLAorCVNORF9QQ0lfUVVJUksoMHgx
NTU4LCAweDUwZjYsICJDbGV2byBOSDU1RFBRIiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19O
T19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDE1NTgsIDB4NTEwMSwgIkNsZXZvIFM1MTBX
VSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJ
UksoMHgxNTU4LCAweDUxNTcsICJDbGV2byBXNTE3R1UxIiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2
X01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDE1NTgsIDB4NTFhMSwgIkNsZXZv
IE5TNTBNVSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0UpLAogCVNORF9Q
Q0lfUVVJUksoMHgxNTU4LCAweDcwYTEsICJDbGV2byBOQjcwVFtISktdIiwgQUxDMjkzX0ZJWFVQ
X1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDE1NTgsIDB4NzBi
MywgIkNsZXZvIE5LNzBTQiIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0Up
LAorCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDcwZjIsICJDbGV2byBOSDc5RVBZIiwgQUxDMjkz
X0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCisJU05EX1BDSV9RVUlSSygweDE1NTgs
IDB4NzBmMywgIkNsZXZvIE5INzdEUFEiLCBBTEMyOTNfRklYVVBfU1lTVEVNNzZfTUlDX05PX1BS
RVNFTkNFKSwKKwlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg3MGY0LCAiQ2xldm8gTkg3N0VQWSIs
IEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0UpLAorCVNORF9QQ0lfUVVJUkso
MHgxNTU4LCAweDcwZjYsICJDbGV2byBOSDc3RFBRLVkiLCBBTEMyOTNfRklYVVBfU1lTVEVNNzZf
TUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg4MjI4LCAiQ2xldm8g
TlI0MEJVIiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BD
SV9RVUlSSygweDE1NTgsIDB4ODUyMCwgIkNsZXZvIE5INTBEW0NEXSIsIEFMQzI5M19GSVhVUF9T
WVNURU03Nl9NSUNfTk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDg1MjEs
ICJDbGV2byBOSDc3RFtDRF0iLCBBTEMyOTNfRklYVVBfU1lTVEVNNzZfTUlDX05PX1BSRVNFTkNF
KSwKQEAgLTg0MDgsOSArODQxNSwxNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9wY2lfcXVp
cmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDhhNTEs
ICJDbGV2byBOSDcwUkNRLVkiLCBBTEMyOTNfRklYVVBfU1lTVEVNNzZfTUlDX05PX1BSRVNFTkNF
KSwKIAlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg4ZDUwLCAiQ2xldm8gTkg1NVJDUS1NIiwgQUxD
MjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDE1
NTgsIDB4OTUxZCwgIkNsZXZvIE45NTBUW0NERl0iLCBBTEMyOTNfRklYVVBfU1lTVEVNNzZfTUlD
X05PX1BSRVNFTkNFKSwKKwlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg5NjAwLCAiQ2xldm8gTjk2
MEtbUFJdIiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BD
SV9RVUlSSygweDE1NTgsIDB4OTYxZCwgIkNsZXZvIE45NjBTW0NERl0iLCBBTEMyOTNfRklYVVBf
U1lTVEVNNzZfTUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg5NzFk
LCAiQ2xldm8gTjk3MFRbQ0RGXSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9fUFJFU0VO
Q0UpLAogCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweGE1MDAsICJDbGV2byBOTDUzUlUiLCBBTEMy
OTNfRklYVVBfU1lTVEVNNzZfTUlDX05PX1BSRVNFTkNFKSwKKwlTTkRfUENJX1FVSVJLKDB4MTU1
OCwgMHhhNjAwLCAiQ2xldm8gTkw1WE5VIiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19Q
UkVTRU5DRSksCisJU05EX1BDSV9RVUlSSygweDE1NTgsIDB4YjAxOCwgIkNsZXZvIE5QNTBEW0JF
XSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0UpLAorCVNORF9QQ0lfUVVJ
UksoMHgxNTU4LCAweGIwMTksICJDbGV2byBOSDc3RFtCRV1RIiwgQUxDMjkzX0ZJWFVQX1NZU1RF
TTc2X01JQ19OT19QUkVTRU5DRSksCisJU05EX1BDSV9RVUlSSygweDE1NTgsIDB4YjAyMiwgIkNs
ZXZvIE5INzdEW0RDXVtRV10iLCBBTEMyOTNfRklYVVBfU1lTVEVNNzZfTUlDX05PX1BSRVNFTkNF
KSwKKwlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHhjMDE4LCAiQ2xldm8gTlA1MERbQkVdIiwgQUxD
MjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCisJU05EX1BDSV9RVUlSSygweDE1
NTgsIDB4YzAxOSwgIkNsZXZvIE5INzdEW0JFXVEiLCBBTEMyOTNfRklYVVBfU1lTVEVNNzZfTUlD
X05PX1BSRVNFTkNFKSwKKwlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHhjMDIyLCAiQ2xldm8gTkg3
N1tEQ11bUVddIiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCiAJU05E
X1BDSV9RVUlSSygweDE3YWEsIDB4MTAzNiwgIkxlbm92byBQNTIwIiwgQUxDMjMzX0ZJWFVQX0xF
Tk9WT19NVUxUSV9DT0RFQ1MpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDEwNDgsICJUaGlu
a0NlbnRyZSBTdGF0aW9uIiwgQUxDMjgzX0ZJWFVQX0hFQURTRVRfTUlDKSwKIAlTTkRfUENJX1FV
SVJLKDB4MTdhYSwgMHgyMGYyLCAiVGhpbmtwYWQgU0w0MTAvNTEwIiwgQUxDMjY5X0ZJWFVQX1NL
VV9JR05PUkUpLAo=

--_004_5814caa848754d58815c49cdff04893crealtekcom_--
