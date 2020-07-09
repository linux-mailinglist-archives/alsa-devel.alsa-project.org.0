Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D111821A4C1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 18:27:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46AF71612;
	Thu,  9 Jul 2020 18:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46AF71612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594312041;
	bh=AB9DUxlap7his/1pJioffJhFp/iCyb5jVDYZu0tP9OM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gKEH1w/a3afENj1BrCVcb3JldTH1a5ypS1dC+xoI6LXOg48E4XNixLX6LC0lcsY8u
	 CvT/mCpdnp8+T28Sg8L/GyTRNbTBfAnKSibMPdWQwCwIhhBaFepfqPvKTlfPpTcmGw
	 JGJOWA/yyx9eHklvmzNnmdN4+hDMpgQ08I3ArYrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45DCDF802DF;
	Thu,  9 Jul 2020 18:24:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6813AF802BD; Thu,  9 Jul 2020 18:24:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C0E8F80216
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 18:23:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C0E8F80216
IronPort-SDR: zfHdDJf5Rnv+Up8rjlGUHBUUy8B6NIwFaolVN3Q1KKaxr00Y9k8ItlJExVHg8JkJ9qd8cJsHu/
 nsm1jtA89J8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="149515612"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="149515612"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:41 -0700
IronPort-SDR: KzUGfoalURuiIxELJefwg1H+FBc3WNXrvMOf2f8zmPdhtnNVYUyYTwLZLRJA3PgutpqmK+1VIY
 5NpmjSl/m53g==
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="280352965"
Received: from mdcoakle-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.43])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 01/10] ASoC: sti: uniperif: fix 'defined by not used'
 warning
Date: Thu,  9 Jul 2020 11:23:18 -0500
Message-Id: <20200709162328.259586-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
References: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>,
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

Fix W=1 warning. The table uni_tdm_hw is declared in a header included
by multiple C file. This isn't really a good practice but for now
using __maybe_unused makes the following warning go away.

sound/soc/sti/sti_uniperif.c:12:
sound/soc/sti/uniperif.h:1351:38: warning: ‘uni_tdm_hw’ defined but
not used [-Wunused-const-variable=]
 1351 | static const struct snd_pcm_hardware uni_tdm_hw = {
      |                                      ^~~~~~~~~~

Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sti/uniperif.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sti/uniperif.h b/sound/soc/sti/uniperif.h
index 2dc2da5d458b..a16adeb7c1e9 100644
--- a/sound/soc/sti/uniperif.h
+++ b/sound/soc/sti/uniperif.h
@@ -1348,7 +1348,7 @@ struct sti_uniperiph_data {
 	struct sti_uniperiph_dai dai_data;
 };
 
-static const struct snd_pcm_hardware uni_tdm_hw = {
+static __maybe_unused const struct snd_pcm_hardware uni_tdm_hw = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_MMAP |
 		SNDRV_PCM_INFO_MMAP_VALID,
-- 
2.25.1

