Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2240B203009
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jun 2020 09:01:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4119516D7;
	Mon, 22 Jun 2020 09:00:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4119516D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592809263;
	bh=cJaK9Ij0LnW3uaf90F+DxG2K4hVeM1atFzhGIhfMpbw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jlbRcO29G6NBqUk769h4DVg2MNaZnIf+uhf1eggdoPzY37fr8KxTvBRvLDYqIYuxN
	 UrF81PIeoFZNijuOeK/izeXbAoYvxt+ioRZt/jGF9gIBe5L4OJrfdMmU9tVqs+Ikxi
	 /Cr/vATbViGQFCHvpfT9bTI71gCERgla/cwZ/xQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD753F8028A;
	Mon, 22 Jun 2020 08:58:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B52EEF80246; Mon, 22 Jun 2020 08:58:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3816EF8010D
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 08:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3816EF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="d8QdwWm0"
Received: from localhost.localdomain (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3ADF325439;
 Mon, 22 Jun 2020 06:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592809110;
 bh=cJaK9Ij0LnW3uaf90F+DxG2K4hVeM1atFzhGIhfMpbw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d8QdwWm0SMOkokdDVPicskvy40K7ynMncLQaHXxFnQTMFTimJ01a1vQMX/PSZ/nO8
 jGkKLCigR4/9ZePJBXqxvd0G4tHPH4Mbkxak3bGmivigI2FCilVmdOIfQdAjKHo9UL
 vj+ZjHlaPIvWK8xVXL1q22/fztbcgByVRAs0Gxyg=
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 1/3] ALSA: compress: document the compress audio state
 machine
Date: Mon, 22 Jun 2020 12:28:09 +0530
Message-Id: <20200622065811.221485-2-vkoul@kernel.org>
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

So we had some discussions of the stream states, so I thought it is a
good idea to document the state transitions, so add it documentation

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../sound/designs/compress-offload.rst        | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
index ad4bfbdacc83..6f86db82298b 100644
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
+                                             v
+         compr_free()                   +----------+
+  +-------------------------------------|          |
+  |                                     |   SETUP  |
+  |           +------------------------>|          |<---------------------------------+
+  |           | compr_drain_notify()    +----------+                                  |
+  |           |                              |                                        |
+  |           |                              |                                        |
+  |           |                              | compr_write()                          |
+  |           |                              |                                        |
+  |           |                              v                                        |
+  |           |                         +----------+                                  |
+  |           |                         |          |                                  |
+  |           |                         |  PREPARE |                                  |
+  |           |                         |          |                                  |
+  |           |                         +----------+                                  |
+  |           |                              |                                        |
+  |           |                              |                                        |
+  |           |                              | compr_start()                          |
+  |           |                              |                                        |
+  |           |                              v                                        |
+  |     +----------+                    +----------+  compr_pause()  +----------+     |
+  |     |          |    compr_drain()   |          |---------------->|          |     |
+  |     |  DRAIN   |<-------------------|  RUNNING |                 |  PAUSE   |     |
+  |     |          |                    |          |<----------------|          |     |
+  |     +----------+                    +----------+  compr_resume() +----------+     |
+  |           |                           |      |                                    |
+  |           |                           |      |                                    |
+  |           |                           |      |                                    |
+  |           |                           |      |          compr_stop()              |
+  |           |                           |      +------------------------------------+
+  |           |       +----------+        |
+  |           |       |          |        |
+  +-----------+------>|          |<-------+
+     compr_free()     |   FREE   |  compr_free()
+                      |          |
+                      +----------+
+
 
 Gapless Playback
 ================
-- 
2.26.2

