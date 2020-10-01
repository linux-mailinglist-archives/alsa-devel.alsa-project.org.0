Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F05280584
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 19:36:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDC561AAA;
	Thu,  1 Oct 2020 19:35:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDC561AAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601573773;
	bh=6sHZcyuVnn3p/mLygeXG13a8vPke7HtuCUdtrdI+HF8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wqdq1LqLCb/ac8BldiTxPvECG15H7gKVUItnxPyAWQ9PDRfAancM16crxclOzhEsF
	 hABgvh2zhlbQMOqSYgYfqYuNxZqYe0n9n0EOyOwq+CaWRBySs1dWlJgoArt6WFHZBw
	 hATbP0NmxOwOOf1wrNbEvPV32Kc1smu2yJUFfogI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69B5FF802E2;
	Thu,  1 Oct 2020 19:33:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94BB0F802E1; Thu,  1 Oct 2020 19:33:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DCB9F8020C
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 19:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DCB9F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="aWKbsPji"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7612c70000>; Thu, 01 Oct 2020 10:32:55 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 17:33:44 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 1 Oct 2020 17:33:38 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <pierre-louis.bossart@linux.intel.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <thierry.reding@gmail.com>,
 <jonathanh@nvidia.com>
Subject: [PATCH v3 02/13] ASoC: soc-pcm: Get all BEs along DAPM path
Date: Thu, 1 Oct 2020 23:02:56 +0530
Message-ID: <1601573587-15288-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601573575; bh=3W6UwWfLG2y91GsD4wxpT6TKLXhYsYzkiLpXPArPYYQ=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=aWKbsPjiYcs+eBs60mOl5T1fCxii/NCGDY3P6oZ31iiqIW05HFPv2FdgXWbWa8UGi
 7isM0+VMPdy7ZmFBmp9ekCXqBlGB9SMUuNtE4PsMElp79OIIxXjCpcWJl5PVDC7irE
 uZP2Pd8M9VlBNEP/sw4qZNxwXCHO8JVh5vrbjhbldNx1kkkJKZRvWH9dxiAzlcOfKZ
 wi8pAY5J/U8ZEDHdjUkgxwgwj0ACtW00WCh2iVV+kxRZNUvwo/Sr1XsLNQp04bp1is
 TzbJ1q5vE+++Whpz052t770g1QqxSzDgA2VxNX853NYEEZHukqGYr8yXBus3T89gX2
 HBvgPw5jq9jNQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 nicoleotsuka@gmail.com, swarren@nvidia.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, atalambedu@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, nwartikar@nvidia.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

dpcm_end_walk_at_be() stops the graph walk when first BE is found for
the given FE component. In a component model we may want to connect
multiple DAIs from different components. A new flag is introduced in
'snd_soc_card', which when set allows DAI/component chaining. Later
PCM operations can be called for all these listed components for a
valid DAPM path.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 include/sound/soc.h | 1 +
 sound/soc/soc-pcm.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 3b038c5..9b69d70 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1084,6 +1084,7 @@ struct snd_soc_card {
 	unsigned int fully_routed:1;
 	unsigned int disable_route_checks:1;
 	unsigned int probed:1;
+	unsigned int component_chaining:1;
 
 	void *drvdata;
 };
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 09e8d70..25904b8 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1283,7 +1283,8 @@ int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
 
 	/* get number of valid DAI paths and their widgets */
 	paths = snd_soc_dapm_dai_get_connected_widgets(cpu_dai, stream, list,
-			dpcm_end_walk_at_be);
+			fe->card->component_chaining ?
+				NULL : dpcm_end_walk_at_be);
 
 	dev_dbg(fe->dev, "ASoC: found %d audio %s paths\n", paths,
 			stream ? "capture" : "playback");
-- 
2.7.4

