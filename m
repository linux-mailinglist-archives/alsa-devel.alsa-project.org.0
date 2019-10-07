Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 286F4CE011
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:18:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD5F11682;
	Mon,  7 Oct 2019 13:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD5F11682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570447107;
	bh=N4S+dmElLBjO5txEYwP8B2Gc0ZqaJEiPYhzf8Xu0GPQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iLSYZdPJMKaQakBIa1TOwT4PUgDlvXUHURpN0h2pAL1/jztUet1Xc81gF5yUY/uEm
	 xr6ydeqm7iEotijivHMNhWNa3gpkL8tB5wRFsaY8HDjIbvt5zDqZ4+6X2QFCByCmJi
	 e+N4iT1Hzefq13aO/yGhA3pFHK40/VbSBaLjUjs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8117F8075B;
	Mon,  7 Oct 2019 13:06:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0865EF80709; Mon,  7 Oct 2019 13:06:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 030D1F80676
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 030D1F80676
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Zgg9xqrD"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GxBJU59s"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0333020D56;
 Mon,  7 Oct 2019 07:06:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=hVXkd78rPyXpe
 CbuO7Q8YF4fKXTpi2mwDgvEDKMRrjU=; b=Zgg9xqrDWBuwmwMhYDfu1oO+hLa9L
 qu3WE5pw943sk0t1FSzsmeO9TRmLyLn3sO/MfnvcV7XlOJA27llDRSm0MP5gTQA7
 varKcXkKWF3xbl2dfpwiw/uasl3uZxz8OikeV+qFozYfF9ORZINe+nXmyOcAEaWe
 IAqViYaPhUUAS40aZPxjEgmZLGW/4qEg+gVDvV9xgdKaQFcsdyuFSHKsnZVVdmge
 ha0tq3scEdP4ZgqsPHTbG0NAmjzQwJqu594bPafx1YuWBGVKdrl5CpbqKSj4ET6z
 Jhq/S5NMBFdekHWuD73lBa6yzlHF2UpcmBR3iw28Y9THHXua1W/yDqtvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=hVXkd78rPyXpeCbuO7Q8YF4fKXTpi2mwDgvEDKMRrjU=; b=GxBJU59s
 Ippx3zGlIgSqN4FSk6GFyWGNb4qyZPNaqfVWcomjRkcuKb3bG3ak1RoAhqaO/8R0
 LkwbjOm22uZ+76RlqTs79JOAWS8aUWWNaOORdM78ERA7g35sO9u04eURnOPF+Rvv
 IYibtTWt7o2A/m9BqlNm4gqYQkd2vVN5g4scH6M2aymiX8Gf/Njka/Wg+ho+uT0o
 WOGVD5hJR6xJgwrw79JTmppAJSpV8P+JlScAHVTP8Bj+WzCuCAZ3+ZkkIToaHc78
 X/nvQWRIQXwAHm/Eu4JmazBiqnZLjehpPbedp4e0lejoxmNDPyfFvbI3DpeCUWsB
 lZJ78V2RluL/qA==
X-ME-Sender: <xms:GBybXV7jdd8XV5wFVxqCJbZzLLCUUddU1M-5FaFk7sE06boE-e6iEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddviecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeeg
X-ME-Proxy: <xmx:GBybXXR8cfYzwcoxJrKgIXQAHr-jffUMvKQnwK_KFbQT0dxZ8X09JA>
 <xmx:GBybXaVywGm0IvfpBFiw0RI4r-IHpHmtsGzp4LUKrBSZX9lLbZfJvg>
 <xmx:GBybXcGkl_pr4pIVxiywnF-u9FCfj65rN6L4LBX-zhexhXacFEnjSQ>
 <xmx:GBybXdjrDHlX_m2gmMhxqMcAhJO4Vh5HgSxt2iRN2xqULxQxAhv4qg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8906680059;
 Mon,  7 Oct 2019 07:05:59 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:31 +0900
Message-Id: <20191007110532.30270-17-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 16/17] firewire-motu: use the same size of
	period for PCM substream in AMDTP streams
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

In current implementation, when opening a PCM substream, it's needed to
check whether the opposite PCM substream runs. This is to assign
effectual constraints (e.g. sampling rate) to opened PCM substream.

The number of PCM substreams and MIDI substreams on AMDTP streams in
domain is recorded in own structure. Usage of this count is an
alternative of the above check. This is better because the count is
incremented in pcm.hw_params earlier than pcm.trigger.

This idea has one issue because it's incremented for MIDI substreams as
well. In current implementation, for a case that any MIDI substream run
and a PCM substream is going to start, PCM application to start the PCM
substream can decide hardware parameters by restart packet streaming.
Just checking the substream count can brings regression.

Now AMDTP domain structure has a member for the size of PCM period in
PCM substream which starts AMDTP streams in domain. When the value has
zero and the substream count is greater than 1, it means that any MIDI
substream starts AMDTP streams in domain. Usage of the value can resolve
the above issue.

This commit replaces the check with the substream count and the value for
the size of PCM period.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/motu/motu-pcm.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index 9a54c562494b..7bbf8b86a33d 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -134,8 +134,8 @@ static int pcm_open(struct snd_pcm_substream *substream)
 {
 	struct snd_motu *motu = substream->private_data;
 	const struct snd_motu_protocol *const protocol = motu->spec->protocol;
+	struct amdtp_domain *d = &motu->domain;
 	enum snd_motu_clock_source src;
-	unsigned int rate;
 	int err;
 
 	err = snd_motu_stream_lock_try(motu);
@@ -152,28 +152,41 @@ static int pcm_open(struct snd_pcm_substream *substream)
 	if (err < 0)
 		goto err_locked;
 
-	/*
-	 * When source of clock is not internal or any PCM streams are running,
-	 * available sampling rate is limited at current sampling rate.
-	 */
 	err = protocol->get_clock_source(motu, &src);
 	if (err < 0)
 		goto err_locked;
+
+	// When source of clock is not internal or any stream is reserved for
+	// transmission of PCM frames, the available sampling rate is limited
+	// at current one.
 	if (src != SND_MOTU_CLOCK_SOURCE_INTERNAL ||
-	    amdtp_stream_pcm_running(&motu->tx_stream) ||
-	    amdtp_stream_pcm_running(&motu->rx_stream)) {
+	    (motu->substreams_counter > 0 && d->events_per_period > 0)) {
+		unsigned int frames_per_period = d->events_per_period;
+		unsigned int rate;
+
 		err = protocol->get_clock_rate(motu, &rate);
 		if (err < 0)
 			goto err_locked;
+
 		substream->runtime->hw.rate_min = rate;
 		substream->runtime->hw.rate_max = rate;
+
+		if (frames_per_period > 0) {
+			err = snd_pcm_hw_constraint_minmax(substream->runtime,
+					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					frames_per_period, frames_per_period);
+			if (err < 0) {
+				mutex_unlock(&motu->mutex);
+				goto err_locked;
+			}
+		}
 	}
 
 	snd_pcm_set_sync(substream);
 
 	mutex_unlock(&motu->mutex);
 
-	return err;
+	return 0;
 err_locked:
 	mutex_unlock(&motu->mutex);
 	snd_motu_stream_lock_release(motu);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
