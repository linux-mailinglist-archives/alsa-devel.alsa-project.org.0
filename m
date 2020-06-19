Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0A4200175
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 06:57:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B9B81685;
	Fri, 19 Jun 2020 06:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B9B81685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592542662;
	bh=aaWRkkykSSnCYuAvPKup4agERzD5kDIAX5iNHAHydtA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Arr/IBPY6nFRUAkTIfAYhDRV5EQ5jNwsnLpU0LIMCUc4hNcQBD2Ctb3YrpIdQG93m
	 3IA6M3VheaT+1PLYKfEH7JTtL90sWyuszLyRTZcBYYpM++HiZ4Oag9RSD9UZqgLFoZ
	 adQj2xyjp2YiGR2Yfa45aq4houJT4E/sQro18G68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18A88F8028F;
	Fri, 19 Jun 2020 06:55:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55ED3F8025F; Fri, 19 Jun 2020 06:55:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52BB9F800B5
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 06:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52BB9F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="zulubkkT"
Received: from localhost.localdomain (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E9B720DD4;
 Fri, 19 Jun 2020 04:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592542505;
 bh=aaWRkkykSSnCYuAvPKup4agERzD5kDIAX5iNHAHydtA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zulubkkTMOWfLNC6gumYk9dHzgNwNj6/lG03GT93JzxbEux14idZVIMS7Ylwenm/1
 SpQstxJtCf5JGNud6GNwSoDf2PS3KtF5Jv2F6pn3haKeZXOApSQA/lWiGq8w7IeP6h
 flduAyEktEGBW1lCH6EzhlTht/hz6Kue0O9ABzA0=
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/3] ALSA: compress: document the compress audio state machine
Date: Fri, 19 Jun 2020 10:24:46 +0530
Message-Id: <20200619045449.3966868-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200619045449.3966868-1-vkoul@kernel.org>
References: <20200619045449.3966868-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vinod Koul <vkoul@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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
 .../sound/designs/compress-offload.rst        | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
index ad4bfbdacc83..7292717c43bf 100644
--- a/Documentation/sound/designs/compress-offload.rst
+++ b/Documentation/sound/designs/compress-offload.rst
@@ -151,6 +151,58 @@ Modifications include:
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
+                                             V
+                                        +----------+
+                compr_drain_notify()    |          |
+              +------------------------>|   SETUP  |
+              |                         |          |
+              |                         +----------+
+              |                              |
+              |                              |
+              |                              | compr_write()
+              |                              |
+              |                              V
+              |                         +----------+
+              |                         |          |
+              |                         |  PREPARE |
+              |                         |          |
+              |                         +----------+
+              |                              |
+              |                              |
+              |                              | compr_start()
+              |                              |
+              |                              V
+        +----------+                    +----------+     compr_pause()      +----------+
+        |          |                    |          |----------------------->|          |
+        |  DRAIN   |<-------------------|  RUNNING |                        |  PAUSE   |
+        |          |                    |          |<-----------------------|          |
+        +----------+                    +----------+     compr_resume()     +----------+
+              |                              |
+              |                              |
+              |                              | compr_free()
+              |                              |
+              |                              V
+              |                         +----------+
+              |     compr_free()        |          |
+              +------------------------>|          |
+                                        |   STOP   |
+                                        |          |
+                                        +----------+
+
 
 Gapless Playback
 ================
-- 
2.26.2

