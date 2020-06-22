Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF20020300B
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 09:01:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90B8B16B6;
	Mon, 22 Jun 2020 09:00:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90B8B16B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592809279;
	bh=GqFAi7Q4sHYSuj6BAxMwU4DVplPmfDCh76OdL45s+EM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iFxWT7D1clA0ECh4HqpYYN/dK9TK/LWWQFLDmyr5wMuBaqDt487ls7MmUBVqSRxUs
	 0avo3ATwBk0CPCvrtbNA9qI1qV0gbjLz06J7rkTOPvWbTc6moYsereypAxxcWPYdps
	 bRHU0oh0eiJ2QMX6Xog4FqANmKiI/HZLU4ISzxnk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8048F802A2;
	Mon, 22 Jun 2020 08:58:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D901DF802A0; Mon, 22 Jun 2020 08:58:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC60EF8010E
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 08:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC60EF8010E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XUubVqh7"
Received: from localhost.localdomain (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D6E42543C;
 Mon, 22 Jun 2020 06:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592809115;
 bh=GqFAi7Q4sHYSuj6BAxMwU4DVplPmfDCh76OdL45s+EM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XUubVqh7SwrB1MbftvIpwdhMm7y6KHzJxeFvVNTH/tD6Xxo5XFxARiUaBkZM8W1kz
 r50RblSeNtI1MSjlbdZWVJ4r6EGHDEE4S8YxivgVlaOwL0dE1m6u9AM9MRE19IlpgE
 7T81WWPH0+y6mERjA2wlJwJ3tM4TTSV9pa3hQ3rI=
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 2/3] ALSA: compress: document the compress gapless audio
 state machine
Date: Mon, 22 Jun 2020 12:28:10 +0530
Message-Id: <20200622065811.221485-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622065811.221485-1-vkoul@kernel.org>
References: <20200622065811.221485-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-arm-msm@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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

Also documented the galpess transitions. Please note that these are not
really stream states, but show how the stream steps in gapless mode

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../sound/designs/compress-offload.rst        | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
index 6f86db82298b..0bebfd33b933 100644
--- a/Documentation/sound/designs/compress-offload.rst
+++ b/Documentation/sound/designs/compress-offload.rst
@@ -251,6 +251,38 @@ Sequence flow for gapless would be:
 
 (note: order for partial_drain and write for next track can be reversed as well)
 
+Gapless Playback SM
+===================
+
+For Gapless, we move from running state to partial drain and back, along
+with setting of meta_data and signalling for next track ::
+
+
+                                        +----------+
+                compr_drain_notify()    |          |
+              +------------------------>|  RUNNING |
+              |                         |          |
+              |                         +----------+
+              |                              |
+              |                              |
+              |                              | compr_next_track()
+              |                              |
+              |                              V
+              |                         +----------+
+              |                         |          |
+              |                         |NEXT_TRACK|
+              |                         |          |
+              |                         +----------+
+              |                              |
+              |                              |
+              |                              | compr_partial_drain()
+              |                              |
+              |                              V
+              |                         +----------+
+              |                         |          |
+              +------------------------ | PARTIAL_ |
+                                        |  DRAIN   |
+                                        +----------+
 
 Not supported
 =============
-- 
2.26.2

