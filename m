Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D6F32263
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:18:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70267166A;
	Sun,  2 Jun 2019 09:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70267166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559459894;
	bh=+CifTaS7dg8MYNgqL4dCV98DImdEy4XFYEs948CSRNU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7gZVIdqKQXHD5vILlt6QhJHKMeLlEVhCZVxwPRiJmCY40DPvywCw6GeXo/vYL+b7
	 9LLPYXEiDyYvA3/tLB0KS+1nPKMLM6smt6E/bGNIaZSRcmE7V4wR8p0P0J4VGHMWRQ
	 U6Lnm0MJRui3z4ZGOuaCdc/tko42y5qvxFEBmRoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81A0EF89743;
	Sun,  2 Jun 2019 09:13:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDC58F89730; Sun,  2 Jun 2019 09:13:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C43FFF896F7
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C43FFF896F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="gbzANJO5"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="nyPUH8eO"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B8DBE21C47;
 Sun,  2 Jun 2019 03:13:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=+4TfiauU9RvDN
 x7Ep5kTrh3IFRbHRzNzrYBKehI9i8o=; b=gbzANJO5eld49NjtlTNbNnL6lTqfT
 UBITE1nxLAFM9bySU0vZoL/GFpdswc54j52wJGCPVu6uGEqBrtv4WIJw+7bGVzS2
 +xBo7v0K/Ifs8Z5uVzblgYxCqS1kb2yquq4kyiYqOVi5hQjVNU3DIJCizUKoJEhm
 C07FhKlaFvG2ie3mZ/CkHWtrBBJhhwuczKOaYz+H/Pru3ax6i/p/f6Xy5f/Og36i
 9FgCtEShXqNESc32uujNdLgrKFVVKAsbDdir0H2qXrnFhihIbbTBJOfH06IDk+eg
 ASSdnVq1GZoX//rxdZ+66/uljuYJqg28CC+mRuhwmZvAcMbT4hAcolKuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=+4TfiauU9RvDNx7Ep5kTrh3IFRbHRzNzrYBKehI9i8o=; b=nyPUH8eO
 mvmWug8HByPY5dt07AuBfKj16g2DyrWO5DTPwEsUumOIvyRzUwovD5zKZfEOZw7y
 9N/JMe1p/aN5sIoY/V9bVEkTuVrRlCpKHvJDvqN4htcPB6UywUZ7ou2KSZiLyPUR
 hx6L4goz10vX3bnNMC4+nEXIBDFkGOJzjPzmm/H2LAeIYG2Nzc6/a52Kd8ol3t8e
 fooAgw4vnx5zhba2qqNDRyaW+j5GdeNBrO2yzLzGPHps/rzVjoM05rm7VBEvc5J2
 DIUwivnHb5ZzW7xCNTzk1lSCEtTkBYllV9Qlz2vPK18BKkvk51ACQ1fFMMkiV90K
 mG5VR6gsawf3bw==
X-ME-Sender: <xms:CHfzXCDgBX-bXJShb9ivvFsAcO3mSNYWL5RY-NTzsJdDaEdJy5d3qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:CHfzXAwjglsSrXmK2kWVCsaEBOh_ZncwVLOzb8nryE8Ll4N5lpndpQ>
 <xmx:CHfzXAmhoFoKLu9I6xm3Un0B7Yi6WYKD5QKxusbiZKziOdA8CKspsA>
 <xmx:CHfzXFGwXTh_WIr_K5v7nQ8Q5qNriwjLqWTeWq5iLQOr7eRdiz7cbw>
 <xmx:CHfzXDk5q52tu5itOECwDKi7R7SmFJBRdn46GcDWnSvFaFeLlazKAw>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 49EA780059;
 Sun,  2 Jun 2019 03:13:11 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:49 +0900
Message-Id: <20190602071259.21622-6-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 05/15] ALSA: firewire-tascam: update
	isochronous resources when starting packet streaming after bus reset
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

After bus reset, isochronous resource manager releases all of allocated
isochronous resources. The nodes to restart packet streaming should
request reallocation of the resources.

However, between the bus-reset and invocation of 'struct fw_driver.update'
handler, ALSA PCM application can detect this situation by XRUN because
the target device cancelled to transmit packets once bus-reset occurs.

Due to the above mechanism, ALSA firewire-tascam driver just stops
packet streaming in the update handler, thus pcm.prepare handler
should request the reallocation.

This commit requests the reallocation in pcm.prepare callback when
bus generation is changed.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-stream.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/tascam/tascam-stream.c b/sound/firewire/tascam/tascam-stream.c
index 18d554d46be5..be9dcc808188 100644
--- a/sound/firewire/tascam/tascam-stream.c
+++ b/sound/firewire/tascam/tascam-stream.c
@@ -321,7 +321,7 @@ int snd_tscm_stream_init_duplex(struct snd_tscm *tscm)
 	return err;
 }
 
-/* At bus reset, streaming is stopped and some registers are clear. */
+// At bus reset, streaming is stopped and some registers are clear.
 void snd_tscm_stream_update_duplex(struct snd_tscm *tscm)
 {
 	amdtp_stream_pcm_abort(&tscm->tx_stream);
@@ -390,6 +390,7 @@ void snd_tscm_stream_release_duplex(struct snd_tscm *tscm)
 
 int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 {
+	unsigned int generation = tscm->rx_resources.generation;
 	int err;
 
 	if (tscm->substreams_counter == 0)
@@ -403,6 +404,16 @@ int snd_tscm_stream_start_duplex(struct snd_tscm *tscm, unsigned int rate)
 		finish_session(tscm);
 	}
 
+	if (generation != fw_parent_device(tscm->unit)->card->generation) {
+		err = fw_iso_resources_update(&tscm->tx_resources);
+		if (err < 0)
+			goto error;
+
+		err = fw_iso_resources_update(&tscm->rx_resources);
+		if (err < 0)
+			goto error;
+	}
+
 	if (!amdtp_stream_running(&tscm->rx_stream)) {
 		err = set_stream_formats(tscm, rate);
 		if (err < 0)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
