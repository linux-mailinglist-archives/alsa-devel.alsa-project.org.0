Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F01F7E26
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 22:43:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A43074C;
	Fri, 12 Jun 2020 22:42:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A43074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591994622;
	bh=unaBrrPcwH0903joTDh0IrNLYv+R/e860NWlRhmsDEo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YnFygwHwf8tdEk5hotlU/ii3r50CzfFtoV+9XGphj4ZuRBJCwG4cOA6AV6aYM0/SA
	 D/ziVucwTKq7hk3an95S4xPipWVQIQo8D8okLjUNv1z8FoWFlBpm5DIIUum89Bllyr
	 VBbcm9BCSjoN5elMNvaiDsxsWND1mtqU0I3lUnt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3206CF801F7;
	Fri, 12 Jun 2020 22:41:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5D9CF80228; Fri, 12 Jun 2020 22:41:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA9FFF801F7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 22:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA9FFF801F7
IronPort-SDR: nm5QDK10JTiWyKMdvJ5G6uplOQuQHrwNchrjIsjuHR0iN/kjtSJ3/2oL+E1Hr/lk+n8Q+9+7wy
 LIU8HareHCvg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2020 13:41:07 -0700
IronPort-SDR: KvJVZ1P7roDSoHMkIpfGD0So3jhL0HZ2rXoKOCg2LTvUSfUBvOLU6o96SbJLBG79UNyVtUyrVF
 kQ7tZ831PITQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,504,1583222400"; d="scan'208";a="272022964"
Received: from tcampell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.137])
 by orsmga003.jf.intel.com with ESMTP; 12 Jun 2020 13:41:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: soc-core: reduce verbosity of BE override message
Date: Fri, 12 Jun 2020 15:40:48 -0500
Message-Id: <20200612204050.25901-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200612204050.25901-1-pierre-louis.bossart@linux.intel.com>
References: <20200612204050.25901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

With dynamic debug not enabled, we still see this sort of messages:

[   47.656671] sof_sdw sof_sdw: info: override BE DAI link SDW0-Playback
[   47.656677] sof_sdw sof_sdw: info: override BE DAI link SDW0-Capture
[   47.656682] sof_sdw sof_sdw: info: override BE DAI link SDW1-Playback
[   47.656686] sof_sdw sof_sdw: info: override BE DAI link SDW3-Capture
[   47.656691] sof_sdw sof_sdw: info: override BE DAI link iDisp1
[   47.656695] sof_sdw sof_sdw: info: override BE DAI link iDisp2
[   47.656699] sof_sdw sof_sdw: info: override BE DAI link iDisp3

This is not really helpful for most users, move to dev_dbg.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/soc-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 0f30f5aabaa8..e607a4927933 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1638,8 +1638,8 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 				continue;
 			}
 
-			dev_info(card->dev, "info: override BE DAI link %s\n",
-				 card->dai_link[i].name);
+			dev_dbg(card->dev, "info: override BE DAI link %s\n",
+				card->dai_link[i].name);
 
 			/* override platform component */
 			if (!dai_link->platforms) {
-- 
2.20.1

