Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C20308870
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 12:44:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C09216B9;
	Fri, 29 Jan 2021 12:43:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C09216B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611920663;
	bh=/SZRNRAookmYB6G/EMnRNajlEjai0LCMfZw/extuLZE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cKq9wYTFCQDS0xAoK/TJQ5u6kcgsY1i2iZRKn36tgfY2KOAviAN9Rmm0WWBrZG/vw
	 AgZS1FCggRtJRsbUn3RxxtEgb5l4p4pvjQ/TPV9TaV+ePAQ2aTpcEiWVomn42NYdHM
	 RNbp/24AfhBCHLGkFYAs5tQ3PGcHVWo1Yt5r/XwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 118DBF804E0;
	Fri, 29 Jan 2021 12:42:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83429F804E1; Fri, 29 Jan 2021 12:41:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD579F804DF
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 12:41:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD579F804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="oduL/wvb"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6013f4810000>; Fri, 29 Jan 2021 03:41:53 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 11:41:52 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 11:41:49 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <thierry.reding@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH 4/8] ASoC: tegra: Select SND_SOC_RT5659
Date: Fri, 29 Jan 2021 17:11:06 +0530
Message-ID: <1611920470-24225-5-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
References: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611920513; bh=fR80egToT/9ZxV0GxkkHdcoiMkLsY1TA0onhiA0OYKU=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=oduL/wvboBcDAimkPLINGAAZ6a3eYCvqgSthFvfkIYQINaMS1vaDBdrSbdjtepw3X
 +JDopObg/6iopbMKaGiyjeypHOUhZOUEL7GQ7IBM8H85RgHNxophGgeZpja3gJ64Dr
 ls/GmTi4ZhiHtteUL4HJhca10OD1mphRyUgkLXNVhIgUKzklsbrltDJUWWFCwTJD6/
 TZVqnWlrG3KI0sJU66oTi3pCie3qE0Sdjsj5u/RC4vMlZK4Capx6u+HMBHqHbLP7Km
 Fv47hOcFURVZKMC7TUwZ6V1SIPW2tCrcafeM4QB5UGFs0Dev+FcEyCr/BoRbDgy1tL
 KiBPo8eGiGlwQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 jonathanh@nvidia.com, sharadg@nvidia.com, linux-tegra@vger.kernel.org
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

Select SND_SOC_RT5659 to verify external audio over Jetson platforms.
Jetson AGX Xavier has an on-board RT5658 audio codec and to use this
enable required config.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
---
 sound/soc/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
index 6dc83ad..4a45163 100644
--- a/sound/soc/tegra/Kconfig
+++ b/sound/soc/tegra/Kconfig
@@ -120,6 +120,7 @@ config SND_SOC_TEGRA210_ADMAIF
 config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
 	tristate "Audio Graph Card based Tegra driver"
 	depends on SND_AUDIO_GRAPH_CARD
+	select SND_SOC_RT5659
 	help
 	  Config to enable Tegra audio machine driver based on generic
 	  audio graph driver. It is a thin driver written to customize
-- 
2.7.4

