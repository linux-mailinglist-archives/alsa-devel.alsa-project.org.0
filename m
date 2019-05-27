Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4452BB39
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 22:15:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3BDD178F;
	Mon, 27 May 2019 22:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3BDD178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558988130;
	bh=0Ucy4YT/E0gmn8dZn4h4Bn1625C/VDxsNVw4EX/0yXE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kb5jFOqom4eE54OdAzpfNEHOfggANvXESnZlCg71MN8cVnwhfeHvE4oYKEcIyOqbY
	 FziqD6y56AY1Xm3fWDdFte5f+s3q274WMTZXZq4sjmym5NNYNtqXerjKYJxc7aCC1C
	 HUccQBEUNiu5oVJZh/E/DCKyVb6isHQqVGkXZkRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 649CDF89743;
	Mon, 27 May 2019 22:10:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FB09F896E5; Mon, 27 May 2019 22:10:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D13DF8072E
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 22:10:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D13DF8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aLE1iny4"
Received: by mail-wm1-x341.google.com with SMTP id w9so540982wmi.0
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 13:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vtCxvhDjc6UIDNW85CWIxfeFRpcagFN9CHe3gjmJy+k=;
 b=aLE1iny4yG3QCT/zG491gC1RXU7vzr69elKMD8GQaEyJQ4YjjaXpQCTv/m7SwtQWTT
 qOfCWbDxi7OckkxwLbHzS3+YXZYJHdUzLuZCdP4RY/rG7w49JvzLb6LRX6jr+ph9SiqH
 BUuDczojLSivlQnaCGDi9VgWm/ZHpdc09A9RQ3/SZkDdUoPzMURenPRHR6MJQruRFDXM
 KiZCPYH4bQh0gsxm4wJMdS2ZdrnVbdtWnwuhtrTWgvBNdESrHelN/M4g/AxuEQPyJl4g
 tj8aRZtoFS2vR5rMuVcs+C+J2w7pMALclLGyJK53yhlQjHbfTpVM0sLD4a1uumOUq2nF
 9t+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vtCxvhDjc6UIDNW85CWIxfeFRpcagFN9CHe3gjmJy+k=;
 b=T2zC9RTcgVBxeRqyd63lAeSK6ZYz2FEcbV7mYzIIH8/+ymLPu9EiWSNECBqdlPZK3D
 KaAyPizxem2CgZAVqCkC2XVMz+819oOZjsl1US/YDZVGH4DGso20WCM1ZqGfS13vSw7S
 f5uax0saDpthEfjgCuv2Z4pdW+yfipSsVrlCu86yqddqSAVsv8YsP5Gf4UT+AinnWRBy
 ah33xEq27Ypxc+VUNm2OiKHlREqTahdcY8mYhc2Gjt4rcyHZOGG+EcEQuo/PvMea9Itx
 8rFw3fHIY63vBDqctiyn0DK6Mj44Q5PR+1g010DMmHp1OWaOQgEDOWfDlubMLh9Ebfvh
 D0Hg==
X-Gm-Message-State: APjAAAXx3QF54NdW7sGOyYFU64oKHQUk2My0eA3KdCbGKgqFkY+H9PDn
 a7xrkXaI1ddEYTqumH/QBxU=
X-Google-Smtp-Source: APXvYqxH3xB78DGBhf12PYNkbxwGH69xUEVnBP+LhdwkWmd176J8x+oCf/GMubBlZhUYOV/xcxXuIQ==
X-Received: by 2002:a1c:eb0c:: with SMTP id j12mr464874wmh.55.1558987819118;
 Mon, 27 May 2019 13:10:19 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id s127sm308523wmf.48.2019.05.27.13.10.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 13:10:18 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 27 May 2019 22:06:25 +0200
Message-Id: <20190527200627.8635-6-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527200627.8635-1-peron.clem@gmail.com>
References: <20190527200627.8635-1-peron.clem@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 5/7] arm64: dts: allwinner: Add SPDIF node
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
eCBmNGVhNTk2YzgyY2UuLmUwY2EyMzcwNDcxOSAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9ib290
L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kKKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9h
bGx3aW5uZXIvc3VuNTBpLWg2LmR0c2kKQEAgLTgzLDYgKzgzLDI0IEBACiAJCW1ldGhvZCA9ICJz
bWMiOwogCX07CiAKKwlzb3VuZC1zcGRpZiB7CisJCWNvbXBhdGlibGUgPSAic2ltcGxlLWF1ZGlv
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
