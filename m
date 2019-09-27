Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D5BC0C88
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 22:17:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F6241670;
	Fri, 27 Sep 2019 22:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F6241670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569615474;
	bh=JOWmkj+dKHuCFrL8GoONplk5lXuJCe0iDQjY2bIQTP4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uaZeL194zRhx9HotQ58QbExeZ8/laC6KNp9OdQSbT3eeTPRnAojWQyr8khuWoGdkZ
	 qhoUKdvd2rUVA9U5CD2PfaI8AfzfVESDp5KzoT2EV2L5S6tJ4EG87aR37RofYvjmAD
	 1T6pqb0YjDmmvRuBOnoEb4rH5DCZOMy7/jNwb0Us=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3378F805F7;
	Fri, 27 Sep 2019 22:14:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C06BF8049A; Fri, 27 Sep 2019 22:14:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC409F800B3
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 22:14:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC409F800B3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 13:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,556,1559545200"; d="scan'208";a="202144622"
Received: from wcui-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.146.136])
 by orsmga002.jf.intel.com with ESMTP; 27 Sep 2019 13:14:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 27 Sep 2019 15:14:05 -0500
Message-Id: <20190927201408.925-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190927201408.925-1-pierre-louis.bossart@linux.intel.com>
References: <20190927201408.925-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Jaska Uimonen <jaska.uimonen@intel.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/4] ASoC: intel: bytcr_rt5651: add null check
	to support_button_press
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Jaska Uimonen <jaska.uimonen@intel.com>

When removing sof module the support_button_press function will oops
because hp_jack pointer is not checked for NULL. So add a check to fix
this.

Signed-off-by: Jaska Uimonen <jaska.uimonen@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5651.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index 762595de956c..c506c9305043 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -1770,6 +1770,9 @@ static int rt5651_detect_headset(struct snd_soc_component *component)
 
 static bool rt5651_support_button_press(struct rt5651_priv *rt5651)
 {
+	if (!rt5651->hp_jack)
+		return false;
+
 	/* Button press support only works with internal jack-detection */
 	return (rt5651->hp_jack->status & SND_JACK_MICROPHONE) &&
 		rt5651->gpiod_hp_det == NULL;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
