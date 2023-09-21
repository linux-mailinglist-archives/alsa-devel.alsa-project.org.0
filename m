Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BFF7A9226
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 09:37:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADB5BA4C;
	Thu, 21 Sep 2023 09:36:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADB5BA4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695281862;
	bh=Fb53ZAWeSvsPS6bJr846kpA0M5RuBydMbxwNuwc3q1Y=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RsgHsiw49x5AEz8ff8WdpdAGaXtgjX129BHblM0b6Jlz9cFoVCCv6J3TIfx3AKmmL
	 W6mtaCJI2s+A63rB+w3ERkVgs3I1hlRt1N3BRnj9VdcxOaI1Db/z+2MUxiASAwWR2k
	 RxDlgWbVzwZhqrbNbauEJ9IQLG/w2AN14sL4hFas=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D4CAF8055A; Thu, 21 Sep 2023 09:36:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A95DF801F5;
	Thu, 21 Sep 2023 09:36:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16033F8025A; Thu, 21 Sep 2023 09:36:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11238F800AA
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 09:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11238F800AA
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 38L7aaikF2453938,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.92/5.92) with ESMTPS id 38L7aaikF2453938
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 21 Sep 2023 15:36:37 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 21 Sep 2023 15:36:36 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Thu, 21 Sep 2023 15:36:35 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b]) by
 RTEXMBS01.realtek.com.tw ([fe80::9cb8:8d5:b6b3:213b%5]) with mapi id
 15.01.2375.007; Thu, 21 Sep 2023 15:36:35 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>
Subject: Change model for those Lenovo Thinkpad 8 SSIDs
Thread-Topic: Change model for those Lenovo Thinkpad 8 SSIDs
Thread-Index: AdnsXlI8gEv4SsL2Ru+7F4g9O1Sdsg==
Date: Thu, 21 Sep 2023 07:36:35 +0000
Message-ID: <82a45234327c4c50b4988a27e9f64c37@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXDAG01.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: multipart/mixed;
	boundary="_002_82a45234327c4c50b4988a27e9f64c37realtekcom_"
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: JEY7TRM6DDA5EOILLO6YWDU53SRTNMY2
X-Message-ID-Hash: JEY7TRM6DDA5EOILLO6YWDU53SRTNMY2
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JEY7TRM6DDA5EOILLO6YWDU53SRTNMY2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_82a45234327c4c50b4988a27e9f64c37realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Change model for those SSIDs.
This was use CS AMP for speaker. So, it also need to fixed DAC 0x02 for 0x1=
7 pin.

BR,
Kailang

--_002_82a45234327c4c50b4988a27e9f64c37realtekcom_
Content-Type: application/octet-stream;
	name="0000-ALC287-MG-RTKC-CSAMP.patch"
Content-Description: 0000-ALC287-MG-RTKC-CSAMP.patch
Content-Disposition: attachment; filename="0000-ALC287-MG-RTKC-CSAMP.patch";
	size=3411; creation-date="Thu, 21 Sep 2023 07:23:15 GMT";
	modification-date="Thu, 21 Sep 2023 07:29:54 GMT"
Content-Transfer-Encoding: base64

RnJvbSAzNjgyYTgzODEzYzQ3ZTZlOGMyNTkxOTE1MTYwM2MxZjFiNTBkNDg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMjEgU2VwIDIwMjMgMTU6MjA6NDEgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEFMQzI4NyBtZXJnZSBSVEsgY29kZWMgd2l0aCBDUyBDUzM1TDQxIEFN
UAoKVGhpcyBpcyBtZXJnZSBtb2RlbCBBTEMyODdfRklYVVBfVEhJTktQQURfSTJTX1NQSyBhbmQK
QUxDMjg3X0ZJWFVQX0NTMzVMNDFfSTJDXzJfVEhJTktQQURfQUNQSS4KClNpZ25lZC1vZmYtYnk6
IEthaWxhbmcgWWFuZyA8a2FpbGFuZ0ByZWFsdGVrLmNvbT4KZGlmZiAtLWdpdCBhL3NvdW5kL3Bj
aS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNpL2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5k
ZXggNzUxNzgzZjNhMTVjLi40OGJiNTdiZDhkMTEgMTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEv
cGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC03
MzQzLDYgKzczNDMsNyBAQCBlbnVtIHsKIAlBTEMyNDVfRklYVVBfSFBfTVVURV9MRURfQ09FRkJJ
VCwKIAlBTEMyNDVfRklYVVBfSFBfWDM2MF9NVVRFX0xFRFMsCiAJQUxDMjg3X0ZJWFVQX1RISU5L
UEFEX0kyU19TUEssCisJQUxDMjg3X0ZJWFVQX01HX1JUS0NfQ1NBTVBfQ1MzNUw0MV9JMkNfVEhJ
TktQQUQsCiB9OwogCiAvKiBBIHNwZWNpYWwgZml4dXAgZm9yIExlbm92byBDOTQwIGFuZCBZb2dh
IER1ZXQgNzsKQEAgLTk0NDEsNiArOTQ0MiwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9m
aXh1cCBhbGMyNjlfZml4dXBzW10gPSB7CiAJCS50eXBlID0gSERBX0ZJWFVQX0ZVTkMsCiAJCS52
LmZ1bmMgPSBhbGMyODdfZml4dXBfYmluZF9kYWNzLAogCX0sCisJW0FMQzI4N19GSVhVUF9NR19S
VEtDX0NTQU1QX0NTMzVMNDFfSTJDX1RISU5LUEFEXSA9IHsKKwkJLnR5cGUgPSBIREFfRklYVVBf
RlVOQywKKwkJLnYuZnVuYyA9IGFsYzI4N19maXh1cF9iaW5kX2RhY3MsCisJCS5jaGFpbmVkID0g
dHJ1ZSwKKwkJLmNoYWluX2lkID0gQUxDMjg3X0ZJWFVQX0NTMzVMNDFfSTJDXzJfVEhJTktQQURf
QUNQSSwKKwl9LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzI2
OV9maXh1cF90YmxbXSA9IHsKQEAgLTk5ODgsMTQgKzk5OTUsMTQgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBzbmRfcGNpX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJL
KDB4MTdhYSwgMHgyMmJlLCAiVGhpbmtwYWQgWDEgQ2FyYm9uIDh0aCIsIEFMQzI4NV9GSVhVUF9U
SElOS1BBRF9IRUFEU0VUX0pBQ0spLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDIyYzEsICJU
aGlua3BhZCBQMSBHZW4gMyIsIEFMQzI4NV9GSVhVUF9USElOS1BBRF9OT19CQVNTX1NQS19IRUFE
U0VUX0pBQ0spLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDIyYzIsICJUaGlua3BhZCBYMSBF
eHRyZW1lIEdlbiAzIiwgQUxDMjg1X0ZJWFVQX1RISU5LUEFEX05PX0JBU1NfU1BLX0hFQURTRVRf
SkFDSyksCi0JU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjJmMSwgIlRoaW5rcGFkIiwgQUxDMjg3
X0ZJWFVQX0NTMzVMNDFfSTJDXzJfVEhJTktQQURfQUNQSSksCi0JU05EX1BDSV9RVUlSSygweDE3
YWEsIDB4MjJmMiwgIlRoaW5rcGFkIiwgQUxDMjg3X0ZJWFVQX0NTMzVMNDFfSTJDXzJfVEhJTktQ
QURfQUNQSSksCi0JU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjJmMywgIlRoaW5rcGFkIiwgQUxD
Mjg3X0ZJWFVQX0NTMzVMNDFfSTJDXzJfVEhJTktQQURfQUNQSSksCi0JU05EX1BDSV9RVUlSSygw
eDE3YWEsIDB4MjMxNiwgIlRoaW5rcGFkIFAxIEdlbiA2IiwgQUxDMjg3X0ZJWFVQX0NTMzVMNDFf
STJDXzJfVEhJTktQQURfQUNQSSksCi0JU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjMxNywgIlRo
aW5rcGFkIFAxIEdlbiA2IiwgQUxDMjg3X0ZJWFVQX0NTMzVMNDFfSTJDXzJfVEhJTktQQURfQUNQ
SSksCi0JU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjMxOCwgIlRoaW5rcGFkIFoxMyBHZW4yIiwg
QUxDMjg3X0ZJWFVQX0NTMzVMNDFfSTJDXzJfVEhJTktQQURfQUNQSSksCi0JU05EX1BDSV9RVUlS
SygweDE3YWEsIDB4MjMxOSwgIlRoaW5rcGFkIFoxNiBHZW4yIiwgQUxDMjg3X0ZJWFVQX0NTMzVM
NDFfSTJDXzJfVEhJTktQQURfQUNQSSksCi0JU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjMxYSwg
IlRoaW5rcGFkIFoxNiBHZW4yIiwgQUxDMjg3X0ZJWFVQX0NTMzVMNDFfSTJDXzJfVEhJTktQQURf
QUNQSSksCisJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjJmMSwgIlRoaW5rcGFkIiwgQUxDMjg3
X0ZJWFVQX01HX1JUS0NfQ1NBTVBfQ1MzNUw0MV9JMkNfVEhJTktQQUQpLAorCVNORF9QQ0lfUVVJ
UksoMHgxN2FhLCAweDIyZjIsICJUaGlua3BhZCIsIEFMQzI4N19GSVhVUF9NR19SVEtDX0NTQU1Q
X0NTMzVMNDFfSTJDX1RISU5LUEFEKSwKKwlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgyMmYzLCAi
VGhpbmtwYWQiLCBBTEMyODdfRklYVVBfTUdfUlRLQ19DU0FNUF9DUzM1TDQxX0kyQ19USElOS1BB
RCksCisJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjMxNiwgIlRoaW5rcGFkIFAxIEdlbiA2Iiwg
QUxDMjg3X0ZJWFVQX01HX1JUS0NfQ1NBTVBfQ1MzNUw0MV9JMkNfVEhJTktQQUQpLAorCVNORF9Q
Q0lfUVVJUksoMHgxN2FhLCAweDIzMTcsICJUaGlua3BhZCBQMSBHZW4gNiIsIEFMQzI4N19GSVhV
UF9NR19SVEtDX0NTQU1QX0NTMzVMNDFfSTJDX1RISU5LUEFEKSwKKwlTTkRfUENJX1FVSVJLKDB4
MTdhYSwgMHgyMzE4LCAiVGhpbmtwYWQgWjEzIEdlbjIiLCBBTEMyODdfRklYVVBfTUdfUlRLQ19D
U0FNUF9DUzM1TDQxX0kyQ19USElOS1BBRCksCisJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MjMx
OSwgIlRoaW5rcGFkIFoxNiBHZW4yIiwgQUxDMjg3X0ZJWFVQX01HX1JUS0NfQ1NBTVBfQ1MzNUw0
MV9JMkNfVEhJTktQQUQpLAorCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDIzMWEsICJUaGlua3Bh
ZCBaMTYgR2VuMiIsIEFMQzI4N19GSVhVUF9NR19SVEtDX0NTQU1QX0NTMzVMNDFfSTJDX1RISU5L
UEFEKSwKIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzMGJiLCAiVGhpbmtDZW50cmUgQUlPIiwg
QUxDMjMzX0ZJWFVQX0xFTk9WT19MSU5FMl9NSUNfSE9US0VZKSwKIAlTTkRfUENJX1FVSVJLKDB4
MTdhYSwgMHgzMGUyLCAiVGhpbmtDZW50cmUgQUlPIiwgQUxDMjMzX0ZJWFVQX0xFTk9WT19MSU5F
Ml9NSUNfSE9US0VZKSwKIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzMTBjLCAiVGhpbmtDZW50
cmUgU3RhdGlvbiIsIEFMQzI5NF9GSVhVUF9MRU5PVk9fTUlDX0xPQ0FUSU9OKSwK

--_002_82a45234327c4c50b4988a27e9f64c37realtekcom_--
