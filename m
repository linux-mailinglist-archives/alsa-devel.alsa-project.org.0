Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B618544DD1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:37:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDBB21A95;
	Thu,  9 Jun 2022 15:36:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDBB21A95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654781841;
	bh=8HJcIravgrWc+gp3rtvSdU0B38FZF2WwoFaIgFk2ZtI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ObYQxMcrATSs4M+UUeAhye5ovLirmqTI8DqoNXolDEj+NInu/mlOXZaAAFslTGRj7
	 dHVlxaogjMgrVKHZzXIvVVVGLlnxH6bGGIezJR3D1k5/ncfAiiLtKIv3IT7DJgBB2X
	 aaH5RmMnieP6zTkoAP10BgD5fFQTxOyzwmEw3V2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A0BBF80520;
	Thu,  9 Jun 2022 15:35:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81EA6F804BD; Thu,  9 Jun 2022 15:35:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD30AF800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:35:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD30AF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Q0CUht9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654781746; x=1686317746;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8HJcIravgrWc+gp3rtvSdU0B38FZF2WwoFaIgFk2ZtI=;
 b=Q0CUht9t5htFHo60YaCE5Imo0XZSYrwgpSKTXsZm3h3HpBYmn/ZQxAC3
 e4j7yjTohflodFNtjQz/t8ZK8p/UIfsk9GD4qTCfISdpF7zuuf5W/Tsni
 NFlVKE2kZJ7dyOr2fgmA9Q9laGiKoB7+7G+8nQWVf7dTfO7fPxUN3ILts
 KISV121YsAwharvWr9M+gGv4MXHwxhBbUlNYrVYRFAA7gMq2G/T6DFtHz
 VQD9VTME2csYvOEJpW33MevJ83mJHpOaq4xcBWSFtBZkA3R1z2JGdh+X3
 Tv/7nfdWQ/iFLMi5m8KSEwg49JiFOECPX6dsoW0cdo8E63d06a/AoL9VT w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266061384"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="266061384"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 06:35:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="683966134"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2022 06:35:40 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Oder Chiou <oder_chiou@realtek.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 01/11] ASoC: codecs: rt274: Always init jack_detect_work
Date: Thu,  9 Jun 2022 15:35:31 +0200
Message-Id: <20220609133541.3984886-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
References: <20220609133541.3984886-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
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

From: Cezary Rojewski <cezary.rojewski@intel.com>

Improves readability by making sure the work is always initialized.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/codecs/rt274.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index ab093bdb5552..a5615e94ec7d 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -980,14 +980,11 @@ static int rt274_probe(struct snd_soc_component *component)
 	struct rt274_priv *rt274 = snd_soc_component_get_drvdata(component);
 
 	rt274->component = component;
+	INIT_DELAYED_WORK(&rt274->jack_detect_work, rt274_jack_detect_work);
 
-	if (rt274->i2c->irq) {
-		INIT_DELAYED_WORK(&rt274->jack_detect_work,
-					rt274_jack_detect_work);
+	if (rt274->i2c->irq)
 		schedule_delayed_work(&rt274->jack_detect_work,
-					msecs_to_jiffies(1250));
-	}
-
+				      msecs_to_jiffies(1250));
 	return 0;
 }
 
-- 
2.25.1

