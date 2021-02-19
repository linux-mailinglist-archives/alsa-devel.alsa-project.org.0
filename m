Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5FE3201DD
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:35:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73FC71665;
	Sat, 20 Feb 2021 00:34:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73FC71665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613777718;
	bh=XDCoHup9BrnFmq5+HsbzomPJ5pXagTGKLTKXc3ehov4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DhSOniKZSzxrtfCy0AvrIW/Z95aQmQfgzugFZ7jZT4FHI+n7t4L8/2CI124unn4lW
	 Um8/Zn7ze2Ud/1n3eHt5hoVwjq/EQaR3nnWwKZmAsc+Neu7SW4F/W68ItvIk38OLCd
	 +XpvYNz3A0M+WFN6k2DaZPfCrgcaK5vivxWHJjf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A01BEF804B4;
	Sat, 20 Feb 2021 00:30:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E2E4F802E0; Sat, 20 Feb 2021 00:30:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C5C3F802C9
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C5C3F802C9
IronPort-SDR: iP84Rjhr4RMfPRkTZBjzMS4uN42oSfPNkYaqKLkZFrSMNBG0um0QVDV5gq5IRbzS1ktAoUG3YB
 6yEmVVfpS0uA==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203293782"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203293782"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:41 -0800
IronPort-SDR: 7J5iSuMxctWjKWA9b/RW/w0Y6U0jE9BtLu2q8n+o//laTJq3NERRJCZ18FAbsXtUH/+bOrFvBY
 TIL2tFRRWQgQ==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="496662875"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:40 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 8/9] ASoC: fsl: mpc8610: remove useless assignment
Date: Fri, 19 Feb 2021 17:29:36 -0600
Message-Id: <20210219232937.6440-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210219232937.6440-1-pierre-louis.bossart@linux.intel.com>
References: <20210219232937.6440-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, tiwai@suse.de,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 broonie@kernel.org, Fabio Estevam <festevam@gmail.com>
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

sound/soc/fsl/mpc8610_hpcd.c:333:6: style: Redundant initialization
for 'ret'. The initialized value is overwritten before it is
read. [redundantInitialization]
 ret = fsl_asoc_get_dma_channel(np, "fsl,playback-dma",
     ^
sound/soc/fsl/mpc8610_hpcd.c:193:10: note: ret is initialized
 int ret = -ENODEV;
         ^
sound/soc/fsl/mpc8610_hpcd.c:333:6: note: ret is overwritten
 ret = fsl_asoc_get_dma_channel(np, "fsl,playback-dma",
     ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/mpc8610_hpcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/mpc8610_hpcd.c b/sound/soc/fsl/mpc8610_hpcd.c
index eccc833390d4..58b9ca3c4da0 100644
--- a/sound/soc/fsl/mpc8610_hpcd.c
+++ b/sound/soc/fsl/mpc8610_hpcd.c
@@ -190,7 +190,7 @@ static int mpc8610_hpcd_probe(struct platform_device *pdev)
 	struct device_node *codec_np = NULL;
 	struct mpc8610_hpcd_data *machine_data;
 	struct snd_soc_dai_link_component *comp;
-	int ret = -ENODEV;
+	int ret;
 	const char *sprop;
 	const u32 *iprop;
 
-- 
2.25.1

