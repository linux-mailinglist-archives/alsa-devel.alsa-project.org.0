Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AB3C72BC3
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 09:13:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67ABE60209;
	Thu, 20 Nov 2025 09:13:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67ABE60209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763626420;
	bh=BDuiSvYVO5juVvfqzeumvsXg0Xka6tT3l8dU2zHvc4A=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XGY7QycC21rwGjHWNHVUsaK6C9pwTVtHygxVvSpfrUmehknFslN/Yo/x/gDfE3Krb
	 SRRADQ5zVe5RTc1u+Nuom2OPe8r7+JBasiOKxLQG1e5a5sCgYwOzwCJEY9g+EkC2bi
	 ZyDy7RQ+drDI/kGRew/jfkTU75aqptAfo9fpBIKk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B496AF805C6; Thu, 20 Nov 2025 09:13:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96453F805C8;
	Thu, 20 Nov 2025 09:13:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37DAAF8021D; Thu, 20 Nov 2025 09:12:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C320F80072
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 09:12:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C320F80072
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=k4WnBCQZ
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AK8CeglE1118842,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763626360; bh=HrcNRJGAvEPgH6jx51Hyx7WboVksqxPTGUExBuq42eo=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=k4WnBCQZXD4bi6qey0xUwuTimVGGF0fbuTq4+gzakTNcPs3sZG7batPVf+PgnKDH1
	 0AQFqsiJutQDu2RxZc2waxm6RjKPkxEHjkfaIOFZSFNVdijqjl2AOR2glqkFLMGuEd
	 yLAx4x1wYZVYmtstl3mfu2rPpKbKsroSsOBF3FNF6qZvKn59k2Ur68UWACsprgS4ev
	 LnhSA8wr3z/BHx/fGTxA84MYPLFkYl3Q9OsXf19o7ubH1i2XoMMESg2bCm0vqSckQF
	 60ewArNRtGUWtmenhc50Q0Wu0R9UhWSpxokon7cek6CEbj0qf7i5vwHx7K7fYtAzI1
	 9k3QH3sjdyrpA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AK8CeglE1118842
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Nov 2025 16:12:40 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Thu, 20 Nov 2025 16:12:38 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Thu, 20 Nov 2025 16:12:38 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::744:4bc9:832c:9b7e%10]) with mapi id
 15.02.1544.027; Thu, 20 Nov 2025 16:12:38 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Support Tas2781 and mute led for HP platform
Thread-Topic: Support Tas2781 and mute led for HP platform
Thread-Index: AdxZ9TkHdwxlpI8gQJCC76hamazeYA==
Date: Thu, 20 Nov 2025 08:12:38 +0000
Message-ID: <c9c11acbefa24f7e8d0c62daecc00ac8@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
Content-Type: multipart/mixed;
	boundary="_002_c9c11acbefa24f7e8d0c62daecc00ac8realtekcom_"
MIME-Version: 1.0
Message-ID-Hash: YYQTHLNBSAMEXR56P4BRTRBXBOK65HDU
X-Message-ID-Hash: YYQTHLNBSAMEXR56P4BRTRBXBOK65HDU
X-MailFrom: kailang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YYQTHLNBSAMEXR56P4BRTRBXBOK65HDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_c9c11acbefa24f7e8d0c62daecc00ac8realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch was supported Tas2781 and mute led for HP platform.

BR,
Kailang

--_002_c9c11acbefa24f7e8d0c62daecc00ac8realtekcom_
Content-Type: application/octet-stream;
	name="0000-alc3315-hp-tas2781-mute-led-003.patch"
Content-Description: 0000-alc3315-hp-tas2781-mute-led-003.patch
Content-Disposition: attachment;
	filename="0000-alc3315-hp-tas2781-mute-led-003.patch"; size=5027;
	creation-date="Thu, 20 Nov 2025 06:52:57 GMT";
	modification-date="Thu, 20 Nov 2025 07:55:31 GMT"
Content-Transfer-Encoding: base64

RnJvbSBmYWYwOGViMWViOTM5NWU1MGI3OGQ2MTNjZWI1M2YyZTEwOTE3YzEwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IFRodSwgMjAgTm92IDIwMjUgMTQ6NTI6NDYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEVuYWJsZSBNdXRlIExFRCBhbmQgVGFzMjc4MSBmb3IgSFAgcGxhdGZv
cm0KCkVuYWJsZSBTUEsgTXV0ZSBMZWQgYW5kIE1pYyBNdXRlIExlZCBmb3IgSFAgcGxhdGZvcm0u
Ckl0IHdhcyBhbHNvIGludGVncmF0ZWQgd2l0aCBUYXMyNzgxIHN1cHBvcnRlZC4KClByaW9yaXR5
OiBQMQpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+Cgpk
aWZmIC0tZ2l0IGEvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jIGIvc291bmQvaGRh
L2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jCmluZGV4IDI2OWI2YzFlM2I2ZC4uNDY1OGI1MzRiMzc5
IDEwMDY0NAotLS0gYS9zb3VuZC9oZGEvY29kZWNzL3JlYWx0ZWsvYWxjMjY5LmMKKysrIGIvc291
bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jCkBAIC0zNDA2LDcgKzM0MDYsNDIgQEAgc3Rh
dGljIHZvaWQgYWxjMjg3X2ZpeHVwX2xlbm92b190aGlua3BhZF93aXRoX2FsYzEzMTgoc3RydWN0
IGhkYV9jb2RlYyAqY29kZWMsCiAJc3BlYy0+cG93ZXJfaG9vayA9IGFsYzI4N19zNF9wb3dlcl9n
cGlvM19kZWZhdWx0OwogCXNwZWMtPmdlbi5wY21fcGxheWJhY2tfaG9vayA9IGFsYzI4N19hbGMx
MzE4X3BsYXliYWNrX3BjbV9ob29rOwogfQorLyogR1BJTzI6IG11dGUgbGVkIEdQSU8zOiBtaWNt
dXRlIGxlZCAqLworc3RhdGljIHZvaWQgYWxjMjQ1X3RhczI3ODFfc3BpX2hwX2ZpeHVwX211dGVs
ZWQoc3RydWN0IGhkYV9jb2RlYyAqY29kZWMsCisJCQkJCSAgY29uc3Qgc3RydWN0IGhkYV9maXh1
cCAqZml4LCBpbnQgYWN0aW9uKQoreworCXN0cnVjdCBhbGNfc3BlYyAqc3BlYyA9IGNvZGVjLT5z
cGVjOworCXN0YXRpYyBjb25zdCBoZGFfbmlkX3QgY29ubltdID0geyAweDAyIH07CiAKKwlzd2l0
Y2ggKGFjdGlvbikgeworCWNhc2UgSERBX0ZJWFVQX0FDVF9QUkVfUFJPQkU6CisJCXNwZWMtPmdl
bi5hdXRvX211dGVfdmlhX2FtcCA9IDE7CisJCXNuZF9oZGFfb3ZlcnJpZGVfY29ubl9saXN0KGNv
ZGVjLCAweDE3LCBBUlJBWV9TSVpFKGNvbm4pLCBjb25uKTsKKwkJYnJlYWs7CisJfQorCisJdGFz
Mjc4MV9maXh1cF9zcGkoY29kZWMsIGZpeCwgYWN0aW9uKTsKKwlhbGNfZml4dXBfaHBfZ3Bpb19s
ZWQoY29kZWMsIGFjdGlvbiwgMHgwNCwgMHgwKTsKKwlhbGMyODVfZml4dXBfaHBfY29lZl9taWNt
dXRlX2xlZChjb2RlYywgZml4LCBhY3Rpb24pOworfQorLyogSkQyOiBtdXRlIGxlZCBHUElPMzog
bWljbXV0ZSBsZWQgKi8KK3N0YXRpYyB2b2lkIGFsYzI0NV90YXMyNzgxX2kyY19ocF9maXh1cF9t
dXRlbGVkKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAorCQkJCQkgIGNvbnN0IHN0cnVjdCBoZGFf
Zml4dXAgKmZpeCwgaW50IGFjdGlvbikKK3sKKwlzdHJ1Y3QgYWxjX3NwZWMgKnNwZWMgPSBjb2Rl
Yy0+c3BlYzsKKwlzdGF0aWMgY29uc3QgaGRhX25pZF90IGNvbm5bXSA9IHsgMHgwMiB9OworCisJ
c3dpdGNoIChhY3Rpb24pIHsKKwljYXNlIEhEQV9GSVhVUF9BQ1RfUFJFX1BST0JFOgorCQlzcGVj
LT5nZW4uYXV0b19tdXRlX3ZpYV9hbXAgPSAxOworCQlzbmRfaGRhX292ZXJyaWRlX2Nvbm5fbGlz
dChjb2RlYywgMHgxNywgQVJSQVlfU0laRShjb25uKSwgY29ubik7CisJCWJyZWFrOworCX0KKwor
CXRhczI3ODFfZml4dXBfdHhud19pMmMoY29kZWMsIGZpeCwgYWN0aW9uKTsKKwlhbGMyNDVfZml4
dXBfaHBfbXV0ZV9sZWRfY29lZmJpdChjb2RlYywgZml4LCBhY3Rpb24pOworCWFsYzI4NV9maXh1
cF9ocF9jb2VmX21pY211dGVfbGVkKGNvZGVjLCBmaXgsIGFjdGlvbik7Cit9CiAvKgogICogQ2xl
YXIgQ09FRiAweDBkIChQQ0JFRVAgcGFzc3Rocm91Z2gpIGJpdCAweDQwIHdoZXJlIEJJT1Mgc2V0
cyBpdCB3cm9uZ2x5CiAgKiBhdCBQTSByZXN1bWUKQEAgLTM3MzcsNiArMzc3Miw4IEBAIGVudW0g
ewogCUFMQzI2OV9GSVhVUF9QT1NJVElWT19QMTVYX0hFQURTRVRfTUlDLAogCUFMQzI4OV9GSVhV
UF9BU1VTX1pFUEhZUlVTX0RVQUxfU1BLLAogCUFMQzI1Nl9GSVhVUF9WQUlPX1JQTF9NSUNfTk9f
UFJFU0VOQ0UsCisJQUxDMjQ1X0ZJWFVQX0hQX1RBUzI3ODFfU1BJX01VVEVfTEVELAorCUFMQzI0
NV9GSVhVUF9IUF9UQVMyNzgxX0kyQ19NVVRFX0xFRCwKIH07CiAKIC8qIEEgc3BlY2lhbCBmaXh1
cCBmb3IgTGVub3ZvIEM5NDAgYW5kIFlvZ2EgRHVldCA3OwpAQCAtNjE4NCw2ICs2MjIxLDE0IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgaGRhX2ZpeHVwIGFsYzI2OV9maXh1cHNbXSA9IHsKIAkJLmNo
YWluZWQgPSB0cnVlLAogCQkuY2hhaW5faWQgPSBBTEMyNjlfRklYVVBfTElNSVRfSU5UX01JQ19C
T09TVAogCX0KKwlbQUxDMjQ1X0ZJWFVQX0hQX1RBUzI3ODFfU1BJX01VVEVfTEVEXSA9IHsKKwkJ
LnR5cGUgPSBIREFfRklYVVBfRlVOQywKKwkJLnYuZnVuYyA9IGFsYzI0NV90YXMyNzgxX3NwaV9o
cF9maXh1cF9tdXRlbGVkLAorCX0sCisJW0FMQzI0NV9GSVhVUF9IUF9UQVMyNzgxX0kyQ19NVVRF
X0xFRF0gPSB7CisJCS50eXBlID0gSERBX0ZJWFVQX0ZVTkMsCisJCS52LmZ1bmMgPSBhbGMyNDVf
dGFzMjc4MV9pMmNfaHBfZml4dXBfbXV0ZWxlZCwKKwl9LAogfTsKIAogc3RhdGljIGNvbnN0IHN0
cnVjdCBoZGFfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewpAQCAtNjY5NCwxNSArNjczOSwx
NiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9xdWlyayBhbGMyNjlfZml4dXBfdGJsW10gPSB7
CiAJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGU2MCwgIkhQIFRyZWtrZXIgIiwgQUxDMjg3X0ZJ
WFVQX0NTMzVMNDFfSTJDXzIpLAogCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDhlNjEsICJIUCBU
cmVra2VyICIsIEFMQzI4N19GSVhVUF9DUzM1TDQxX0kyQ18yKSwKIAlTTkRfUENJX1FVSVJLKDB4
MTAzYywgMHg4ZTYyLCAiSFAgVHJla2tlciAiLCBBTEMyODdfRklYVVBfQ1MzNUw0MV9JMkNfMiks
Ci0JU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGVkNSwgIkhQIE1lcmlubzEzWCIsIEFMQzI0NV9G
SVhVUF9UQVMyNzgxX1NQSV8yKSwKLQlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4ZWQ2LCAiSFAg
TWVyaW5vMTMiLCBBTEMyNDVfRklYVVBfVEFTMjc4MV9TUElfMiksCi0JU05EX1BDSV9RVUlSSygw
eDEwM2MsIDB4OGVkNywgIkhQIE1lcmlubzE0IiwgQUxDMjQ1X0ZJWFVQX1RBUzI3ODFfU1BJXzIp
LAotCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDhlZDgsICJIUCBNZXJpbm8xNiIsIEFMQzI0NV9G
SVhVUF9UQVMyNzgxX1NQSV8yKSwKLQlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4ZWQ5LCAiSFAg
TWVyaW5vMTRXIiwgQUxDMjQ1X0ZJWFVQX1RBUzI3ODFfU1BJXzIpLAotCVNORF9QQ0lfUVVJUkso
MHgxMDNjLCAweDhlZGEsICJIUCBNZXJpbm8xNlciLCBBTEMyNDVfRklYVVBfVEFTMjc4MV9TUElf
MiksCi0JU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGY0MCwgIkhQIExhbXBhczE0IiwgQUxDMjg3
X0ZJWFVQX1RYTlcyNzgxX0kyQyksCi0JU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGY0MSwgIkhQ
IExhbXBhczE2IiwgQUxDMjg3X0ZJWFVQX1RYTlcyNzgxX0kyQyksCi0JU05EX1BDSV9RVUlSSygw
eDEwM2MsIDB4OGY0MiwgIkhQIExhbXBhc1cxNCIsIEFMQzI4N19GSVhVUF9UWE5XMjc4MV9JMkMp
LAorCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDhlZDUsICJIUCBFbGl0ZUJvb2sgOCBGbGlwIEcy
aSAxMyIsIEFMQzI0NV9GSVhVUF9IUF9UQVMyNzgxX1NQSV9NVVRFX0xFRCksCisJU05EX1BDSV9R
VUlSSygweDEwM2MsIDB4OGVkNiwgIkhQIEVsaXRlQm9vayA4IEcyaSAxMyIsIEFMQzI0NV9GSVhV
UF9IUF9UQVMyNzgxX1NQSV9NVVRFX0xFRCksCisJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGVk
NywgIkhQIEVsaXRlQm9vayA4IEcyaSAxNCIsIEFMQzI0NV9GSVhVUF9IUF9UQVMyNzgxX1NQSV9N
VVRFX0xFRCksCisJU05EX1BDSV9RVUlSSygweDEwM2MsIDB4OGVkOCwgIkhQIEVsaXRlQm9vayA4
IEcyaSAxNiIsIEFMQzI0NV9GSVhVUF9IUF9UQVMyNzgxX1NQSV9NVVRFX0xFRCksCisJU05EX1BD
SV9RVUlSSygweDEwM2MsIDB4OGVkOSwgIkhQIFpCb29rIEZpcmVmbHkgMTRXIiwgQUxDMjQ1X0ZJ
WFVQX0hQX1RBUzI3ODFfU1BJX01VVEVfTEVEKSwKKwlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4
ZWRhLCAiSFAgWkJvb2sgRmlyZWZseSAxNlciLCBBTEMyNDVfRklYVVBfSFBfVEFTMjc4MV9TUElf
TVVURV9MRUQpLAorCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDhmNDAsICJIUCBaQm9vayA4IEcy
YSAxNCIsIEFMQzI0NV9GSVhVUF9IUF9UQVMyNzgxX0kyQ19NVVRFX0xFRCksCisJU05EX1BDSV9R
VUlSSygweDEwM2MsIDB4OGY0MSwgIkhQIFpCb29rIDggRzJhIDE2IiwgQUxDMjQ1X0ZJWFVQX0hQ
X1RBUzI3ODFfSTJDX01VVEVfTEVEKSwKKwlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4ZjQyLCAi
SFAgWkJvb2sgOCBHMmEgMTRXIiwgQUxDMjQ1X0ZJWFVQX0hQX1RBUzI3ODFfSTJDX01VVEVfTEVE
KSwKKwlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4ZjYyLCAiSFAgWkJvb2sgOCBHMmEgMTZXIiwg
QUxDMjQ1X0ZJWFVQX0hQX1RBUzI3ODFfSTJDX01VVEVfTEVEKSwKIAlTTkRfUENJX1FVSVJLKDB4
MTA0MywgMHgxMDMyLCAiQVNVUyBWaXZvQm9vayBYNTEzRUEiLCBBTEMyNTZfRklYVVBfQVNVU19N
SUNfTk9fUFJFU0VOQ0UpLAogCVNORF9QQ0lfUVVJUksoMHgxMDQzLCAweDEwMzQsICJBU1VTIEdV
NjA1QyIsIEFMQzI4NV9GSVhVUF9BU1VTX0dVNjA1X1NQSV9TUEVBS0VSMl9UT19EQUMxKSwKIAlT
TkRfUENJX1FVSVJLKDB4MTA0MywgMHgxMDNlLCAiQVNVUyBYNTQwU0EiLCBBTEMyNTZfRklYVVBf
QVNVU19NSUMpLAo=

--_002_c9c11acbefa24f7e8d0c62daecc00ac8realtekcom_--
