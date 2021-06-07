Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D64B39E9CE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:52:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 891BB16AB;
	Tue,  8 Jun 2021 00:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 891BB16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623106334;
	bh=kjesBnmvm2tSMNWJO2yj7Hkcp8L53AwZk54cC6sVvNg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HrlprZp5OZr+UlkOGcmTjDAq1vvJOo1YXX7bIcBn6O2DZn4f7BXTyVoZ8myUrPC8w
	 +odeh36omVy0Ac0gCw8dXAcplCG0a37HORRaVXFazbli7RbPasHb6aTANdJqs+l9LT
	 NnZpQQDQYoTDsmLEUYlgXfxjayOhCbl2FzgldkfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B41A4F80515;
	Tue,  8 Jun 2021 00:47:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A87BF8032C; Tue,  8 Jun 2021 00:47:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32764F800DF
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32764F800DF
IronPort-SDR: JVm9yLa/6otfMRioGq5uL1kD3owlqFndsjlKYfPU2GpvR0porIBv/LPrWoY+Y7C1mZckR2tzpz
 iYsdUHDq7E7g==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="185102183"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="185102183"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:46:52 -0700
IronPort-SDR: v0zLc8xa+6JGbLIWbzBcDxbV7XK2zORx4g+e7nsqQ86wjRL5IPutzJQ5DfJnl+5AIpohBuwRCK
 FZkVoDkSZtAQ==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="637437122"
Received: from marocham-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:46:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/10] ASoC: Intel: sof_sdw: fix signed/unsigned warning
Date: Mon,  7 Jun 2021 17:46:35 -0500
Message-Id: <20210607224638.585486-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607224638.585486-1-pierre-louis.bossart@linux.intel.com>
References: <20210607224638.585486-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Paul Olaru <paul.olaru@oss.nxp.com>
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

Sparse throws the following warning:

sound/soc/intel/boards/sof_sdw.c:796:31: error: incorrect type in argument 6 (different signedness)
sound/soc/intel/boards/sof_sdw.c:796:31:    expected int *group_id
sound/soc/intel/boards/sof_sdw.c:796:31:    got unsigned int *

The group_id cannot be negative, use unsigned int.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 34f142d7b3f9..e9118234b30e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -682,7 +682,7 @@ static int set_codec_init_func(const struct snd_soc_acpi_link_adr *link,
  */
 static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 			  struct device *dev, int *cpu_dai_id, int *cpu_dai_num,
-			  int *codec_num, int *group_id,
+			  int *codec_num, unsigned int *group_id,
 			  bool *group_generated)
 {
 	const struct snd_soc_acpi_adr_device *adr_d;
-- 
2.25.1

