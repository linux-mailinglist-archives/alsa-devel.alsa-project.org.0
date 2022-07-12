Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 490E3571AFB
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 15:17:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FF5616C7;
	Tue, 12 Jul 2022 15:16:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FF5616C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657631847;
	bh=d1i/lmKcK/nb7SY1FQztbfenpWiYwYh4lqWt6J1giEA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j0IOF7ZbH9JKNVz0+rUSbt93hdEkAR2Fnlc+PGMGVmbIvfht9ElHylnwJGp+IIpCU
	 DR36CEBooR/DxRun099c3jA2nTW/S7cqpGyeJMWvYTMbK2+Vr/YLcK6NQ4qF4k2JWm
	 ZNbrtIqix8dR4HwORgc+xn3k0JjmuiBvSjPNax9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98AAEF80543;
	Tue, 12 Jul 2022 15:15:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AA72F80542; Tue, 12 Jul 2022 15:15:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AE38F8012B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 15:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AE38F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Z7vexO7k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657631744; x=1689167744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d1i/lmKcK/nb7SY1FQztbfenpWiYwYh4lqWt6J1giEA=;
 b=Z7vexO7kCRxaGwgI/O252K3coMo0dUaDofQLRmm5HRUD3LmpHhz3l0/u
 jf8K5k9jIaXXM+fVpaM89kiGgOU81OoT3mj+0PSLA60Sf/q+9ggjtIXFX
 cm1ml1BRFWpKBXdlp1L8JlUCSrk+h2TIg0psaysVrCQjDqHmZU7L9VqUR
 3B5Vu+Vw9KZdVh/VYcweeFN/Lbwx96c/oZZTj6JdUZlmJ2pnfo/OcBbYV
 Op0aFmYzBUlHEZMyj7XsMPfyUAKCodWx8qPF2q+ps3VPx34T4PSIMGFFA
 m2VVb4mtbmJQKnu0xeiVReOjau+XcOfKEUuc5R3Hu9CgS81HsxMZwS5Lv g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="285671095"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="285671095"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 06:15:38 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="545421054"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.175])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 06:15:35 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: Intel: hda-dai: Drop misleading comment
 regarding dma_data
Date: Tue, 12 Jul 2022 16:16:19 +0300
Message-Id: <20220712131620.13365-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220712131620.13365-1-peter.ujfalusi@linux.intel.com>
References: <20220712131620.13365-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

The comment in hda_link_dma_hw_params() is no longer valid as the dma_data
is set to NULL at system suspend as well.

Instead of rewording the comment to state the obvious: try to take the
hext_stream from the dma_data and if it is not set then assign a new one
and store it as dma_data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index ed74a1f264e8..9015ca2024bc 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -221,7 +221,6 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_bus *bus = hstream->bus;
 	struct hdac_ext_link *link;
 
-	/* get stored dma data if resuming from system suspend */
 	hext_stream = snd_soc_dai_get_dma_data(cpu_dai, substream);
 	if (!hext_stream) {
 		hext_stream = hda_link_stream_assign(bus, substream);
-- 
2.37.0

