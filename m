Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8691D5B40
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 23:12:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0393D1664;
	Fri, 15 May 2020 23:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0393D1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589577160;
	bh=gyjtKQ0ygUBmtZaFAHBY2Selg/N/5ibzxfY/EwTSlLQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K+Y9o7sj++43p2/I96BYQxkSOkGRw9dZsQNYeZQlR/4AHOIemlWVVOhcYoDPeThSo
	 sUe/Lczj1JBJEut+cMAsvL0fUnFY9q33CG6lg7sVgxbI3FBzzJhJpKRBqM49vovstR
	 SSqE1ejVqxd83jvxJIrdSkx3aq7KSe+puJtsJZlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE907F80278;
	Fri, 15 May 2020 23:10:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D988F80253; Fri, 15 May 2020 23:08:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B4B2F80101
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 23:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B4B2F80101
IronPort-SDR: 65cvv7BDLE6FmfrfDpnnrECysoRd/7LX9vSAmt68I1v1ZXBYPA7niaZubsb7LxSkyydDjBROPu
 YNfcjjoqHomA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 14:07:57 -0700
IronPort-SDR: JZHECuqh+Ap1ZKYuEtJDdaQCjO1apB+hJY9K2+cgMnRQiqO0zUeHshuB1snMglF+uW+AkQ1wuJ
 LIQfFlVUb4jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,396,1583222400"; d="scan'208";a="410589928"
Received: from btchambe-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.66.225])
 by orsmga004.jf.intel.com with ESMTP; 15 May 2020 14:07:57 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: Intel: sof_sdw_rt711: remap buttons
Date: Fri, 15 May 2020 16:07:29 -0500
Message-Id: <20200515210731.10942-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515210731.10942-1-pierre-louis.bossart@linux.intel.com>
References: <20200515210731.10942-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

Use same mapping as in all other machine drivers:

BTN_0 : KEY_PLAYPAUSE
BTN_1 : KEY_VOICECOMMAND
BTN_2 : KEY_VOLUMEUP
BTN_3 : KEY_VOLUMEDOWN

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/boards/sof_sdw_rt711.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 1ded5d9895cf..d4d75c8dc6b7 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -119,10 +119,10 @@ static int rt711_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	jack = &ctx->sdw_headset;
 
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_VOLUMEUP);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_PLAYPAUSE);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
-	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
 
 	ret = snd_soc_component_set_jack(component, jack, NULL);
 
-- 
2.20.1

