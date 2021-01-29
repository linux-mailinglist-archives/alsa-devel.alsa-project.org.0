Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA94308C74
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 19:31:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D20AD169A;
	Fri, 29 Jan 2021 19:30:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D20AD169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611945068;
	bh=mY/mk5nVbHT8O6sDGdf485yOOyb5o7IcUSGfAPzkQTU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=reoOtPGjNM107428pA36Nrw8o+6vT4igQD3c5rWo1gSgHYaOrIFybwfAPeM6m4Lb/
	 bQzq0SSe+yPPr4tJvp/IzYOfnkE2ihuDKLIqWakptOnbphhkhbvsyjripr/7BPwojI
	 jjAFViikltuf5US5gXU1Z+NyQtqgGmXaRAiQivgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68685F804E0;
	Fri, 29 Jan 2021 19:28:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E6B9F80277; Fri, 29 Jan 2021 19:28:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 224A1F800EB
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 19:28:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 224A1F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="nHr8zObC"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601453b90000>; Fri, 29 Jan 2021 10:28:09 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:28:09 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 18:28:05 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <thierry.reding@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v2 4/9] ASoC: rt5659: Add Kconfig prompt
Date: Fri, 29 Jan 2021 23:57:41 +0530
Message-ID: <1611944866-29373-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611944889; bh=F/BW7PY5izzMMJY0fLuFBv2E9jr38z5576WRI7J2fI4=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=nHr8zObCaCY6pG1yyuNQjsFsK4HACEtNZlOEi+9wFF+5YeulwGrvqumXM3dKSTu0y
 j8dKgOt7hm7jV0t2JGxZLGbW2fk4n2srPAlwHhuT081rRHLsafHByHjj7/C/wIYNYs
 yA2wbM5gUG1OgNMmNu+cVxW/cwgpef2vTQCYrRc7z3SOQpfQZ6uqevHEgDopyRmrch
 SwDmps+lFqyyJZvXoqm/wn4AsuYA+mf9E8Z6uui/pmRtSxlYzo3MI3IjYiNQi+Pr3F
 G8BYUSrzzt9omitztdGp+x9Npznp6J2S5rdRImZHJnVWIfIZKNtqqOGTp8lVHuEAi3
 US7ukp7XQzn4A==
Cc: Oder Chiou <oder_chiou@realtek.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 Sameer Pujar <spujar@nvidia.com>, jonathanh@nvidia.com, sharadg@nvidia.com,
 linux-tegra@vger.kernel.org, Bard Liao <bardliao@realtek.com>
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

Add tristate prompt to allow codec selection.

Cc: Oder Chiou <oder_chiou@realtek.com>
Cc: Bard Liao <bardliao@realtek.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 9bf6bfd..df34b3b 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1162,7 +1162,7 @@ config SND_SOC_RT5651
 	depends on I2C
 
 config SND_SOC_RT5659
-	tristate
+	tristate "Realtek RT5658/RT5659 Codec"
 	depends on I2C
 
 config SND_SOC_RT5660
-- 
2.7.4

