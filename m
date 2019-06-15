Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8A46F3A
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jun 2019 11:14:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F85D1871;
	Sat, 15 Jun 2019 11:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F85D1871
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560590072;
	bh=PMXA3rflkUjbCgPrc0gjuIj4BuFiGzombtl98Aacja0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tpDm9R2YFR5zLSwTfHNuS8laMPVUsLNYc8XPcy8eGzaXAX34ikE1VAajr8IFqf4aq
	 1041xNU9UDgf3ujLS9/hYOt9/d8ShBvVe3C5kcWg/t4ykoWxteNxj9zWpBNZ9YAGoz
	 gk8DmZRu8d6HpCD2SBjQ0lTVk2wjfoVCeJdtvXF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA7BDF89734;
	Sat, 15 Jun 2019 11:11:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE2C4F89714; Sat, 15 Jun 2019 11:11:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDF55F89703
 for <alsa-devel@alsa-project.org>; Sat, 15 Jun 2019 11:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDF55F89703
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="lHOWRkdE"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mU7LfXsW"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id DB965481;
 Sat, 15 Jun 2019 05:11:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sat, 15 Jun 2019 05:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=eYzE1l2eqiM/5
 yYYURDF7yVUEG286uGR0DpkjH8tXM8=; b=lHOWRkdE0F+m8yDS1d22IYgi/0uOD
 rqbbC0sv3XvkBvA2t6C/qlf2FdPufN3bFlz55XgwHLkJpVg+sV8N84FJFcDQ3/6n
 oxK4Cebug9wNQFhw9QRt7L+jMgXWjoTW5/gkMl+nyL/2n6bOt3mNgxZK+VNZJPy9
 ABn5Feiij8kG/sxicMMZHJm0krmSNSSmVWdiVCTR+GmRs4dYzHed/tAmH8/xfGh6
 wMvSE0z6v7p4g6ziCX3CBMNseYlXT5VvGDC2oEDkwXGwhorrz+s3KfWM0SbP7aEc
 H5Nu65lWEbAdQdpvxsF62eQ86x1Z11XgcAmTK9+oVRSMMPrK8dJ453lIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=eYzE1l2eqiM/5yYYURDF7yVUEG286uGR0DpkjH8tXM8=; b=mU7LfXsW
 pcILQr4JJ/PvNy7V9WJqeFCjmgmM9CRBkVaqYuRSnNclWnvkCi/EMs/TC+dTtCbu
 tUchRl3ZcnPyB1zmaz3qvMxFwST8pKRzimHoQR1InrK6XcegBNivcRWrM2vDfSYL
 7YubGX+6TnLikPGQxAZ0nQLHb+dxwN4XDzQYKvIM7hYS3H7LzI0hW0/NBUvRCvEz
 RAphDdxmjgmKONnywNy2PQbucNV8dp09sJSXBukrgmR87bE1uRkJOkAFRSpOOdJg
 FpbeTN3JRUrhO7GEmv/w6FChQKYrv2MS2wYkuj1dOZyV9HU+m6Kf3WV0pQDVn/Wc
 3VaNlviqIlXDcQ==
X-ME-Sender: <xms:L7YEXXpbqmZOQrDw3rhxbHVV9Ti-_8LLkRA1kRU5U0ik53xqoeq_EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeifedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:L7YEXTd62er1rOX0yHxZrH6oHES-7uYXFTnDXQrZjG8-yXtECH_E7Q>
 <xmx:L7YEXV-df11QXNKfKSKP5Bfpr9fvyth5oRz1P6gQqv1bHNU1iT85KA>
 <xmx:L7YEXcElb7Sb9lXgXdB_odJiB-OMQVhOozDdQXCsTFD3MDiCSBbDYQ>
 <xmx:L7YEXcJlY3KCoQx2OcH0nzAGVuh5likosg8YSqCxegYsBdvqBcQ7ow>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0EC428005A;
 Sat, 15 Jun 2019 05:11:09 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sat, 15 Jun 2019 18:10:57 +0900
Message-Id: <20190615091101.7515-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190615091101.7515-1-o-takashi@sakamocchi.jp>
References: <20190615091101.7515-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 2/6] ALSA: bebob: code refactoring for callback
	function to rawmidi interface
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

The pairs of rawmidi.hw_params callback functions and .hw_free callback
functions for both direction have no differences.

This commit unifies the pairs.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/bebob/bebob_midi.c | 47 ++++---------------------------
 1 file changed, 6 insertions(+), 41 deletions(-)

diff --git a/sound/firewire/bebob/bebob_midi.c b/sound/firewire/bebob/bebob_midi.c
index e2d3cad39d28..f7db1f7bce86 100644
--- a/sound/firewire/bebob/bebob_midi.c
+++ b/sound/firewire/bebob/bebob_midi.c
@@ -8,7 +8,7 @@
 
 #include "bebob.h"
 
-static int midi_capture_open(struct snd_rawmidi_substream *substream)
+static int midi_open(struct snd_rawmidi_substream *substream)
 {
 	struct snd_bebob *bebob = substream->rmidi->private_data;
 	int err;
@@ -30,42 +30,7 @@ static int midi_capture_open(struct snd_rawmidi_substream *substream)
 	return err;
 }
 
-static int midi_playback_open(struct snd_rawmidi_substream *substream)
-{
-	struct snd_bebob *bebob = substream->rmidi->private_data;
-	int err;
-
-	err = snd_bebob_stream_lock_try(bebob);
-	if (err < 0)
-		return err;
-
-	mutex_lock(&bebob->mutex);
-	err = snd_bebob_stream_reserve_duplex(bebob, 0);
-	if (err >= 0) {
-		++bebob->substreams_counter;
-		err = snd_bebob_stream_start_duplex(bebob);
-	}
-	mutex_unlock(&bebob->mutex);
-	if (err < 0)
-		snd_bebob_stream_lock_release(bebob);
-
-	return err;
-}
-
-static int midi_capture_close(struct snd_rawmidi_substream *substream)
-{
-	struct snd_bebob *bebob = substream->rmidi->private_data;
-
-	mutex_lock(&bebob->mutex);
-	bebob->substreams_counter--;
-	snd_bebob_stream_stop_duplex(bebob);
-	mutex_unlock(&bebob->mutex);
-
-	snd_bebob_stream_lock_release(bebob);
-	return 0;
-}
-
-static int midi_playback_close(struct snd_rawmidi_substream *substream)
+static int midi_close(struct snd_rawmidi_substream *substream)
 {
 	struct snd_bebob *bebob = substream->rmidi->private_data;
 
@@ -127,13 +92,13 @@ static void set_midi_substream_names(struct snd_bebob *bebob,
 int snd_bebob_create_midi_devices(struct snd_bebob *bebob)
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
