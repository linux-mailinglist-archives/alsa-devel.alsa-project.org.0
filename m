Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 055B143CA33
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 14:57:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 669B516B6;
	Wed, 27 Oct 2021 14:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 669B516B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635339429;
	bh=PXoj76feWjO+stdYIcdW0lwLSZrsvu8FIzFG07F2OSA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EZkvaWCiKHGsQgbDFcJEpI3Af0LSfat+XK7UH+W10EuU4ZteFf5HUtIzJdwjG7xMm
	 2sv4hkFyGa0DK/Vamt2IhCcvlgzui27A/W8GbXMXWKTal6hPOF3ETJyhGUjU7VsVkS
	 uqV0SeAwkexLrhgw8+2RrdJ0cV+q87j97+B258kE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5118F8027B;
	Wed, 27 Oct 2021 14:55:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 772ABF8027B; Wed, 27 Oct 2021 14:55:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68B4CF8010A
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 14:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68B4CF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="PE5FXjNZ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VxjUCUtQ"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4EC195C01F8;
 Wed, 27 Oct 2021 08:55:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 08:55:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=9/YlCOpawClvq
 rqYswASrbJgMx0dJ6xfjHZEBPgL6n8=; b=PE5FXjNZ7s/kXaAR9U3DS7t75Ibfa
 lEDPkA2R62OuA+VztDI4YWUFfmz2TCqy9MHKr06E2oXsdNK61n+p0NS1QPKDBkkN
 sfg+T0SOkr3fm1TlPBf8KO59ga57ZOyJ7TWaruzcp8DhM5ZzHBin5ywT1bXZBLJ2
 HY4IDrckh46q8c1HVwyckGmPuld9W3LQZ+KabWtO7Eez40BqwO44H2F6oR2Ni9hE
 wYofpZCiF49tRenble6FTloG0b+MgQc3EqmFFZGMTp1HAzmw366hIs3d1KevZ7TE
 CTkyA/GEPEU1xcIE26jp7t6TZF0zI/adHb5TPapt/FeY8iTDrQEwuU9RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=9/YlCOpawClvqrqYswASrbJgMx0dJ6xfjHZEBPgL6n8=; b=VxjUCUtQ
 pEXEh5wvWWshLvJRI6DpB6NldjWrUj0c7MdILo4RB/BY79J/qgsYqwsYWNXER6+r
 ejFOD2Gp4tixYKi7u3/yl7kTOkwEFCwi1CwHN9N8iWe25/uE86Z4JTcdBdEVphOR
 VtKLjAdfJpX1iCXJyMSUVTLvMpi22Lk9JxQzuMb80MJa5mgdKq2ow9Omdqvi4Hav
 HqcHIIqIuKjhUDkhgK7NZoMG0A/blqvptt5U3Z5pGjAz746t8690Xm8o73Mc2FaX
 O8HjgJl7+T1MeAWns1nl+MDkJXSUSs524R96+/7Z+jVWVvwxOlXMTaS00ov9IIiB
 OFUIo31CHphdiQ==
X-ME-Sender: <xms:Skx5YcRtjPoT3KA-m7O_Otu7_j-haYueApevGKcpsD9bxbmwI55hjw>
 <xme:Skx5YZzwDkl3pVPzzPoLisAIZS56aEDHSBJPsf4TKsZANmz-3NZfyLB7eUNc_V4sJ
 0aUkPEfW0BblKUeWHU>
X-ME-Received: <xmr:Skx5YZ3yuJZYqPGO1aIRwlpLcBP1W1R71ic3Ject68yFP5vwbrZ86cJS1Op6ESzrIT7bOFPq54sObmstr3lnlrpgxOIMQlYQl6CTYWWF7-dmmAbgqCnq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihessh
 grkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:Skx5YQDHV2oCqsRZT7AAuVwiw7i39z6JIwgS6oIyKKD5SHZvLKxHkA>
 <xmx:Skx5YVh_bdQh99sk0itRb9Ha3xKIDW_N93NE0Uf6xKWFuPUrxrTQDw>
 <xmx:Skx5YcrkDgl7NwP7eW2OT8XnNNd7eFjZQBUwgBaoWdnusjWpAQ21Kw>
 <xmx:S0x5YatZ39d2Ics1d_NtLM7DtAZmtg6ExPOKeVN6CZO7bzh9PDXC_w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 08:55:37 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH 1/3] ALSA: firewire-motu: fix null pointer dereference when
 polling hwdep character device
Date: Wed, 27 Oct 2021 21:55:27 +0900
Message-Id: <20211027125529.54295-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211027125529.54295-1-o-takashi@sakamocchi.jp>
References: <20211027125529.54295-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: ffado-devel@lists.sourceforge.net, alsa-devel@alsa-project.org,
 clemens@ladisch.de, kernel test robot <lkp@intel.com>
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

ALSA firewire-motu driver recently got support for event notification via
ALSA HwDep interface for register DSP models. However, when polling ALSA
HwDep cdev, the driver can cause null pointer dereference for the other
models due to accessing to unallocated memory or uninitialized memory.

This commit fixes the bug by check the type of model before accessing to
the memory.

Reported-by: kernel test robot <lkp@intel.com>
Suggested-by: Takashi Iwai <tiwai@suse.de>
Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-hwdep.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/firewire/motu/motu-hwdep.c b/sound/firewire/motu/motu-hwdep.c
index 9c2e457ce692..a900fc0e7644 100644
--- a/sound/firewire/motu/motu-hwdep.c
+++ b/sound/firewire/motu/motu-hwdep.c
@@ -16,6 +16,14 @@
 
 #include "motu.h"
 
+static bool has_dsp_event(struct snd_motu *motu)
+{
+	if (motu->spec->flags & SND_MOTU_SPEC_REGISTER_DSP)
+		return (snd_motu_register_dsp_message_parser_count_event(motu) > 0);
+	else
+		return false;
+}
+
 static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 		       loff_t *offset)
 {
@@ -25,8 +33,7 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 
 	spin_lock_irq(&motu->lock);
 
-	while (!motu->dev_lock_changed && motu->msg == 0 &&
-			snd_motu_register_dsp_message_parser_count_event(motu) == 0) {
+	while (!motu->dev_lock_changed && motu->msg == 0 && !has_dsp_event(motu)) {
 		prepare_to_wait(&motu->hwdep_wait, &wait, TASK_INTERRUPTIBLE);
 		spin_unlock_irq(&motu->lock);
 		schedule();
@@ -55,7 +62,7 @@ static long hwdep_read(struct snd_hwdep *hwdep, char __user *buf, long count,
 		count = min_t(long, count, sizeof(event));
 		if (copy_to_user(buf, &event, count))
 			return -EFAULT;
-	} else if (snd_motu_register_dsp_message_parser_count_event(motu) > 0) {
+	} else if (has_dsp_event(motu)) {
 		size_t consumed = 0;
 		u32 __user *ptr;
 		u32 ev;
@@ -94,8 +101,7 @@ static __poll_t hwdep_poll(struct snd_hwdep *hwdep, struct file *file,
 	poll_wait(file, &motu->hwdep_wait, wait);
 
 	spin_lock_irq(&motu->lock);
-	if (motu->dev_lock_changed || motu->msg ||
-	    snd_motu_register_dsp_message_parser_count_event(motu) > 0)
+	if (motu->dev_lock_changed || motu->msg || has_dsp_event(motu))
 		events = EPOLLIN | EPOLLRDNORM;
 	else
 		events = 0;
-- 
2.30.2

