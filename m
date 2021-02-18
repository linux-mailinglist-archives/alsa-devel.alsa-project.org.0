Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 592EA31F231
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:22:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA4861669;
	Thu, 18 Feb 2021 23:21:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA4861669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613686927;
	bh=bdOLkGdNzkpyAQ4FJgOUq/oJswLIiU4JK5A+pPYo8BI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XWULW04BMDffJ/OE4h6GjKMevtWmslw/qyAupfv8nRw6bUDc6MMp30IMeYJnoOfF8
	 4G1mCJ9Jo0kB21TjHyND7acnVfWZa1XOvogMkiNwq1ep4oNXHAaIOZUAdXSDZ67Xh6
	 Zn2mgMKB6c+JUo/WmiTRZXYWV2cnfy3zdOyg9nRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2118CF802DB;
	Thu, 18 Feb 2021 23:19:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3685F8028B; Thu, 18 Feb 2021 23:19:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82D85F80155
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:19:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82D85F80155
IronPort-SDR: rCtdaxhdgOwM/uQPo5/3HOjBAfHjPczjh7tt1fBi/atNVH1N8ZxXK1hPcyjLvYMEweZLeOjk9g
 kSJGxhxWRpgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="170801483"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="170801483"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:19:36 -0800
IronPort-SDR: As5biSp9YH2SjXReHi/NWSOO2+xJ/6CViASZ2QhNxOogxV5jJ2RErWSMSMb1HfK7tLXCLX2Tx5
 bfSU0vfnAA2A==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="581441983"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:19:35 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/6] ASoC: soc-pcm: remove redundant assignment
Date: Thu, 18 Feb 2021 16:19:17 -0600
Message-Id: <20210218221921.88991-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218221921.88991-1-pierre-louis.bossart@linux.intel.com>
References: <20210218221921.88991-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

cppcheck warning:

sound/soc/soc-pcm.c:2398:7: style: Variable 'ret' is reassigned a
value before the old one has been used. [redundantAssignment]
  ret = -EINVAL;
      ^
sound/soc/soc-pcm.c:2395:7: note: ret is assigned
  ret = -EINVAL;
      ^
sound/soc/soc-pcm.c:2398:7: note: ret is overwritten
  ret = -EINVAL;
      ^

This looks like a copy/paste or git merge issue.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/soc-pcm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 14d85ca1e435..12fd10a6c190 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2395,7 +2395,6 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 	/* Only start the BE if the FE is ready */
 	if (fe->dpcm[stream].state == SND_SOC_DPCM_STATE_HW_FREE ||
 		fe->dpcm[stream].state == SND_SOC_DPCM_STATE_CLOSE) {
-		ret = -EINVAL;
 		dev_err(fe->dev, "ASoC: FE %s is not ready %d\n",
 			fe->dai_link->name, fe->dpcm[stream].state);
 		ret = -EINVAL;
-- 
2.25.1

