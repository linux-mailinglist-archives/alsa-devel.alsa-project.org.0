Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AEF550995
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jun 2022 11:55:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 777631F59;
	Sun, 19 Jun 2022 11:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 777631F59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655632543;
	bh=qJqdRhppLHf8Ht0qI14YI59McVuZNxX+kjzP3VWebok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OzW6E38PVjB+S/ZYe9yFZIsJ4sjilc80cxS0dCFeByF/beLd4TNTBpinBBaCr5E+6
	 beERcexD6Nn2qzkRrbXSvzSsxDTjTFh5S5M9u1aR605NKqVvuFOzLMbUSaCAy97utw
	 INja1JANvS3Gdi3uHTJaq78ME4n4WY0SQ4md9jec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1078DF8027B;
	Sun, 19 Jun 2022 11:53:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA4A9F8053D; Sun, 19 Jun 2022 11:53:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 702ABF8027B
 for <alsa-devel@alsa-project.org>; Sun, 19 Jun 2022 11:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 702ABF8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="TyGlyA60"
Received: by mail-pf1-x434.google.com with SMTP id s37so7776811pfg.11
 for <alsa-devel@alsa-project.org>; Sun, 19 Jun 2022 02:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2fjP9Be4hnegvsgOyWKGbkMNBDmKFNmzp11PphlEg+I=;
 b=TyGlyA6041iqq3nmsynOTfJ21vEfUvDYCG4nSwbrENb4R/wm4mKgHSJhZomtxv5MwJ
 vEC3hgZrSrypBzETpsbBjyhi+gFB50/DBY5Iwp0MB2kUmSPXxiU2I0B8UesLx61Nd7Gj
 +/kHxoFNHBpp0VyXgbT0IdwmPtCUm+uijFxBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2fjP9Be4hnegvsgOyWKGbkMNBDmKFNmzp11PphlEg+I=;
 b=gH8Lbpyj5WEyAz8iV9rFIkPoQ9LHFKmGbJ5lJMqxCmHsOMzSGaIojoyHNAIoMa95Xj
 N4F0fMqooEv7CrNCHDz8zaXp7mxzNe5htPd/bYh0A41W1yNi5b841QVthyIpVh78B3e8
 9GpYSaXac9uj6fk/SFtOjVH1MTCVZTjYdjMoN7jhjdiu5mxs4Wy8Eh7M214I/iZmBUSJ
 b3acbzLyUU+Hsd5x+gSw2v6Fx35d82igbCI+UZbGokmgoCEJM4qhgME/QR2NWCQJYIDX
 DqH/3OitT0pgYSp4qGipjrmq2DAOlxwPiy1uZ9000UCsWZ1ATAopTC0YLzPoE7gqxi6v
 yj2g==
X-Gm-Message-State: AJIora/BhiP1HLo7zeT4QC/Sxz9pz5Gh4QfrdVM9iGMnBqGZdCKGcElt
 kQ/ySI1mJ5JLzKuTSyV8C513Ag==
X-Google-Smtp-Source: AGRyM1sE4ddG0U8OSTKG5E7HfKRJdGT18RC0WV6uVpoOpoAIl/cjFPO7PDHNBgm+VZoiSBuDSBih7g==
X-Received: by 2002:a63:d94e:0:b0:408:9aeb:c55f with SMTP id
 e14-20020a63d94e000000b004089aebc55fmr16482677pgj.287.1655632422791; 
 Sun, 19 Jun 2022 02:53:42 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62178d000000b0050dc762817esm6799971pfx.88.2022.06.19.02.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 02:53:42 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v4 3/3] ASoC: dt-bindings: rockchip: Document pinctrl-names
 for i2s
Date: Sun, 19 Jun 2022 09:53:24 +0000
Message-Id: <20220619095324.492678-4-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
In-Reply-To: <20220619095324.492678-1-judyhsiao@chromium.org>
References: <20220619095324.492678-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Judy Hsiao <judyhsiao@chromium.org>, linux-arm-kernel@lists.infradead.org
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

This patch documents pinctrl-names for i2s.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 Documentation/devicetree/bindings/sound/rockchip-i2s.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
index 5ea16b8ef93f..7e36e389e976 100644
--- a/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/rockchip-i2s.yaml
@@ -61,6 +61,13 @@ properties:
           - const: tx
           - const: rx
 
+  pinctrl-names:
+    oneOf:
+      - const: default
+      - items:
+          - const: bclk_on
+          - const: bclk_off
+
   power-domains:
     maxItems: 1
 
-- 
2.36.1.476.g0c4daa206d-goog

