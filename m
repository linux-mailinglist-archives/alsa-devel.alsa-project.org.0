Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DF064B0A4
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 08:56:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BC6E1683;
	Tue, 13 Dec 2022 08:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BC6E1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670918218;
	bh=+Fjp4NTmrhG4YFx7jFd8xJDppuXs2EWKHX6VF+TC/SE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NNOHdrDEa+kK5dgEWQLrtWd3FUHgSNCmpvtCGRMkFwHGH/T3CKcjD3rWhZmbP8XgK
	 JyTsRHxZjw0q5p5GFXJn+AX0Wcmz6+jx5L9ooo37WFz1nWK1Vw2PbWQVqpEgt/aZ7L
	 A4oz0FRTc8MljiaI9tR/k2I/rO02/xI+HjIgwUrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F03E0F80141;
	Tue, 13 Dec 2022 08:56:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50B40F80431; Tue, 13 Dec 2022 08:55:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,RCVD_IN_DNSWL_MED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D4CEF80431
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 08:55:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D4CEF80431
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=A14lTsfa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1670918159;
 x=1702454159;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=hDvAhm2qY0FyFX7cJlbF4u5kIskI/PQsLuV5FiRkqMg=;
 b=A14lTsfa6SXoQzKJNCKODbX2xLux06pbHvTtzR8uFi9NHPzSsv/GEJFW
 iWPj/OUkJOnfpLy+0xbsXgQOyks5tvAMBey8T9Ibe69ZHP8Oh4+9LfX7t
 tYx9+XcVhs32oYJZrG3uG7skXMrR2Ap9INBTtj3EGXgqSBN64CPt0iYYI
 kS9uP8tdJuon8Mu0PILarcRIyMCP+A0unYwBjC5LVA1d8yFql8YFqJGvF
 auGVmaOx4aATMtZ+UigrpE/b86nNLaCt+mZBCm0tErQp85P/DeoCCFFVv
 uhMMZjrTh9PKIxtNxmiOk0b0SzMaSYQiNmU2DL8VRlXkEcX7hH+PSlPSX Q==;
From: Simon Svanbom <Simon.Svanbom@axis.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: [PATCH] ALSA: conf: Save SND_CONFIG_TYPE_REAL with at least one
 decimal
Thread-Topic: [PATCH] ALSA: conf: Save SND_CONFIG_TYPE_REAL with at least one
 decimal
Thread-Index: AQHZDsdHOsnY5fSCk0ykhYvc8iAaLw==
Date: Tue, 13 Dec 2022 07:55:55 +0000
Message-ID: <f9a7ad6a256d4ad7a31642dcf875d436@axis.com>
Accept-Language: sv-SE, en-US
Content-Language: sv-SE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: multipart/mixed;
 boundary="_004_f9a7ad6a256d4ad7a31642dcf875d436axiscom_"
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "tiwai@suse.de" <tiwai@suse.de>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--_004_f9a7ad6a256d4ad7a31642dcf875d436axiscom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,
patch for saving SND_CONFIG_TYPE_REAL with at least one decimal as to not m=
isinterpret the value as an integer in snd_config_get_real. Example would b=
e the sofvol configuration property min_dB and max_dB, that are required to=
 have at least one decimal.

All the best

// Simon


--_004_f9a7ad6a256d4ad7a31642dcf875d436axiscom_
Content-Type: text/x-patch;
	name="0001-conf-Save-SND_CONFIG_TYPE_REAL-with-at-least-one-dec.patch"
Content-Description: 0001-conf-Save-SND_CONFIG_TYPE_REAL-with-at-least-one-dec.patch
Content-Disposition: attachment;
	filename="0001-conf-Save-SND_CONFIG_TYPE_REAL-with-at-least-one-dec.patch";
	size=1130; creation-date="Tue, 13 Dec 2022 07:47:27 GMT";
	modification-date="Tue, 13 Dec 2022 07:47:27 GMT"
Content-Transfer-Encoding: base64

RnJvbSBkNjc5ZDQ2OWNkMDQ4ZDAxZWRmZWM5NTJjNTU1MGFjYThmZDRiMDRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaW1vbiBTdmFuYm9tIDxzaW1vY2hyQGF4aXMuY29tPgpEYXRl
OiBUdWUsIDEzIERlYyAyMDIyIDA4OjIzOjUzICswMTAwClN1YmplY3Q6IFtQQVRDSF0gY29uZjog
U2F2ZSBTTkRfQ09ORklHX1RZUEVfUkVBTCB3aXRoIGF0IGxlYXN0IG9uZSBkZWNpbWFsCgpTYXZl
IG5vZGUgdmFsdWVzIG9mIHR5cGUgU05EX0NPTkZJR19UWVBFX1JFQUwgd2l0aCBhdCBsZWFzdApv
bmUgZGVjaW1hbCBpbiBvcmRlciBub3QgdG8gbWlzaW50ZXJwcmV0IHRoZSB2YWx1ZSBhcwphbiBp
bnRlZ2VyIGluIHNuZF9jb25maWdfZ2V0X3JlYWwuCgpDaGFuZ2UtSWQ6IEk1ODk3YmE4ZWE2YmUz
MjE3ZjQwZGQzODJhOThlMTdmZmNhM2Q1NmJlCi0tLQogc3JjL2NvbmYuYyB8IDcgKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3NyYy9jb25mLmMgYi9zcmMvY29uZi5jCmluZGV4IDY1ZjJlMWE3Li5kZTA1MTI4MyAxMDA2
NDQKLS0tIGEvc3JjL2NvbmYuYworKysgYi9zcmMvY29uZi5jCkBAIC0xNjM0LDcgKzE2MzQsMTIg
QEAgaW50IF9zbmRfY29uZmlnX3NhdmVfbm9kZV92YWx1ZShzbmRfY29uZmlnX3QgKm4sIHNuZF9v
dXRwdXRfdCAqb3V0LAogCQlzbmRfb3V0cHV0X3ByaW50ZihvdXQsICIlbGxkIiwgbi0+dS5pbnRl
Z2VyNjQpOwogCQlicmVhazsKIAljYXNlIFNORF9DT05GSUdfVFlQRV9SRUFMOgotCQlzbmRfb3V0
cHV0X3ByaW50ZihvdXQsICIlLTE2ZyIsIG4tPnUucmVhbCk7CisJCS8qIElmIG5vIGRlY2ltYWxz
IHByb3ZpZGVkLCBwcmludCBhdCBsZWFzdCBvbmUgKi8KKwkJaWYgKG4tPnUucmVhbCA9PSAoaW50
KW4tPnUucmVhbCkgeworCQkJc25kX291dHB1dF9wcmludGYob3V0LCAiJS0uMWYiLCBuLT51LnJl
YWwpOworCQl9IGVsc2UgeworCQkJc25kX291dHB1dF9wcmludGYob3V0LCAiJS0xNmciLCBuLT51
LnJlYWwpOworCQl9CiAJCWJyZWFrOwogCWNhc2UgU05EX0NPTkZJR19UWVBFX1NUUklORzoKIAkJ
c3RyaW5nX3ByaW50KG4tPnUuc3RyaW5nLCAwLCBvdXQpOwotLSAKMi4yMC4xCgo=

--_004_f9a7ad6a256d4ad7a31642dcf875d436axiscom_--
