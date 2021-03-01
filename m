Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C64329558
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:58:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF08D1697;
	Tue,  2 Mar 2021 00:57:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF08D1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614643119;
	bh=dbc/8nXB3WUmgVp3rvH+9/uNhPBmkmGjWibAuv3Sx+k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ewk8LbLeJg4VPXixTGXckLj4Mxqtp9KbItTkdngql5p3uHsnAgrsGzUWeOkthXVI9
	 CmsTHZlkzYZ+KGvWNDkG8KE+UttZ36PsnK82lLCuq6piEeZbpCsd+EYw0A/0cJF9ax
	 5pd13+6IeiPPb7cbsbFzgsfQZxlRve3CuQFQG3p4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4071F8026A;
	Tue,  2 Mar 2021 00:56:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC0E7F80275; Tue,  2 Mar 2021 00:56:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90663F8010B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:56:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90663F8010B
IronPort-SDR: izxXt26VQSXEluUSKID8wccuAxXnZrpDPTrK9oetcq/ShoJcgFISrd2Jk8xmYEfT9BgqtCb0EA
 tO23lPVFObTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="184195006"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="184195006"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 15:56:46 -0800
IronPort-SDR: sjD8tEwZyJXbtrfE1hYaV7lCRK/JMzJKjasB7oR0o3sFtuehwUnzjrNHEVmacwKcLbkvhQ14cP
 SvENJFTuhlxQ==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="406449841"
Received: from josemrod-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.215.233])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 15:56:45 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: Intel: soc-acpi: remove unused TGL table with
 rt5682 only
Date: Mon,  1 Mar 2021 17:56:36 -0600
Message-Id: <20210301235637.1177525-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301235637.1177525-1-pierre-louis.bossart@linux.intel.com>
References: <20210301235637.1177525-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Bard Liao <bard.liao@intel.com>
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

This patch partially reverts Commit 095ee71907ea ("ASoC: Intel: common: add match table for TGL RT5682 SoundWire driver").

This commit was added as an enabling patch before the Maxim98373 codec
driver was available. This codec is now fully functional and the
topology with only RT5682 no longer maintained or used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 40f31c8a3aba..e8640ee10012 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -415,12 +415,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-tgl-sdw-max98373-rt5682.tplg",
 	},
-	{
-		.link_mask = 0x1, /* this will only enable rt5682 for now */
-		.links = tgl_chromebook_base,
-		.drv_name = "sof_sdw",
-		.sof_tplg_filename = "sof-tgl-rt5682.tplg",
-	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_sdw_machines);
-- 
2.25.1

