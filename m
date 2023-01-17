Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB3566DDBB
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:36:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ECA1676D;
	Tue, 17 Jan 2023 13:35:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ECA1676D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673958999;
	bh=PZ7ixeSn2ddRI4HzkRiJijs0B0hCsdE3wOSphO9CUuA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qczFOlyhwGgIQX3DqIXb7vEA4jvhZVw2jDkXGhMYI2DdO7NP7eBaT57VRw1a5T5Vm
	 mlNg/nwVyhosGig0M3fONlY2V8wQnmcwDWDzqYMHzmKjw0SG4kL3KV3QWaQvGjuBb2
	 6+NEmK3xpISsNhmosXi0wC/+29SsJg0athz+Z5lg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFD69F8022D;
	Tue, 17 Jan 2023 13:35:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93F5AF8047B; Tue, 17 Jan 2023 13:35:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A62AF8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:35:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A62AF8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L5W02kbM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673958935; x=1705494935;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PZ7ixeSn2ddRI4HzkRiJijs0B0hCsdE3wOSphO9CUuA=;
 b=L5W02kbMha9QHmfZvOE2IjMEiF78fhIqdBb4yc22Iuoc+GoqaFoUofEx
 mldgQbCk7hISCSjeapKpEat0icA0SiqnTYaaxBMONrpSvL4GVJb75I4KJ
 /HHxGbcBVnWXaaYJdsz2pncgnFBfVKeZfOyRfh12p4avy014KNk3XeTgM
 2cdXhydNGLnMEbXrgmFpE6LPoOZg82GUy1LmPIJR6wbYPzpAuF9so5n3c
 UP7gUMlLcji3K1uZ0of0KyzByhcqEJXt1AwCQhwqFYFPhHJnVUOtJFpSl
 pigtzo4CYGCmlVejB1WRg+FaGcitvnaoxy/Zo7ZxE041hxQMgRPpf7zTu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="324737988"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="324737988"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:35:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="609231377"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="609231377"
Received: from izakharo-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.14.16])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:35:29 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: sof-audio: start with the right widget type
Date: Tue, 17 Jan 2023 14:35:34 +0200
Message-Id: <20230117123534.2075-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

If there is a connection between a playback stream and a capture stream,
all widgets that are connected to the playback stream and the capture
stream will be in the list.
So, we have to start with the exactly right widget type.
snd_soc_dapm_aif_out is for capture stream and a playback stream should
start with a snd_soc_dapm_aif_in widget.
Contrarily, snd_soc_dapm_dai_in is for playback stream, and a capture
stream should start with a snd_soc_dapm_dai_out widget.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index e1ab8380e7d8..785d797b73d0 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -436,11 +436,11 @@ sof_walk_widgets_in_order(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget_l
 
 	for_each_dapm_widgets(list, i, widget) {
 		/* starting widget for playback is AIF type */
-		if (dir == SNDRV_PCM_STREAM_PLAYBACK && !WIDGET_IS_AIF(widget->id))
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK && widget->id != snd_soc_dapm_aif_in)
 			continue;
 
 		/* starting widget for capture is DAI type */
-		if (dir == SNDRV_PCM_STREAM_CAPTURE && !WIDGET_IS_DAI(widget->id))
+		if (dir == SNDRV_PCM_STREAM_CAPTURE && widget->id != snd_soc_dapm_dai_out)
 			continue;
 
 		switch (op) {
-- 
2.39.0

