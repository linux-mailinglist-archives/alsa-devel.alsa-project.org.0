Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8B957349A
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 12:50:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 958391703;
	Wed, 13 Jul 2022 12:49:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 958391703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657709434;
	bh=Mz8F6MA6JHUdDR6Na8NpZ8BO2P3BL5YxOuEKvEHjN0E=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PXfo2gmx75EG89JbBptSAVdCvgr0J4ES5R7y2y4E0To1IDw99sfWxZZrJoQ/yWdmT
	 YS2KVVL/TzseYgu7x+jDp+bUyAY0M4KcVUKRLIEvbtdlJYe8RRf+DZ+80YVK9MZoeH
	 KTtgmhkCnF//RK4AxqPVJSaBbqWvSMVg0zckwsPM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 090A3F80566;
	Wed, 13 Jul 2022 12:48:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57395F8055B; Wed, 13 Jul 2022 12:48:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DC68F8047B
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 12:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DC68F8047B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="Fr7IU1W9"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="X7k4Yt6m"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C8ED733B0F;
 Wed, 13 Jul 2022 10:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657709286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8MJ45r2MsP5AkjEd91CoXpS8Un3y+WzzinILPYTpmCk=;
 b=Fr7IU1W9WmfBKgsBRyVMnIJU4tQziezFF4KUHMOaakzEBOebWnXzF1gFjo326+4w8fJyB0
 qsZ3m4GYgJVd6RBe+X/JpDAxdEiWI6p0S+4RzB91fN/FUdpiscvDjQcFCgn3K8Zp31IOiS
 sp/m8rML42sEHEBxKLbewnMd8uG80DQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657709286;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8MJ45r2MsP5AkjEd91CoXpS8Un3y+WzzinILPYTpmCk=;
 b=X7k4Yt6mTT2+Aj0PQYxZdNgpexPkNFLk8rDjIH0EF7fDyJt8LUe4PXEmpanccTYbVNvSEB
 Fe5qpKRP9VePZiCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC65F13754;
 Wed, 13 Jul 2022 10:48:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aFZUKeaizmLceAAAMHmgww
 (envelope-from <tiwai@suse.de>); Wed, 13 Jul 2022 10:48:06 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ALSA: compress: Fix kernel doc warnings
Date: Wed, 13 Jul 2022 12:47:56 +0200
Message-Id: <20220713104759.4365-5-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220713104759.4365-1-tiwai@suse.de>
References: <20220713104759.4365-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Each kernel doc comment expects the definition of the return value and
the summary for each struct / enum in a proper format.  This patch
adds or fixes the missing entries for compress-offload API.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/compress_offload.h | 2 +-
 include/uapi/sound/compress_params.h  | 6 +++---
 sound/core/compress_offload.c         | 4 ++++
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 9555f31c8425..3aef123dbd7f 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -123,7 +123,7 @@ struct snd_compr_codec_caps {
 } __attribute__((packed, aligned(4)));
 
 /**
- * enum sndrv_compress_encoder
+ * enum sndrv_compress_encoder - encoder metadata key
  * @SNDRV_COMPRESS_ENCODER_PADDING: no of samples appended by the encoder at the
  * end of the track
  * @SNDRV_COMPRESS_ENCODER_DELAY: no of samples inserted by the encoder at the
diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index 79b14389ae41..726361716919 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -250,7 +250,7 @@ struct snd_enc_wma {
 
 
 /**
- * struct snd_enc_vorbis
+ * struct snd_enc_vorbis - Vorbis encoder parameters
  * @quality: Sets encoding quality to n, between -1 (low) and 10 (high).
  * In the default mode of operation, the quality level is 3.
  * Normal quality range is 0 - 10.
@@ -279,7 +279,7 @@ struct snd_enc_vorbis {
 
 
 /**
- * struct snd_enc_real
+ * struct snd_enc_real - RealAudio encoder parameters
  * @quant_bits: number of coupling quantization bits in the stream
  * @start_region: coupling start region in the stream
  * @num_regions: number of regions value
@@ -294,7 +294,7 @@ struct snd_enc_real {
 } __attribute__((packed, aligned(4)));
 
 /**
- * struct snd_enc_flac
+ * struct snd_enc_flac - FLAC encoder parameters
  * @num: serial number, valid only for OGG formats
  *	needs to be set by application
  * @gain: Add replay gain tags
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index cf415fe231ed..243acad89fd3 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -818,6 +818,8 @@ static void error_delayed_work(struct work_struct *work)
  * Stop the stream and set its state.
  *
  * Should be called with compressed device lock held.
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_compr_stop_error(struct snd_compr_stream *stream,
 			 snd_pcm_state_t state)
@@ -1164,6 +1166,8 @@ static int snd_compress_dev_free(struct snd_device *device)
  * @dirn: device direction, should be of type enum snd_compr_direction
  * @id: ID string
  * @compr: compress device pointer
+ *
+ * Return: zero if successful, or a negative error code
  */
 int snd_compress_new(struct snd_card *card, int device,
 			int dirn, const char *id, struct snd_compr *compr)
-- 
2.35.3

