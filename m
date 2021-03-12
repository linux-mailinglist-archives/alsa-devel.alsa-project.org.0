Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAA5339673
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:29:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C06C1773;
	Fri, 12 Mar 2021 19:28:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C06C1773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573748;
	bh=wJOEURvR4M+abLk3YifJNlw+LqRTmIzaKHz3LXTK+4s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HWurA00cB+yU9Ofdbb6ElieIKiHZL9EzVdrpdLgSaXlosT3f/zM6qM9GMPrJtCW2Q
	 Rz2sUgUfo9VeTDYmYO4qnOx2dTI6kUEimoN2I/B/ZQR2qnUiHkOvdOEattNb5r/84d
	 /S6YnZ1hUHr5RXuBppcD/l6IyZKhep05AtfuX0eg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FC82F80508;
	Fri, 12 Mar 2021 19:23:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA929F8032D; Fri, 12 Mar 2021 19:23:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4251EF80482
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4251EF80482
IronPort-SDR: sDhe8vjsdaZncNedz1qpNzm/qVR+pphni3ZvPaWgOA91g1odUmEYhAKk0IM0Ly6uGnoe1gwtQd
 IU1jy54KNa7Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="185515193"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="185515193"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:24 -0800
IronPort-SDR: ds0S0yWIDJ1HBs03JMj+yNt0YAyLpS++2rq6kg9abvuLpIxsQ0w+m9VtYlRKp0eBF/1Ky8f+rv
 fJYCpW0qJUrw==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377791961"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:23 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/23] ASoC: hdmi-codec: remove useless initialization
Date: Fri, 12 Mar 2021 12:22:33 -0600
Message-Id: <20210312182246.5153-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Sia Jee Heng <jee.heng.sia@intel.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 broonie@kernel.org, Cheng-Yi Chiang <cychiang@chromium.org>
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

Fix cppcheck warning:

sound/soc/codecs/hdmi-codec.c:745:5: style: Redundant initialization
for 'cf'. The initialized value is overwritten before it is
read. [redundantInitialization]
 cf = dai->playback_dma_data;
    ^
sound/soc/codecs/hdmi-codec.c:738:31: note: cf is initialized
 struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
                              ^
sound/soc/codecs/hdmi-codec.c:745:5: note: cf is overwritten
 cf = dai->playback_dma_data;
    ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/hdmi-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 422539f933de..83e74ddccf59 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -735,7 +735,7 @@ static int hdmi_codec_set_jack(struct snd_soc_component *component,
 
 static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
 {
-	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
+	struct hdmi_codec_daifmt *cf;
 	int ret;
 
 	ret = hdmi_dai_probe(dai);
-- 
2.25.1

