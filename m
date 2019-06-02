Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E27BF32267
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 09:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 802DC1686;
	Sun,  2 Jun 2019 09:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 802DC1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559459982;
	bh=XazWFe2D9r9fFetRjGdL5TVRUJe/9E5DxiFKJ1U6pSM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jRlfCLPDhO69ShPU2eqc9fn5eWnd7V9RJ0ZMIkm3txW3FhriNYixulVcccZWJ//Us
	 mpAotI5yWc2PaHhKseeBxLXahNsOMQSiBpUf5NT2byzQVlOH/fNnbfC8M8hYpjKjl8
	 QCrnX6I/OvTRNaJZes/a+k0YrYOsKkdoDk8PAJXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47C3EF89755;
	Sun,  2 Jun 2019 09:13:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7875F89734; Sun,  2 Jun 2019 09:13:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9157FF896F7
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 09:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9157FF896F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="d7Hvx5IY"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="GRypUjQ0"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id C29CE21E44;
 Sun,  2 Jun 2019 03:13:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 02 Jun 2019 03:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=tH8gqUEn9WcVO
 Gp1rmRXdiFROPA6uiuIzKOO5rej1dM=; b=d7Hvx5IYrOmaQh3zWVVug96ZYAEVl
 u2qPhP1VFHr43Nmo4e7HaZWbVGATCVH2VaZ2N9qB5RU4Qp70dg7Ziaj4wrUIizG1
 +gwWPSyWhvo+IoAobFRWVUT71QLnfeLZXK7cYaROJ7Se36FxHi9LqHL4B8gzGTrs
 mgtDkSZ22DWynNDnmeSz5FwqhEwfSxr4gn6rrhNUdu7kNs5dMb/81/WnJ+C+QM2+
 kzxrWaJR8VxtJJhOEMwRbwSYKGYTbcM61O1IFb58UE7M+YQp7HpeAdcwXFy4Qu4y
 FH0SQ6CbJWIvDLEf4uQ6CO6KoCAUQ+bR0RTaAOLhH3wrKZy0I8evMKnFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=tH8gqUEn9WcVOGp1rmRXdiFROPA6uiuIzKOO5rej1dM=; b=GRypUjQ0
 SAaKm9MdFuwDepYBUUD4pl6QckB7MhFN+WaByaHeB+Vr6bxZrT0fquHkn5HySViA
 I4Bof+taByk1aP4brVh+hwUXXtna+6ekXXVjQxiuF1rYPrCaJA8R+bLLHC+TClKp
 OiwDF/wvGl1wsSjJLzhxS4J6SkX/lV6cxxBYD2HaQUdE78sLWNnm3FgKWZtg5VD5
 t8HVv2LLplyk7Ndbw2AUcOhzb0s/I5OIpCLnWX88jb2KBgW/aXS8p8Pol2tha0JS
 zErvY8Z/Gb/JBswNnIxRpQTrjoHQ+SOAKpDVi1oomr4Zf9lFLNvU47NtjCqcifcW
 7e0Al7CHzKWUtg==
X-ME-Sender: <xms:C3fzXLy3hG1GNYVJ-X-BrY-nHqobOh9FlvD3KZKUsYHnyg0uRca9fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudefgedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:C3fzXEyMtpGbgHNNlSt3FB3N9VPJLKalaaBy3z4uVuzyCDmUS8V_Cw>
 <xmx:C3fzXJ5j5Y4XBelr6mIaOKZV70AZUftwAQ-Fio58pw_QCIDVuP8cDA>
 <xmx:C3fzXFAIxWxrrgnVXe1Bm3zEEuvkVurDYr84M_RAncWpaKzRXKZ4Qg>
 <xmx:C3fzXB0O2e9F57kYUBrPOzxVnfUZOgzcXXzx7nsTcO991Br7qAl1PA>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5AD2F80059;
 Sun,  2 Jun 2019 03:13:14 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  2 Jun 2019 16:12:51 +0900
Message-Id: <20190602071259.21622-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
References: <20190602071259.21622-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 07/15] ALSA: firewire-tascam: code refactoring
	for pcm.hw_params/hw_free callbacks
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

The pairs of pcm.hw_params callbacks and .hw_free callbacks for both
direction have no differences.

This commit unifies the pairs.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/tascam/tascam-pcm.c | 55 ++++--------------------------
 1 file changed, 7 insertions(+), 48 deletions(-)

diff --git a/sound/firewire/tascam/tascam-pcm.c b/sound/firewire/tascam/tascam-pcm.c
index 962ef1212ac0..450711bef508 100644
--- a/sound/firewire/tascam/tascam-pcm.c
+++ b/sound/firewire/tascam/tascam-pcm.c
@@ -84,8 +84,8 @@ static int pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *hw_params)
+static int pcm_hw_params(struct snd_pcm_substream *substream,
+			 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_tscm *tscm = substream->private_data;
 	int err;
@@ -108,48 +108,7 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 	return err;
 }
 
-static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
-				  struct snd_pcm_hw_params *hw_params)
-{
-	struct snd_tscm *tscm = substream->private_data;
-	int err;
-
-	err = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-					       params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
-
-	if (substream->runtime->status->state == SNDRV_PCM_STATE_OPEN) {
-		unsigned int rate = params_rate(hw_params);
-
-		mutex_lock(&tscm->mutex);
-		err = snd_tscm_stream_reserve_duplex(tscm, rate);
-		if (err >= 0)
-			++tscm->substreams_counter;
-		mutex_unlock(&tscm->mutex);
-	}
-
-	return err;
-}
-
-static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_tscm *tscm = substream->private_data;
-
-	mutex_lock(&tscm->mutex);
-
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		--tscm->substreams_counter;
-
-	snd_tscm_stream_stop_duplex(tscm);
-	snd_tscm_stream_release_duplex(tscm);
-
-	mutex_unlock(&tscm->mutex);
-
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
-}
-
-static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
+static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_tscm *tscm = substream->private_data;
 
@@ -270,8 +229,8 @@ int snd_tscm_create_pcm_devices(struct snd_tscm *tscm)
 		.open		= pcm_open,
 		.close		= pcm_close,
 		.ioctl		= snd_pcm_lib_ioctl,
-		.hw_params	= pcm_capture_hw_params,
-		.hw_free	= pcm_capture_hw_free,
+		.hw_params	= pcm_hw_params,
+		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_capture_prepare,
 		.trigger	= pcm_capture_trigger,
 		.pointer	= pcm_capture_pointer,
@@ -282,8 +241,8 @@ int snd_tscm_create_pcm_devices(struct snd_tscm *tscm)
 		.open		= pcm_open,
 		.close		= pcm_close,
 		.ioctl		= snd_pcm_lib_ioctl,
-		.hw_params	= pcm_playback_hw_params,
-		.hw_free	= pcm_playback_hw_free,
+		.hw_params	= pcm_hw_params,
+		.hw_free	= pcm_hw_free,
 		.prepare	= pcm_playback_prepare,
 		.trigger	= pcm_playback_trigger,
 		.pointer	= pcm_playback_pointer,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
