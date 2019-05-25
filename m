Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F1F2A556
	for <lists+alsa-devel@lfdr.de>; Sat, 25 May 2019 18:28:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53FCD173F;
	Sat, 25 May 2019 18:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53FCD173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558801722;
	bh=eKreFC7V2JUzgVrtgoEaIjMj8hMsIlOG/kLp6gxcsmk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tK6EIRPwLyXF35LxAv7O7lLtEkjNuZcH9wu3JEZ5N9iPT2FjMqFVj0UPSgc6LCalV
	 bX/zCEmmKO9/Iua0AlFRreQi+V9GpNd1M45Klu4S37uhdAxGOOe9hfluG+xLTReOYg
	 ILQUFs7hPLVxKl2jqnGKxuck9tBVbm+mYKNzpbiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCF97F8973C;
	Sat, 25 May 2019 18:23:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37AEDF89674; Sat, 25 May 2019 18:23:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB62FF8065A
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 18:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB62FF8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I7TtEChR"
Received: by mail-wr1-x441.google.com with SMTP id l17so4404063wrm.10
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 09:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qlop/tLKOAnYug0Dp9+i5+P1xnfuVjpNMnA0jr7cUrU=;
 b=I7TtEChRmmNj6VLSBCmaMIg1zu7RzzR2Ga+g89wPPkAc7JPfiS4+Fg+EMAgbEWdFjf
 InpqE8E/KGCaKzquF3SLe/yF/Yk3D/rfGZXpj0Gecf1DFjtsa/4xb+hKPoP644KGMtU3
 yXb2aN7EZ4xogv4qpSqOsRpSuRa9YeXNbjwGVqBFhWdzDzp0l9hym9Sc4o7ADgtt70NJ
 C/ACW4wRXgVi/Qr0TdwzxeXNpXyVgKKbMZ2iVYEAG0SC7nSfXcnc3eNwAMg9zEWWJ24g
 ggcLwnhi4gR5/SNmgxSm63gbJCes2IZ7tcExC/8g/9qng6fNyULrJuumkr/R2O0JgbtQ
 BTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qlop/tLKOAnYug0Dp9+i5+P1xnfuVjpNMnA0jr7cUrU=;
 b=GAELm1k02i2arqP1oq1pLrPi58gqoG1RoeK5xKMjEo3pC5hvsjLuPMpB6aOdJDDGtJ
 yXCnpCgIeQCeWYOkuDI/x8VI+ak0+GjGLrPk9ylM5UprK4zyFw6O1cmiScNJK7n7Xi42
 wJ4I5pvRmVjHMQ+c/qs+BN3HO8QZkSBh036k2K1EiLKLqYlhZZR4n8M1axbIt9YXiEIA
 zeh2lkysyY4jRoW2tXKs3rKxplSnZRHQ8eRSga3cBI5i4x9Cnjlli1JF3Xt1MrzDcqgP
 xTmtFmeJWEXgPecfCXda0Gab+qHGRjajbWcOvPr+vWJsnbK8SPAbIgmi9/mXZA03wBea
 dTog==
X-Gm-Message-State: APjAAAUCao5y7Zb+PO1a87oUXHQVeJaFdSjHYrNwsGPER5RH6OxzNmAi
 7IoeSQaoR0TmrEoxi+3YkIQ=
X-Google-Smtp-Source: APXvYqwCnYLX+Ua7LtZco21uxEOjlg/sf70RxAvq0yiaBVeuxuqAX8O5GRMhgBMAJtNYkNZSW6fLSA==
X-Received: by 2002:adf:aa09:: with SMTP id p9mr14856373wrd.59.1558801416931; 
 Sat, 25 May 2019 09:23:36 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id k184sm13194409wmk.0.2019.05.25.09.23.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 25 May 2019 09:23:36 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 25 May 2019 18:23:21 +0200
Message-Id: <20190525162323.20216-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525162323.20216-1-peron.clem@gmail.com>
References: <20190525162323.20216-1-peron.clem@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v3 5/7] arm64: dts: allwinner: Add SPDIF node
	for Allwinner H6
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

VGhlIEFsbHdpbm5lciBINiBoYXMgYSBTUERJRiBjb250cm9sbGVyIGNhbGxlZCBPV0EgKE9uZSBX
aXJlIEF1ZGlvKS4KCk9ubHkgb25lIHBpbm11eGluZyBpcyBhdmFpbGFibGUgc28gc2V0IGl0IGFz
IGRlZmF1bHQuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21h
aWwuY29tPgotLS0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1oNi5kdHNp
IHwgMzggKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2
LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW41MGktaDYuZHRzaQppbmRl
eCBmNGVhNTk2YzgyY2UuLjMwN2QzYzg5NmZmMiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9h
bGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kKQEAgLTgzLDYgKzgzLDI0IEBACiAJCW1ldGhvZCA9ICJz
bWMiOwogCX07CiAKKwlzb3VuZF9zcGRpZiB7CisJCWNvbXBhdGlibGUgPSAic2ltcGxlLWF1ZGlv
LWNhcmQiOworCQlzaW1wbGUtYXVkaW8tY2FyZCxuYW1lID0gIk9uLWJvYXJkIFNQRElGIjsKKwor
CQlzaW1wbGUtYXVkaW8tY2FyZCxjcHUgeworCQkJc291bmQtZGFpID0gPCZzcGRpZj47CisJCX07
CisKKwkJc2ltcGxlLWF1ZGlvLWNhcmQsY29kZWMgeworCQkJc291bmQtZGFpID0gPCZzcGRpZl9v
dXQ+OworCQl9OworCX07CisKKwlzcGRpZl9vdXQ6IHNwZGlmLW91dCB7CisJCSNzb3VuZC1kYWkt
Y2VsbHMgPSA8MD47CisJCWNvbXBhdGlibGUgPSAibGludXgsc3BkaWYtZGl0IjsKKwl9OworCiAJ
dGltZXIgewogCQljb21wYXRpYmxlID0gImFybSxhcm12OC10aW1lciI7CiAJCWludGVycnVwdHMg
PSA8R0lDX1BQSSAxMwpAQCAtMjczLDYgKzI5MSwxMSBAQAogCQkJCWJpYXMtcHVsbC11cDsKIAkJ
CX07CiAKKwkJCXNwZGlmX3R4X3Bpbjogc3BkaWYtdHgtcGluIHsKKwkJCQlwaW5zID0gIlBINyI7
CisJCQkJZnVuY3Rpb24gPSAic3BkaWYiOworCQkJfTsKKwogCQkJdWFydDBfcGhfcGluczogdWFy
dDAtcGgtcGlucyB7CiAJCQkJcGlucyA9ICJQSDAiLCAiUEgxIjsKIAkJCQlmdW5jdGlvbiA9ICJ1
YXJ0MCI7CkBAIC00MDIsNiArNDI1LDIxIEBACiAJCQl9OwogCQl9OwogCisJCXNwZGlmOiBzcGRp
ZkA1MDkzMDAwIHsKKwkJCSNzb3VuZC1kYWktY2VsbHMgPSA8MD47CisJCQljb21wYXRpYmxlID0g
ImFsbHdpbm5lcixzdW41MGktaDYtc3BkaWYiOworCQkJcmVnID0gPDB4MDUwOTMwMDAgMHg0MDA+
OworCQkJaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIxIElSUV9UWVBFX0xFVkVMX0hJR0g+OworCQkJ
Y2xvY2tzID0gPCZjY3UgQ0xLX0JVU19TUERJRj4sIDwmY2N1IENMS19TUERJRj47CisJCQljbG9j
ay1uYW1lcyA9ICJhcGIiLCAic3BkaWYiOworCQkJcmVzZXRzID0gPCZjY3UgUlNUX0JVU19TUERJ
Rj47CisJCQlkbWFzID0gPCZkbWEgMj47CisJCQlkbWEtbmFtZXMgPSAidHgiOworCQkJcGluY3Ry
bC1uYW1lcyA9ICJkZWZhdWx0IjsKKwkJCXBpbmN0cmwtMCA9IDwmc3BkaWZfdHhfcGluPjsKKwkJ
CXN0YXR1cyA9ICJkaXNhYmxlZCI7CisJCX07CisKIAkJdXNiMm90ZzogdXNiQDUxMDAwMDAgewog
CQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuNTBpLWg2LW11c2IiLAogCQkJCSAgICAgImFs
bHdpbm5lcixzdW44aS1hMzMtbXVzYiI7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2Et
ZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
