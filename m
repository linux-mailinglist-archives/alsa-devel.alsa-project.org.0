Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9920ECDFFC
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:13:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E079168F;
	Mon,  7 Oct 2019 13:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E079168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570446815;
	bh=4UR0BlsVE18vFWeLxABocK+DCimoJlHnnDu27247VT4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GEKJ1w9+gOqaQxxxGRzA3UTI/sJladpfaRp8WAbC4xjBaP/gWwJm6aOpitartHs9b
	 tLzFnYNh3/W9DvK9CseuIqkIzXUDDbfrkp2LDFvhYSdILyx0/exQfZKngYkflqaWZB
	 LmaXWEvi8mhkZTHhQaQbuBGsPEM/WOcaIgmVE4f0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85E0CF806EF;
	Mon,  7 Oct 2019 13:06:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D61F80638; Mon,  7 Oct 2019 13:05:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CC1AF80610
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CC1AF80610
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="EMVz1duP"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="SApH50uv"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 43D0521CC3;
 Mon,  7 Oct 2019 07:05:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=YzXKu+WZoTozI
 R6y0LRU4n4MSnrgZ1eUjR9ramzalQI=; b=EMVz1duPyx0F0D1IoGTRVm6WoR9si
 EZ9qB2dJgrAqhRyO0KIdVTw/jQpViFkcHvKH08Fekw9EqqUAH6kXtL1kj/5WkUlg
 EvywOIePCb2x88dDSyiPDsLYElqB5a6SVBhD0SOHGI5Gjvrb2B+5YzkCw2OT73Fr
 vGQNi4ZgV+nN5y7IRM4+6dTXab1KaQo9jp6X6dCR1ZVmKVjpbjnjVDm1V0jWl7Yg
 em9aJbrgzSp+xkmWG1EuidKalPfJZNsZeHmHzD/rDlEffSS+/t4j7GS5xVrqD5Ff
 2A/y0v7k6DkCtK9l36bH7vE8RenFRxKmA708YPDyZxDaEQiD9rYKwlkww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=YzXKu+WZoTozIR6y0LRU4n4MSnrgZ1eUjR9ramzalQI=; b=SApH50uv
 OtBJroSJbkTbZflM8DQHWRFQl65mVzsVf2MIZ77jB73MUw/1Fuhz0I3kV2EiWeWC
 99NSRU3Ta9XSt0336nTs84UrODi7aQ9vVsGneuI4euu/M+IPKm/UF/DT0XLBaYsw
 VHpXYJbbVDQs1+YHd2SNInhky5uA+jAKL3MiuDdXpbu1BJPhWMexk9dGfaTI8Stj
 UPCUEVjtkAcsaR9TsqNlgWogJwdLoQgEW5rUUqG4ct/c0YjmtHlptYRc7dYBrmye
 OrUFugm/J7sc5lOer44LQpkTwI8VFOBIbk+5rMSsPPMQqJHf2jRxp/sHkPsAbMYm
 MQERe7aET8M6xA==
X-ME-Sender: <xms:DhybXZoxSRpAves9BLF7RmmbmqUqDMpNEG3tLGBqrzz1k0nZSQLR3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeeh
X-ME-Proxy: <xmx:DhybXd4m9zajqvtQcZlLqZ22oY03n-CCanV06DS2m3T5b7HA5vPGAQ>
 <xmx:DhybXWQfDuuuj2EsK42FdUjCbUdYuT-RQJ1oZy7bS6_DIiLRTgPHUw>
 <xmx:DhybXd07GJoM_B9AcQeTKAh4HUGWWjwYNhxm79yYWNK47xUJmKxrog>
 <xmx:DhybXRN_Y0iD8yw3lKcWYywycwqQ53oz2GmqKnNXoMKIzE3KQ4uNGg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id E6CBF8005A;
 Mon,  7 Oct 2019 07:05:48 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:24 +0900
Message-Id: <20191007110532.30270-10-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 09/17] fireface: register the size of PCM
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
 sound/firewire/fireface/ff-pcm.c    |  3 ++-
 sound/firewire/fireface/ff-stream.c | 11 ++++++++++-
 sound/firewire/fireface/ff.h        |  3 ++-
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/fireface/ff-pcm.c b/sound/firewire/fireface/ff-pcm.c
index 9eab3ad283ce..4f2208202494 100644
--- a/sound/firewire/fireface/ff-pcm.c
+++ b/sound/firewire/fireface/ff-pcm.c
@@ -211,9 +211,10 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
+		unsigned int frames_per_period = params_period_size(hw_params);
 
 		mutex_lock(&ff->mutex);
-		err = snd_ff_stream_reserve_duplex(ff, rate);
+		err = snd_ff_stream_reserve_duplex(ff, rate, frames_per_period);
 		if (err >= 0)
 			++ff->substreams_counter;
 		mutex_unlock(&ff->mutex);
diff --git a/sound/firewire/fireface/ff-stream.c b/sound/firewire/fireface/ff-stream.c
index e8e6f9fd6433..d05e7d3055e1 100644
--- a/sound/firewire/fireface/ff-stream.c
+++ b/sound/firewire/fireface/ff-stream.c
@@ -106,7 +106,8 @@ void snd_ff_stream_destroy_duplex(struct snd_ff *ff)
 	destroy_stream(ff, &ff->tx_stream);
 }
 
-int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate)
+int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate,
+				 unsigned int frames_per_period)
 {
 	unsigned int curr_rate;
 	enum snd_ff_clock_src src;
@@ -150,6 +151,14 @@ int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate)
 		err = ff->spec->protocol->allocate_resources(ff, rate);
 		if (err < 0)
 			return err;
+
+		err = amdtp_domain_set_events_per_period(&ff->domain,
+							 frames_per_period);
+		if (err < 0) {
+			fw_iso_resources_free(&ff->tx_resources);
+			fw_iso_resources_free(&ff->rx_resources);
+			return err;
+		}
 	}
 
 	return 0;
diff --git a/sound/firewire/fireface/ff.h b/sound/firewire/fireface/ff.h
index b4c22ca6079e..970d4ae571ee 100644
--- a/sound/firewire/fireface/ff.h
+++ b/sound/firewire/fireface/ff.h
@@ -139,7 +139,8 @@ int snd_ff_stream_get_multiplier_mode(enum cip_sfc sfc,
 				      enum snd_ff_stream_mode *mode);
 int snd_ff_stream_init_duplex(struct snd_ff *ff);
 void snd_ff_stream_destroy_duplex(struct snd_ff *ff);
-int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate);
+int snd_ff_stream_reserve_duplex(struct snd_ff *ff, unsigned int rate,
+				 unsigned int frames_per_period);
 int snd_ff_stream_start_duplex(struct snd_ff *ff, unsigned int rate);
 void snd_ff_stream_stop_duplex(struct snd_ff *ff);
 void snd_ff_stream_update_duplex(struct snd_ff *ff);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
