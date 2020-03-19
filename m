Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D518C1EF
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 21:53:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7FD717C3;
	Thu, 19 Mar 2020 21:53:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7FD717C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584651236;
	bh=SX5r+ueQ3HYJXxpaOm6h74oiceanV4fJvp64JeXm/hc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gfQ3a1wREQ9PVPgKapGDrjxu6Ho7RkxyGIQW6GRVIPK9mOzZAKOz0g7nNjcnj6AA/
	 HN9iiL/6MV0DyZ6P6MN5S6z3N7FkX8MCE6gvg22tTcBhgugMselbuoveRHxvG5X/fW
	 alhrmso5Pwv/qoYGs245HAprPfz2GUuYPB+6PnCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E344F8028D;
	Thu, 19 Mar 2020 21:51:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88ECEF80256; Thu, 19 Mar 2020 21:50:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BD3AF800DD
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 21:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BD3AF800DD
IronPort-SDR: bshqppfckWMyOxhdTU8Wxi4/4zDPDl3KVoAfAvdycTqALjxW8OA73KE2BTl1aGS3lDeCEhC482
 S5viVjP/huUA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 13:50:29 -0700
IronPort-SDR: IrIbT3rZiiIH6PowvhmavZNMuMjivDcWe8ydpvajaXLlPvgBRq1Sqtd6ThblabNO7Lq8qnRWc5
 thV89Rpw3wwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,573,1574150400"; d="scan'208";a="248661000"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 19 Mar 2020 13:50:26 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: Intel: broadwell: Remove ignore_suspend flag from
 SSP0 dai link
Date: Thu, 19 Mar 2020 21:49:44 +0100
Message-Id: <20200319204947.18963-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319204947.18963-1-cezary.rojewski@intel.com>
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, lgirdwood@gmail.com,
 tiwai@suse.com, vkoul@kernel.org, broonie@kernel.org
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

As of commit:
ASoC: soc-core: care .ignore_suspend for Component suspend

function soc-core::snd_soc_suspend no longer ignores 'ignore_suspend'
flag for dai links. While BE dai link for System Pin is
supposed to follow standard suspend-resume flow, appended
'ignore_suspend' flag disturbs that flow and causes audio to break
right after resume. Remove the flag to address this.

Link to first message in conversation:
https://lkml.org/lkml/2020/3/18/54

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reported-by: Dominik Brodowski <linux@dominikbrodowski.net>
Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/boards/broadwell.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index 25178000c6a5..0776ea2d4f36 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -220,7 +220,6 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 		.init = broadwell_rt286_codec_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 			SND_SOC_DAIFMT_CBS_CFS,
-		.ignore_suspend = 1,
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = broadwell_ssp0_fixup,
 		.ops = &broadwell_rt286_ops,
-- 
2.17.1

