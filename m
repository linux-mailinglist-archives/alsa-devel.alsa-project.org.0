Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D4D809B7
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Aug 2019 08:36:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 564C716B2;
	Sun,  4 Aug 2019 08:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 564C716B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564900597;
	bh=V7M3LCWM297Fa/C7WIT3Gx0kyb6WpcrvH4sdAxPR8ZI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=utHZQPH8bdScTiRtDHQdzXCg6909ybFqLlxuKpOCWPClAbwp4zdr0Tg3ttMze8Mt0
	 tqnit+LhvmLZXJHjk7sWYh4oa8IzzsJE6dG+HnVYNL/BMdvFdLHGA6Fqd48lvQWHPn
	 cP7Z6qKieoniqQJ7RokjQ4LzRP4rTTMW0z54JxPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CFC7F80769;
	Sun,  4 Aug 2019 08:22:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3E0EF805F8; Sun,  4 Aug 2019 08:22:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DA37F805A1
 for <alsa-devel@alsa-project.org>; Sun,  4 Aug 2019 08:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DA37F805A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="XeuPoKBK"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Wp5McXGu"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B423C21B10;
 Sun,  4 Aug 2019 02:22:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sun, 04 Aug 2019 02:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=LtQqCfjpme2nf
 rb3QtBP3YTIiGWSsnOM4xLicwd3wuA=; b=XeuPoKBKvhi3IuFNVxfcNmTX9l89M
 BPIXtPTDZkL/Uld9+b26P1GdXUXdRkD3JrjsbdR/6J6YvNhnd+dc/pEfN4nrF2c+
 tkJ5bOqyun+gFT7usZmuJANMZOOnSD3uk8y8kUhvrjPgTCqbsAHJPaaxmM4T+0bT
 MPkjEqGGL/TE6FXnk4AAu5xVZFXKF1MGaD07l8DdUHyVMR5yjLspOecEdDjRh40P
 T2XRz6piC65hEotATfFXa2v2V28dyQWmbIlcMABEEn0OaVKDlA+uAoQZruGnEOnX
 suUZslXy9MQcCZB7P86xFkoLNeQ+PxkaJ5VDdX3em4eK+Ve1b47r/rFMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=LtQqCfjpme2nfrb3QtBP3YTIiGWSsnOM4xLicwd3wuA=; b=Wp5McXGu
 fx1Xw7otX+yM7EL/lTNbdHVIkRGcQKsLuvSb38wILymsI5c+jW9VDacdmjgv+EF+
 mj7Pd0mW+cT0/tAXwCvvZVQRhwTtoSkye2CQCzhTR4dNjsZVQuBYS4hiKlg8BcDe
 gN2xKzNF4zA/zZXo7bCf2frc9LTLigX58CizVYMhZfbONgBHgdGtlY9JlY6Ebp5j
 sgNRUnrdEUxq8i2PLdzi25jeCXTyt38+EwocCTVCM6ZNvBFenstCayTz97nbwdjS
 mKAFjuSWlJezjVz9K74R9N5xpNjqHeKoKjCRfMD/aALhH8R2tJpMA2eZmYOH1xAL
 epEPvXqif0Cd1Q==
X-ME-Sender: <xms:k3lGXTMUKq6tO1E2S4rIfDWotzGDj5IqcZPCSn67lh2qr0F1GkRlfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddtgedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrjeehrddukedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghh
 ihdrjhhpnecuvehluhhsthgvrhfuihiivgepudej
X-ME-Proxy: <xmx:k3lGXQCv6B6j5M0hD3NPRwqWMppYHqDfMdzbTQCg_7cy37uSO2IDLw>
 <xmx:k3lGXQaJIQNhlHLCTSfSnoyIjQcnrhloCExaxORZPvEJcdgBCXMnqg>
 <xmx:k3lGXcovwKdcY9B1ip1JoYcNkzNVmjsOKn_xL7VlpVC3rGU6Kns5Mw>
 <xmx:k3lGXXAS0W1692GskdTZx3dsc6dw23TYVe-gYC8XzDxbZ1LaQtR59Q>
Received: from workstation.flets-east.jp (ae075181.dynamic.ppp.asahi-net.or.jp
 [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4E0DB380084;
 Sun,  4 Aug 2019 02:22:10 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de,
	tiwai@suse.de
Date: Sun,  4 Aug 2019 15:21:38 +0900
Message-Id: <20190804062138.1217-20-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
References: <20190804062138.1217-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 19/19] ALSA: firewire-lib: localize kernel APIs
	to start/stop each AMDTP stream
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

As a result to support AMDTP domain, no drivers call kernel APIs to
start/stop each AMDTP stream. This commit localize these APIs.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/amdtp-stream.c | 6 ++----
 sound/firewire/amdtp-stream.h | 2 --
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/firewire/amdtp-stream.c b/sound/firewire/amdtp-stream.c
index 158d210caea7..1a92855c7647 100644
--- a/sound/firewire/amdtp-stream.c
+++ b/sound/firewire/amdtp-stream.c
@@ -894,7 +894,7 @@ static void amdtp_stream_first_callback(struct fw_iso_context *context,
  * amdtp_stream_set_parameters() and it must be started before any PCM or MIDI
  * device can be started.
  */
-int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
+static int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 {
 	static const struct {
 		unsigned int data_block;
@@ -1027,7 +1027,6 @@ int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed)
 
 	return err;
 }
-EXPORT_SYMBOL(amdtp_stream_start);
 
 /**
  * amdtp_stream_pcm_pointer - get the PCM buffer position
@@ -1098,7 +1097,7 @@ EXPORT_SYMBOL(amdtp_stream_update);
  * All PCM and MIDI devices of the stream must be stopped before the stream
  * itself can be stopped.
  */
-void amdtp_stream_stop(struct amdtp_stream *s)
+static void amdtp_stream_stop(struct amdtp_stream *s)
 {
 	mutex_lock(&s->mutex);
 
@@ -1118,7 +1117,6 @@ void amdtp_stream_stop(struct amdtp_stream *s)
 
 	mutex_unlock(&s->mutex);
 }
-EXPORT_SYMBOL(amdtp_stream_stop);
 
 /**
  * amdtp_stream_pcm_abort - abort the running PCM device
diff --git a/sound/firewire/amdtp-stream.h b/sound/firewire/amdtp-stream.h
index 15d471660a43..bbbca964b9b4 100644
--- a/sound/firewire/amdtp-stream.h
+++ b/sound/firewire/amdtp-stream.h
@@ -188,9 +188,7 @@ int amdtp_stream_set_parameters(struct amdtp_stream *s, unsigned int rate,
 				unsigned int data_block_quadlets);
 unsigned int amdtp_stream_get_max_payload(struct amdtp_stream *s);
 
-int amdtp_stream_start(struct amdtp_stream *s, int channel, int speed);
 void amdtp_stream_update(struct amdtp_stream *s);
-void amdtp_stream_stop(struct amdtp_stream *s);
 
 int amdtp_stream_add_pcm_hw_constraints(struct amdtp_stream *s,
 					struct snd_pcm_runtime *runtime);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
