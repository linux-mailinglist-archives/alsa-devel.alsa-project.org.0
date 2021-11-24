Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E657A45CFE7
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:14:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D26D185F;
	Wed, 24 Nov 2021 23:13:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D26D185F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637792056;
	bh=LzzPOO+RM6FEOiFNwxVrD5niwYNDvz2u+GaEY3CfkBM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QmTcE8IRk/2jR38EPfDVSzG7IwKuuQ7evjVifChAI0SnRtWcf7ddzlF+DM794brwR
	 vRyoqKVp/xSniibeyJcjLoRMe84/NRfiVJEw5f4pgqOCfMolc0WSK9spJNZoTkKaMG
	 LRA1LvqIDcZKtuevn7/JG1dKMU71DzN5DMJx5QY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8EA4F80245;
	Wed, 24 Nov 2021 23:07:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 458FCF8058C; Wed, 24 Nov 2021 23:07:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 394C8F801F7
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 394C8F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ARwTAJfT"
Received: by mail-lf1-x12e.google.com with SMTP id bi37so10957617lfb.5
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jZtmNInV251GqgFq3K9ZRWdCyBV26EPK8i39JKkeuGY=;
 b=ARwTAJfTqtelTIPULCHTr4G1ZuHUenvIBkuGFZhD92TpJknc06Pw4cc8Q0R4MkYvx6
 ZrGOgymmMNeLJVRsE9/cc5Ab3/Isn6TJ/W0hPgcZwOEfa3j2FDIf0rCGr7KuMPBV59Si
 SJWeTuh6I7v7M09Q623XB87OkuNd+AwC4UztBJOpDnXF5/CBuHKP3gHgvGh5xNJ2QBbX
 9lOkMvN8rkLKzWw1To+uJiANLdC1wZCXreMAsaQUt4OfMwVpVCDk7gxkrKflx3D4zStc
 heknKMF8Gd2Lhn0RUV5qxHSS/hp6xVdYYKOqg1/ycE7I2303I3dBEl5MG0m2eWG+ITKX
 nlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jZtmNInV251GqgFq3K9ZRWdCyBV26EPK8i39JKkeuGY=;
 b=tl3QHxjeXP8tIw5R/xRBD5f4iGcny949vz3ysZIp3JyNsQAUTRYCkS2QaH+WHx87pr
 z+cnTHA4BH7Kev6eL79aJpR5V7LQy+2cTOlbd7eOa7lPDAONAQ2MDbUTHlMpmmISNo5W
 2yT9WWys5U4xQdTkCkTB9FQLb3yDWfqBKR3DIojbTTims+GWWzMJIJfhnRmGKxia8BAg
 MJa7ya/MQHt1EASXKg4TEfeXK5QWIVctyrmjJcVqqbNUfkZaJLtHnqBI/WwTucamEVN3
 SPvVOXW/7U5ki1Vqx8ZSV34An0RPoFEpte5uW4K3vUZx1jVucX3Otc1CMze/P2LtMc8/
 QQPg==
X-Gm-Message-State: AOAM530aZqrZQ33SfMBT/gTIGUWuFCXw4jVOkQV0RdBWIUfqol++tzML
 bI8Sp8hmMda0MhR6p4iQCYM=
X-Google-Smtp-Source: ABdhPJzhi7UNU46047RRxIFY+qitxZ5+V78jiCA3Ag2Za0QxQcgCp2Ay3wCtMWWTnZuxJO6SBU4FjQ==
X-Received: by 2002:a19:c308:: with SMTP id t8mr18436846lff.621.1637791593535; 
 Wed, 24 Nov 2021 14:06:33 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:33 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 04/20] dt-bindings: host1x: Document optional HDMI
 sound-dai-cells
Date: Thu, 25 Nov 2021 01:00:41 +0300
Message-Id: <20211124220057.15763-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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

Document new optional sound-dai-cells property of HDMI node. This node will
be used as endpoint of HDMI sound DAI graph.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt  | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index e61999ce54e9..27b746f28f31 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -297,6 +297,7 @@ of the following host1x client modules:
   - nvidia,edid: supplies a binary EDID blob
   - nvidia,panel: phandle of a display panel
   - operating-points-v2: See ../bindings/opp/opp.txt for details.
+  - #sound-dai-cells: Should be 0.
 
 - tvo: TV encoder output
 
-- 
2.33.1

