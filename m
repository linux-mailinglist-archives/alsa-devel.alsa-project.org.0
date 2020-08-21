Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A06224E1A9
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 22:00:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 244AF166D;
	Fri, 21 Aug 2020 21:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 244AF166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598040043;
	bh=HykUThEbEkzFKoOSkj7+Zb9QTwUUmI4SJjLK9HAmpKY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sm6r+5KcBe1ZlwDKVeE1GOQS046bwVhZq01k3dInsMCQzNPdk7+5PwUraP5mKV0Vl
	 zKPcGePsGXG9T5WHW9RU2z6/ljxQnGB/EL53PP+0vA7IspoQMNr+obpdihpfLpnWWZ
	 ZwqxSJLqqIPnMuEbaFbsyNLq9vOUbGhPd6cXa9jk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7750F802A9;
	Fri, 21 Aug 2020 21:56:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF6BCF80253; Fri, 21 Aug 2020 21:56:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1136FF80253
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1136FF80253
IronPort-SDR: 9m/hNTF8xvcgdVCA4XcQbqZwIhTo6ggnC0S49lTK+nG0E/EB1NCiRGRsR7jcjzgRO1M0shWHc7
 Q8ifMtat3kZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158542"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158542"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:16 -0700
IronPort-SDR: rcDwaojsFUT+znCEJxwdevAAumN4AHHymWce6vZtmyVGBY/gjKCHS+E1gN8a+54OZUCcFxl/A3
 wXIpUZTFDEMQ==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002396"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:15 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/14] ASoC: Intel: sof-soundwire: add support for rt5682 on
 link2
Date: Fri, 21 Aug 2020 14:55:50 -0500
Message-Id: <20200821195603.215535-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vinod.koul@intel.com, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

The UpExtreme board provides support for SoundWire link2 in 2 of the 3
advanced modes. Let's use it w/ rt5682.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 4bc1ed757009..100c0a83a6ad 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -173,6 +173,11 @@ static struct snd_soc_codec_conf codec_conf[] = {
 		.dlc = COMP_CODEC_CONF("sdw:0:25d:5682:0"),
 		.name_prefix = "rt5682",
 	},
+	/* rt5682 on link2 */
+	{
+		.dlc = COMP_CODEC_CONF("sdw:2:25d:5682:0"),
+		.name_prefix = "rt5682",
+	},
 };
 
 static struct snd_soc_dai_link_component dmic_component[] = {
-- 
2.25.1

