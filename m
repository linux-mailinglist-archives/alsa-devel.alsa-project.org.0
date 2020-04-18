Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 988C01AF5A2
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 00:48:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4056F846;
	Sun, 19 Apr 2020 00:48:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4056F846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587250131;
	bh=Jvy3ne5DgM8OayHGMO9Ywg9q85cO1bdmYPOMsFS877Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b0sTbl4vVilJJzYSvhuQ0m9HoVqJvG1T8aZqF7UzOXFqMQx9i9DsHFNyGsEyZy260
	 q2pTIwmMB+j0vMwe1IArqewwg9CRdaBKwxxXjscd8lhGllh7FwPzNVfQ13kwjrCxtL
	 NmfwpiACa2krZQq+1qUeSjgrmJFrQBEzTd/36eG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F32D7F802BC;
	Sun, 19 Apr 2020 00:44:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0092EF8028F; Sun, 19 Apr 2020 00:44:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0B75F80122
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 00:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0B75F80122
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RxHYA8Ts"
Received: by mail-wr1-x441.google.com with SMTP id i10so7380230wrv.10
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 15:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0RLyOmcQjC6vn1XEI3ccjJ++FkYMXRfGQ9jNbYoBA2Y=;
 b=RxHYA8TscBFB44NiehmUfeeQ06VUO3DFs/wsLjmwVEtal9fdToV7SPpG8MiCJfBS3j
 SPZFa960dZe2EhROSESp9ye1krXTOZiDFANBH6AMkfka/8TvX7RyL6lngNgc7vKv1zqG
 I198UmThs8xPlBLubazE9FsVpVx2WTYFzsdMooOCmI18+G/iYGooaaF4U87+MaMTyrvZ
 KIkmBGLtfkorteZae8wDxddFnlezaLiCynZ0atvPQy4AZdjabbmKOxC4AY7MoFmQ7FHJ
 hXqWCY3ZY3ChScUcC79Eh5bqQ8aMKrLvcvokHvhOwHZN8CvaIAtZsQX7aKcBBvNQ0+U+
 4uCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0RLyOmcQjC6vn1XEI3ccjJ++FkYMXRfGQ9jNbYoBA2Y=;
 b=Nhn568IIMClmV59nr42Fg1U9/0DD0vXM0j4IiKLj7dgRIGGk3McBHc9S0sHGVs0fEa
 hq46ZGd4tmnWsHM5EaabLpJWwD7bTKO0yY+sqN5xtWtf+++9xUTYExk9C6EnN37NQ6ow
 YSPVFTn32g/Y8HgJqqJMlDLUaPLBjtF0A/sRSO6eD9gcl3QN38xUld77twqlqIABEgl9
 HSgF/hq9ELngFOH44A/oRURcvyNBJepuYy5UZX+RUvb9lwm3uIlhw4XwhxJQsCAuXFkB
 GlkdHy+7G6vdmcel5dPtnVzJB9qStukkHVpnlMMNLSNmLewLprKWSka4tiRmBOhOa0dn
 HEtw==
X-Gm-Message-State: AGi0PuawCix0dECqNF2MgjGf5wmaT14vl2iDVLcA12b+td0BzlGIZlKc
 0Ffk2hWGqfVDlPG127BpQnU=
X-Google-Smtp-Source: APiQypKVFCS52LWaQqMpRrBfL5zoWfUa0PpkSMSmggBTe57uDxcMbauy9YOkMjLXPaTEMf2xJWwU2w==
X-Received: by 2002:a5d:6584:: with SMTP id q4mr11851428wru.403.1587249881115; 
 Sat, 18 Apr 2020 15:44:41 -0700 (PDT)
Received: from localhost.localdomain (91-167-199-67.subs.proxad.net.
 [91.167.199.67])
 by smtp.gmail.com with ESMTPSA id t16sm13371559wmi.27.2020.04.18.15.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 15:44:40 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 2/7] dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
Date: Sun, 19 Apr 2020 00:44:30 +0200
Message-Id: <20200418224435.23672-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418224435.23672-1-peron.clem@gmail.com>
References: <20200418224435.23672-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, linux-kernel@vger.kernel.org,
 Marcus Cooper <codekipper@gmail.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Jernej Skrabec <jernej.skrabec@siol.net>

H6 I2S is very similar to H3, except that it supports up to 16 channels
and thus few registers have fields on different position.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index 112ae00d63c1..606ad2d884a8 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -24,6 +24,7 @@ properties:
       - items:
           - const: allwinner,sun50i-a64-i2s
           - const: allwinner,sun8i-h3-i2s
+      - const: allwinner,sun50i-h6-i2s
 
   reg:
     maxItems: 1
@@ -59,6 +60,7 @@ allOf:
               - allwinner,sun8i-a83t-i2s
               - allwinner,sun8i-h3-i2s
               - allwinner,sun50i-a64-codec-i2s
+              - allwinner,sun50i-h6-i2s
 
     then:
       required:
-- 
2.20.1

