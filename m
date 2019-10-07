Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5CACDFF7
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:12:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C420166B;
	Mon,  7 Oct 2019 13:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C420166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570446731;
	bh=fC/ecvFkUuxMib2UT7j9euwFzFoUH8A0LBBgiqRCbWw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DtD2X+mMQcgG88F4nilVJmeMVdDSHP1RJTBDqrNciob8tLWGgMCdhKVkSYsxK4Z9V
	 +G8ZoHUXQQy4PUUCHTqgCzVtQDgBiMBmFHZFBs1Oa+iGj4gHeMjhb4NOreQOC2Io2u
	 OY3vTP/rq4c5+zIvYx8ZIPTqlJuOH+N4Lrrpc83M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8DF8F80674;
	Mon,  7 Oct 2019 13:05:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B82DBF80611; Mon,  7 Oct 2019 13:05:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26BB3F805FC
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:05:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26BB3F805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="hVY2cQnW"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="S3j0rrNW"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 53F3A21C1C;
 Mon,  7 Oct 2019 07:05:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=0XRaFulXshiB9
 R9fqIsqzdfZua2GxmZSptsbAI6Y19I=; b=hVY2cQnWg0FWYqJmGrWD+sXOaQOo/
 AWQLAhw0Kh7S+KjwSn5T7iV5Qd7+q4m8GQnEKcXKUzAvo2eRdx+wsMsdt/obMpa3
 SJ8Gef/CgzqGEEN3bE8YT8b3+S4Nclt19yz/Ri7UpZmEBp/Hu9tT3hx8cpfmVH4Q
 nFbu66ycxQ/hF4KFNA2lX99biS6P20gQjbDbCrmJ2YJtFBki22D0roiaYO5K6Zkp
 and/4xJo/cJdi6lQrXoRoH29FtxctumKp7L1PsP5rh6ogZKnTXsfcu77cj0ZzTO/
 tqv+Xit4zCU3D2x8Po0OMkrk+4bjbm2pEZhdsf4CZbsVI+XFhkf1Ik6zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=0XRaFulXshiB9R9fqIsqzdfZua2GxmZSptsbAI6Y19I=; b=S3j0rrNW
 jjRlymetrm/xgORj8OWPGTbn62gJXzdDESSQ1CC31ANnrLbk2Nz1UhrKUgTQKvrX
 kWSeKKH2cna1XhMpu4xw9uZltI3eAGhpqVTsHGHUgj2PedlBPZ9nbjPHb1is4so5
 MEUli8n30NWTI7jCscdDZ3SSbrQJN5L0h3Qhif9zub74ieAiFECnEduJRM+S6mWP
 IEr2qjiV3qsw78Gg893LWrmVicXFvP6nNliiwWDdScjfS5GseC3xJlNbHlRWEl3Q
 /VG1X6ToIU5q8b5Z29QXskyjNp35Hbww9J5PC7Q8ImVF1UIKHCv63iieez6Wydld
 Koe+mcHKayNafQ==
X-ME-Sender: <xms:CxybXY7rjzdcoJPZKkhjFdMbnQeTJh9-jW9pdvvMJastfHyVRBrbtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeeh
X-ME-Proxy: <xmx:CxybXfZ1W4cRhPh7KWN_hS4V7NpqRrFico0txSzLwzlh7wl8GnroyA>
 <xmx:CxybXWgPswsOa2jHiiouRK0tCMr8YmaDzQgzEmretU_mAwLRiOT7Ag>
 <xmx:CxybXRcNjgiWCbpW9Ip1hAZrMYcZ0Qn0NHaMHI9eBjPR44OSa7mOZg>
 <xmx:CxybXeSZCm7fC3X6BRzDAn4z3cfQ8PUaQw6D5Xz8xrjAorC9YrdGVg>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id DDE7280066;
 Mon,  7 Oct 2019 07:05:45 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:22 +0900
Message-Id: <20191007110532.30270-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 07/17] firewire-tascam: register the size of
	PCM period to AMDTP domain
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
 sound/firewire/tascam/tascam-pcm.c    |  4 +++-
 sound/firewire/tascam/tascam-stream.c | 11 ++++++++++-
 sound/firewire/tascam/tascam.h        |  3 ++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index 2377732caa52..cea26d5eff1a 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -99,9 +99,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
+		unsigned int frames_per_period = params_period_size(hw_params);
 
 		mutex_lock(&tscm->mutex);
-		err = snd_tscm_stream_reserve_duplex(tscm, rate);
+		err = snd_tscm_stream_reserve_duplex(tscm, rate,
+						     frames_per_period);
 		if (err >= 0)
 			++tscm->substreams_counter;
 		mutex_unlock(&tscm->mutex);
diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index adf69a520b80..8c04a0ad17d9 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -383,7 +383,8 @@ void snd_tscm_stream_destroy_duplex(struct snd_tscm *tscm)
 	destroy_stream(tscm, &tscm->tx_stream);
 }
 
-int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate)
+int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate,
+				   unsigned int frames_per_period)
 {
 	unsigned int curr_rate;
 	int err;
@@ -413,6 +414,14 @@ int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate)
 			fw_iso_resources_free(&tscm->tx_resources);
 			return err;
 		}
+
+		err = amdtp_domain_set_events_per_period(&tscm->domain,
+							frames_per_period);
+		if (err < 0) {
+			fw_iso_resources_free(&tscm->tx_resources);
+			fw_iso_resources_free(&tscm->rx_resources);
+			return err;
+		}
 	}
 
 	return 0;
diff --git a/sound/firewire/tascam/tascam.h b/sound/firewire/tascam/tascam.h
index 15bd335fa07f..32e72a25bf46 100644
--- a/sound/firewire/tascam/tascam.h
+++ b/sound/firewire/tascam/tascam.h
@@ -168,7 +168,8 @@ int snd_tscm_stream_get_clock(struct snd_tscm *tscm,
 int snd_tscm_stream_init_duplex(struct snd_tscm *tscm);
 void snd_tscm_stream_update_duplex(struct snd_tscm *tscm);
 void snd_tscm_stream_destroy_duplex(struct snd_tscm *tscm);
-int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate);
+int snd_tscm_stream_reserve_duplex(struct snd_tscm *tscm, unsigned int rate,
+				   unsigned int frames_per_period);
 int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate);
 void snd_tscm_stream_stop_duplex(struct snd_tscm *tscm);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
