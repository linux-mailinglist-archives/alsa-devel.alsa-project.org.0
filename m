Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC8934B1CD
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 23:05:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C58EF165E;
	Fri, 26 Mar 2021 23:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C58EF165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616796336;
	bh=Az1eBJAcFWrG7CWtUDUyzxU5P9GRI4MHog/RHVyNbZQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WGY8/GmdKt4XdrV3s3WxflCu9DaBIVKXZa0QZeHW23vYWshyUhkQ23UtQQ3nb0ioM
	 uJMZXNJpVS9w/ZPntuZug177azwczk67UcV10OH2/08JDS4oJ/iTlI8jFy7MpgUx5l
	 5ni31+oZOqBXQTvjA6KS2w8ip3WV5zzMNOPLiAaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1638FF804F1;
	Fri, 26 Mar 2021 23:00:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5176F804B0; Fri, 26 Mar 2021 23:00:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47326F80424
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 23:00:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47326F80424
IronPort-SDR: 3nGV31GyycQ1fg3e2Fk58IVF1meXK5OabMxjCliITh203TSODty8NtXsTZvPqX9mAuVfvXmcue
 D9VhXyMb0JEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="211396730"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="211396730"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:09 -0700
IronPort-SDR: CzeTxe0xAsNYaajyRxXKP2vOoum6MEbKQdiHKYSUG2P2g6L9+x50WpB4rDhgJKJfOR1gxYDezG
 0sb/3cg5pXZw==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416706835"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.231.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/17] ASoC: stm: stm32_adfsdm: fix snprintf format string
Date: Fri, 26 Mar 2021 16:59:20 -0500
Message-Id: <20210326215927.936377-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Olivier Moysan <olivier.moysan@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 Takashi Iwai <tiwai@suse.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
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

cppcheck warning:

sound/soc/stm/stm32_adfsdm.c:120:2: warning: %d in format
string (no. 1) requires 'int' but the argument type is 'unsigned
int'. [invalidPrintfArgType_sint]
 snprintf(str_freq, sizeof(str_freq), "%d\n", freq);
 ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/stm/stm32_adfsdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index 47fae8dd20b4..e6078f50e508 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -117,7 +117,7 @@ static int stm32_adfsdm_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 
 	/* Set IIO frequency if CODEC is master as clock comes from SPI_IN */
 
-	snprintf(str_freq, sizeof(str_freq), "%d\n", freq);
+	snprintf(str_freq, sizeof(str_freq), "%u\n", freq);
 	size = iio_write_channel_ext_info(priv->iio_ch, "spi_clk_freq",
 					  str_freq, sizeof(str_freq));
 	if (size != sizeof(str_freq)) {
-- 
2.25.1

