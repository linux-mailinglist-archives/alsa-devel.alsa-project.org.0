Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D61AF867E5D
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 18:25:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68B59AE8;
	Mon, 26 Feb 2024 18:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68B59AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708968335;
	bh=f/VwGG/Xa37pwX+dykC40PbJQJ/HnNDNIS6jQdlWTpU=;
	h=Date:To:From:Subject:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rR2eB3nefdKTPomF+LwpXPSRZfujSZk7S3IQdQ7NbktB812Xw+Xf22CkVYsjc0Rtl
	 qWWDS07pwxzT+aELXOXzZx4vj5T3ThA7l9MiUZKLUw1z2F6g1gs7374gtvU6HF5+Ak
	 1Z7MSn4POmia9XRdbr0Cn4NlxR4EG1otCyIUmRTg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2A13F806CA; Mon, 26 Feb 2024 18:23:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16135F806BD;
	Mon, 26 Feb 2024 18:23:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81312F80246; Sun, 25 Feb 2024 12:41:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail.athaariq.my.id (unknown [117.53.144.211])
	by alsa1.perex.cz (Postfix) with ESMTP id 96477F800EE
	for <alsa-devel@alsa-project.org>; Sun, 25 Feb 2024 12:41:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96477F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=dkim20240121 header.b=BcNPy/FX
Received: from localhost (localhost [127.0.0.1])
	by mail.athaariq.my.id (Postfix) with ESMTP id 11D823E0BD;
	Sun, 25 Feb 2024 11:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=athaariq.my.id;
	 h=subject:subject:from:from:content-language:user-agent
	:mime-version:date:date:message-id:content-type:content-type
	:received; s=dkim20240121; t=1708861264; x=1710070865; bh=f/VwGG
	/Xa37pwX+dykC40PbJQJ/HnNDNIS6jQdlWTpU=; b=BcNPy/FXES170HzrFGbKsR
	JQ15ipdhJW710uOXD5EqKO/oCAvNrG7F5NQZwV0PnuSoIu7JwdT1Jm0gyo6toeQ2
	6K7auf2zodwMErmQOzYvAOCIU62SQBd/8yUDWaqnhjtjlgwPSCC1hCmKnR3CCvLG
	ngvJRnsImOsqPoM4Y0ERIBhzH1QSFhNDhaTuATKPtmSkVFgHTcjiE6pS+3nAWtOb
	lbqUKsGJGcxu1xtDGkGJmtDaMlVNxu2Jq02XL3WZnIQLe6X+KMuIDTFw1ol+7uHX
	jjPm1GFCGLekda4mTyaALsh1lsnY/+huBjlLVShyCsS+CPsXSqjgiivj8YyxNdbA
	==
Received: from [10.100.78.147] (unknown [192.168.100.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest
 SHA256)
	(No client certificate requested)
	by mail.athaariq.my.id (Postfix) with ESMTPSA id E6C6A3B197;
	Sun, 25 Feb 2024 11:41:03 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------2n0JwmlWKBbojw6uTk00pY7l"
Message-ID: <46f40b6f-645b-434d-a963-7d1834c8bd7d@athaariq.my.id>
Date: Sun, 25 Feb 2024 18:40:53 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Kailang Yang <kailang@realtek.com>
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
Subject: Attempt to Fix ALC285 on Linux for HP Envy x360 Laptops
Autocrypt: addr=foss@athaariq.my.id; keydata=
 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
 GMviPu198f0Mg1RQmg==
Cc: alsa-devel@alsa-project.org
X-MailFrom: foss@athaariq.my.id
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DWW3I2LLLKX6RI2QAXFTUADVQ47VZJSD
X-Message-ID-Hash: DWW3I2LLLKX6RI2QAXFTUADVQ47VZJSD
X-Mailman-Approved-At: Mon, 26 Feb 2024 17:22:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a multi-part message in MIME format.
--------------2n0JwmlWKBbojw6uTk00pY7l
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Mr. Yang and ALSA contributors,

Currently, I'm trying to fix ALC285 for HP Envy x360 13-ar0107au
convertible laptop on Linux v6.7.6 kernel. It has several problems
including B&O soundbar speakers won't work and volume too low even though
it's 100%. For now, the B&O soundbar is working. However, I'm still
struggling to fix the low volume problem. The draft patch is attached to
this mail. If you don't mind, please let me know the information about the
correct coefficients, so I can help you fix the problem and test it on my
device. Thank you for your attention.


Sincerely,

Eric

--------------2n0JwmlWKBbojw6uTk00pY7l
Content-Type: text/x-patch; charset=UTF-8;
 name="linux-hp-envy-13-ar0-draft.patch"
Content-Disposition: attachment; filename="linux-hp-envy-13-ar0-draft.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jIGIvc291bmQvcGNp
L2hkYS9wYXRjaF9yZWFsdGVrLmMKaW5kZXggZTMwOTY1NzI4ODFkLi44ZTRjZDcxYTQwZjQg
MTAwNjQ0Ci0tLSBhL3NvdW5kL3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCisrKyBiL3NvdW5k
L3BjaS9oZGEvcGF0Y2hfcmVhbHRlay5jCkBAIC02Njc3LDYgKzY2NzcsNDIgQEAgc3RhdGlj
IHZvaWQgYWxjMjg1X2ZpeHVwX2hwX3NwZWN0cmVfeDM2MF9lYjEoc3RydWN0IGhkYV9jb2Rl
YyAqY29kZWMsCiAJfQogfQogCitzdGF0aWMgdm9pZCBhbGMyODVfZml4dXBfaHBfZW52eV94
MzYwKHN0cnVjdCBoZGFfY29kZWMgKmNvZGVjLAorCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBo
ZGFfZml4dXAgKmZpeCwKKwkJCQkgICAgICBpbnQgYWN0aW9uKQoreworCXN0YXRpYyBjb25z
dCBzdHJ1Y3QgY29lZl9mdyBjb2Vmc1tdID0geworCQkvKiBBbXBsaWZpZXIgcHJvY2VzcyBj
b2VmZmljaWVudCovCisJCVdSSVRFX0NPRUYoMHgwOCwgMHg2YTBjKSwgV1JJVEVfQ09FRigw
eDBkLCAweGEwMjMpLAorCQlXUklURV9DT0VGKDB4MTAsIDB4MDMyMCksIFdSSVRFX0NPRUYo
MHgxYSwgMHg4YzAzKSwKKwkJV1JJVEVfQ09FRigweDI1LCAweDE4MDApLCBXUklURV9DT0VG
KDB4MjYsIDB4MDAzYSksCisJCVdSSVRFX0NPRUYoMHgyOCwgMHgxZGZlKSwgV1JJVEVfQ09F
RigweDI5LCAweGIwMTQpLAorCQlXUklURV9DT0VGKDB4MmIsIDB4ZmRmZSksIFdSSVRFX0NP
RUYoMHgzNywgMHhmZTE1KSwKKwkJV1JJVEVfQ09FRigweDM4LCAweDc5MDkpLCBXUklURV9D
T0VGKDB4NDUsIDB4ZDA4OSksCisJCVdSSVRFX0NPRUYoMHg0NiwgMHgwMGY0KSwgV1JJVEVf
Q09FRigweDRhLCAweDIwZTApLAorCQlXUklURV9DT0VGKDB4NjYsIDB4MDNmMCksIFdSSVRF
X0NPRUYoMHg2NywgMHgxMDAwKSwKKwkJV1JJVEVfQ09FRigweDZlLCAweDEwMDUpLCB7IH0K
Kwl9OworCisJc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfcGludGJsIHBpbmNmZ3NbXSA9IHsK
KwkJeyAweDE0LCAweDkwMTcwMTUwIH0sICAvKiBCJk8gc291bmRiYXIgc3BlYWtlcnMgKi8K
KwkJeyAweDE3LCAweDkwMTcwMTUyIH0sICAvKiBzaWRlIHNwZWFrZXJzICovCisJCXsgfQor
CX07CisKKwlzdGF0aWMgY29uc3QgaGRhX25pZF90IGNvbm5bXSA9IHsgMHgwMiwgMHgwMyB9
OworCisJc3dpdGNoIChhY3Rpb24pIHsKKwljYXNlIEhEQV9GSVhVUF9BQ1RfUFJFX1BST0JF
OgorCQlzbmRfaGRhX2FwcGx5X3BpbmNmZ3MoY29kZWMsIHBpbmNmZ3MpOworCQlhbGMyOTVf
Zml4dXBfZGlzYWJsZV9kYWMzKGNvZGVjLCBmaXgsIGFjdGlvbik7CisJCWJyZWFrOworCWNh
c2UgSERBX0ZJWFVQX0FDVF9JTklUOgorCQlhbGNfcHJvY2Vzc19jb2VmX2Z3KGNvZGVjLCBj
b2Vmcyk7CisJCWJyZWFrOworCX0KK30KKwogc3RhdGljIHZvaWQgYWxjMjg1X2ZpeHVwX2hw
X3NwZWN0cmVfeDM2MChzdHJ1Y3QgaGRhX2NvZGVjICpjb2RlYywKIAkJCQkJICBjb25zdCBz
dHJ1Y3QgaGRhX2ZpeHVwICpmaXgsIGludCBhY3Rpb24pCiB7CkBAIC03MjkwLDYgKzczMjYs
NyBAQCBlbnVtIHsKIAlBTEMyODBfRklYVVBfSFBfOTQ4ME0sCiAJQUxDMjQ1X0ZJWFVQX0hQ
X1gzNjBfQU1QLAogCUFMQzI4NV9GSVhVUF9IUF9TUEVDVFJFX1gzNjBfRUIxLAorCUFMQzI4
NV9GSVhVUF9IUF9FTlZZX1gzNjAsCiAJQUxDMjg4X0ZJWFVQX0RFTExfSEVBRFNFVF9NT0RF
LAogCUFMQzI4OF9GSVhVUF9ERUxMMV9NSUNfTk9fUFJFU0VOQ0UsCiAJQUxDMjg4X0ZJWFVQ
X0RFTExfWFBTXzEzLApAQCAtOTI0NCw2ICs5MjgxLDEyIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaGRhX2ZpeHVwIGFsYzI2OV9maXh1cHNbXSA9IHsKIAkJLnR5cGUgPSBIREFfRklYVVBf
RlVOQywKIAkJLnYuZnVuYyA9IGFsYzI4NV9maXh1cF9ocF9zcGVjdHJlX3gzNjBfZWIxCiAJ
fSwKKwlbQUxDMjg1X0ZJWFVQX0hQX0VOVllfWDM2MF0gPSB7CisJCS50eXBlID0gSERBX0ZJ
WFVQX0ZVTkMsCisJCS52LmZ1bmMgPSBhbGMyODVfZml4dXBfaHBfZW52eV94MzYwLAorCQku
Y2hhaW5lZCA9IHRydWUsCisJCS5jaGFpbl9pZCA9IEFMQzI4NV9GSVhVUF9IUF9HUElPX0FN
UF9JTklULAorCX0sCiAJW0FMQzI4N19GSVhVUF9JREVBUEFEX0JBU1NfU1BLX0FNUF0gPSB7
CiAJCS50eXBlID0gSERBX0ZJWFVQX0ZVTkMsCiAJCS52LmZ1bmMgPSBhbGMyODVfZml4dXBf
aWRlYXBhZF9zNzQwX2NvZWYsCkBAIC05ODYyLDYgKzk5MDUsNyBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHNuZF9wY2lfcXVpcmsgYWxjMjY5X2ZpeHVwX3RibFtdID0gewogCVNORF9QQ0lf
UVVJUksoMHgxMDNjLCAweDg4MGQsICJIUCBFbGl0ZUJvb2sgODMwIEc4IE5vdGVib29rIFBD
IiwgQUxDMjg1X0ZJWFVQX0hQX0dQSU9fTEVEKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywg
MHg4ODExLCAiSFAgU3BlY3RyZSB4MzYwIDE1LWViMXh4eCIsIEFMQzI4NV9GSVhVUF9IUF9T
UEVDVFJFX1gzNjBfRUIxKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4ODEyLCAiSFAg
U3BlY3RyZSB4MzYwIDE1LWViMXh4eCIsIEFMQzI4NV9GSVhVUF9IUF9TUEVDVFJFX1gzNjBf
RUIxKSwKKwlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4NWRlLCAiSFAgRW52eSB4MzYwIDEz
LWFyMHh4eCIsIEFMQzI4NV9GSVhVUF9IUF9FTlZZX1gzNjApLAogCVNORF9QQ0lfUVVJUkso
MHgxMDNjLCAweDg4MWQsICJIUCAyNTAgRzggTm90ZWJvb2sgUEMiLCBBTEMyMzZfRklYVVBf
SFBfTVVURV9MRURfQ09FRkJJVDIpLAogCVNORF9QQ0lfUVVJUksoMHgxMDNjLCAweDg4NDYs
ICJIUCBFbGl0ZUJvb2sgODUwIEc4IE5vdGVib29rIFBDIiwgQUxDMjg1X0ZJWFVQX0hQX0dQ
SU9fTEVEKSwKIAlTTkRfUENJX1FVSVJLKDB4MTAzYywgMHg4ODQ3LCAiSFAgRWxpdGVCb29r
IHgzNjAgODMwIEc4IE5vdGVib29rIFBDIiwgQUxDMjg1X0ZJWFVQX0hQX0dQSU9fTEVEKSwK
QEAgLTEwNTA5LDYgKzEwNTUzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoZGFfbW9kZWxf
Zml4dXAgYWxjMjY5X2ZpeHVwX21vZGVsc1tdID0gewogCXsuaWQgPSBBTEMyOTVfRklYVVBf
SFBfT01FTiwgLm5hbWUgPSAiYWxjMjk1LWhwLW9tZW4ifSwKIAl7LmlkID0gQUxDMjg1X0ZJ
WFVQX0hQX1NQRUNUUkVfWDM2MCwgLm5hbWUgPSAiYWxjMjg1LWhwLXNwZWN0cmUteDM2MCJ9
LAogCXsuaWQgPSBBTEMyODVfRklYVVBfSFBfU1BFQ1RSRV9YMzYwX0VCMSwgLm5hbWUgPSAi
YWxjMjg1LWhwLXNwZWN0cmUteDM2MC1lYjEifSwKKwl7LmlkID0gQUxDMjg1X0ZJWFVQX0hQ
X0VOVllfWDM2MCwgLm5hbWUgPSAiYWxjMjg1LWhwLWVudnkteDM2MCJ9LAogCXsuaWQgPSBB
TEMyODdfRklYVVBfSURFQVBBRF9CQVNTX1NQS19BTVAsIC5uYW1lID0gImFsYzI4Ny1pZGVh
cGFkLWJhc3Mtc3BrLWFtcCJ9LAogCXsuaWQgPSBBTEMyODdfRklYVVBfWU9HQTlfMTRJQVA3
X0JBU1NfU1BLX1BJTiwgLm5hbWUgPSAiYWxjMjg3LXlvZ2E5LWJhc3Mtc3BrLXBpbiJ9LAog
CXsuaWQgPSBBTEM2MjNfRklYVVBfTEVOT1ZPX1RISU5LU1RBVElPTl9QMzQwLCAubmFtZSA9
ICJhbGM2MjMtbGVub3ZvLXRoaW5rc3RhdGlvbi1wMzQwIn0sCg==

--------------2n0JwmlWKBbojw6uTk00pY7l--
