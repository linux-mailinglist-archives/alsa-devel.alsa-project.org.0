Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B20520A2E4
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jun 2020 18:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F146C190F;
	Thu, 25 Jun 2020 18:27:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F146C190F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593102490;
	bh=L9ED3CmPmrCq6aX9512m6F+JVxfMbMf1Yg5lgmCu1Dc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RdkfbDcfz/nRiAcr0csVhfSFnBuUC8CxQUqaMSRZPb1nMAhXYlD93gJ/0jZv03nvI
	 /JLkormDMUItRmy72+AmLk5agh9jXxoM9s46NMzP0m1HxS7SVS8mUvR0qfdP8vHbH6
	 KkCU29TJbn6/91LowDAMCLzHsroNNgfwre9Tc7VU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF5D1F802A2;
	Thu, 25 Jun 2020 18:25:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E800F80277; Thu, 25 Jun 2020 18:25:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E54D2F80137
 for <alsa-devel@alsa-project.org>; Thu, 25 Jun 2020 18:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E54D2F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vBvmjOSi"
Received: from localhost.localdomain (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D198A2081A;
 Thu, 25 Jun 2020 15:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593100028;
 bh=L9ED3CmPmrCq6aX9512m6F+JVxfMbMf1Yg5lgmCu1Dc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vBvmjOSiGpHUKSnl9WcOnpYbcnN0Jt2U3/xWMuaG9IbOSiOusHErTQPD0+0SCy10f
 gMO56qo/BsGaIQ0P3597NMz4p9qC+KPD0RAMXEiGWhLcGn+3ZzGDpDXkpNJa0IcGBy
 YuQ+23VJM6VXNy+cY6WR118g8yiYygJcCu6k7ygU=
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v3 1/3] ALSA: compress: document the compress audio state
 machine
Date: Thu, 25 Jun 2020 21:16:49 +0530
Message-Id: <20200625154651.99758-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200625154651.99758-1-vkoul@kernel.org>
References: <20200625154651.99758-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

So we had some discussions of the stream states, so I thought it is a
good idea to document the state transitions, so add it documentation

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../sound/designs/compress-offload.rst        | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
index ad4bfbdacc83..b6e9025ae105 100644
--- a/Documentation/sound/designs/compress-offload.rst
+++ b/Documentation/sound/designs/compress-offload.rst
@@ -151,6 +151,57 @@ Modifications include:
 - Addition of encoding options when required (derived from OpenMAX IL)
 - Addition of rateControlSupported (missing in OpenMAX AL)
 
+State Machine
+=============
+
+The compressed audio stream state machine is described below ::
+
+                                        +----------+
+                                        |          |
+                                        |   OPEN   |
+                                        |          |
+                                        +----------+
+                                             |
+                                             |
+                                             | compr_set_params()
+                                             |
+                                             v
+         compr_free()                   +----------+
+  +------------------------------------|          |
+  |                                    |   SETUP  |
+  |          +------------------------>|          |<-------------------------+
+  |          | compr_drain_notify()    +----------+                          |
+  |          |         or                   |                                |
+  |          |      compr_stop()            |                                |
+  |          |                              | compr_write()                  |
+  |          |                              |                                |
+  |          |                              v                                |
+  |          |                         +----------+                          |
+  |          |                         |          |   compr_free()           |
+  |          |                         |  PREPARE |---------------> A        |
+  |          |                         |          |                          |
+  |          |                         +----------+                          |
+  |          |                              |                                |
+  |          |                              |                                |
+  |          |                              | compr_start()                  |
+  |          |                              |                                |
+  |          |                              v                                |
+  |    +----------+                    +----------+                          |
+  |    |          |    compr_drain()   |          |        compr_stop()      |
+  |    |  DRAIN   |<-------------------|  RUNNING |--------------------------+
+  |    |          |                    |          |                          |
+  |    +----------+                    +----------+                          |
+  |                                       |    ^                             |
+  |          A                            |    |                             |
+  |          |              compr_pause() |    | compr_resume()              |
+  |          |                            |    |                             |
+  |          v                            v    |                             |
+  |    +----------+                   +----------+                           |
+  |    |          |                   |          |         compr_stop()      |
+  +--->|   FREE   |                   |  PAUSE   |---------------------------+
+       |          |                   |          |
+       +----------+                   +----------+
+
 
 Gapless Playback
 ================
-- 
2.26.2

