Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13630200178
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jun 2020 06:58:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA4701688;
	Fri, 19 Jun 2020 06:57:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA4701688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592542705;
	bh=xsXYmu5KJaRlZUfPJ9GfJ5BsD+GGZhZMq6RqGkubP44=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXkwHMVkXFEhQBi9dMi/353WjINh8eJs879curiDIjmEpJoUkg/PbPArqyLmZ/bCc
	 YyHE+E/qxVcEXVvejybFyxKyUh3jiAEoteNeo62dA+4gkQOFbGlDoa0B9LqOWoJMRh
	 wpz8xQUhaSBCiB00SlwOUsPROMenm68mFjlwZiJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6174CF80245;
	Fri, 19 Jun 2020 06:55:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA1A7F80255; Fri, 19 Jun 2020 06:55:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1AE0F80245
 for <alsa-devel@alsa-project.org>; Fri, 19 Jun 2020 06:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1AE0F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XWaR+4Dl"
Received: from localhost.localdomain (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AE2420CC7;
 Fri, 19 Jun 2020 04:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592542509;
 bh=xsXYmu5KJaRlZUfPJ9GfJ5BsD+GGZhZMq6RqGkubP44=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XWaR+4Dl9B4lEGH3LA86yfWN3WtZHxRrvSzeZL19EwYgVM8KWonOpvVr7U4RbDGHg
 x2NjlW9LOLlYlti68KducJiUZSrzJWRlJWO13hzCvjPHz7iSgabN74FHaPkpNrLatS
 O3ESbCIrPQl1Bft1FVqoABlkVpCHY73tERAnoA/w=
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/3] ALSA: compress: document the compress gapless audio state
 machine
Date: Fri, 19 Jun 2020 10:24:47 +0530
Message-Id: <20200619045449.3966868-3-vkoul@kernel.org>
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

Also documented the galpess transitions. Please note that these are not
really stream states, but show how the stream steps in gapless mode

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../sound/designs/compress-offload.rst        | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
index 7292717c43bf..3e241530e173 100644
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

