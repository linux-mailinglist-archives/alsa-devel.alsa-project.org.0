Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB60344067
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 18:06:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24FF3180E;
	Thu, 13 Jun 2019 18:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24FF3180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560441976;
	bh=cTlsxPekY6E4FbsbPxOl9W2w3k3O7AfeA2TIg8ZGBgo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ByygLeBZo7XcscmBs3EYadvUAlFkp1D2K7O4DNWrpKtX2u6HRNFr5/hR+WwSsAJIw
	 t8fgYMXaXg8GfNAurlZH74NkfUDb6WaFvBa6wnP4VyMdVJWeSQIfk8fQ3jcuPvVYAM
	 Ix60EGoyeNaBKsLi7jH8VAyeAMFLjq+pfK/YgdOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B19A1F89703;
	Thu, 13 Jun 2019 18:04:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13DECF89703; Thu, 13 Jun 2019 18:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from pokefinder.org (sauhun.de [88.99.104.3])
 by alsa1.perex.cz (Postfix) with ESMTP id 8AC4AF8076F
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 18:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AC4AF8076F
Received: from localhost (p5486CF99.dip0.t-ipconnect.de [84.134.207.153])
 by pokefinder.org (Postfix) with ESMTPSA id EB38D4A127B;
 Thu, 13 Jun 2019 18:04:25 +0200 (CEST)
From: Wolfram Sang <wsa@the-dreams.de>
To: alsa-devel@alsa-project.org
Date: Thu, 13 Jun 2019 18:04:23 +0200
Message-Id: <20190613160423.17097-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Wolfram Sang <wsa@the-dreams.de>
Subject: [alsa-devel] [PATCH] ALSA: pci: echoaudio: remove variable which is
	a constant
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

Checking a variable which is always '1' has no use.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---

Only build tested. Found by static code analysis of similar patterns.

 sound/pci/echoaudio/echoaudio_dsp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio_dsp.c b/sound/pci/echoaudio/echoaudio_dsp.c
index b181752b8481..50d4a87a6bb3 100644
--- a/sound/pci/echoaudio/echoaudio_dsp.c
+++ b/sound/pci/echoaudio/echoaudio_dsp.c
@@ -1058,7 +1058,6 @@ static int allocate_pipes(struct echoaudio *chip, struct audiopipe *pipe,
 {
 	int i;
 	u32 channel_mask;
-	char is_cyclic;
 
 	dev_dbg(chip->card->dev,
 		"allocate_pipes: ch=%d int=%d\n", pipe_index, interleave);
@@ -1066,8 +1065,6 @@ static int allocate_pipes(struct echoaudio *chip, struct audiopipe *pipe,
 	if (chip->bad_board)
 		return -EIO;
 
-	is_cyclic = 1;	/* This driver uses cyclic buffers only */
-
 	for (channel_mask = i = 0; i < interleave; i++)
 		channel_mask |= 1 << (pipe_index + i);
 	if (chip->pipe_alloc_mask & channel_mask) {
@@ -1078,8 +1075,8 @@ static int allocate_pipes(struct echoaudio *chip, struct audiopipe *pipe,
 
 	chip->comm_page->position[pipe_index] = 0;
 	chip->pipe_alloc_mask |= channel_mask;
-	if (is_cyclic)
-		chip->pipe_cyclic_mask |= channel_mask;
+	/* This driver uses cyclic buffers only */
+	chip->pipe_cyclic_mask |= channel_mask;
 	pipe->index = pipe_index;
 	pipe->interleave = interleave;
 	pipe->state = PIPE_STATE_STOPPED;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
