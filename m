Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 023F531F255
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:33:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EE6042;
	Thu, 18 Feb 2021 23:32:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EE6042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613687588;
	bh=LRIqfkHRrBekVFIq2DGIruwqdCUR+DPTqGb1WwlLuL8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j1KtuD95NqpmR+4ZL4LvLqy6ZWpQOJfyL5jyR1D/sbwzxMj1Eh5LmFHsw8Mfllyg3
	 2P84iYkcZ+dU1zn2k/sFE1lBCVFbry75tkW/aphyvTRcfABsSVyWZisQiSkoseG4l7
	 iYhjfHbYMpMg0bJ9wbvPmntLjZOvooTb0EsH3rfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2738F802DB;
	Thu, 18 Feb 2021 23:30:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95387F801DB; Thu, 18 Feb 2021 23:29:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B869F8020C
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:29:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B869F8020C
IronPort-SDR: FiKmnqP9LaEu0QE2I/Pwrxo0cavmWzkws5s6IAf6RFbz1XAvJN7ToreNShIIj3jGrKoNNU1XH5
 +VvuwfGETkLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="182875645"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="182875645"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:41 -0800
IronPort-SDR: pDilh3V6JUOf+ybioFI4frKfUMAEl5Xp2NsYRY375d9MicT8rW/xVKNyZeFuwHArATsTLi/0Go
 M7m5crzgpYhg==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="364990843"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:40 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/10] ASoC: wcd-clsh-v2: align function prototypes
Date: Thu, 18 Feb 2021 16:29:13 -0600
Message-Id: <20210218222916.89809-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
References: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

cppcheck warnings:

sound/soc/codecs/wcd-clsh-v2.c:523:28: style:inconclusive: Function
'wcd_clsh_ctrl_set_state' argument 2 names different: declaration
'event' definition 'clsh_event'. [funcArgNamesDifferent]
       enum wcd_clsh_event clsh_event,
                           ^
sound/soc/codecs/wcd-clsh-v2.h:45:28: note: Function
'wcd_clsh_ctrl_set_state' argument 2 names different: declaration
'event' definition 'clsh_event'.
       enum wcd_clsh_event event,
                           ^
sound/soc/codecs/wcd-clsh-v2.c:523:28: note: Function
'wcd_clsh_ctrl_set_state' argument 2 names different: declaration
'event' definition 'clsh_event'.
       enum wcd_clsh_event clsh_event,
                           ^
sound/soc/codecs/wcd-clsh-v2.c:524:12: style:inconclusive: Function
'wcd_clsh_ctrl_set_state' argument 3 names different: declaration
'state' definition 'nstate'. [funcArgNamesDifferent]
       int nstate,
           ^
sound/soc/codecs/wcd-clsh-v2.h:46:12: note: Function
'wcd_clsh_ctrl_set_state' argument 3 names different: declaration
'state' definition 'nstate'.
       int state,
           ^
sound/soc/codecs/wcd-clsh-v2.c:524:12: note: Function
'wcd_clsh_ctrl_set_state' argument 3 names different: declaration
'state' definition 'nstate'.
       int nstate,
           ^
sound/soc/codecs/wcd-clsh-v2.c:557:69: style:inconclusive: Function
'wcd_clsh_ctrl_alloc' argument 1 names different: declaration
'component' definition 'comp'. [funcArgNamesDifferent]
struct wcd_clsh_ctrl *wcd_clsh_ctrl_alloc(struct snd_soc_component *comp,
                                                                    ^
sound/soc/codecs/wcd-clsh-v2.h:40:31: note: Function
'wcd_clsh_ctrl_alloc' argument 1 names different: declaration
'component' definition 'comp'.
    struct snd_soc_component *component,
                              ^
sound/soc/codecs/wcd-clsh-v2.c:557:69: note: Function
'wcd_clsh_ctrl_alloc' argument 1 names different: declaration
'component' definition 'comp'.
struct wcd_clsh_ctrl *wcd_clsh_ctrl_alloc(struct snd_soc_component *comp,
                                                                    ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wcd-clsh-v2.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd-clsh-v2.h b/sound/soc/codecs/wcd-clsh-v2.h
index a902f9893467..a6d0f2d0e9e3 100644
--- a/sound/soc/codecs/wcd-clsh-v2.h
+++ b/sound/soc/codecs/wcd-clsh-v2.h
@@ -37,13 +37,13 @@ enum wcd_clsh_mode {
 struct wcd_clsh_ctrl;
 
 extern struct wcd_clsh_ctrl *wcd_clsh_ctrl_alloc(
-				struct snd_soc_component *component,
+				struct snd_soc_component *comp,
 				int version);
 extern void wcd_clsh_ctrl_free(struct wcd_clsh_ctrl *ctrl);
 extern int wcd_clsh_ctrl_get_state(struct wcd_clsh_ctrl *ctrl);
 extern int wcd_clsh_ctrl_set_state(struct wcd_clsh_ctrl *ctrl,
-				   enum wcd_clsh_event event,
-				   int state,
+				   enum wcd_clsh_event clsh_event,
+				   int nstate,
 				   enum wcd_clsh_mode mode);
 
 #endif /* _WCD_CLSH_V2_H_ */
-- 
2.25.1

