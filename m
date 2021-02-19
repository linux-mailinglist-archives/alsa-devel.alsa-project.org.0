Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0382E3201D9
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:33:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75A091678;
	Sat, 20 Feb 2021 00:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75A091678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613777634;
	bh=YJOE0c9U075qY5eQdpKk+JEJLkfFslujQdyrEOoOy9c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fg52WgN6oWojF91Gdy7RSXdYn/vBByDUtMDHV2Si4moI0MR5j6sCqflhBYTpW4rSq
	 eq3J25cpy/AXiXveWrP8k9syj2xzKqfjzU8h4SyTUeIFdVVYy5M92+JCM20cU5fXD+
	 ZUWNttPJziqhNHnpzR0N+okjsCnuazTSZFMxLxW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFCADF8032B;
	Sat, 20 Feb 2021 00:30:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B7B9F802C8; Sat, 20 Feb 2021 00:30:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26AC1F801F5
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:30:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26AC1F801F5
IronPort-SDR: HrAKthg+8YfAlvPT2ACyEP6hqfXU2lFayhvCPeglrG1EBe07bfJcNAoFAL0Nvq2Lkkr3IB2RTd
 HdrXaEOXvBqQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="203293761"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="203293761"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:38 -0800
IronPort-SDR: CfK6mY4hDQy0TmUyczZmvQxnXe7g9+7POSQ3LWZgXVsoeX8yig7+76dLydP8+UiHQ8hVHVidrn
 3nQmHl6a+G+g==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="496662779"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:30:37 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/9] ASoC: fsl: imx-hdmi: remove unused structure members
Date: Fri, 19 Feb 2021 17:29:34 -0600
Message-Id: <20210219232937.6440-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210219232937.6440-1-pierre-louis.bossart@linux.intel.com>
References: <20210219232937.6440-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, tiwai@suse.de,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 broonie@kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

sound/soc/fsl/imx-hdmi.c:21:16: style: struct member
'cpu_priv::sysclk_freq' is never used. [unusedStructMember]
 unsigned long sysclk_freq[2];
               ^

Additional checks show the sysclk_dir member is also not used.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/fsl/imx-hdmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index dbbb7618351c..1ebcb9a2336b 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -10,16 +10,12 @@
 
 /**
  * struct cpu_priv - CPU private data
- * @sysclk_freq: SYSCLK rates for set_sysclk()
- * @sysclk_dir: SYSCLK directions for set_sysclk()
  * @sysclk_id: SYSCLK ids for set_sysclk()
  * @slot_width: Slot width of each frame
  *
  * Note: [1] for tx and [0] for rx
  */
 struct cpu_priv {
-	unsigned long sysclk_freq[2];
-	u32 sysclk_dir[2];
 	u32 sysclk_id[2];
 	u32 slot_width;
 };
-- 
2.25.1

