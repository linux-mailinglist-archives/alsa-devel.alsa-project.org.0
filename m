Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BFA2A555
	for <lists+alsa-devel@lfdr.de>; Sat, 25 May 2019 18:28:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 890A91743;
	Sat, 25 May 2019 18:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 890A91743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558801680;
	bh=Cs6GLavuVA039eAThDGs+D4w+BjWX0NhKF2zG3i5s6E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KUDBA1nhtjXUGDCLfaJFZh8cfMWHZI2mq8xfvb9VLleQlaxAVIjV+AJB+VQiUalSd
	 m3NYnjvTo7uDOk+z4Uz3PJCXudTOMfl+zlSRzjEJhjua/FnD0BeRCuwoVPD6FymDtJ
	 XiGzkYr7niuSutNwRfELSdF1xO/g67K/F76diClU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB449F89735;
	Sat, 25 May 2019 18:23:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4DFDF89674; Sat, 25 May 2019 18:23:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAFA5F89670
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 18:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAFA5F89670
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bHLkAWb9"
Received: by mail-wr1-x441.google.com with SMTP id w13so4443646wru.11
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5uUaYKFKqVciIG3lVseFyzbyz6GKlPhTPtvbtba51oA=;
 b=bHLkAWb9RfaNiXMj3sBfSi6dpURjsbFlzSAaDE8K334xT29EiBpmbLYA0Gk6IdaNIb
 2mZY4BDMqGmHswFGwX20J00imoNKgA8vT1DSgaJR437fnNk6ylUGk6Zm7+Yp2ih11lDm
 vbHzXF7kJFN6bEXymy0y1E3n/OU+uW9HJTHTFeahfVhQeYY5QVo4o9+M6yY0n71WdKfV
 b9BtKnuVccwPam5ipRCVE7iP0vV8f/cOEGMjjNVIOH5/FckfXzpBxNcPKNV/MBHWOs6K
 ZBxdukjjSbTsNYLW5IDaUvM1BDTjNL8l9/QPT3cg8xtaUpQxOPG7zjKdk7GIeW6Mf7hj
 /FPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5uUaYKFKqVciIG3lVseFyzbyz6GKlPhTPtvbtba51oA=;
 b=c0jtQNa0fcWurS7HyoXoq26SBT9ArPpEmpRP8tfPWPEBzIZmCAYNY3DieE0UYMMUlU
 MmMydwr/fqsn2Rt6YFBIY5oPYdY8eRH8VUPJHUADmGSK9oZlhvzUUD+2679qHvyOnhIU
 JVE+DNVIC5W0WuiLfLjR4WxBGDPQAoMMMJMIf/derT3vOrNp2Bmf//uhk6qC+j/KLZkY
 r0BP4nCRAgumvGv69f58pi24hxhm5/tsFtMklejerrqNVXV37vHCWzmYKrADN5v6KJ9P
 aHPQcRWJVHCoALUj5FKagtXYUhiWscWEkp4MXlLaF/PooIh1eD3O+anB2rC5lcp/g8QJ
 b0nA==
X-Gm-Message-State: APjAAAVYmXF11zVqJXsRfbmW2yUfxEpykFtKNlhfXscO0bL4qdL1WKQ7
 NkV1RKkx/3MTz4gSb5BNtiE=
X-Google-Smtp-Source: APXvYqwkPqO3mn4ga/iil/wlxyKMkJ5pDpNfzOJHHLu+QPgmwmExfzMvPXSHTN8LXOo1cqiuCvs5UA==
X-Received: by 2002:a05:6000:1c6:: with SMTP id
 t6mr18063975wrx.236.1558801415765; 
 Sat, 25 May 2019 09:23:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id k184sm13194409wmk.0.2019.05.25.09.23.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 25 May 2019 09:23:35 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 25 May 2019 18:23:20 +0200
Message-Id: <20190525162323.20216-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525162323.20216-1-peron.clem@gmail.com>
References: <20190525162323.20216-1-peron.clem@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v3 4/7] ASoC: sun4i-spdif: Add support for H6
	SoC
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

QWxsd2lubmVyIEg2IGhhcyBhIGRpZmZlcmVudCBtYXBwaW5nIGZvciB0aGUgZmlmbyByZWdpc3Rl
ciBjb250cm9sbGVyLgoKQWN0dWFsbHkgb25seSB0aGUgZmlmbyBUWCBiaXQgaXMgdXNlZCBpbiB0
aGUgZHJpdmVycy4KClVzZSB0aGUgZnJlc2hseSBpbnRyb2R1Y2VkIHF1aXJrcyB0byBtYWtlIHRo
aXMgZHJpdmVycyBjb21wYXRpYmxlIHdpdGgKdGhlIEFsbHdpbm5lciBINi4KClNpZ25lZC1vZmYt
Ynk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Ci0tLQogc291bmQvc29j
L3N1bnhpL3N1bjRpLXNwZGlmLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9zdW54aS9z
dW40aS1zcGRpZi5jIGIvc291bmQvc29jL3N1bnhpL3N1bjRpLXNwZGlmLmMKaW5kZXggODMxN2Ji
ZWUwNzEyLi44NmJmNmE5OTcwM2YgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9zdW54aS9zdW40aS1z
cGRpZi5jCisrKyBiL3NvdW5kL3NvYy9zdW54aS9zdW40aS1zcGRpZi5jCkBAIC03NSw2ICs3NSwx
OCBAQAogCSNkZWZpbmUgU1VONElfU1BESUZfRkNUTF9SWE9NKHYpCQkoKHYpIDw8IDApCiAJI2Rl
ZmluZSBTVU40SV9TUERJRl9GQ1RMX1JYT01fTUFTSwkJR0VOTUFTSygxLCAwKQogCisjZGVmaW5l
IFNVTjUwSV9INl9TUERJRl9GQ1RMICgweDE0KQorCSNkZWZpbmUgU1VONTBJX0g2X1NQRElGX0ZD
VExfSFVCX0VOCQlCSVQoMzEpCisJI2RlZmluZSBTVU41MElfSDZfU1BESUZfRkNUTF9GVFgJCUJJ
VCgzMCkKKwkjZGVmaW5lIFNVTjUwSV9INl9TUERJRl9GQ1RMX0ZSWAkJQklUKDI5KQorCSNkZWZp
bmUgU1VONTBJX0g2X1NQRElGX0ZDVExfVFhUTCh2KQkJKCh2KSA8PCAxMikKKwkjZGVmaW5lIFNV
TjUwSV9INl9TUERJRl9GQ1RMX1RYVExfTUFTSwkJR0VOTUFTSygxOSwgMTIpCisJI2RlZmluZSBT
VU41MElfSDZfU1BESUZfRkNUTF9SWFRMKHYpCQkoKHYpIDw8IDQpCisJI2RlZmluZSBTVU41MElf
SDZfU1BESUZfRkNUTF9SWFRMX01BU0sJCUdFTk1BU0soMTAsIDQpCisJI2RlZmluZSBTVU41MElf
SDZfU1BESUZfRkNUTF9UWElNCQlCSVQoMikKKwkjZGVmaW5lIFNVTjUwSV9INl9TUERJRl9GQ1RM
X1JYT00odikJCSgodikgPDwgMCkKKwkjZGVmaW5lIFNVTjUwSV9INl9TUERJRl9GQ1RMX1JYT01f
TUFTSwkJR0VOTUFTSygxLCAwKQorCiAjZGVmaW5lIFNVTjRJX1NQRElGX0ZTVEEJKDB4MTgpCiAJ
I2RlZmluZSBTVU40SV9TUERJRl9GU1RBX1RYRQkJCUJJVCgxNCkKIAkjZGVmaW5lIFNVTjRJX1NQ
RElGX0ZTVEFfVFhFQ05UU0hUCQkoOCkKQEAgLTQzOCw2ICs0NTAsMTIgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBzdW40aV9zcGRpZl9xdWlya3Mgc3VuOGlfaDNfc3BkaWZfcXVpcmtzID0gewogCS5o
YXNfcmVzZXQJPSB0cnVlLAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBzdW40aV9zcGRpZl9x
dWlya3Mgc3VuNTBpX2g2X3NwZGlmX3F1aXJrcyA9IHsKKwkucmVnX2RhY190eGRhdGEgPSBTVU44
SV9TUERJRl9UWEZJRk8sCisJLnJlZ19mY3RsX2Z0eCAgID0gU1VONTBJX0g2X1NQRElGX0ZDVExf
RlRYLAorCS5oYXNfcmVzZXQgICAgICA9IHRydWUsCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCBzdW40aV9zcGRpZl9vZl9tYXRjaFtdID0gewogCXsKIAkJLmNvbXBhdGli
bGUgPSAiYWxsd2lubmVyLHN1bjRpLWExMC1zcGRpZiIsCkBAIC00NTEsNiArNDY5LDEwIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHN1bjRpX3NwZGlmX29mX21hdGNoW10gPSB7
CiAJCS5jb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW44aS1oMy1zcGRpZiIsCiAJCS5kYXRhID0g
JnN1bjhpX2gzX3NwZGlmX3F1aXJrcywKIAl9LAorCXsKKwkJLmNvbXBhdGlibGUgPSAiYWxsd2lu
bmVyLHN1bjUwaS1oNi1zcGRpZiIsCisJCS5kYXRhID0gJnN1bjUwaV9oNl9zcGRpZl9xdWlya3Ms
CisJfSwKIAl7IC8qIHNlbnRpbmVsICovIH0KIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBz
dW40aV9zcGRpZl9vZl9tYXRjaCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2
ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
