Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E02EA67E49A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:05:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5880FE8D;
	Fri, 27 Jan 2023 13:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5880FE8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821145;
	bh=/zQedUmqQ05hRyXZMI9pSi2x6aVDsMgYOBr4faBAQkg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oA9OvnDOX7OmHEz9yby1LgAeRLT2bgwn1+gCXsMoeIUxcas60ihHrwpoBaSF/Rrjb
	 ZILajJpZsg46VugNEw51mPWylCprukhHDRU5q2cAkhLolKXrC28Hlv4JAck4KWnzp+
	 G98JXajSobwtT2o7Uu7+cXPUTPiWcj7IN9BItijQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D5C7F805BD;
	Fri, 27 Jan 2023 13:01:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA93FF805B1; Fri, 27 Jan 2023 13:01:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0365EF80154
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:01:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0365EF80154
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=G5HqE8Yv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820869; x=1706356869;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/zQedUmqQ05hRyXZMI9pSi2x6aVDsMgYOBr4faBAQkg=;
 b=G5HqE8YvMbUYD6u0jwmJKSP8DhBnPdUaDyJtI30bnL5Ls4tjPPrdFO/i
 C0KNW6gycOyR4a0+EeKVaRWyWycoeEf33TNdnMhk3k0iwb/oQRkuVg+P9
 LM83ICiNLVyKVyjFtA9EZpcKZpVsvVF7OKvzr5V7cEnAIcbomBo/ETqOU
 kTBGCZkTJEfYqUXVg9zehiFFeOyx5cuDB/HGinFMJxRP6g+HXCKH7knR/
 tkniulhS+9z9S6O4VE0Tf2Y654Qbpoec9QSZnPDTgKy2p+Cl8i9eJxE0v
 33bncYbd1atqbWZUOQwZOMuSGjHbVg5fa6RqdQDV9IBdpnJVbi9Td2aic Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091973"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091973"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:01:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782343"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782343"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:01:04 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 16/18] ASoC: SOF: Avoid double decrementing use_count in
 sof_widget_setup on error
Date: Fri, 27 Jan 2023 14:00:29 +0200
Message-Id: <20230127120031.10709-17-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
References: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The sof_widget_free() on the error path will decrement the use count and if
we jump to widget_free: then the use_count will be decremented by two,
which is not correct as we only incremented once with 1.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 158f7b03fbc2..14b4b949d081 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -89,6 +89,7 @@ EXPORT_SYMBOL(sof_widget_free);
 int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	bool use_count_decremented = false;
 	int ret;
 
 	/* skip if there is no private data */
@@ -160,13 +161,16 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 widget_free:
 	/* widget use_count and core ref_count will both be decremented by sof_widget_free() */
 	sof_widget_free(sdev, swidget);
+	use_count_decremented = true;
 core_put:
 	snd_sof_dsp_core_put(sdev, swidget->core);
 pipe_widget_free:
 	if (swidget->id != snd_soc_dapm_scheduler)
 		sof_widget_free(sdev, swidget->spipe->pipe_widget);
 use_count_dec:
-	swidget->use_count--;
+	if (!use_count_decremented)
+		swidget->use_count--;
+
 	return ret;
 }
 EXPORT_SYMBOL(sof_widget_setup);
-- 
2.39.1

