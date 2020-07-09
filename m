Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C52CC21A4D3
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 18:30:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 551D515F2;
	Thu,  9 Jul 2020 18:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 551D515F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594312243;
	bh=dWlAy/k4q7/dBlS0g3Zx6Gek3heswxJ2Ohoqcih2eqc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YJHsGPEGq6v8f7f+3AVvddxRh1Zk3RpM+e6Mq9FEe+5yVxs1zipAoT+PWu3OCNaVO
	 keqpu8LEER2oBUaMb/RjTWlE2lZNhfvIgykWI+ys50TqCtgSpDzrrh179O0qYGJolA
	 3QqiKmZj6gdt3Zr+8jdQ3qggQytFgTlvor94B7Go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC1EAF80315;
	Thu,  9 Jul 2020 18:24:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70E9DF802E1; Thu,  9 Jul 2020 18:24:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 841D4F80257
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 18:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 841D4F80257
IronPort-SDR: nMeR/wU6EOZEAhtRfrW+HE6rRpYQoBetVd+hycPtMld2zHuWi+YX2YmRLTfg27651oMZiebwkv
 E6ZZRI7eovzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="149515643"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="149515643"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:55 -0700
IronPort-SDR: oiN3UjHYz9Irr5z1q5wYWoXbBhChlgsIu9pzEl6jvv7r29jWK3bZr+b83PRHnYi6d/nAQ6uue5
 F4stw2piK8yw==
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="280353035"
Received: from mdcoakle-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.43])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 07/10] ASoC: codecs: rt5631: fix spurious kernel-doc start
 and missing arguments
Date: Thu,  9 Jul 2020 11:23:24 -0500
Message-Id: <20200709162328.259586-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
References: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, broonie@kernel.org,
 Lee Jones <lee.jones@linaro.org>
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

Fixes the following W=1 kernel build warning(s):

sound/soc/codecs/rt5631.c:72: warning: Function parameter or member
'component' not described in 'rt5631_write_index'
sound/soc/codecs/rt5631.c:72: warning: Function parameter or member
'reg' not described in 'rt5631_write_index'
sound/soc/codecs/rt5631.c:72: warning: Function parameter or member
'value' not described in 'rt5631_write_index'
sound/soc/codecs/rt5631.c:82: warning: Function parameter or member
'component' not described in 'rt5631_read_index'
sound/soc/codecs/rt5631.c:82: warning: Function parameter or member
'reg' not described in 'rt5631_read_index'
sound/soc/codecs/rt5631.c:367: warning: Function parameter or member
'component' not described in 'onebit_depop_power_stage'
sound/soc/codecs/rt5631.c:405: warning: Function parameter or member
'component' not described in 'onebit_depop_mute_stage'
sound/soc/codecs/rt5631.c:443: warning: Function parameter or member
'component' not described in 'depop_seq_power_stage'
sound/soc/codecs/rt5631.c:515: warning: Function parameter or member
 'component' not described in 'depop_seq_mute_stage'

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5631.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index b5184f0e10e3..653da3eaf355 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -64,7 +64,7 @@ static const struct reg_default rt5631_reg[] = {
 	{ RT5631_PSEUDO_SPATL_CTRL, 0x0553 },
 };
 
-/**
+/*
  * rt5631_write_index - write index register of 2nd layer
  */
 static void rt5631_write_index(struct snd_soc_component *component,
@@ -74,7 +74,7 @@ static void rt5631_write_index(struct snd_soc_component *component,
 	snd_soc_component_write(component, RT5631_INDEX_DATA, value);
 }
 
-/**
+/*
  * rt5631_read_index - read index register of 2nd layer
  */
 static unsigned int rt5631_read_index(struct snd_soc_component *component,
@@ -359,6 +359,7 @@ static int check_adcr_select(struct snd_soc_dapm_widget *source,
 
 /**
  * onebit_depop_power_stage - auto depop in power stage.
+ * @component: ASoC component
  * @enable: power on/off
  *
  * When power on/off headphone, the depop sequence is done by hardware.
@@ -397,6 +398,7 @@ static void onebit_depop_power_stage(struct snd_soc_component *component, int en
 
 /**
  * onebit_depop_mute_stage - auto depop in mute stage.
+ * @component: ASoC component
  * @enable: mute/unmute
  *
  * When mute/unmute headphone, the depop sequence is done by hardware.
@@ -435,6 +437,7 @@ static void onebit_depop_mute_stage(struct snd_soc_component *component, int ena
 
 /**
  * onebit_depop_power_stage - step by step depop sequence in power stage.
+ * @component: ASoC component
  * @enable: power on/off
  *
  * When power on/off headphone, the depop sequence is done in step by step.
@@ -507,6 +510,7 @@ static void depop_seq_power_stage(struct snd_soc_component *component, int enabl
 
 /**
  * depop_seq_mute_stage - step by step depop sequence in mute stage.
+ * @component: ASoC component
  * @enable: mute/unmute
  *
  * When mute/unmute headphone, the depop sequence is done in step by step.
-- 
2.25.1

