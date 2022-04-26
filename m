Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0451D510549
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:22:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ACFB18FB;
	Tue, 26 Apr 2022 19:21:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ACFB18FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993722;
	bh=UTQU6BdBg7+Z5lLAa9KNocLNRL6+9S0jp1rVPX++10U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OMvZIOa+fQeA2rjFy0NIBg+l6GPsQcirU5CMes2lTbtwoycNDPhmsWY7Hqg8KwkEY
	 2rnHNOfZgKy7hbGBOgnD3v9rT+rinKTO4l0S0R3hFP7rFXxNy+Kc5X+wRerSjI2EGf
	 BRszOG2ZzTqAIAk9k4zBDpEoUgyCU5HJtjP3UbLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07CA1F8053E;
	Tue, 26 Apr 2022 19:18:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94E2EF80536; Tue, 26 Apr 2022 19:18:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2E82F80516
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2E82F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="NiNjfO4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993480; x=1682529480;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UTQU6BdBg7+Z5lLAa9KNocLNRL6+9S0jp1rVPX++10U=;
 b=NiNjfO4S9MD73PcD1qHkpe7oSmvqEGLn/nUsTKLeRdt8vRduuJ4ZGoBu
 ItL8YoeI+xmJz+gJtxQBOuNcWzjbYO9Jo4g1rE9NoyX8ZesH4/XsLPw9I
 YHP7YPRzcOpvLNnRTYx+ic1cP2uxhyq0vNkGI2HWHaGkWfMZ7Tmq9Erax
 QLZGCR3lF0jbJVVcJFR056PGpYx7dr3ip+eB5Cn76xlH+cqyUl3qMVQJ1
 JBqmMBY2o7WLiTLTI/KuchSFIG23VXKeB/rmUi78L1GMhh9Vq/hsWxaxR
 EQb2I7F1KvS0z86itapNytBfenUW0B/tLVgdiFr1dz3hswpt5WBZIxXhb A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="326150585"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="326150585"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="558431189"
Received: from shashinx-mobl.gar.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.0.53])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:48 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/11] ASoC: SOF: sof-audio: reset route status before freeing
 widget
Date: Tue, 26 Apr 2022 10:17:34 -0700
Message-Id: <20220426171743.171061-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
References: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

This is in preparation for IPC4 which requires that the route be reset
before the widget is freed. For IPC3, there is nothing more to be done
other than setting the route status. So it is OK to be moved before the
widget is freed.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index e2ec60887568..1180d6bab33e 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -34,6 +34,9 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	if (--swidget->use_count)
 		return 0;
 
+	/* reset route setup status for all routes that contain this widget */
+	sof_reset_route_setup_status(sdev, swidget);
+
 	/* continue to disable core even if IPC fails */
 	if (tplg_ops->widget_free)
 		err = tplg_ops->widget_free(sdev, swidget);
@@ -50,8 +53,6 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 			err = ret;
 	}
 
-	/* reset route setup status for all routes that contain this widget */
-	sof_reset_route_setup_status(sdev, swidget);
 	swidget->complete = 0;
 
 	/*
-- 
2.25.1

