Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBAFCDFE4
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:09:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7EEF1673;
	Mon,  7 Oct 2019 13:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7EEF1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570446556;
	bh=HwGZ+oPHoAkq9OdcrGM2J6+oySyFCu1f+e0VaDU+Yqc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TNYclZxZHwEAsjdY8SCsKvELVqaWacXCVlbvfm0Dn/+kcX71zpsBmbhDLgM8fr0dA
	 6tVJeWxGBUmifV8fgpFAx/uX7w2fMrM52yHDSdhmlSMFy42WkVfoHWU24blc9gAk70
	 hWoZx9nRbUwGsM3xlzjUxZlvWcqTOnrLLeePLJwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 547A6F805FC;
	Mon,  7 Oct 2019 13:05:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FF08F805FA; Mon,  7 Oct 2019 13:05:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACE43F802DF
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACE43F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ime7sSeg"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="AjNNbWkB"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D32E21C1C;
 Mon,  7 Oct 2019 07:05:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=c9rU/tvqyJmy1
 5+F2oZCmKdiMf8JlcJVUsjbYu7pe6Y=; b=ime7sSegL0OnIEbxGeAv42liXh++2
 y1C/vwXqGdoJ0juslaKYZ9Sqim1dZP7+AG3g7YN8UQsPI0FVktoowCPOwb9pClyD
 gJhgedSxiCrjFTfP+8dEF/Z+REVTj5tcbKygbSdHuGqsqnlzVMdjlo1q2Zdr6HPP
 ydj9mq3OLMq8jjTbq9Pm+hHyLup6AMgRVMsxma/T2L+UhKOEbuwls22CpGZnlxrT
 fKH7bPlul+DvZpH5STd2NRA2PFFA3fQ6fIkwzo2o3HCmIizmShE7soJFRFn5leLm
 AA+JDFzkGUSpcKHMgivC5ZcwUIuM8AZOHUldBTBf+M6POHdpRo4DLkZMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=c9rU/tvqyJmy15+F2oZCmKdiMf8JlcJVUsjbYu7pe6Y=; b=AjNNbWkB
 8qefDElGnqiCPmUX0qHt/5cJH1OAFyKeMgp6a6X3I71mnKd9gg1I9/s6PbYHM7ZY
 AzoJbL96d86fb5Hz5hKln1G14EAYsCkCTszGajLq62dnH66mmrYv7hmNJ8k0O7yx
 F+PJ3OFARJrzwlZCsea9UYIQVwLruY3pAc7ByIqJzeXUnT6dtd65LY0XruDBzg8n
 17XvvLrZNzbaFvK9PTz4Z+a7wv8UqGsz/X6/IgYBbkjgz3IVu+vF/0GL5zONHE61
 kR+hCmVYZ7nCg5gpUvy3us9EqEpfSUN9o0m7T9kPGEaon7DgfHi58guRRbOIOFeM
 dakYXnJ478/XFA==
X-ME-Sender: <xms:BBybXaB6C_cU9fZf5odp9nLPQ5pQxhUiYBGlu4C3FcsuVnGnX3cD7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:BBybXYzrs-z8J4NSTUfK45LiApoqXKoMhI9Tt88FqXxVXlqMpim9IQ>
 <xmx:BBybXYn_9bxSm92bc88PnR3tnnYrtUCnTcSALqlKrvpmQFSN0Yim1Q>
 <xmx:BBybXdHsnefLJIJNAO1qDOXf1gO_H5CyGt0pj5IGTJ7IPmbBPt6sHw>
 <xmx:BRybXbmRHbuYF8-WkBsdzcCnPwGZlj_mAD_w5hDcw641PM6guXCpcA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id A738B8005A;
 Mon,  7 Oct 2019 07:05:39 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:18 +0900
Message-Id: <20191007110532.30270-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 03/17] fireworks: register the size of PCM
	period to AMDTP domain
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

This commit is a preparation to share the size of PCM period between
PCM substreams on AMDTP streams in the same domain. At this time,
the size of PCM period in PCM substream which starts AMDTP streams in the
same domain is recorded.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/fireworks/fireworks.h        |  3 ++-
 sound/firewire/fireworks/fireworks_midi.c   |  2 +-
 sound/firewire/fireworks/fireworks_pcm.c    |  4 +++-
 sound/firewire/fireworks/fireworks_stream.c | 11 ++++++++++-
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks.h b/sound/firewire/fireworks/fireworks.h
index 4cda297f8438..fc5f945a49ff 100644
--- a/sound/firewire/fireworks/fireworks.h
+++ b/sound/firewire/fireworks/fireworks.h
@@ -207,7 +207,8 @@ int snd_efw_command_get_sampling_rate(struct snd_efw *efw, unsigned int *rate);
 int snd_efw_command_set_sampling_rate(struct snd_efw *efw, unsigned int rate);
 
 int snd_efw_stream_init_duplex(struct snd_efw *efw);
-int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate);
+int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate,
+				  unsigned int frames_per_period);
 int snd_efw_stream_start_duplex(struct snd_efw *efw);
 void snd_efw_stream_stop_duplex(struct snd_efw *efw);
 void snd_efw_stream_update_duplex(struct snd_efw *efw);
diff --git a/sound/firewire/fireworks/fireworks_midi.c b/sound/firewire/fireworks/fireworks_midi.c
index a9f4a9630d15..e593f842ee8f 100644
--- a/sound/firewire/fireworks/fireworks_midi.c
+++ b/sound/firewire/fireworks/fireworks_midi.c
@@ -17,7 +17,7 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 		goto end;
 
 	mutex_lock(&efw->mutex);
-	err = snd_efw_stream_reserve_duplex(efw, 0);
+	err = snd_efw_stream_reserve_duplex(efw, 0, 0);
 	if (err >= 0) {
 		++efw->substreams_counter;
 		err = snd_efw_stream_start_duplex(efw);
diff --git a/sound/firewire/fireworks/fireworks_pcm.c b/sound/firewire/fireworks/fireworks_pcm.c
index a7025dccc754..35fc95283423 100644
--- a/sound/firewire/fireworks/fireworks_pcm.c
+++ b/sound/firewire/fireworks/fireworks_pcm.c
@@ -231,9 +231,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
+		unsigned int frames_per_period = params_period_size(hw_params);
 
 		mutex_lock(&efw->mutex);
-		err = snd_efw_stream_reserve_duplex(efw, rate);
+		err = snd_efw_stream_reserve_duplex(efw, rate,
+						    frames_per_period);
 		if (err >= 0)
 			++efw->substreams_counter;
 		mutex_unlock(&efw->mutex);
diff --git a/sound/firewire/fireworks/fireworks_stream.c b/sound/firewire/fireworks/fireworks_stream.c
index f2de304d2f26..0787d5c3b01b 100644
--- a/sound/firewire/fireworks/fireworks_stream.c
+++ b/sound/firewire/fireworks/fireworks_stream.c
@@ -181,7 +181,8 @@ static int keep_resources(struct snd_efw *efw, struct amdtp_stream *stream,
 	return cmp_connection_reserve(conn, amdtp_stream_get_max_payload(stream));
 }
 
-int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate)
+int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate,
+				  unsigned int frames_per_period)
 {
 	unsigned int curr_rate;
 	int err;
@@ -228,6 +229,14 @@ int snd_efw_stream_reserve_duplex(struct snd_efw *efw, unsigned int rate)
 			cmp_connection_release(&efw->in_conn);
 			return err;
 		}
+
+		err = amdtp_domain_set_events_per_period(&efw->domain,
+							 frames_per_period);
+		if (err < 0) {
+			cmp_connection_release(&efw->in_conn);
+			cmp_connection_release(&efw->out_conn);
+			return err;
+		}
 	}
 
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
