Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C4F20A5A0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 21:19:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 077331AA6;
	Thu, 25 Jun 2020 21:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 077331AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593112766;
	bh=3Tn6axxwzyO4uvFy18A9IPR1VtofeKKjURdQmGRDzXo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hHGvYY2ax/Y0/j2WmMgxnilKuXm5KSN7c4UeIWjYGu7F46mLbTtjgPLN5U9IZkfWY
	 ScPsXkXZzw+0/JUEz1+q+kIBPhxPdFoLvf//SQ2O2tG9YLC2MIP+KvRtB4Le4Fd5gd
	 bhU+YMK5Pxd2vXsoKbc/G+8XfSIITfz4pZloVR7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7CCFF802F9;
	Thu, 25 Jun 2020 21:14:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DBA8F802BC; Thu, 25 Jun 2020 21:13:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C252F802BD
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 21:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C252F802BD
IronPort-SDR: boW16CdNNnIWD8vNimuEPaLFL6Qp0aTi7fULafrOW37ly2DT+PhNIuHzJhrWbjbB1zjrE3+9nu
 JqLqKCuyPaZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="144120824"
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="144120824"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:38 -0700
IronPort-SDR: iCbqz69WqEBV9CvYq0AHIkOi7LHwGE08UCNvptmqh3i4LkwrUO6hrIWoItsDphYomr/dRxCrA3
 aFMGhQNFsDTw==
X-IronPort-AV: E=Sophos;i="5.75,280,1589266800"; d="scan'208";a="354559512"
Received: from zeqimao-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.109.39])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 12:13:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/17] ASoC: Intel: Boards: tgl_max98373: Fix the comment for
 max_98373_components
Date: Thu, 25 Jun 2020 14:12:59 -0500
Message-Id: <20200625191308.3322-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
References: <20200625191308.3322-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Dharageswari R <dharageswari.r@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
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

From: Dharageswari R <dharageswari.r@intel.com>

MAX_98373_DEV0_NAME is the Right speaker and MAX_98373_DEV1_NAME is the
Left speaker, hence updating the comments for max98373 dailink components
accordingly.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Dharageswari R <dharageswari.r@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index b7014c424163..f8871af2f0d3 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -29,11 +29,11 @@ static struct snd_soc_codec_conf max_98373_codec_conf[] = {
 };
 
 struct snd_soc_dai_link_component max_98373_components[] = {
-	{  /* For Left */
+	{  /* For Right */
 		.name = MAX_98373_DEV0_NAME,
 		.dai_name = MAX_98373_CODEC_DAI,
 	},
-	{  /* For Right */
+	{  /* For Left */
 		.name = MAX_98373_DEV1_NAME,
 		.dai_name = MAX_98373_CODEC_DAI,
 	},
-- 
2.20.1

