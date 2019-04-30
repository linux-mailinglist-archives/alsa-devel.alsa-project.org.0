Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3E71034A
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 01:25:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C963616A1;
	Wed,  1 May 2019 01:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C963616A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556666701;
	bh=6wy6zwQIHLKSVO8+/coJY+u0zGtOYCr+bf7WILHKlE8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OAxFuyFLty6DPbC3edCGWfBKJpbPkJuTjAwjFI5aXoFjI5Wai9hRkdlgFsnwnwVfn
	 8G//NqvU+Yc5IgC9L9dInXDwFFBs6YQQJDq5DyC6R7VbO7UudHC6NGhfbJZFCl+8w5
	 6fCPE9cL2wszxMhcIjKJAH6+6pLDxks6xBLSoR3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E6B7F896F0;
	Wed,  1 May 2019 01:11:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1023F89783; Wed,  1 May 2019 01:11:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22B9AF896F0
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 01:11:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22B9AF896F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 16:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,415,1549958400"; d="scan'208";a="166418011"
Received: from slawsonx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.128])
 by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2019 16:11:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 30 Apr 2019 18:11:34 -0500
Message-Id: <20190430231134.4471-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: dapm: fix kcontrols for effect widgets
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>

This patch adds the handling of snd_soc_dapm_effect that was missing.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-dapm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 65ee0bb5dd0b..81a7a12196ff 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -883,6 +883,7 @@ static int dapm_create_or_share_kcontrol(struct snd_soc_dapm_widget *w,
 			case snd_soc_dapm_switch:
 			case snd_soc_dapm_mixer:
 			case snd_soc_dapm_pga:
+			case snd_soc_dapm_effect:
 			case snd_soc_dapm_out_drv:
 				wname_in_long_name = true;
 				kcname_in_long_name = true;
@@ -2370,6 +2371,7 @@ static ssize_t dapm_widget_show_component(struct snd_soc_component *cmpnt,
 		case snd_soc_dapm_dac:
 		case snd_soc_dapm_adc:
 		case snd_soc_dapm_pga:
+		case snd_soc_dapm_effect:
 		case snd_soc_dapm_out_drv:
 		case snd_soc_dapm_mixer:
 		case snd_soc_dapm_mixer_named_ctl:
@@ -3197,6 +3199,7 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 			dapm_new_mux(w);
 			break;
 		case snd_soc_dapm_pga:
+		case snd_soc_dapm_effect:
 		case snd_soc_dapm_out_drv:
 			dapm_new_pga(w);
 			break;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
