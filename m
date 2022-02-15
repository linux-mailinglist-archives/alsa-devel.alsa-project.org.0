Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 921214B8444
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 10:30:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 344B61A2D;
	Wed, 16 Feb 2022 10:29:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 344B61A2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645003823;
	bh=I5XueSE1opvXUg1vwu6IREWSuGwNSqTyAPRgFmdNKbE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s3R0pM6u4SLmKQEd//gbirZH+/VPRDFTdYnk0iS3a5aVxbfeSJgyCZJ9L9WPfVdEN
	 JbdT0Um1MkQAxFZBpkxEi16crMbiuoT0gMRKYTXOOpXz5xpK4RYMS3M2Jhgn2Yc9Ev
	 9P0ggtQVg8YhT0cQb1swYY9veBFNQz18oNmytDmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25975F80563;
	Wed, 16 Feb 2022 10:25:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60CE4F80100; Tue, 15 Feb 2022 11:19:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D52AFF80100
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 11:19:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D52AFF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="n2ncRWS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1644920362;
 x=1676456362;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=4PMIRuFsZZN7nQKf/tTL2zewTz+Jtnm/iUTnmhWgwMg=;
 b=n2ncRWS9MM4Es1DXFHg/flEV+/4hlb9+W9ADbZmR5x9u4MWxBFycz7Y4
 2AukMB+RrKZ6Mj7EXPipC6wPM+UXMeCVnu6fhiR5Pp2lIClgH1IqHgPw6
 NdgDOt/Vp/hrwv2AbGPkZtfjSovOMk7OYVwRsLpsA8CHbW3hN1GFP/+pe
 JodCwBDeN9p6s8fZhaK/kwnOlVWIc++dEPwHNKjY+GqrcPINeh+YhNzhV
 lIoYfY8N4HjRnaYg3hFrfL7Nu71VlvNY/HzfxiZg1y2MGCw/wRfvFUO8t
 V3K/kzPNn4kVEPWAytnOmR8gPtKYU8ebunBJ1ZQl6Na7s8H1EOL0Zv8Qi w==;
From: Simon Christensson <Simon.Christensson@axis.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: [PATCH] conf: Remove left justification for SND_CONFIG_TYPE_REAL
Thread-Topic: [PATCH] conf: Remove left justification for SND_CONFIG_TYPE_REAL
Thread-Index: AQHYIlT8PNO1mE+zxEaSIPix53D3aQ==
Date: Tue, 15 Feb 2022 10:19:15 +0000
Message-ID: <40f87742994f4d7bbb2f94386f7891c8@axis.com>
Accept-Language: sv-SE, en-US
Content-Language: sv-SE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: multipart/mixed;
 boundary="_004_40f87742994f4d7bbb2f94386f7891c8axiscom_"
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Feb 2022 10:25:43 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "tiwai@suse.de" <tiwai@suse.de>
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

--_004_40f87742994f4d7bbb2f94386f7891c8axiscom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

In order to avoid extra padding replace data type "%-16g" (left justificati=
on) with default right justification "%16g" when printing snd_config type S=
ND_CONFIG_TYPE_REAL.


Example for control "min_dB" available in softvol:

Before patch: "min_dB -50             "

After patch: "min_dB -50.0"

--_004_40f87742994f4d7bbb2f94386f7891c8axiscom_
Content-Type: text/x-patch;
	name="0001-conf-Remove-left-justify-for-SND_CONFIG_TYPE_REAL.patch"
Content-Description: 0001-conf-Remove-left-justify-for-SND_CONFIG_TYPE_REAL.patch
Content-Disposition: attachment;
	filename="0001-conf-Remove-left-justify-for-SND_CONFIG_TYPE_REAL.patch";
	size=941; creation-date="Tue, 15 Feb 2022 10:04:17 GMT";
	modification-date="Tue, 15 Feb 2022 10:04:17 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkOWY0NGJlYTI4ODQ0ZDRhYTI3M2I2OTA3ZGE4MWQ0MTY3YTM1ZTUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaW1vbiBDaHJpc3RlbnNzb24gPHNpbW9jaHJAYXhpcy5jb20+
CkRhdGU6IFR1ZSwgMTUgRmViIDIwMjIgMTA6NDA6MzggKzAxMDAKU3ViamVjdDogW1BBVENIXSBj
b25mOiBSZW1vdmUgbGVmdC1qdXN0aWZ5IGZvciBTTkRfQ09ORklHX1RZUEVfUkVBTAoKSW4gb3Jk
ZXIgdG8gYXZvaWQgcGFkZGluZyBhbmQgdG8gcHJpbnQgYXQgbGVhc3Qgb24KZGVjaW1hbCBmb3Ig
bm9kZSB0eXBlIFNORF9DT05GSUdfVFlQRV9SRUFMIHVzZQpkZWZhdWx0IHJpZ2h0LWp1c3RpZmlj
YXRpb24uCgpDaGFuZ2UtSWQ6IEk0MTQwMDkwMWVlOWYwYTQzNzcxYWZjNWQ0MmVlNjllYWM5ODA4
ODNjCi0tLQogc3JjL2NvbmYuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NyYy9jb25mLmMgYi9zcmMvY29uZi5jCmlu
ZGV4IDcwZjBlNzczLi5mYmEyOTA3YSAxMDA2NDQKLS0tIGEvc3JjL2NvbmYuYworKysgYi9zcmMv
Y29uZi5jCkBAIC0xNjMzLDcgKzE2MzMsNyBAQCBpbnQgX3NuZF9jb25maWdfc2F2ZV9ub2RlX3Zh
bHVlKHNuZF9jb25maWdfdCAqbiwgc25kX291dHB1dF90ICpvdXQsCiAJCXNuZF9vdXRwdXRfcHJp
bnRmKG91dCwgIiVsbGQiLCBuLT51LmludGVnZXI2NCk7CiAJCWJyZWFrOwogCWNhc2UgU05EX0NP
TkZJR19UWVBFX1JFQUw6Ci0JCXNuZF9vdXRwdXRfcHJpbnRmKG91dCwgIiUtMTZnIiwgbi0+dS5y
ZWFsKTsKKwkJc25kX291dHB1dF9wcmludGYob3V0LCAiJTE2ZyIsIG4tPnUucmVhbCk7CiAJCWJy
ZWFrOwogCWNhc2UgU05EX0NPTkZJR19UWVBFX1NUUklORzoKIAkJc3RyaW5nX3ByaW50KG4tPnUu
c3RyaW5nLCAwLCBvdXQpOwotLSAKMi4yMC4xCgo=

--_004_40f87742994f4d7bbb2f94386f7891c8axiscom_--
