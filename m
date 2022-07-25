Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6B9581F9D
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 07:42:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB6CA9F6;
	Wed, 27 Jul 2022 07:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB6CA9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658900558;
	bh=xxfpDZrbm7zCSfGjVdSridYCJTF/7C6BhRwRfwFXKWE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z2uFmVHURc5QZlvTM32004DZUBg2IFFvZcHFHyDk0l9/NhTKfr4fBQPuxU53bCJbx
	 ZJ+8nuHz33vCU3pzsZeIX9G/DmLGAJ9xEUJV2Gzrt10bhR8cGoVYcvlrOcjcRw0vUo
	 acT75R1gFbWxecwbdIIWlwsBaWDE97WDfKhXo7Sg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 227B9F800FA;
	Wed, 27 Jul 2022 07:41:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F00BFF80115; Mon, 25 Jul 2022 13:11:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sender4-op-o13.zoho.com (sender4-op-o13.zoho.com
 [136.143.188.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BCD3F80115
 for <alsa-devel@alsa-project.org>; Mon, 25 Jul 2022 13:11:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BCD3F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=icenowy.me header.i=uwu@icenowy.me
 header.b="NSK+g8ly"
ARC-Seal: i=1; a=rsa-sha256; t=1658747433; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fW8TaQMdY65k4a6PKbwO5EvXQYUat5GJl3nk4ojQxYKztgFdxYaf+Hzzd+ScGnx0RY/pxBnIEDpHFwgGtCL6CdpzZlQH+Cfqvz/pgOM3LaBoFg1MLc5bIbv1rMTjmGGozmtprtA3Y13eoVpsfefJ6aaX8QXHz2/kSFY2UkIXxXQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1658747433;
 h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=td2HD537TFOqVAXGmobMSbf6TwwoP0HqZ6KHlLX2n6Q=; 
 b=DvLAml3IlrBKQOcRZbveXUhmdO6ZcRNg7fPMsr428hc65vAErcS820j243ZZcuF2L9w/NHdKB+JAzukmV5woADgN74+/o4Ko51MwHVcP58lVnV7koQe/2UGEMiFDfEPyhJHHCXZg9Jd1aIeVypWZ5SQ1LXt7mQ6ncdUkcWpW/jc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658747433; 
 s=zmail; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=td2HD537TFOqVAXGmobMSbf6TwwoP0HqZ6KHlLX2n6Q=;
 b=NSK+g8lymnxFsW3NBxxSdluCZuP91qRNACJuzv0Vu4ZueHaC7FrumKdnPz6ml8Kk
 mOcm2peOuCbTo1acgIkx0CrpIBDzCHflXN3ygeXkfNmel1c/kh6vCtQrd+f3ghqU5VI
 r5NPUJo98R7/rctNerhhHYq+wPd8WsDaVe9yaQfo=
Received: from edelgard.icenowy.me (59.41.162.230 [59.41.162.230]) by
 mx.zohomail.com with SMTPS id 1658747431498424.62638727725675;
 Mon, 25 Jul 2022 04:10:31 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: Intel: Skylake: try to get NHLT blob with PCM
 params as fallback
Date: Mon, 25 Jul 2022 19:10:02 +0800
Message-Id: <20220725111002.143765-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220725111002.143765-1-uwu@icenowy.me>
References: <20220725111002.143765-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Mailman-Approved-At: Wed, 27 Jul 2022 07:41:04 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Icenowy Zheng <uwu@icenowy.me>
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

Switching to use pipeline parameters to get NHLT blob breaks audio on
HP Chromebook 13 G1 (at least with MrChromeBox firmware).

Fix this by retrying to get NHLT blob with PCM parameters (which is the
old behavior) if pipeline parameters fail.

Fixes: 87b265260046 ("ASoC: Intel: Skylake: Select proper format for NHLT blob")
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 sound/soc/intel/skylake/skl-topology.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 19994ec8bba1..3d5a3ee1c82c 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -1858,6 +1858,15 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
 					pipe_fmt->bps, params->s_cont,
 					pipe_fmt->channels, pipe_fmt->freq,
 					pipe->direction, dev_type);
+	if (!cfg) {
+		/* Retry with PCM parameters, as the old behavior */
+		cfg = intel_nhlt_get_endpoint_blob(dai->dev, skl->nhlt,
+						mconfig->vbus_id, link_type,
+						params->s_fmt, params->s_cont,
+						params->ch, params->s_freq,
+						params->stream, dev_type);
+	}
+
 	if (cfg) {
 		mconfig->formats_config[SKL_PARAM_INIT].caps_size = cfg->size;
 		mconfig->formats_config[SKL_PARAM_INIT].caps = (u32 *)&cfg->caps;
@@ -1866,6 +1875,8 @@ static int skl_tplg_be_fill_pipe_params(struct snd_soc_dai *dai,
 			mconfig->vbus_id, link_type, params->stream,
 			pipe_fmt->channels, pipe_fmt->freq,
 			pipe_fmt->bps);
+		dev_err(dai->dev, "PCM: ch %d, freq %d, fmt %d\n",
+			params->ch, params->s_freq, params->s_fmt);
 		return -EINVAL;
 	}
 
-- 
2.37.1

