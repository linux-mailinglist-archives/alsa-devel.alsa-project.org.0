Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2EC67E46F
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:02:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89542ECB;
	Fri, 27 Jan 2023 13:01:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89542ECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674820951;
	bh=SYxl5ORHfYu3n4ZTLyDzRfOA6FhujfLMgVg1CCrCmkI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=a3AW+w48uLLoS9fM8ZYu4oqK58o2Hfx/IVQo0jkFh/reg2D2Mqtc5XzIy5dGEgZrB
	 n/ioWDfhI9r0Xyp94zuVsihQiOFuaStZnJeEPvXUuWsNU8AhcpQqZp5hAcAtwdKjUd
	 23ANUjAex81vE/0swbYKSAcVwVW6cPaN+OlBipBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F7D0F80549;
	Fri, 27 Jan 2023 13:00:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 089D9F802E8; Fri, 27 Jan 2023 13:00:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F055F802E8
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F055F802E8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eokhHcSn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820835; x=1706356835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SYxl5ORHfYu3n4ZTLyDzRfOA6FhujfLMgVg1CCrCmkI=;
 b=eokhHcSnXi/bXRcEKTA4XgCeDUUtbVdCMD/xzGTZWZ4SUou1Lafei9UY
 9ckY7+irrPjfkGkNK9Ht+VdJUeBY+YiaUdJTTFqOHcHL5uCTYUlMD7T4X
 oLEV9+wRQiVi/ft5mS5ashAliIiZ8xemkR65LTnHBE7FqSJ2pylEvlmOb
 wW9OJX5y8eiJy1Bv4P+MYbbaHKZFFS+jcw8BOL2qcNxgtHM3oDbIMeTiS
 sPT4Fl51VnDHs37y1RtJlIMWag8UsGDAcHbP1lMgP/gsuGXXYzHlzRO1u
 GAQft2gMYDYwtGJtTIO8Lbhn4Seor172Xy93Lvn0y+muBqjZEwCQkSKli Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091807"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091807"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782110"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782110"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:00:31 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 03/18] ASoC: SOF: sof-audio: Set up/free DAI/AIF widgets only
 once
Date: Fri, 27 Jan 2023 14:00:16 +0200
Message-Id: <20230127120031.10709-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
References: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Calling the sof_widget_setup/free() for the DAI/AIF widgets inside the
snd_soc_dapm_widget_for_each_sink_path() loop will end up setting up or
freeing the widget multiple times if there are multiple paths leaving
the widget. Fix this by moving the widget setup/free for the starting
widget in each path outside the loop.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 48 +++++++++++++++------------------------
 1 file changed, 18 insertions(+), 30 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 2dff3ae25d27..572ac6a0c9ac 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -358,19 +358,16 @@ static int sof_free_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dap
 	int err;
 	int ret = 0;
 
-	/* free all widgets even in case of error to keep use counts balanced */
+	if (widget->dobj.private) {
+		err = sof_widget_free(sdev, widget->dobj.private);
+		if (err < 0)
+			ret = err;
+	}
+
+	/* free all widgets in the sink paths even in case of error to keep use counts balanced */
 	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
-		if (!p->walking && p->sink->dobj.private && widget->dobj.private) {
+		if (!p->walking) {
 			p->walking = true;
-			if (WIDGET_IS_AIF_OR_DAI(widget->id)) {
-				err = sof_widget_free(sdev, widget->dobj.private);
-				if (err < 0)
-					ret = err;
-			}
-
-			err = sof_widget_free(sdev, p->sink->dobj.private);
-			if (err < 0)
-				ret = err;
 
 			err = sof_free_widgets_in_path(sdev, p->sink, dir);
 			if (err < 0)
@@ -393,32 +390,23 @@ static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_d
 	struct snd_soc_dapm_path *p;
 	int ret;
 
+	if (widget->dobj.private) {
+		ret = sof_widget_setup(sdev, widget->dobj.private);
+		if (ret < 0)
+			return ret;
+	}
+
 	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
-		if (!p->walking && p->sink->dobj.private && widget->dobj.private) {
+		if (!p->walking) {
 			p->walking = true;
-			if (WIDGET_IS_AIF_OR_DAI(widget->id)) {
-				ret = sof_widget_setup(sdev, widget->dobj.private);
-				if (ret < 0)
-					goto out;
-			}
-
-			ret = sof_widget_setup(sdev, p->sink->dobj.private);
-			if (ret < 0) {
-				if (WIDGET_IS_AIF_OR_DAI(widget->id))
-					sof_widget_free(sdev, widget->dobj.private);
-				goto out;
-			}
 
 			ret = sof_set_up_widgets_in_path(sdev, p->sink, dir);
+			p->walking = false;
 			if (ret < 0) {
-				if (WIDGET_IS_AIF_OR_DAI(widget->id))
+				if (widget->dobj.private)
 					sof_widget_free(sdev, widget->dobj.private);
-				sof_widget_free(sdev, p->sink->dobj.private);
-			}
-out:
-			p->walking = false;
-			if (ret < 0)
 				return ret;
+			}
 		}
 	}
 
-- 
2.39.1

