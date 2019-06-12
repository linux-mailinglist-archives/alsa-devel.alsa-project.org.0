Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6131741FAA
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 10:50:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 002881760;
	Wed, 12 Jun 2019 10:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 002881760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560329431;
	bh=9GTK2Dy4UJDlH+zfHdqV3Zm9tLhtt9YimHm9WI5wts4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tZ4SL0U82eZRlgO4BzskTBHWy3tF2kGS3Hi+99RnJgZ9MrAhjU3GIlCSDQR+B4YbY
	 FuHuYjyYMNVv0mztI8sHJ+499V9IZ101K2HiIAJqjtj5pCRKsmuNQPZsD52R5j8/7X
	 hnqDaLQ3g2YnlOokGrH65R+4EEFEymSsspzFMSU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0268DF89756;
	Wed, 12 Jun 2019 10:44:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB644F89738; Wed, 12 Jun 2019 10:44:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07B05F89731
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 10:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07B05F89731
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="NjXvHJO8"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="gRibVIKi"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 761B95B3;
 Wed, 12 Jun 2019 04:44:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 12 Jun 2019 04:44:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=fvU/ADFICi6Q8
 mSRBV3xog/q6Xd0VjtIxX3GW4nA64o=; b=NjXvHJO8PszS7E2tPtEsCNX5S9kZO
 cZ4lZ9gK8UGSWNxMKx7v7w/QLdXH/vOZplWxjsO9+dE91ZxH9OKA9G9fgsbQ2pq9
 LThnF7h0Sr8wsQfbz0D+AOZeA9RGFZaeBTdxaC1k9n1FSHs7NX1HEKvfwViYMgHM
 1ANajBtWFoUM/PHjB2e7bQ4VmUitzIUlfwVkR95LhDVLpb7GyrmjGEwCqqUpsvq7
 Od4my+X7t+NPilcYdCTR4zdIIKi31XduoJ9rmgnCth+TvP7JjddmR9T1XaarUwMy
 rm3LMOEHE5Bl5HOxfHatees3qKUSNYrq/5WqFwbrx2NiH0sUn4HqydPcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=fvU/ADFICi6Q8mSRBV3xog/q6Xd0VjtIxX3GW4nA64o=; b=gRibVIKi
 TW/gb9YlwMWfrE9SUrw7qjAJl2+l1CIqro0+mhEJ6L4l4E8lTBIiaAnfbiS7cpmY
 q1e2GR6cxgMC04mD4JxrX5KA/HLVqpW6rBwz5jr3cbQ7fv7o94guT2NmIiHHuCeX
 R6DE0SCuyNcX2m90+GPNqenBGOUDCcAzeO0WYAHLnClBd93YtylQwv4704UsQmvo
 JDgpJBMd1aBjNyet91B1fC1O9ZUQT9Jl3rQgn5cszcK4CstvGN3gjCRu8RS8ljzh
 Lma0Dxnl6bVhJKhmmwRZZ7iUH2MRvlfMBCcuXAoEqT7fzfexApNfo/3cXKNZcyif
 5VxU4/RWG0M5xQ==
X-ME-Sender: <xms:c7sAXcOWJH6BzF_W23Dw6oBU4zVP4GVZIUGJFIgoYqyjpu4OIUR5GA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuffhomhgrihhnpehrrgifmhhiughird
 hophgvnhenucfkphepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhfrhho
 mhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghruf
 hiiigvpedt
X-ME-Proxy: <xmx:c7sAXXEFwWR2OryDObgZwK63phlIdIvn9nAOIPk6MvPSHbzH_6DOkA>
 <xmx:c7sAXQSWg5y4HzKRx745VqoBd8tn_YZxgpOwstqwVBvakWS0SeDfSQ>
 <xmx:c7sAXfQTYGMdMc0dfEEQscv9oyQCZ5AasA0vKrZlXZYV-3LZOhlKwQ>
 <xmx:dLsAXbi8E4Gn6mhn2v1OYEP6MyvBnYBP4wOppyXOoyGNtEPWfzF1Fw>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id BD04E380089;
 Wed, 12 Jun 2019 04:44:34 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Wed, 12 Jun 2019 17:44:09 +0900
Message-Id: <20190612084422.5344-7-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
References: <20190612084422.5344-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 06/19] ALSA: fireworks: code refactoring for
	rawmidi.open/close
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

Two sets of callbacks for rawmidi.open/close but they have the same
codes. This commit unifies each of the callbacks.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks_midi.c | 45 +++--------------------
 1 file changed, 6 insertions(+), 39 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks_midi.c b/sound/firewire/fireworks/fireworks_midi.c
index 7e78cdfe699e..ee5dc7be70b6 100644
--- a/sound/firewire/fireworks/fireworks_midi.c
+++ b/sound/firewire/fireworks/fireworks_midi.c
@@ -8,7 +8,7 @@
  */
 #include "fireworks.h"
 
-static int midi_capture_open(struct snd_rawmidi_substream *substream)
+static int midi_open(struct snd_rawmidi_substream *substream)
 {
 	struct snd_efw *efw = substream->rmidi->private_data;
 	int err;
@@ -23,44 +23,11 @@ static int midi_capture_open(struct snd_rawmidi_substream *substream)
 	mutex_unlock(&efw->mutex);
 	if (err < 0)
 		snd_efw_stream_lock_release(efw);
-
 end:
 	return err;
 }
 
-static int midi_playback_open(struct snd_rawmidi_substream *substream)
-{
-	struct snd_efw *efw = substream->rmidi->private_data;
-	int err;
-
-	err = snd_efw_stream_lock_try(efw);
-	if (err < 0)
-		goto end;
-
-	mutex_lock(&efw->mutex);
-	++efw->substreams_counter;
-	err = snd_efw_stream_start_duplex(efw, 0);
-	mutex_unlock(&efw->mutex);
-	if (err < 0)
-		snd_efw_stream_lock_release(efw);
-end:
-	return err;
-}
-
-static int midi_capture_close(struct snd_rawmidi_substream *substream)
-{
-	struct snd_efw *efw = substream->rmidi->private_data;
-
-	mutex_lock(&efw->mutex);
-	--efw->substreams_counter;
-	snd_efw_stream_stop_duplex(efw);
-	mutex_unlock(&efw->mutex);
-
-	snd_efw_stream_lock_release(efw);
-	return 0;
-}
-
-static int midi_playback_close(struct snd_rawmidi_substream *substream)
+static int midi_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_efw *efw = substream->rmidi->private_data;
 
@@ -121,13 +88,13 @@ static void set_midi_substream_names(struct snd_efw *efw,
 int snd_efw_create_midi_devices(struct snd_efw *efw)
 {
 	static const struct snd_rawmidi_ops capture_ops = {
-		.open		= midi_capture_open,
-		.close		= midi_capture_close,
+		.open		= midi_open,
+		.close		= midi_close,
 		.trigger	= midi_capture_trigger,
 	};
 	static const struct snd_rawmidi_ops playback_ops = {
-		.open		= midi_playback_open,
-		.close		= midi_playback_close,
+		.open		= midi_open,
+		.close		= midi_close,
 		.trigger	= midi_playback_trigger,
 	};
 	struct snd_rawmidi *rmidi;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
