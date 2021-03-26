Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B034B1C6
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 23:04:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9F261694;
	Fri, 26 Mar 2021 23:03:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9F261694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616796248;
	bh=9qDUwHPTBroQ8LNiEQzFb6UW4q04SWcs0SnBKY7uo74=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K1bRBX3vSdDrXTwm4WVbpApXrJ51UDt0awxucy4QWoev3YQajs7Oa2Z6ovfmlTtHl
	 RacoOesm4fGycRKj4VoXCL5qFZGW7A7SOzdvxHXI7inhp6G2AI8rn3IoItRUIo5Nql
	 nN+OemxiLpEPHXEqEjmgvGKz0gDLTa8sqQ20EGwc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7ACC2F804AA;
	Fri, 26 Mar 2021 23:00:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2496F802E3; Fri, 26 Mar 2021 23:00:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61355F80156
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 23:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61355F80156
IronPort-SDR: dcLfLEdyGFbiLF54jsD9CA2cN57Xp/gaKUaNAzFEnDSIiEKnXxdz3QfqDfiKVBQfF+pdhdeSnl
 t7rY4gORptTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="211396714"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="211396714"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:05 -0700
IronPort-SDR: LPvQQBUTZQoub2tgOnyV3oci46fvQuMKxLtmO0TNsF6EKwhztLoDFYJJu9ibZwwz2dP6h5WHcv
 LChziWVcD0ww==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416706775"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.231.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/17] ASoC: pxa: remove useless assignment
Date: Fri, 26 Mar 2021 16:59:17 -0500
Message-Id: <20210326215927.936377-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 "moderated list:PXA2xx/PXA3xx SUPPORT" <linux-arm-kernel@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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

sound/soc/pxa/mmp-pcm.c:207:10: style: Variable 'ret' is assigned a
value that is never used. [unreadVariable]
 int ret = 0, stream;
         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/pxa/mmp-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/pxa/mmp-pcm.c b/sound/soc/pxa/mmp-pcm.c
index 53fc49e32fbc..5d520e18e512 100644
--- a/sound/soc/pxa/mmp-pcm.c
+++ b/sound/soc/pxa/mmp-pcm.c
@@ -204,7 +204,7 @@ static int mmp_pcm_new(struct snd_soc_component *component,
 {
 	struct snd_pcm_substream *substream;
 	struct snd_pcm *pcm = rtd->pcm;
-	int ret = 0, stream;
+	int ret, stream;
 
 	for (stream = 0; stream < 2; stream++) {
 		substream = pcm->streams[stream].substream;
-- 
2.25.1

