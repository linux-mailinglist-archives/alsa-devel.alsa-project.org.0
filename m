Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 569F6CD5598
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Dec 2025 10:38:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FE8F601A7;
	Mon, 22 Dec 2025 10:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FE8F601A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1766396297;
	bh=ZA2qP0G/a9M/P6UHxZt5AslOtMaaYfdSqdRp6fr6Zgw=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tgFTyJZe56D5DJy7YJWolfj2XV3WaM2jkkX349i5YyD/xVry7SxfuA3byP6w+mZrh
	 iujiFSFLoEKZGPtXAfEKMdmcYqZrwSQ0+LsVnX8p5TVHk7inP3zZrrxDGLreimvN8c
	 2CA78WfK82NblXV6lKWb9mAutvWL6EZ4I4JuZKvQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 125D7F805E4; Mon, 22 Dec 2025 10:37:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F270F805DA;
	Mon, 22 Dec 2025 10:37:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 621B3F80246; Mon, 22 Dec 2025 10:34:05 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7186AF80088
	for <alsa-devel@alsa-project.org>; Mon, 22 Dec 2025 10:33:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7186AF80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=E2PewdHk
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5BM9XiBlA3157941,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1766396024; bh=Jkm2kSar05WFpc8af/wZU6hw8iz8mm9ZSwUx4Vm1ynY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version;
	b=E2PewdHkSXkGQOdVrCtA2GoEJ61nKmmDtyclZJ6TqCZpcPehDtEDDgIuRsuFVF43G
	 PaHkul1bmJn6XFTXkVxyOUgpsIlgwFNjCQU6ALmQYIYDA9E8BIHpOTFchemC/8lNkI
	 qOjFAKGa4nfpuozcJWMI/9WTCHNf8tTB5SqcNfxfURftVU4HxujQ3nbMArfixEwWRT
	 cNQP1RZMg8Od1zmcVoeov2RXH69ZSububl4zocNz8LzEClLjx28ton2s+apvSMcI9N
	 DsuFaCtTYUZWPiRVOPrXMRPs4EZFuwVANvPruVKBl1V2GF//0pZQGIkBbpd/1IDGJp
	 saOe4VPQOgBQw==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5BM9XiBlA3157941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Dec 2025 17:33:44 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 22 Dec 2025 17:33:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 22 Dec 2025 17:33:44 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::4cbd:6c6c:b92b:3913%10]) with mapi id
 15.02.1748.010; Mon, 22 Dec 2025 17:33:44 +0800
From: Kailang <kailang@realtek.com>
To: "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
CC: " (alsa-devel@alsa-project.org)" <alsa-devel@alsa-project.org>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Subject: Enable Mute LED for Lenovo platform
Thread-Topic: Enable Mute LED for Lenovo platform
Thread-Index: AdxzJZTpQBMS0SqrS+iIpeTmji/LTA==
Date: Mon, 22 Dec 2025 09:33:44 +0000
Message-ID: <8a99edffee044e13b6e348d1b69c2b57@realtek.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: yes
x-originating-ip: [172.21.6.42]
Content-Type: multipart/mixed;
	boundary="_002_8a99edffee044e13b6e348d1b69c2b57realtekcom_"
MIME-Version: 1.0
Message-ID-Hash: UW6V3BU5F32MFSL3MXQNIDER3HFN34YN
X-Message-ID-Hash: UW6V3BU5F32MFSL3MXQNIDER3HFN34YN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UW6V3BU5F32MFSL3MXQNIDER3HFN34YN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--_002_8a99edffee044e13b6e348d1b69c2b57realtekcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Attach patch was for enable mute led functions of the Lenovo platform.
Many Thanks.

BR,
Kailang

--_002_8a99edffee044e13b6e348d1b69c2b57realtekcom_
Content-Type: application/octet-stream;
	name="0000-alc233-lenovo-M90-GEN5-mute-key-v4.patch"
Content-Description: 0000-alc233-lenovo-M90-GEN5-mute-key-v4.patch
Content-Disposition: attachment;
	filename="0000-alc233-lenovo-M90-GEN5-mute-key-v4.patch"; size=4090;
	creation-date="Mon, 22 Dec 2025 09:30:23 GMT";
	modification-date="Mon, 22 Dec 2025 09:28:22 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxYzZjZjRhMjliZWRiZTJjNDQ0MjdhYmVkMDk5NmIxYzBhNjc4MDA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5jb20+CkRh
dGU6IE1vbiwgMjIgRGVjIDIwMjUgMTc6MjA6MDYgKzA4MDAKU3ViamVjdDogW1BBVENIXSBBTFNB
OiBoZGEvcmVhbHRlayAtIEVuYWJsZSBNdXRlIExFRCBmb3IgTGVub3ZvIHBsYXRmb3JtCgpFbmFi
bGUgU1BLIE11dGUgTGVkIGFuZCBNaWMgTXV0ZSBMZWQgZm9yIExlbm92byBwbGF0Zm9ybS4KClBy
aW9yaXR5OiBQMQpTaWduZWQtb2ZmLWJ5OiBLYWlsYW5nIFlhbmcgPGthaWxhbmdAcmVhbHRlay5j
b20+CgpkaWZmIC0tZ2l0IGEvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jIGIvc291
bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jCmluZGV4IDk1MTBhYTJmMWJkYS4uZjQ4OGQ5
NTIwMjRhIDEwMDY0NAotLS0gYS9zb3VuZC9oZGEvY29kZWNzL3JlYWx0ZWsvYWxjMjY5LmMKKysr
IGIvc291bmQvaGRhL2NvZGVjcy9yZWFsdGVrL2FsYzI2OS5jCkBAIC0xNjE2LDYgKzE2MTYsMjAg
QEAgc3RhdGljIHZvaWQgYWxjMjk1X2ZpeHVwX2hwX211dGVfbGVkX2NvZWZiaXQxMShzdHJ1Y3Qg
aGRhX2NvZGVjICpjb2RlYywKIAl9CiB9CiAKK3N0YXRpYyB2b2lkIGFsYzIzM19maXh1cF9sZW5v
dm9fY29lZl9taWNtdXRlX2xlZChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYywKKwkJCQljb25zdCBz
dHJ1Y3QgaGRhX2ZpeHVwICpmaXgsIGludCBhY3Rpb24pCit7CisJc3RydWN0IGFsY19zcGVjICpz
cGVjID0gY29kZWMtPnNwZWM7CisKKwlpZiAoYWN0aW9uID09IEhEQV9GSVhVUF9BQ1RfUFJFX1BS
T0JFKSB7CisJCXNwZWMtPm1pY19sZWRfY29lZi5pZHggPSAweDEwOworCQlzcGVjLT5taWNfbGVk
X2NvZWYubWFzayA9IDEgPDwgMTM7CisJCXNwZWMtPm1pY19sZWRfY29lZi5vbiA9IDA7CisJCXNw
ZWMtPm1pY19sZWRfY29lZi5vZmYgPSAxIDw8IDEzOworCQlzbmRfaGRhX2dlbl9hZGRfbWljbXV0
ZV9sZWRfY2Rldihjb2RlYywgY29lZl9taWNtdXRlX2xlZF9zZXQpOworCX0KK30KKwogc3RhdGlj
IHZvaWQgYWxjMjg1X2ZpeHVwX2hwX211dGVfbGVkKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAog
CQkJCWNvbnN0IHN0cnVjdCBoZGFfZml4dXAgKmZpeCwgaW50IGFjdGlvbikKIHsKQEAgLTE5MDUs
NiArMTkxOSwzOCBAQCBzdGF0aWMgdm9pZCBhbGMyODBfZml4dXBfaHBfZ3BpbzJfbWljX2hvdGtl
eShzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYywKIAkJc3BlYy0+a2JfZGV2ID0gTlVMTDsKIAl9CiB9
CisvKiBHUElPMiA9IG1pYyBtdXRlIGhvdGtleQorICogR1BJTzMgPSBtaWMgbXV0ZSBMRUQKKyAq
Lworc3RhdGljIHZvaWQgYWxjMjMzX2ZpeHVwX2xlbm92b19ncGlvMl9taWNfaG90a2V5KHN0cnVj
dCBoZGFfY29kZWMgKmNvZGVjLAorCQkJCQkgICAgIGNvbnN0IHN0cnVjdCBoZGFfZml4dXAgKmZp
eCwgaW50IGFjdGlvbikKK3sKKwlzdHJ1Y3QgYWxjX3NwZWMgKnNwZWMgPSBjb2RlYy0+c3BlYzsK
KworCWFsYzIzM19maXh1cF9sZW5vdm9fY29lZl9taWNtdXRlX2xlZChjb2RlYywgZml4LCBhY3Rp
b24pOworCWlmIChhY3Rpb24gPT0gSERBX0ZJWFVQX0FDVF9QUkVfUFJPQkUpIHsKKwkJYWxjX3Vw
ZGF0ZV9jb2VmX2lkeChjb2RlYywgMHgxMCwgMTw8MiwgMTw8Mik7CisJCWlmIChhbGNfcmVnaXN0
ZXJfbWljbXV0ZV9pbnB1dF9kZXZpY2UoY29kZWMpICE9IDApCisJCQlyZXR1cm47CisKKwkJc3Bl
Yy0+Z3Bpb19tYXNrIHw9IDB4MDQ7CisJCXNwZWMtPmdwaW9fZGlyIHw9IDB4MDsKKwkJc25kX2hk
YV9jb2RlY193cml0ZV9jYWNoZShjb2RlYywgY29kZWMtPmNvcmUuYWZnLCAwLAorCQkJCQkgIEFD
X1ZFUkJfU0VUX0dQSU9fVU5TT0xJQ0lURURfUlNQX01BU0ssIDB4MDQpOworCQlzbmRfaGRhX2ph
Y2tfZGV0ZWN0X2VuYWJsZV9jYWxsYmFjayhjb2RlYywgY29kZWMtPmNvcmUuYWZnLAorCQkJCQkJ
ICAgIGdwaW8yX21pY19ob3RrZXlfZXZlbnQpOworCQlyZXR1cm47CisJfQorCisJaWYgKCFzcGVj
LT5rYl9kZXYpCisJCXJldHVybjsKKworCXN3aXRjaCAoYWN0aW9uKSB7CisJY2FzZSBIREFfRklY
VVBfQUNUX0ZSRUU6CisJCWlucHV0X3VucmVnaXN0ZXJfZGV2aWNlKHNwZWMtPmtiX2Rldik7CisJ
CXNwZWMtPmtiX2RldiA9IE5VTEw7CisJfQorfQogCiAvKiBMaW5lMiA9IG1pYyBtdXRlIGhvdGtl
eQogICogR1BJTzIgPSBtaWMgbXV0ZSBMRUQKQEAgLTM3OTEsNiArMzgzNyw3IEBAIGVudW0gewog
CUFMQzI0NV9GSVhVUF9IUF9UQVMyNzgxX0kyQ19NVVRFX0xFRCwKIAlBTEMyODhfRklYVVBfU1VS
RkFDRV9TV0FQX0RBQ1MsCiAJQUxDMjM2X0ZJWFVQX0hQX01VVEVfTEVEX01JQ01VVEVfR1BJTywK
KwlBTEMyMzNfRklYVVBfTEVOT1ZPX0dQSU8yX01JQ19IT1RLRVksCiB9OwogCiAvKiBBIHNwZWNp
YWwgZml4dXAgZm9yIExlbm92byBDOTQwIGFuZCBZb2dhIER1ZXQgNzsKQEAgLTYyNTYsNiArNjMw
MywxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhkYV9maXh1cCBhbGMyNjlfZml4dXBzW10gPSB7
CiAJCS50eXBlID0gSERBX0ZJWFVQX0ZVTkMsCiAJCS52LmZ1bmMgPSBhbGMyODhfZml4dXBfc3Vy
ZmFjZV9zd2FwX2RhY3MsCiAJfSwKKyAgICAgICAgW0FMQzIzM19GSVhVUF9MRU5PVk9fR1BJTzJf
TUlDX0hPVEtFWV0gPSB7CisgICAgICAgICAgICAgICAgLnR5cGUgPSBIREFfRklYVVBfRlVOQywK
KyAgICAgICAgICAgICAgICAudi5mdW5jID0gYWxjMjMzX2ZpeHVwX2xlbm92b19ncGlvMl9taWNf
aG90a2V5LAorICAgICAgICB9LAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfcXVpcmsg
YWxjMjY5X2ZpeHVwX3RibFtdID0gewpAQCAtNzE1MSw3ICs3MjAyLDEyIEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgaGRhX3F1aXJrIGFsYzI2OV9maXh1cF90YmxbXSA9IHsKIAlTTkRfUENJX1FVSVJL
KDB4MTdhYSwgMHgzMTc2LCAiVGhpbmtDZW50cmUgU3RhdGlvbiIsIEFMQzI4M19GSVhVUF9IRUFE
U0VUX01JQyksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzE3OCwgIlRoaW5rQ2VudHJlIFN0
YXRpb24iLCBBTEMyODNfRklYVVBfSEVBRFNFVF9NSUMpLAogCVNORF9QQ0lfUVVJUksoMHgxN2Fh
LCAweDMxYWYsICJUaGlua0NlbnRyZSBTdGF0aW9uIiwgQUxDNjIzX0ZJWFVQX0xFTk9WT19USElO
S1NUQVRJT05fUDM0MCksCisJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzM0MSwgIkxlbm92byBU
aGlua0NlbnRyZSBNOTAgR2VuNCIsIEFMQzIzM19GSVhVUF9MRU5PVk9fR1BJTzJfTUlDX0hPVEtF
WSksCisJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzM0MiwgIkxlbm92byBUaGlua0NlbnRyZSBN
OTAgR2VuNCIsIEFMQzIzM19GSVhVUF9MRU5PVk9fR1BJTzJfTUlDX0hPVEtFWSksCisJU05EX1BD
SV9RVUlSSygweDE3YWEsIDB4MzM0MywgIkxlbm92byBUaGlua0NlbnRyZSBNNzAgR2VuNCIsIEFM
QzIzM19GSVhVUF9MRU5PVk9fR1BJTzJfTUlDX0hPVEtFWSksCisJU05EX1BDSV9RVUlSSygweDE3
YWEsIDB4MzM0NCwgIkxlbm92byBUaGlua0NlbnRyZSBNNzAgR2VuNCIsIEFMQzIzM19GSVhVUF9M
RU5PVk9fR1BJTzJfTUlDX0hPVEtFWSksCiAJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzM0Yiwg
Ikxlbm92byBUaGlua0NlbnRyZSBNNzAgR2VuNSIsIEFMQzI4M19GSVhVUF9IRUFEU0VUX01JQyks
CisJU05EX1BDSV9RVUlSSygweDE3YWEsIDB4MzM0ZiwgIkxlbm92byBUaGlua0NlbnRyZSBNOTBh
IEdlbjUiLCBBTEMyMzNfRklYVVBfTEVOT1ZPX0dQSU8yX01JQ19IT1RLRVkpLAogCVNORF9QQ0lf
UVVJUksoMHgxN2FhLCAweDMzODQsICJUaGlua0NlbnRyZSBNOTBhIFBSTyIsIEFMQzIzM19GSVhV
UF9MRU5PVk9fTDJNSF9MT1dfRU5MRUQpLAogCVNORF9QQ0lfUVVJUksoMHgxN2FhLCAweDMzODYs
ICJUaGlua0NlbnRyZSBNOTBhIEdlbjYiLCBBTEMyMzNfRklYVVBfTEVOT1ZPX0wyTUhfTE9XX0VO
TEVEKSwKIAlTTkRfUENJX1FVSVJLKDB4MTdhYSwgMHgzMzg3LCAiVGhpbmtDZW50cmUgTTcwYSBH
ZW42IiwgQUxDMjMzX0ZJWFVQX0xFTk9WT19MMk1IX0xPV19FTkxFRCksCg==

--_002_8a99edffee044e13b6e348d1b69c2b57realtekcom_--
