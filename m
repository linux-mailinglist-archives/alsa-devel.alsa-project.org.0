Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CB0469F8D
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 16:47:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB1CB2046;
	Mon,  6 Dec 2021 16:47:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB1CB2046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638805673;
	bh=glj+fc0Zzq2bv6vspvoFXx/ngqx5psD70AORAIfRUqM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mRu5lbM8Jzbkb2pqjd3ny3cDDeZne3j5UOElnBA6NPviuf+JiRvPbryHXiZDXeb5r
	 y9ZVm5O7pIkaYhDYFAr8EpbcLQXYl+aG5lUSQuJZEbmIQL4cE2F4HS4GGSn6x3PA2+
	 fjXP4k85RKm6mcEk7eCe7F3Gr9p/PqeMvEK3ruxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D525F804ED;
	Mon,  6 Dec 2021 16:46:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03FCEF804EC; Mon,  6 Dec 2021 16:46:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB666F804E4
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 16:46:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB666F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="n13ximXn"
Received: by mail-wm1-x334.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so102896wmi.1
 for <alsa-devel@alsa-project.org>; Mon, 06 Dec 2021 07:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6tp7FFhJACS8QWvJrV4J18ejcDzbxbLkmoezmrRFt0=;
 b=n13ximXnQOahmYmejBNmkPry0M6Eu5jpASd0nFbE5KkDYPs+PyPs9Rd3F4EE/HK4/x
 Gn8/dTpYxJxysQUcvLBAu45VgnBj0i5MnUeQkr4QVrHKctk/xbjMs2uSE0Y1muCxzy/Q
 QU76UolzAf7d7VrYYnwcgA8MEV9ynf2vskedehauqWKaUjZLjrgsHczwPmuFP+S+gkth
 380Ps6S9TmBU9nCfw5TyhFmzUizeBFbfc69fD0+RDDRzTz/4smsQj4lJLaOLQJN9qyPQ
 OIQA0NpcRVDls3Qq/S6WIJEymLuiqYKYMH4vGZ4ZU6DHUBpaQu6SbWE3D/eC1GI5wznZ
 ANlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6tp7FFhJACS8QWvJrV4J18ejcDzbxbLkmoezmrRFt0=;
 b=XVpDVhEpxuAYQ0PtUnENqSClkJxQyVxm0nug787kOdhdw7PyiVWkmJKqBIOI5pCd91
 cC/qU3eKzW/WZ0hgy2VH0uV5KFGxI96VmlEYQVo3muhYqI7LzaG1EJRy3ciIIbJxRlAb
 I77enDKPGIOpZOIfhcbpIVzqY8jT6dC80t9JPFJ3WAhFxdMI7QBbl/gYLbuWVEimCXwf
 fHGL6+J1EyfgB7aeITwMY73m0u72zZCE1lOSXgsmVRLSbD1TNadQ7wKIyb7HOeRiaq1k
 qom3UOBfODA49UEUYHUeao+5OeZqMtboDGKR46jfa70oq29IrwzQF8gwpP/PaVBEpTTA
 gaBA==
X-Gm-Message-State: AOAM531vL3kzdcIfw/M4izec1prBduKeFGqR+VgL/g3fRmvW0wGpGBwk
 dvzXeTSkPjPBBZM2+CCV4vQ=
X-Google-Smtp-Source: ABdhPJyekBe6dnXPs6YOJehgDST53pxv0RT0H/3MI6ngt8Cji7hflRixjLv1vGzfGSLx/T0I4wYVNQ==
X-Received: by 2002:a05:600c:4f55:: with SMTP id
 m21mr40236724wmq.68.1638805586114; 
 Mon, 06 Dec 2021 07:46:26 -0800 (PST)
Received: from localhost (pd9e51d39.dip0.t-ipconnect.de. [217.229.29.57])
 by smtp.gmail.com with ESMTPSA id j40sm13799400wms.19.2021.12.06.07.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 07:46:25 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: dt-bindings: tegra: Document interconnects property
Date: Mon,  6 Dec 2021 16:46:24 +0100
Message-Id: <20211206154624.229018-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
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

From: Thierry Reding <treding@nvidia.com>

Add the interconnects and interconnect-names properties to the bindings
for the sound card on various NVIDIA Tegra based boards. These are used
to describe the device's memory paths to and from memory.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/sound/nvidia,tegra-audio-graph-card.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
index 5bdd30a8a404..b4bee466d67a 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
@@ -44,6 +44,16 @@ properties:
     minItems: 1
     maxItems: 3
 
+  interconnects:
+    items:
+      - description: APE read memory client
+      - description: APE write memory client
+
+  interconnect-names:
+    items:
+      - const: dma-mem # read
+      - const: write
+
   iommus:
     maxItems: 1
 
-- 
2.33.1

