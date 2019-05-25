Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD6B2A552
	for <lists+alsa-devel@lfdr.de>; Sat, 25 May 2019 18:26:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79DC51746;
	Sat, 25 May 2019 18:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79DC51746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558801566;
	bh=/BtnZ2MmXdyDKSGN3zKPd5ro6f7WGNRiXtUfoM6zj/w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K59IhbWhVFYrbIkKC2TocATXSfLb7j5OECdZVDwMLtkikpgt8hQiDZDnWBiUUXnQh
	 rCGEnFottNt54wPiuc0Z1PXy9uEI38G5OHWRAFHr/LWPd2LDOBs5v42NXIHThIlIV3
	 JeH0pL2LrpecRBFy/Rnka0k/58XaDh6FnRKMN1ho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9ACCF89725;
	Sat, 25 May 2019 18:23:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3FE1F89707; Sat, 25 May 2019 18:23:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 007A3F8065A
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 18:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 007A3F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="giSZXQt0"
Received: by mail-wr1-x442.google.com with SMTP id e15so12816695wrs.4
 for <alsa-devel@alsa-project.org>; Sat, 25 May 2019 09:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bs0GZbXZnXWtuyaAPHUlYLzvVYGzvS4bd3eSLwNHTuY=;
 b=giSZXQt0MWlK2fHUjWgOUBvx8c/keasY+/8yTFoSbFYY9tC6K36oK4UShXl4+A3HX9
 Eiaxz8OwyLrYB2+rhcZ9ocu7QTj+KKenYUgfgK9wZdZzzwNnt10Wk9nr30mbXvXRCCwN
 BYqnXEqgr6uBUAtah3FOMG3ShB8A7Jg3bKJk4ZSlS15SBRzratMuquEAkFI59WrweZin
 u8Zbt27nMmkeP+73J2MIylL93doVtr/2IpdCEp3ICmqO//TPqcVOVWDP8d6x8Q/AZ/9r
 LUydzhApeB5QU785RgFXuxzG619sMvNO5ufYUPeiy0qBr/7XEsv8gQWfdQQnBosaauO8
 ePUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bs0GZbXZnXWtuyaAPHUlYLzvVYGzvS4bd3eSLwNHTuY=;
 b=dUdM4aZZJ9izKEG9j+SqGMxQ+qDn6DeqkTVwcjiaBIvilVcwIjGRcwJ97TRLOe7VdX
 lZOPkHDIgEvKO4bqZGdknRRL1K322iI2nduTdT4dvGrzVoC78eMRrZgCkK2jMfD1k76E
 tn8p8a0EcrFa2wD/MZzcPJr2eNdfH3Gj8O+HD4kyoHrIROQrHCD42HUBnQVw7Q5tsM4l
 FCo8s8IsFCV79nYq+izaSputFygPwmlnXcA3X8LNxuRHzeHaA77yUn3GKpH0GxKyA8wY
 suBxgiI9kuGdF/v2zomRjIpg0XMds8fAwgrJ7ubSzjbMeYNHYsPN946k+4j1aXIIyhZ7
 UZbA==
X-Gm-Message-State: APjAAAWjg4udh9MInmW1Z9Q89HxQiMlYh8s0DGGUmtrjzxQ6cR9M9Al2
 5nl5J7X663W899rZ+DOirMk=
X-Google-Smtp-Source: APXvYqyj8HVx5lOCz7RholqarzDrKbt7byE/t3isboLhVRwX4Won+3vr3HChJcAYfxYvT9D3qtImPg==
X-Received: by 2002:adf:fc4b:: with SMTP id e11mr4209008wrs.340.1558801412178; 
 Sat, 25 May 2019 09:23:32 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id k184sm13194409wmk.0.2019.05.25.09.23.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 25 May 2019 09:23:31 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Sat, 25 May 2019 18:23:17 +0200
Message-Id: <20190525162323.20216-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525162323.20216-1-peron.clem@gmail.com>
References: <20190525162323.20216-1-peron.clem@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v3 1/7] dt-bindings: sound: sun4i-spdif: Add
	Allwinner H6 compatible
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

QWxsd2lubmVyIEg2IGhhcyBhIFNQRElGIGNvbnRyb2xsZXIgd2l0aCBhbiBpbmNyZWFzZSBvZiB0
aGUgZmlmbwpzaXplIGFuZCBhIHNsaWdoZXIgZGlmZmVyZW5jZSBpbiBtZW1vcnkgbWFwcGluZyBj
b21wYXJlIHRvIEgzL0E2NC4KClRoaXMgbWFrZSBpdCBub3QgY29tcGF0aWJsZSB3aXRoIHRoZSBw
cmV2aW91cyBnZW5lcmF0aW9uLgoKSW50cm9kdWNlIGEgc3BlY2lmaWMgYmluZGluZ3MgZm9yIEg2
IFNvQy4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5j
b20+ClJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpBY2tlZC1ieTog
TWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0tCiBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvc3VueGksc3VuNGktc3BkaWYudHh0IHwgMyAr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvc3VueGksc3Vu
NGktc3BkaWYudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3N1
bnhpLHN1bjRpLXNwZGlmLnR4dAppbmRleCAwYzY0YTIwOWMyZTkuLmMwZmJiNTBhNGRmOSAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL3N1bnhpLHN1
bjRpLXNwZGlmLnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291
bmQvc3VueGksc3VuNGktc3BkaWYudHh0CkBAIC03LDEwICs3LDExIEBAIEZvciBub3cgb25seSBw
bGF5YmFjayBpcyBzdXBwb3J0ZWQuCiAKIFJlcXVpcmVkIHByb3BlcnRpZXM6CiAKLSAgLSBjb21w
YXRpYmxlCQk6IHNob3VsZCBiZSBvbmUgb2YgdGhlIGZvbGxvd2luZzoKKyAgLSBjb21wYXRpYmxl
CQk6IFNob3VsZCBiZSBvbmUgb2YgdGhlIGZvbGxvd2luZzoKICAgICAtICJhbGx3aW5uZXIsc3Vu
NGktYTEwLXNwZGlmIjogZm9yIHRoZSBBbGx3aW5uZXIgQTEwIFNvQwogICAgIC0gImFsbHdpbm5l
cixzdW42aS1hMzEtc3BkaWYiOiBmb3IgdGhlIEFsbHdpbm5lciBBMzEgU29DCiAgICAgLSAiYWxs
d2lubmVyLHN1bjhpLWgzLXNwZGlmIjogZm9yIHRoZSBBbGx3aW5uZXIgSDMgU29DCisgICAgLSAi
YWxsd2lubmVyLHN1bjUwaS1oNi1zcGRpZiI6IGZvciB0aGUgYWxsd2lubmVyIEg2IFNvQwogCiAg
IC0gcmVnCQkJOiBPZmZzZXQgYW5kIGxlbmd0aCBvZiB0aGUgcmVnaXN0ZXIgc2V0IGZvciB0aGUg
ZGV2aWNlLgogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkFsc2EtZGV2ZWwgbWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9q
ZWN0Lm9yZwpodHRwczovL21haWxtYW4uYWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2Fsc2EtZGV2ZWwK
