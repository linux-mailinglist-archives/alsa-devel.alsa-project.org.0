Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2C4CDFF8
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 13:12:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5D4E1670;
	Mon,  7 Oct 2019 13:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5D4E1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570446773;
	bh=Fo+RJLMEZn6zVFkEBiTIXeYhZLW5Skkb0mXkTebko0U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cSR4GzAr/LrHIjHZG/uv2WNftowRi6mUSKnsQr7iOA9UVErYhllmA6NEI0ITZNBVC
	 bb/kQP9ZqqM8rVounfaEmd4sE5rIGFv0n+VWqs2UdEJlkqxXSF02cUl4KRWKU+N/IA
	 ll6BjuEFgIjSMSPNNWu8RqpynO1GmAhD2wgP8eH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0843F80678;
	Mon,  7 Oct 2019 13:06:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D0FAF80633; Mon,  7 Oct 2019 13:05:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 977B1F805FD
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 13:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 977B1F805FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="QnaxjHJm"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Xj2NCioc"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CFB8221CBA;
 Mon,  7 Oct 2019 07:05:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 07 Oct 2019 07:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=6wwMQZ23pzgNc
 RwfHV+EQduAjNylICUWvHVUmmhxeuQ=; b=QnaxjHJmhIwOYKp7g3by7p3oCYawq
 ATIkgyOX+R4DyBCSE0lBV/9t7tfz4GdWHxZHq3P/+WnwBgdzqFffKowxhjxPTZCM
 ql0hzqQJmKUZh9JPZeDNxtOwdmFQ3D4OeeMlRzYrMjMuOcf0V7lJgyPLuNCoND6M
 REiIRr8PtGb9rmKBDoKnE+TrC2rd2IFBc2Eh0DHhKpJ58wISE6XRzik2TV9HA7RS
 iGVR15pgi6L3b+hJIn7HA3nD0lWAZQ6IG1Zr5LsPQe3TC5JZxcYh4GXR0hXAQgyb
 WFP/leLGyVezaJmhxpih0Q4rs3ov4kiC2XqpgGYR3QxNoBNZPO43znRrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=6wwMQZ23pzgNcRwfHV+EQduAjNylICUWvHVUmmhxeuQ=; b=Xj2NCioc
 6QIgHbxDr+ATDDumkei+L20UOJzDIY+ToSc+xkOGaJuoiNGgDsNQwfaIQcH+Mk7y
 CQzuarpuPvJ92eqGfAH3Jr940l/DVUm9XTrz6pjSgV5AbzjxqQPYqyMNdOxVn0QV
 KXi+1Ffe1h7H2RNolBwhqHbORHllCeZBi7n99pidLb62E8AYlkPUqGrOYpZVVkyo
 hA0PH4gqIWbmUMhQ7UhGvYxo+YFiLF2tUQ8z2moDIRDGAkgJw/rhZ26MJh2X6Mz4
 MvKfTV3GafWBrpitPaqU5S9bbUfbgOZWx0LXY0CGghnCqpAG4VPIym0y8hrFq1Do
 /L1M9YLs3fyceg==
X-ME-Sender: <xms:DBybXd9d_BHhz7wXWC7zxazG1PpAmwM-ShrX6FGu-92dLTUH9MifvA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrheejgddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekudenuc
 frrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhi
 rdhjphenucevlhhushhtvghrufhiiigvpeeh
X-ME-Proxy: <xmx:DBybXZ-c275Ew5ZNTz1VdYwOSF4hfG3dZGGRRUta7nQbpjmwmAB3Ew>
 <xmx:DBybXQ7aqdSK4ydVZ0ZKCDOGb1SGMwA5fO3_RF29RefUMychq-FN1Q>
 <xmx:DBybXTKIfMr8pPoTlw9ZfLOqS_-b7h_gCbhlnTiMUZAg6Qegcjlcsw>
 <xmx:DBybXfRtBOejeDeADmqg9qaIRbhg41isApQP92Hb9XC2IxoX781mJw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6AFD680062;
 Mon,  7 Oct 2019 07:05:47 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Mon,  7 Oct 2019 20:05:23 +0900
Message-Id: <20191007110532.30270-9-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
References: <20191007110532.30270-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 08/17] firewire-motu: register the size of PCM
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
 sound/firewire/motu/motu-midi.c   |  2 +-
 sound/firewire/motu/motu-pcm.c    |  4 +++-
 sound/firewire/motu/motu-stream.c | 11 ++++++++++-
 sound/firewire/motu/motu.h        |  3 ++-
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/motu/motu-midi.c b/sound/firewire/motu/motu-midi.c
index 46a0035df31e..997dd6c8ec31 100644
--- a/sound/firewire/motu/motu-midi.c
+++ b/sound/firewire/motu/motu-midi.c
@@ -17,7 +17,7 @@ static int midi_open(struct snd_rawmidi_substream *substream)
 
 	mutex_lock(&motu->mutex);
 
-	err = snd_motu_stream_reserve_duplex(motu, 0);
+	err = snd_motu_stream_reserve_duplex(motu, 0, 0);
 	if (err >= 0) {
 		++motu->substreams_counter;
 		err = snd_motu_stream_start_duplex(motu);
diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
index aa2e584da6fe..9a54c562494b 100644
--- a/sound/firewire/motu/motu-pcm.c
+++ b/sound/firewire/motu/motu-pcm.c
@@ -202,9 +202,11 @@ static int pcm_hw_params(struct snd_pcm_substream *substream,
 
 	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
 		unsigned int rate = params_rate(hw_params);
+		unsigned int frames_per_period = params_period_size(hw_params);
 
 		mutex_lock(&motu->mutex);
-		err = snd_motu_stream_reserve_duplex(motu, rate);
+		err = snd_motu_stream_reserve_duplex(motu, rate,
+						     frames_per_period);
 		if (err >= 0)
 			++motu->substreams_counter;
 		mutex_unlock(&motu->mutex);
diff --git a/sound/firewire/motu/motu-stream.c b/sound/firewire/motu/motu-stream.c
index 813e38e6a86e..52b7c375bb0b 100644
--- a/sound/firewire/motu/motu-stream.c
+++ b/sound/firewire/motu/motu-stream.c
@@ -133,7 +133,8 @@ int snd_motu_stream_cache_packet_formats(struct snd_motu *motu)
 	return 0;
 }
 
-int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate)
+int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate,
+				   unsigned int frames_per_period)
 {
 	unsigned int curr_rate;
 	int err;
@@ -171,6 +172,14 @@ int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate)
 			fw_iso_resources_free(&motu->tx_resources);
 			return err;
 		}
+
+		err = amdtp_domain_set_events_per_period(&motu->domain,
+							 frames_per_period);
+		if (err < 0) {
+			fw_iso_resources_free(&motu->tx_resources);
+			fw_iso_resources_free(&motu->rx_resources);
+			return err;
+		}
 	}
 
 	return 0;
diff --git a/sound/firewire/motu/motu.h b/sound/firewire/motu/motu.h
index 350ee2c16f4a..a419e6e7daed 100644
--- a/sound/firewire/motu/motu.h
+++ b/sound/firewire/motu/motu.h
@@ -154,7 +154,8 @@ void snd_motu_transaction_unregister(struct snd_motu *motu);
 int snd_motu_stream_init_duplex(struct snd_motu *motu);
 void snd_motu_stream_destroy_duplex(struct snd_motu *motu);
 int snd_motu_stream_cache_packet_formats(struct snd_motu *motu);
-int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate);
+int snd_motu_stream_reserve_duplex(struct snd_motu *motu, unsigned int rate,
+				   unsigned int frames_per_period);
 int snd_motu_stream_start_duplex(struct snd_motu *motu);
 void snd_motu_stream_stop_duplex(struct snd_motu *motu);
 int snd_motu_stream_lock_try(struct snd_motu *motu);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
