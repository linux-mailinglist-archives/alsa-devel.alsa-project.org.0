Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C685A2BB2D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 22:13:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45914178F;
	Mon, 27 May 2019 22:12:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45914178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558988013;
	bh=cfdgK6rj54CndU9cECJaq4q1Z8KpS96KCxMF6DRSHko=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YF40GLoVvPCxde7xSMjt8U32RuM3hVHzxua9P/1H6STyp48A2RTCuSzBEdIi1eHtC
	 E5kP8rsA+us0jTqLHkHTbfFoSU4cwpfco61RgEwmVheu0BA+b+oc4x1ksWAiRTBqel
	 6irp4CHswU6LFul/A1QG4oR2xEXhw7USyGmIrols=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7601AF8972F;
	Mon, 27 May 2019 22:10:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90E66F8065A; Mon, 27 May 2019 22:10:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3372F8065A
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 22:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3372F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GLpFAL4w"
Received: by mail-wm1-x343.google.com with SMTP id u78so519693wmu.5
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 13:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t6VdND5amN3StrhVc/zIi7Y91LySYgcr3YUPE2udaNw=;
 b=GLpFAL4wu2OrqSDvxzgInDtXCuimTNOqaHJziuaMoWOTVLMYBrJEbzRCGIVqQinpIS
 xeY0389EDmZ4JpQYjVNdRo2DtKE9/Sje54FrxlxZOIAZjV5knm+sTOp68PqqNyDPvRM0
 uUlLytSd2Zs/FxFU282CMHz4nx3Ha+th8GVF+13SuZEv+hndX+zmy/6zrIN3IOvfl3nN
 ESYjm3YPKgBkqSRFMUY0WbkxdAwez86GmY6zf4rd+HFypmxYWV4uBcLvxwwLmC1CKgQ/
 Giaiz+t2+C6sdmd3naO9c85x13RVAeqjMaFoN5fgp9LGewHYfwcRQNUvtO1D1lfa/zyB
 ivog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t6VdND5amN3StrhVc/zIi7Y91LySYgcr3YUPE2udaNw=;
 b=tolYRs7KzHjGrCfUgqBoqNwaVHqGXiYE+kL5zH+/PVQmfehpu2vnJL2CScu00PkFMx
 3lV9VfXlx8xNYhXGlXlVL5iuavbsSRsO5qLzT422H1Q713QVE5vHN5z9Lpz9XzedBQT+
 LWlxws1yNbBfQmVu80kYh2WXduTEapGPwds46r91f4s9B7Wwx8at2lSduWbB0feplpJ1
 E4zGqsW4Qa8zhlLptsv+B5Ys4KsBkllhcsuDeI4sByI4XCk61/XKBuA12IgsCloBcoDt
 kWppFPJ8/x5DrIcWe5shlK8nBaoaxAEjTecvloa3fuOmIObjq2N1SFsl+CaxqDaQ9Y6K
 1SuQ==
X-Gm-Message-State: APjAAAWan8/1snAyWBkZX4/2e8RrnUjpwCzHtxPC2DhSgEH2rEkgL+01
 fttcCXZuwz0xmUYhIz0nQgE=
X-Google-Smtp-Source: APXvYqwhDPRjhw9OpYYCmRvpl9ZRKHy8xPORapsR6gjT3JrkGdCqImbpQ0zkOtaRtG4S2cd9sPO+9w==
X-Received: by 2002:a7b:c549:: with SMTP id j9mr453146wmk.122.1558987814935;
 Mon, 27 May 2019 13:10:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id s127sm308523wmf.48.2019.05.27.13.10.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 13:10:13 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 27 May 2019 22:06:22 +0200
Message-Id: <20190527200627.8635-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527200627.8635-1-peron.clem@gmail.com>
References: <20190527200627.8635-1-peron.clem@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 2/7] ASoC: sun4i-spdif: Move quirks to the
	top
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

VGhlIHF1aXJrcyBhcmUgYWN0dWFsbHkgZGVmaW5lcyBpbiB0aGUgbWlkZGxlIG9mIHRoZSBmaWxl
IHdpdGgKc2hvcnQgZXhwbGFuYXRpb24uCgpNb3ZlIHRoaXMgYXQgdGhlIHRvcCBhbmQgYWRkIGEg
c2VjdGlvbiB0byBoYXZlIGNvaGVyZW5jeSB3aXRoCnN1bjRpLWkycy4KClNpZ25lZC1vZmYtYnk6
IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+CkFja2VkLWJ5OiBNYXhpbWUg
UmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgotLS0KIHNvdW5kL3NvYy9zdW54aS9z
dW40aS1zcGRpZi5jIHwgMTYgKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL3N1bnhp
L3N1bjRpLXNwZGlmLmMgYi9zb3VuZC9zb2Mvc3VueGkvc3VuNGktc3BkaWYuYwppbmRleCBiNGFm
NGFhYmVhZDEuLmI2YzY2YTYyZTkxNSAxMDA2NDQKLS0tIGEvc291bmQvc29jL3N1bnhpL3N1bjRp
LXNwZGlmLmMKKysrIGIvc291bmQvc29jL3N1bnhpL3N1bjRpLXNwZGlmLmMKQEAgLTE2MSw2ICsx
NjEsMTcgQEAKICNkZWZpbmUgU1VONElfU1BESUZfU0FNRlJFUV8xNzZfNEtIWgkJMHhjCiAjZGVm
aW5lIFNVTjRJX1NQRElGX1NBTUZSRVFfMTkyS0haCQkweGUKIAorLyoqCisgKiBzdHJ1Y3Qgc3Vu
NGlfc3BkaWZfcXVpcmtzIC0gRGlmZmVyZW5jZXMgYmV0d2VlbiBTb0MgdmFyaWFudHMuCisgKgor
ICogQHJlZ19kYWNfdHhfZGF0YTogVFggRklGTyBvZmZzZXQgZm9yIERNQSBjb25maWcuCisgKiBA
aGFzX3Jlc2V0OiBTb0MgbmVlZHMgcmVzZXQgZGVhc3NlcnRlZC4KKyAqLworc3RydWN0IHN1bjRp
X3NwZGlmX3F1aXJrcyB7CisJdW5zaWduZWQgaW50IHJlZ19kYWNfdHhkYXRhOworCWJvb2wgaGFz
X3Jlc2V0OworfTsKKwogc3RydWN0IHN1bjRpX3NwZGlmX2RldiB7CiAJc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldjsKIAlzdHJ1Y3QgY2xrICpzcGRpZl9jbGs7CkBAIC00MDUsMTEgKzQxNiw2
IEBAIHN0YXRpYyBzdHJ1Y3Qgc25kX3NvY19kYWlfZHJpdmVyIHN1bjRpX3NwZGlmX2RhaSA9IHsK
IAkubmFtZSA9ICJzcGRpZiIsCiB9OwogCi1zdHJ1Y3Qgc3VuNGlfc3BkaWZfcXVpcmtzIHsKLQl1
bnNpZ25lZCBpbnQgcmVnX2RhY190eGRhdGE7CS8qIFRYIEZJRk8gb2Zmc2V0IGZvciBETUEgY29u
ZmlnICovCi0JYm9vbCBoYXNfcmVzZXQ7Ci19OwotCiBzdGF0aWMgY29uc3Qgc3RydWN0IHN1bjRp
X3NwZGlmX3F1aXJrcyBzdW40aV9hMTBfc3BkaWZfcXVpcmtzID0gewogCS5yZWdfZGFjX3R4ZGF0
YQk9IFNVTjRJX1NQRElGX1RYRklGTywKIH07Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFs
c2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
