Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B180380357
	for <lists+alsa-devel@lfdr.de>; Fri, 14 May 2021 07:24:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB984178D;
	Fri, 14 May 2021 07:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB984178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620969897;
	bh=IyX4odDIIUwakGPG1KW63oEWBsaNGzSqCF82RdnrJvg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s4xk18oAh2ow4atcWIJGUnrvdfp5BXZZG9aO5dJQopzFs4QrHxj1gYwDx7OjTFBbn
	 OlallhDXkrQ2kXTFxnsi4z1nXudn2ifpJf2Z4wiNSmm/5Gk5E+p1fPdxT4j6LRvMos
	 VWv9DHY+HJiEeNxcNXRpq1hjDbhqoOqlVKR/PrOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34512F8026B;
	Fri, 14 May 2021 07:23:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBB14F80240; Fri, 14 May 2021 07:23:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=HTML_MESSAGE,PRX_APP_ATTACH,
 PRX_BODY_135,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36B43F8013A
 for <alsa-devel@alsa-project.org>; Fri, 14 May 2021 07:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36B43F8013A
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 14E5NBGn8007722,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 14E5NBGn8007722
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 May 2021 13:23:11 +0800
Received: from RTEXMBS05.realtek.com.tw (172.21.6.98) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 14 May 2021 13:23:11 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS05.realtek.com.tw (172.21.6.98) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 14 May 2021 13:23:10 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::3132:fefa:293c:f022]) by
 RTEXMBS01.realtek.com.tw ([fe80::3132:fefa:293c:f022%13]) with mapi id
 15.01.2106.013; Fri, 14 May 2021 13:23:10 +0800
From: Pshou <pshou@realtek.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Add some CLOVE SSIDs of ALC293
Thread-Topic: Add some CLOVE SSIDs of ALC293
Thread-Index: AddIgIhg2R7xbEAWSeW+zZ996OarMA==
Date: Fri, 14 May 2021 05:23:10 +0000
Message-ID: <0071b59925304565915258cb88cf070f@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.210]
x-kse-serverinfo: RTEXMBS05.realtek.com.tw, 9
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: =?us-ascii?Q?Clean,_bases:_2021/5/14_=3F=3F_01:35:00?=
x-kse-attachment-filter-triggered-rules: Clean
x-kse-attachment-filter-triggered-filters: Clean
x-kse-bulkmessagesfiltering-scan-result: protection disabled
Content-Type: multipart/mixed;
 boundary="_004_0071b59925304565915258cb88cf070frealtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 05/14/2021 05:06:28
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163650 [May 14 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: pshou@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 445 445 d5f7ae5578b0f01c45f955a2a751ac25953290c9
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {Tracking_susp_attach_format}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2; realtek.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 05/14/2021 05:09:00
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 05/14/2021 05:06:28
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 163650 [May 14 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: pshou@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 445 445 d5f7ae5578b0f01c45f955a2a751ac25953290c9
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {Tracking_susp_attach_format}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; realtek.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 05/14/2021 05:09:00
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

--_004_0071b59925304565915258cb88cf070frealtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alsa-devel ML:



Can you help me add some source code to patch_realtek.c?



Add some CLEVO SSID of alc293.



Best regards

Pshou


--_004_0071b59925304565915258cb88cf070frealtekcom_
Content-Type: application/octet-stream;
	name="0001-Add-some-Clove-SSIDs-of-ALC293.patch"
Content-Description: 0001-Add-some-Clove-SSIDs-of-ALC293.patch
Content-Disposition: attachment;
	filename="0001-Add-some-Clove-SSIDs-of-ALC293.patch"; size=3810;
	creation-date="Thu, 13 May 2021 16:46:29 GMT";
	modification-date="Fri, 14 May 2021 05:13:50 GMT"
Content-Transfer-Encoding: base64

RnJvbTogWW91ciBOYW1lIDx5b3VyQG5hbWUuY29tPg0KU3ViamVjdDogQUxTQTogaGRhL3JlYWx0
ZWs6IEFkZCBzb21lIENMT1ZFIFNTSURzIG9mIEFMQzI5Mw0KDQpGaXggInVzZSBhcyBoZWFkc2V0
IG1pYywgd2l0aG91dCBpdHMgb3duIGphY2sgZGV0ZWN0IiBwcm9ibGVuLg0KDQpTaWduZWQtb2Zm
LWJ5OiBZb3VyIE5hbWUgPHlvdXJAbmFtZS5jb20+DQpTaWduZWQtb2ZmLWJ5OiBQZWlTZW4gSG91
IDxwc2hvdUByZWFsdGVrLmNvbT4KZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVh
bHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggM2UyNjlkZS4uNTUy
ZTJjYiAxMDA2NDQKLS0tIGEvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKKysrIGIvc291
bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKQEAgLTgzODUsMTIgKzgzODUsMTkgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKIAlTTkRf
UENJX1FVSVJLKDB4MTU1OCwgMHg1MGI4LCAiQ2xldm8gTks1MFNaIiwgQUxDMjkzX0ZJWFVQX1NZ
U1RFTTc2X01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygweDE1NTgsIDB4NTBkNSwg
IkNsZXZvIE5QNTBENSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0UpLAog
CVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDUwZjAsICJDbGV2byBOSDUwQVtDREZdIiwgQUxDMjkz
X0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCisJU05EX1BDSV9RVUlSSygweDE1NTgs
IDB4NTBmMiwgIkNsZXZvIE5INTBFW1BSXSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9f
UFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDUwZjMsICJDbGV2byBOSDU4RFBR
IiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCisJU05EX1BDSV9RVUlS
SygweDE1NTgsIDB4NTBmNSwgIkNsZXZvIE5INTVFUFkiLCBBTEMyOTNfRklYVVBfU1lTVEVNNzZf
TUlDX05PX1BSRVNFTkNFKSwKKwlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg1MGY2LCAiQ2xldm8g
Tkg1NURQUSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0UpLAogCVNORF9Q
Q0lfUVVJUksoMHgxNTU4LCAweDUxMDEsICJDbGV2byBTNTEwV1UiLCBBTEMyOTNfRklYVVBfU1lT
VEVNNzZfTUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg1MTU3LCAi
Q2xldm8gVzUxN0dVMSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0UpLAog
CVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDUxYTEsICJDbGV2byBOUzUwTVUiLCBBTEMyOTNfRklY
VVBfU1lTVEVNNzZfTUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg3
MGExLCAiQ2xldm8gTkI3MFRbSEpLXSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9fUFJF
U0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDcwYjMsICJDbGV2byBOSzcwU0IiLCBB
TEMyOTNfRklYVVBfU1lTVEVNNzZfTUlDX05PX1BSRVNFTkNFKSwKKwlTTkRfUENJX1FVSVJLKDB4
MTU1OCwgMHg3MGYyLCAiQ2xldm8gTkg3OUVQWSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNf
Tk9fUFJFU0VOQ0UpLAorCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDcwZjMsICJDbGV2byBOSDc3
RFBRIiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCisJU05EX1BDSV9R
VUlSSygweDE1NTgsIDB4NzBmNCwgIkNsZXZvIE5INzdFUFkiLCBBTEMyOTNfRklYVVBfU1lTVEVN
NzZfTUlDX05PX1BSRVNFTkNFKSwKKwlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg3MGY2LCAiQ2xl
dm8gTkg3N0RQUS1ZIiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCiAJ
U05EX1BDSV9RVUlSSygweDE1NTgsIDB4ODIyOCwgIkNsZXZvIE5SNDBCVSIsIEFMQzI5M19GSVhV
UF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDg1
MjAsICJDbGV2byBOSDUwRFtDRF0iLCBBTEMyOTNfRklYVVBfU1lTVEVNNzZfTUlDX05PX1BSRVNF
TkNFKSwKIAlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg4NTIxLCAiQ2xldm8gTkg3N0RbQ0RdIiwg
QUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCkBAIC04NDA4LDkgKzg0MTUs
MTcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzI2OV9maXh1cF90Ymxb
XSA9IHsKIAlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHg4YTUxLCAiQ2xldm8gTkg3MFJDUS1ZIiwg
QUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCiAJU05EX1BDSV9RVUlSSygw
eDE1NTgsIDB4OGQ1MCwgIkNsZXZvIE5INTVSQ1EtTSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9N
SUNfTk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDk1MWQsICJDbGV2byBO
OTUwVFtDREZdIiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCisJU05E
X1BDSV9RVUlSSygweDE1NTgsIDB4OTYwMCwgIkNsZXZvIE45NjBLW1BSXSIsIEFMQzI5M19GSVhV
UF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweDk2
MWQsICJDbGV2byBOOTYwU1tDREZdIiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVT
RU5DRSksCiAJU05EX1BDSV9RVUlSSygweDE1NTgsIDB4OTcxZCwgIkNsZXZvIE45NzBUW0NERl0i
LCBBTEMyOTNfRklYVVBfU1lTVEVNNzZfTUlDX05PX1BSRVNFTkNFKSwKIAlTTkRfUENJX1FVSVJL
KDB4MTU1OCwgMHhhNTAwLCAiQ2xldm8gTkw1M1JVIiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01J
Q19OT19QUkVTRU5DRSksCisJU05EX1BDSV9RVUlSSygweDE1NTgsIDB4YTYwMCwgIkNsZXZvIE5M
NVhOVSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0UpLAorCVNORF9QQ0lf
UVVJUksoMHgxNTU4LCAweGIwMTgsICJDbGV2byBOUDUwRFtCRV0iLCBBTEMyOTNfRklYVVBfU1lT
VEVNNzZfTUlDX05PX1BSRVNFTkNFKSwKKwlTTkRfUENJX1FVSVJLKDB4MTU1OCwgMHhiMDE5LCAi
Q2xldm8gTkg3N0RbQkVdUSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0Up
LAorCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweGIwMjIsICJDbGV2byBOSDc3RFtEQ11bUVddIiwg
QUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCisJU05EX1BDSV9RVUlSSygw
eDE1NTgsIDB4YzAxOCwgIkNsZXZvIE5QNTBEW0JFXSIsIEFMQzI5M19GSVhVUF9TWVNURU03Nl9N
SUNfTk9fUFJFU0VOQ0UpLAorCVNORF9QQ0lfUVVJUksoMHgxNTU4LCAweGMwMTksICJDbGV2byBO
SDc3RFtCRV1RIiwgQUxDMjkzX0ZJWFVQX1NZU1RFTTc2X01JQ19OT19QUkVTRU5DRSksCisJU05E
X1BDSV9RVUlSSygweDE1NTgsIDB4YzAyMiwgIkNsZXZvIE5INzdbRENdW1FXXSIsIEFMQzI5M19G
SVhVUF9TWVNURU03Nl9NSUNfTk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAw
eDEwMzYsICJMZW5vdm8gUDUyMCIsIEFMQzIzM19GSVhVUF9MRU5PVk9fTVVMVElfQ09ERUNTKSwK
IAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgxMDQ4LCAiVGhpbmtDZW50cmUgU3RhdGlvbiIsIEFM
QzI4M19GSVhVUF9IRUFEU0VUX01JQyksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjBmMiwg
IlRoaW5rcGFkIFNMNDEwLzUxMCIsIEFMQzI2OV9GSVhVUF9TS1VfSUdOT1JFKSwK

--_004_0071b59925304565915258cb88cf070frealtekcom_--
