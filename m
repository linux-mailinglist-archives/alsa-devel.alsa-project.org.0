Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5177C2BB2B
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 22:12:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6F3F17A6;
	Mon, 27 May 2019 22:11:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6F3F17A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558987966;
	bh=hifkyniKLfxgNyzN6qCNVBvlGB7Iew042wNzh/jVHzk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KlbcoJQE5EBm3dJFO44PGFCETFs4wPvYNAft4CMkJ/UMTcktsiSdqNvZoj9oETggQ
	 nKeyubq7CyCEG+1cvUGSyGhcQ8a8Ja3J36qvf7Kgd7VK3uQhd30BwCb2mpgEgxQTI5
	 dvawS1Hc4tcqo5Xu05KfITYXIqYf4jAfGlPOJSzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EF26F8970C;
	Mon, 27 May 2019 22:10:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0C26F896E0; Mon, 27 May 2019 22:10:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61015F8072E
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 22:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61015F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Fmx9pXSz"
Received: by mail-wr1-x443.google.com with SMTP id d18so17873676wrs.5
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 13:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n14EincEgyhHeNXBeUTMMuX2+QPgu7HvYrDyP4chhcI=;
 b=Fmx9pXSzDyPlNYGqK+6K6rz5Arzts2WlpCEd3ci+ylhZxGPmFNMRPHmD9qXjT7aTmP
 r6fSs0AnQZ5yU5E3Zhc7CYlR0LEMh7WvbzVA6GCoQymo70F2bOeDUvUwHnWHkWrbZj0E
 zT2BLNWUsLSX/BQS7Wy+M4nZ6GF0JgfXxQAYpJhDh9WlbSFlcNK0Rp53cVruCNQLH4nQ
 ouYBIQouyrsJ5376q0NBRb8oxpnNfaMfoUhJjSF+QP6ZdfmtjpyRRRDTMlWsA+UnQb7u
 kxMeKzzEr5PmM/x/tGjvoczXHok5VOqZeTbgeoIq/9AxT4G17wBcWa0hGPUBDmjJ4tQS
 Avig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n14EincEgyhHeNXBeUTMMuX2+QPgu7HvYrDyP4chhcI=;
 b=p6vcyPDHlF3j+6NViOskEJFAjZBa4qFCioAoq12kRqiI+/+hZtU3XCCIKIsG69s0Ew
 PTb2kvUQXoIRZD0eqyERWqRs3qrgbx0Er3Kps54pjW5aq7B2jU60bcSQBULXHsnlmN15
 R29/Hh2yxajYtuANrrKLs0G12BqhkvjmqxgTgbLw/J4L4dsqkeXjywJKbCMqz73PCjDB
 oc7l9t1rCeDJ/PSs3wUplMINOA7jpvaGBpcnaKOfI47krBFxASDD0Uc1VFt9to6V5xUH
 rjbKhcrN0OP3Fv84lihXQ8dkTLjjJM3W88bxMjzCTSZmqhsjh2lryT449d/EwwylCk2X
 lhHg==
X-Gm-Message-State: APjAAAXD1jDgrl2s6KJbK5/bPasJ05Nt+WoDD7QJBeodLbNiKbVfvJCo
 Iw/eK/woJLsF3wY9FFwqFSw=
X-Google-Smtp-Source: APXvYqx7MnbzwbceeHK9CTEcjMFASegph4tm3AEkWAL8pUfeZb/J7jGTQ1b3jiXW3bJTwlKcDKlMdw==
X-Received: by 2002:adf:fd0f:: with SMTP id e15mr12818497wrr.104.1558987813345; 
 Mon, 27 May 2019 13:10:13 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id s127sm308523wmf.48.2019.05.27.13.10.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 May 2019 13:10:12 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 27 May 2019 22:06:21 +0200
Message-Id: <20190527200627.8635-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190527200627.8635-1-peron.clem@gmail.com>
References: <20190527200627.8635-1-peron.clem@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 1/7] dt-bindings: sound: sun4i-spdif: Add
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
TWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0tCiAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9zb3VuZC9hbGx3aW5uZXIsc3VuNGktYTEwLXNwZGlmLnlhbWwgICAgIHwg
MSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvYWxsd2lubmVyLHN1bjRpLWExMC1zcGRp
Zi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2FsbHdpbm5l
cixzdW40aS1hMTAtc3BkaWYueWFtbAppbmRleCBhNDllZjIyOTRhNzQuLmUwMjg0ZDhjM2I2MyAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2FsbHdp
bm5lcixzdW40aS1hMTAtc3BkaWYueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc291bmQvYWxsd2lubmVyLHN1bjRpLWExMC1zcGRpZi55YW1sCkBAIC0yMSw2ICsy
MSw3IEBAIHByb3BlcnRpZXM6CiAgICAgICAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuNGktYTEwLXNw
ZGlmCiAgICAgICAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuNmktYTMxLXNwZGlmCiAgICAgICAtIGNv
bnN0OiBhbGx3aW5uZXIsc3VuOGktaDMtc3BkaWYKKyAgICAgIC0gY29uc3Q6IGFsbHdpbm5lcixz
dW41MGktaDYtc3BkaWYKICAgICAgIC0gaXRlbXM6CiAgICAgICAgICAgLSBjb25zdDogYWxsd2lu
bmVyLHN1bjhpLWE4M3Qtc3BkaWYKICAgICAgICAgICAtIGNvbnN0OiBhbGx3aW5uZXIsc3VuOGkt
aDMtc3BkaWYKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2pl
Y3Qub3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YWxzYS1kZXZlbAo=
