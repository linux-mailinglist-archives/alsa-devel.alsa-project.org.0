Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C418B5BE984
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 17:03:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72DC6AEA;
	Tue, 20 Sep 2022 17:02:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72DC6AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663686183;
	bh=h6DxiSUpYn6g9b0nLhcw+nKn/TLZ8X+ldA2ZlGLO1CY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MbrMkBPQ/YakC63G2o/GtDMeEFibAqusO1WBFtj+qEL3OpCSGQGyqfJp7gckQ9Bhp
	 4BP/kWgKTtewR6+7ipwbTAp51ItqTVOHrJ3MeXr+iTeiv9vM/eaIJjLBKlMJLkuy7p
	 +7JGnyHlp+i54Ex2QOWPcz54+bM1/DRLw2Lku/6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9DF3F804DA;
	Tue, 20 Sep 2022 17:01:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FFA9F804E4; Tue, 20 Sep 2022 17:01:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4A4EF800F2
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 17:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4A4EF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KpivjQCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663686095; x=1695222095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h6DxiSUpYn6g9b0nLhcw+nKn/TLZ8X+ldA2ZlGLO1CY=;
 b=KpivjQCocRtD2ldR9rgONnmnq2xQhgkiS9v7X3cJBlcsR8kW4X1cRPh2
 jnWq3K8/hHEtFunu4AgbpwMGXpUShht7tvnaljEF9PPcpVQRyGG3ZmudS
 uogEge0D+O287ExcYvOQ1S9cJ3p5xKEoHzgV5gEj4MBGk/CBqruvCj0XF
 sx+lqXI9bQYpaTfkpJn8fEfWivx+7gKyyOPnhBG/b94pz4bcQGE7xB1J7
 1ofwadz5upMXRsdk2xqFISEzAfrJUN1UWYJ3kKzvwCgznMA20N0t1uOLO
 OB1blE9AyB7T8tH6O+4AphMcytSq3gLyWsTu1ksf2sYYE842UhhP9mk2i w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="280097363"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="280097363"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 08:01:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="687443724"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.209.87])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 08:01:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: don't unprepare widget used other pipelines
Date: Tue, 20 Sep 2022 17:01:07 +0200
Message-Id: <20220920150107.2090695-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920150107.2090695-1-pierre-louis.bossart@linux.intel.com>
References: <20220920150107.2090695-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Rander Wang <rander.wang@intel.com>

If multiple pipeline are mixed into one, we can't unprepare
the widget used by other pipelines. This patch checks use_count
to address this case.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 71cea83889fb0..62092e2d609c7 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -271,8 +271,8 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 	struct snd_sof_widget *swidget = widget->dobj.private;
 	struct snd_soc_dapm_path *p;
 
-	/* it is already unprepared */
-	if (!swidget->prepared)
+	/* return if the widget is in use or if it is already unprepared */
+	if (!swidget->prepared || swidget->use_count > 1)
 		return;
 
 	if (widget_ops[widget->id].ipc_unprepare)
-- 
2.34.1

