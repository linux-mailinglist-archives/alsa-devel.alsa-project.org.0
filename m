Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D03E83CCE3
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 15:28:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5361F1753;
	Tue, 11 Jun 2019 15:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5361F1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560259688;
	bh=tVixzmozbqQmA/z4tFm3LMyBVpqSDUGlLiADRfwopcM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pCgrAOf7qYEyISm2kvyDpEemYN5m046rSn+mA/totX8ye+lMpxGvtEzRFLo4Yu0T0
	 Zuj9aTmnusljFdDD41o9RMtH8r4ivbizGvNNsXUHANzgUUvCdZQcy1qSNLhgEpFthL
	 dbLwC6uhi2737At5pgQaB4Wsgel4mq3Ax1qZBOLw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46AC2F89752;
	Tue, 11 Jun 2019 15:21:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 987A9F89733; Tue, 11 Jun 2019 15:21:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5585F89733
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 15:21:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5585F89733
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="mAwi/CMr"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RH9GDg1u"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E419522331;
 Tue, 11 Jun 2019 09:21:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 11 Jun 2019 09:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Pr1vZmfdnBXlh
 iAseCMgaA2TkpiLyJzkre/Yu4ZX/A8=; b=mAwi/CMr6pYp6xJf776RWCKxZuM4f
 I03tHmUrQkzIiyhe70KNzrEB8rjuBBSqz4bD94QHHRJTAGGrmM4phCVQBfFdt+3G
 n2K/BTr9XV1Zd96psIxCXMmOc03MYH0/jOJSHJcWYH7FgfQ4AmepVjoIGA4XBqBO
 qw8tyfb7hHhwYjhvJZisQDhUenwfiQ6CndAGebc7vRIfKCSTkUkLJAmo4ayd0sjS
 o0JyRKWVAqUWCS0juijDAkh7EEn6Y3p05h1PEUiwaQI1vdeH1raeseEAnP0ms6aD
 BKpCoxsoQY9C+ofqMVVnQTQNiC19DfBrvxScwUflkpJ4dxE0K078DWl2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Pr1vZmfdnBXlhiAseCMgaA2TkpiLyJzkre/Yu4ZX/A8=; b=RH9GDg1u
 qsjlUHC8E43O/ywZN+PzLSLGE9v7JmxEPD2ywpaf0AuohQYjQwvN84vjmXmfea2K
 rWTFtkrwJmYiOw7J1956U12bKR9Ng7/Mt88R+s6s2fanzP+xHxAOi+CLQQWfV5Ze
 f9naFipnp6u/lbgjMW/wvJjtxE+lmcYCM8gL1Pz5laU+H4XhkpzMBE9mwVXt42qS
 6PzpImvmUP2mydx6ckWjJuOuYt8QIR5+K57YinleRc4eM5Doebi82KYjE3Xx+40q
 5YIxyK2RK2UJZX9bPwy9VUSHJEd8ueQYTKDxK+K3h/9zW/LuAdUsDFzj7kQv5uEK
 H/PUB7c/4GngZg==
X-ME-Sender: <xms:36r_XDCv994xYb_Hunko1Se0oSxVrTO3QchJwR3us3JgeaiEdmtLSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepie
X-ME-Proxy: <xmx:36r_XOMw-98tVnPNKtf9pAh-xmLB-CrY8TWjL0FkfK5t17OmRy5_Fg>
 <xmx:36r_XLbeE8NTU_OB9pSB3R73BONMeVGtprvcfR1HKK4RGzFx8obc8Q>
 <xmx:36r_XCrLz0q40We66DjlVc-KPglZ4iiwyb-nY1bQ8jCk4oWUe9Fz2g>
 <xmx:36r_XM7C1n-Y6qhtVlCEvNXE7BZN2dkp2ucLPZgz9YTMb7ovl801gQ>
Received: from localhost.localdomain (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5D284380083;
 Tue, 11 Jun 2019 09:21:34 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Tue, 11 Jun 2019 22:21:13 +0900
Message-Id: <20190611132118.8378-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
References: <20190611132118.8378-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 07/12] ALSA: firewire-digi00x: code refactoring
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
 sound/firewire/digi00x/digi00x-pcm.c | 55 ++++------------------------
 1 file changed, 7 insertions(+), 48 deletions(-)

diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index 1c04747f4fcc..9ed2ebdcf23a 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -155,8 +155,8 @@ static int pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *hw_params)
+static int pcm_hw_params(struct snd_pcm_substream *substream,
+			 struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_dg00x *dg00x = substream->private_data;
 	int err;
@@ -179,48 +179,7 @@ static int pcm_capture_hw_params(struct snd_pcm_substream *substream,
 	return err;
 }
 
-static int pcm_playback_hw_params(struct snd_pcm_substream *substream,
-				  struct snd_pcm_hw_params *hw_params)
-{
-	struct snd_dg00x *dg00x = substream->private_data;
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
-		mutex_lock(&dg00x->mutex);
-		err = snd_dg00x_stream_reserve_duplex(dg00x, rate);
-		if (err >= 0)
-			++dg00x->substreams_counter;
-		mutex_unlock(&dg00x->mutex);
-	}
-
-	return err;
-}
-
-static int pcm_capture_hw_free(struct snd_pcm_substream *substream)
-{
-	struct snd_dg00x *dg00x = substream->private_data;
-
-	mutex_lock(&dg00x->mutex);
-
-	if (substream->runtime->status->state != SNDRV_PCM_STATE_OPEN)
-		--dg00x->substreams_counter;
-
-	snd_dg00x_stream_stop_duplex(dg00x);
-	snd_dg00x_stream_release_duplex(dg00x);
-
-	mutex_unlock(&dg00x->mutex);
-
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
-}
-
-static int pcm_playback_hw_free(struct snd_pcm_substream *substream)
+static int pcm_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_dg00x *dg00x = substream->private_data;
 
@@ -341,8 +300,8 @@ int snd_dg00x_create_pcm_devices(struct snd_dg00x *dg00x)
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
@@ -353,8 +312,8 @@ int snd_dg00x_create_pcm_devices(struct snd_dg00x *dg00x)
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
