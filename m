Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CE666BE6E
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 13:57:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A3343F1D;
	Mon, 16 Jan 2023 13:56:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A3343F1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673873854;
	bh=Lgv407e8OICbsi0gdN267HnBxdARqGVPHIoX3BHAuLM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jI49spKKi9NAjBPbqjtOJG0Ed0hJBIo+0MnDloBHQOzDp7zZoBiM/sJaZCdRRvgb/
	 jDQfxqGk45A0pbJuabBHZZSKxp7jy8AVPQvTv/Qg0OfA6/uFj8ytJhFQ4SFBXe/2GT
	 MzlJ5wm6V0FoffIm/giJ6Fy1q2U+9PJ0eFXubeWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C777F80542;
	Mon, 16 Jan 2023 13:56:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1907F8053A; Mon, 16 Jan 2023 13:56:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00BDEF80482
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 13:55:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00BDEF80482
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eba5cC8d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673873715; x=1705409715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lgv407e8OICbsi0gdN267HnBxdARqGVPHIoX3BHAuLM=;
 b=eba5cC8d/3ZgldvhI7ldRfTIPsWjFZqzwXkw9FoOLLMH1G0m943E0nv/
 LYl1BMW6s1FqdlWcA9gy2MGySIphsLr9z0QU9dYMn56SGux44atyE/Y2Y
 cDBJ9yzjGZzGVLnRT0lTGSk8hySpldDygL4/QmAekdNMAhp4WJ6DZIytM
 piW6CWG4OoSqVIUzfO0luOs7GM83EmXGCq+C4FLHGZGF+4G34M8gsLLvb
 kuGCuqkPeXL7AH5vHPVHjS7icdb7vqWgnppXBnXu8FZKLpwyrUEjcN1Wj
 xhznB97fSj5+h1uZL2C5F75uAmEbgQ71OL995uMjyEn+d6cKfKSkku+nz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="325720844"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="325720844"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:55:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="660972417"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="660972417"
Received: from mmclough-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.13.59])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:55:04 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 1/3] ASoC: SOF: sof-audio: Unprepare when
 swidget->use_count > 0
Date: Mon, 16 Jan 2023 14:55:04 +0200
Message-Id: <20230116125506.27989-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
References: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
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
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We should unprepare the widget if its use_count = 1.

Fixes: 9862dcf70245 ("ASoC: SOF: don't unprepare widget used other pipelines")
Cc: <stable@vger.kernel.org> # 6.1
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index e1ab8380e7d8..068501ed7951 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -274,7 +274,7 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 	struct snd_soc_dapm_path *p;
 
 	/* return if the widget is in use or if it is already unprepared */
-	if (!swidget->prepared || swidget->use_count > 1)
+	if (!swidget->prepared || swidget->use_count > 0)
 		return;
 
 	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
-- 
2.39.0

