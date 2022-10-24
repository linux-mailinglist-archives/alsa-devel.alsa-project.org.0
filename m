Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B6060B2F1
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 18:54:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 809C47014;
	Mon, 24 Oct 2022 18:54:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 809C47014
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666630490;
	bh=l3ybUj0jxYGiDkDkpXgUZXz4Q7rKY3WZTc7yZkJB8a0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oZii/UBT+McsbIJrOZC6uwha7rDvu4iHj0q1+ZAEy6qVrIwigxrNS/rmAJQAhcI2Y
	 nGMEnlBx22aTUmeUlK69Yjp0u2HAY1FKX8oSohWpeGNq6eVglB3EJbW4ntjgqg53d5
	 y0lNcx+5TtBLVlisDuYUr+bc4VoFMZw5jr3WxSWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29358F80557;
	Mon, 24 Oct 2022 18:53:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FEA2F80553; Mon, 24 Oct 2022 18:53:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 823B3F8052F
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 18:53:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 823B3F8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="I6BtnOoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666630407; x=1698166407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l3ybUj0jxYGiDkDkpXgUZXz4Q7rKY3WZTc7yZkJB8a0=;
 b=I6BtnOoiOd6G9g+ms3NojwKIs6e9kmuVZVmpGeKfjAOBvo7be/OVB1UO
 w6GwPwGaN3lKETYNNIGYeV+TVkuKXx5yOc7I7YUPbsD7vXfY+Kl3iCPtn
 9/pdijGaIUH5vCtMkmBOEfN5DcgOwNTF0liGltEwDxcqeTHdKW7iDawo5
 5qg3EAEdKNvObBQtMRe3gXUpLJK9ps0f/S1UY0FW+ZzUsyboNLOdfCn7A
 +EnGSiT/MYLi1ZnZLAwG2DozvOHVnlCGS46QpPe+WruyBQ6avdnMxCV6g
 2an5bGG5xTkbOo0dmTbQ/t1+UfPRQ3yDVbQ7O93UHtWeSCA/irW3DuRWh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="305082253"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="305082253"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="609263046"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="609263046"
Received: from tdsilva-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.186.236])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:53:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/16] ASoC: SOF: Intel: use mmio fallback for all platforms
Date: Mon, 24 Oct 2022 11:52:56 -0500
Message-Id: <20221024165310.246183-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
References: <20221024165310.246183-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

No need to expose an indirection when we can use the fallback.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/bdw.c            |  6 +-----
 sound/soc/sof/intel/byt.c            | 12 ++----------
 sound/soc/sof/intel/hda-common-ops.c |  6 +-----
 sound/soc/sof/intel/pci-tng.c        |  6 +-----
 4 files changed, 5 insertions(+), 25 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index a446154f28032..812a49b1d3f49 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -575,11 +575,7 @@ static struct snd_sof_dsp_ops sof_bdw_ops = {
 	.run            = bdw_run,
 	.reset          = bdw_reset,
 
-	/* Register IO */
-	.write		= sof_io_write,
-	.read		= sof_io_read,
-	.write64	= sof_io_write64,
-	.read64		= sof_io_read64,
+	/* Register IO uses direct mmio */
 
 	/* Block IO */
 	.block_read	= sof_block_read,
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index e6dc4ff531c34..faf223b383605 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -225,11 +225,7 @@ static struct snd_sof_dsp_ops sof_byt_ops = {
 	.run		= atom_run,
 	.reset		= atom_reset,
 
-	/* Register IO */
-	.write		= sof_io_write,
-	.read		= sof_io_read,
-	.write64	= sof_io_write64,
-	.read64		= sof_io_read64,
+	/* Register IO uses direct mmio */
 
 	/* Block IO */
 	.block_read	= sof_block_read,
@@ -304,11 +300,7 @@ static struct snd_sof_dsp_ops sof_cht_ops = {
 	.run		= atom_run,
 	.reset		= atom_reset,
 
-	/* Register IO */
-	.write		= sof_io_write,
-	.read		= sof_io_read,
-	.write64	= sof_io_write64,
-	.read64		= sof_io_read64,
+	/* Register IO uses direct mmio */
 
 	/* Block IO */
 	.block_read	= sof_block_read,
diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
index b2326396c870e..397303b3ac9d5 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -19,11 +19,7 @@ struct snd_sof_dsp_ops sof_hda_common_ops = {
 	.probe		= hda_dsp_probe,
 	.remove		= hda_dsp_remove,
 
-	/* Register IO */
-	.write		= sof_io_write,
-	.read		= sof_io_read,
-	.write64	= sof_io_write64,
-	.read64		= sof_io_read64,
+	/* Register IO uses direct mmio */
 
 	/* Block IO */
 	.block_read	= sof_block_read,
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index f0f6d9ba88037..5b2b409752c58 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -144,11 +144,7 @@ struct snd_sof_dsp_ops sof_tng_ops = {
 	.run		= atom_run,
 	.reset		= atom_reset,
 
-	/* Register IO */
-	.write		= sof_io_write,
-	.read		= sof_io_read,
-	.write64	= sof_io_write64,
-	.read64		= sof_io_read64,
+	/* Register IO uses direct mmio */
 
 	/* Block IO */
 	.block_read	= sof_block_read,
-- 
2.34.1

