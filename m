Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 368746776A2
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 09:46:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60F931CF;
	Mon, 23 Jan 2023 09:45:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60F931CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674463584;
	bh=IWzHSKDutY57ttpTf3ANVNFzATdomb1H5EJNNtEGG1Y=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=FFBbQZhDbHV/F3KaIOhyJmZkxSwe6JgMofxd0dZB8uxzHi9wN7Bxxt2DTbGObXf1a
	 6EMqDkIUbSN53930y8FQSwUhQBHYW0YPfNdwB7g7vy1YVRdjdD8wFtaSprX2ub2Qtm
	 UR4FJsNnAe8zSA3raIRU9jVCZomIquyv+j7WcRpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9495F80589;
	Mon, 23 Jan 2023 09:42:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F105F8027D; Sun, 22 Jan 2023 22:07:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA799F80254
 for <alsa-devel@alsa-project.org>; Sun, 22 Jan 2023 22:07:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA799F80254
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Rrp4V89f
Received: by mail-wm1-x32e.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso3631156wmb.0
 for <alsa-devel@alsa-project.org>; Sun, 22 Jan 2023 13:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kCboDqVUUsDGgqRY72gSPVjixyNxdK1vSMMQPv4p8+U=;
 b=Rrp4V89fMuHgqiVMQpLfX9L+gVN/BTlzKsOMTLGHxO64PcM80m8UGAdVQ8cZ5c/bQp
 /Sb2lyij/Yik7BMMrFfxW0P2IV2KQyuAGWzy4bOiEJTLT4WopzSnucHyyD2GpkMvR2KT
 5PNwcObQx7VMkdkeKOW60V4R/9+JjzxRzAPqzwRf92rE69PRTh66MpJO5lYdatMcYBUH
 be8wuku3jJmGyKXmMRdy/92j2sbVKXm1LEgQnK8GkejiYYhfYn60ht6Ee0jxVfPzzFMQ
 M5G0mdTcmWVQUboTwALFhSJ+02+g9aGVHOS8Nw185wSicZNWhW39fh4iLNg5ExPP28Ee
 dzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kCboDqVUUsDGgqRY72gSPVjixyNxdK1vSMMQPv4p8+U=;
 b=otPLqp5zCh+v/E7+6L0nJ/OberAZ9lE9rknczdXRKVDE5KlrhSIh+PwrCCbS+v07Ae
 jaAoU0hmb9Bt6yR5tG2T8I7YrxNmLWGLmJHXJ3AXZ5zERQFBSAQt72FhPQqVf57ZIrzt
 o+IyaLS8+JymSzr1jKZCgcNp0Wug2THLWMAC3pjRGouHHhsaiqJswf4xbpiivJLDuM6K
 XE737pEopWR08hpsr/es5dCM2tpMoSz/WPIA0vtYMtbv7o27PIQ0UGZazrpz7Y2zM1dW
 JzkCP8FSEXWfTSJPrA79Vj3JVnJmwtRxgtJTPZuRGpvM4gwcJy94WKPCjRdMgSDVB97V
 IxxA==
X-Gm-Message-State: AFqh2kpRtcvFfaMkZ/PaMOXldNOpKhzLaZzPAi3Xxk9K49vjE+YMCHfl
 bnn1UgVY8fc6hmeFaDuK0Xc=
X-Google-Smtp-Source: AMrXdXvQBrFKD6GvoZiyZVRXF/33cCqAKT8qkp6S0xHaAhZoxpWRnjl+rlHCvaeLceU3E2GMR1K9GA==
X-Received: by 2002:a05:600c:4e0f:b0:3db:3695:11b4 with SMTP id
 b15-20020a05600c4e0f00b003db369511b4mr9093682wmq.33.1674421629518; 
 Sun, 22 Jan 2023 13:07:09 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-43c0-f52a-beed-541b.rev.sfr.net.
 [2a02:8428:46a0:7c01:43c0:f52a:beed:541b])
 by smtp.gmail.com with ESMTPSA id
 o21-20020a05600c4fd500b003c6f8d30e40sm9822404wmq.31.2023.01.22.13.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Jan 2023 13:07:09 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-mips@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs/jz4760: add digital gain controls
Date: Sun, 22 Jan 2023 22:07:03 +0100
Message-Id: <20230122210703.2552384-1-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Jan 2023 09:42:43 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Both the DAC and ADC have digital gain controls available
for their mixers, which go from -31 to 0db by step of 1db.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
---
 sound/soc/codecs/jz4760.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/codecs/jz4760.c b/sound/soc/codecs/jz4760.c
index d96a4f6c9183..9df58e23d360 100644
--- a/sound/soc/codecs/jz4760.c
+++ b/sound/soc/codecs/jz4760.c
@@ -287,6 +287,7 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(dac_tlv, -3100, 100);
 static const DECLARE_TLV_DB_SCALE(adc_tlv, 0, 100, 0);
 static const DECLARE_TLV_DB_MINMAX(out_tlv, -2500, 100);
 static const DECLARE_TLV_DB_SCALE(linein_tlv, -2500, 100, 0);
+static const DECLARE_TLV_DB_MINMAX(mixer_tlv, -3100, 0);
 
 /* Unconditional controls. */
 static const struct snd_kcontrol_new jz4760_codec_snd_controls[] = {
@@ -299,6 +300,14 @@ static const struct snd_kcontrol_new jz4760_codec_snd_controls[] = {
 			 JZ4760_CODEC_REG_GCR4, JZ4760_CODEC_REG_GCR3,
 			 REG_GCR_GAIN_OFFSET, REG_GCR_GAIN_MAX, 1, linein_tlv),
 
+	SOC_SINGLE_TLV("Mixer Capture Volume",
+		       JZ4760_CODEC_REG_MIX1,
+		       REG_GCR_GAIN_OFFSET, REG_GCR_GAIN_MAX, 1, mixer_tlv),
+
+	SOC_SINGLE_TLV("Mixer Playback Volume",
+		       JZ4760_CODEC_REG_MIX2,
+		       REG_GCR_GAIN_OFFSET, REG_GCR_GAIN_MAX, 1, mixer_tlv),
+
 	SOC_SINGLE("High-Pass Filter Capture Switch",
 		   JZ4760_CODEC_REG_CR4,
 		   REG_CR4_ADC_HPF_OFFSET, 1, 0),
-- 
2.39.0

