Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE282A05A5
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 13:41:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DB341679;
	Fri, 30 Oct 2020 13:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DB341679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604061702;
	bh=bSjRZaSojxVdQvDg0wqWdDE7CNRIjEOTMByEdIXRbfE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HPQnkMQvvnJu5tm/OsnVTLh//wpdMfw091LkOP7CQcN7AhW4AIwJOsmwNLUiGhd6+
	 +t3dT0vnF+MK3TFxXn9S9eGu+6D7vH47Qbj5FPOjRHED/15M9faZOkLMDgHqXzmAu+
	 q8nZGOmFdj600SMb/vMVyVlfCMlTlkRvXTCvzIOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B88F7F804E6;
	Fri, 30 Oct 2020 13:37:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34A29F804CC; Fri, 30 Oct 2020 13:37:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72DB7F800C0
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 13:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72DB7F800C0
IronPort-SDR: d8iOHrmxLS3Ua5vMTK5z2J7bYLpClUucxkQqhEX5JPPZh2SJyAnumqipQlX/3ElWD+LkEiQJeQ
 CzrEDKHeDX/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="230234022"
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="230234022"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2020 05:37:46 -0700
IronPort-SDR: gdXUZL32QU7wRGqV5QzrJ8WIMDD6B+GP0AMd73hH27K9X34eKyRnk2wNGtPEVQoP9Me7dZZsUy
 nhb/i5p1rKPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,433,1596524400"; d="scan'208";a="362433745"
Received: from pi-desktop.igk.intel.com ([10.237.148.102])
 by orsmga007.jf.intel.com with ESMTP; 30 Oct 2020 05:37:43 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 6/6] ASoC: topology: Simplify remove_widget function
Date: Fri, 30 Oct 2020 10:54:27 -0400
Message-Id: <20201030145427.3497990-7-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
References: <20201030145427.3497990-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Now that enum and mixer kcontrols are freed by resource management
framework, removing kcontrol becomes one function call, so simplify code
in remove_widget.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-topology.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
index 4f632aeeeb5e..07c60187e9ea 100644
--- a/sound/soc/soc-topology.c
+++ b/sound/soc/soc-topology.c
@@ -431,26 +431,8 @@ static void remove_widget(struct snd_soc_component *comp,
 	if (!w->kcontrols)
 		goto free_news;
 
-	/*
-	 * Dynamic Widgets either have 1..N enum kcontrols or mixers.
-	 * The enum may either have an array of values or strings.
-	 */
-	if (dobj->widget.kcontrol_type == SND_SOC_TPLG_TYPE_ENUM) {
-		/* enumerated widget mixer */
-		for (i = 0; w->kcontrols != NULL && i < w->num_kcontrols; i++) {
-			struct snd_kcontrol *kcontrol = w->kcontrols[i];
-
-			snd_ctl_remove(card, kcontrol);
-
-		}
-	} else {
-		/* volume mixer or bytes controls */
-		for (i = 0; w->kcontrols != NULL && i < w->num_kcontrols; i++) {
-			struct snd_kcontrol *kcontrol = w->kcontrols[i];
-
-			snd_ctl_remove(card, kcontrol);
-		}
-	}
+	for (i = 0; w->kcontrols && i < w->num_kcontrols; i++)
+		snd_ctl_remove(card, w->kcontrols[i]);
 
 free_news:
 
-- 
2.25.1

