Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E695FAC20
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 08:06:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9071436C9;
	Tue, 11 Oct 2022 08:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9071436C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665468406;
	bh=NlhJ6okbqsCGo8TIxByw29mDvnFR5SIrRBUphDo94OI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qmgEawmiPGfj3nqwBkhZFiQQpDA43KJgZsjSvZt2tJ+50/Sb3ngXTXAOoofcVEw8c
	 jO1UxMPglAt1Lp23oftnc+PiJKJnZbVQfb3pAMsdDR6bqzvLoFIyF/D/XBbQw3+hpq
	 sSXC717EJEhWvFLkbBTJNnPkB5IznkTX0rlydatY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 197EEF805A9;
	Tue, 11 Oct 2022 08:02:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20646F8032B; Mon, 10 Oct 2022 20:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AA17F800B8
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 20:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AA17F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SXLeDxlZ"
Received: by mail-wr1-x42e.google.com with SMTP id j16so18312554wrh.5
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lgjnL3yJFZCJQlhIdQSv+6Wq7/0/ChyARgbD78LiZt8=;
 b=SXLeDxlZKzSU20+a1UbGy9WlYL5HM66nyKdRI3rS8adCzdjWbQjdfSM6pFIjOKxC3K
 Hw3SOxN6gkB4nN8G3h64shQfIxCmFuICQPh23XefWS0K81lMRqK4TAHi47C9XXM17/lo
 nSvEuS8q8yx+Hx6SGD34zXeoy/rRI/NsEA2u1TvUDvV8DbhV8RaMIUlaCa6UJUoA3lVw
 5ukssilKa8N5j3Jt+rFFtDlap8le9+q/wjJsS8aKw9gyHLLTgTDBRKz8ecS3FOfj5kPK
 4TO358e85so4OdepYeEqlmgKrEk245q1BpAfRzqLcQVvSbAva59OA/mu1Zg3WQEblfnq
 JZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lgjnL3yJFZCJQlhIdQSv+6Wq7/0/ChyARgbD78LiZt8=;
 b=n9Bcyi5QsMFi+FvVfE774ztvpGCSltxntPBc4FHbMzG9KpPc8h1vQ9rbDbRCirXllP
 6QlACTnR9nZrCBBGuvIoezUyf6IgC5GKV8IGaA7tayW2svJRbKvBdZd7o6ydhoVV2ouf
 Nc4LNvMzrO48hyI0I7j/PyaIstOefuafC2RnHvPHiiFJ/u5kZPr9yvP+WhDqmK9pcVmO
 PGbzqhv0CJr0xaRjvbLe1yTOEg05UQ3zyEKAF3WuevS9I5qjMwU+dC/CUaZ+9l7CFPu+
 FWwibBNzrVe/8Lz347Rs05V//K0hwGs8yjvnI5Kex1vU45CX/ruRcrM7wiyYN06hhdQg
 qshw==
X-Gm-Message-State: ACrzQf3XYBIw+WujA5jBXIzp1DzAugYa7d45L6tNsPoPwJrU1AROpITa
 LQOwXNXZh5PlW8VUpCqdMUU=
X-Google-Smtp-Source: AMsMyM5WpCK09mLrSkdRSBj2tSAXxmmJ0WSK7QFNuuMenex8WRursQD9ixHa29Ngvj2NqkAWQBju3A==
X-Received: by 2002:a5d:588f:0:b0:22a:fe0c:afb8 with SMTP id
 n15-20020a5d588f000000b0022afe0cafb8mr13243806wrf.431.1665428098355; 
 Mon, 10 Oct 2022 11:54:58 -0700 (PDT)
Received: from hp-power-15.localdomain
 (mm-126-34-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.34.126])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a5d6142000000b00230c9d427f9sm2082272wrt.53.2022.10.10.11.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 11:54:57 -0700 (PDT)
From: Siarhei Volkau <lis8215@gmail.com>
To: 
Subject: [PATCH v2 5/6] ASoC: codecs: jz4725b: use right control for Master
 Playback
Date: Mon, 10 Oct 2022 21:54:22 +0300
Message-Id: <20221010185423.3167208-6-lis8215@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221010185423.3167208-1-lis8215@gmail.com>
References: <Y0P/u4pJT8rup8Za@sirena.org.uk>
 <20221010185423.3167208-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 11 Oct 2022 08:02:21 +0200
Cc: alsa-devel@alsa-project.org, linux-mips@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>, Siarhei Volkau <lis8215@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

At the moment DAC control is used as Master Playback control, this is
incorrect as DAC's output goes to a Mixer.

The Mixer couples analog input from 4 sources (DAC, Line In, Mic 1,
 Mic 2) each input has its own gain & mute controls.

Output of the Mixer goes to Output Stage control which is the best suite
for the new Playback Master. However, it doesn't have mute capability.

The patch implements Output Stage control as a new master and renames
old Master to DAC. Rest of mixer inputs will be implemented in the next
patch in the series.

Manual states that Output stage control (16.6.3.5 Programmable output
amplifier: PGAT) gain varies from -33.5dB to +4.5dB, gain step isn't
fixed and has 3 opts.

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
---
 sound/soc/codecs/jz4725b.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 3f9bbd79d..6614c5e37 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -136,6 +136,12 @@ enum {
 #define REG_CGR3_GO1L_OFFSET		0
 #define REG_CGR3_GO1L_MASK		(0x1f << REG_CGR3_GO1L_OFFSET)
 
+#define REG_CGR8_GOR_OFFSET		0
+#define REG_CGR8_GOR_MASK		(0x1f << REG_CGR8_GOR_OFFSET)
+
+#define REG_CGR9_GOL_OFFSET		0
+#define REG_CGR9_GOL_MASK		(0x1f << REG_CGR9_GOL_OFFSET)
+
 #define REG_CGR10_GIL_OFFSET		0
 #define REG_CGR10_GIR_OFFSET		4
 
@@ -147,9 +153,14 @@ struct jz_icdc {
 
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_adc_tlv,     0, 150, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_SCALE(jz4725b_dac_tlv, -2250, 150, 0);
+static const SNDRV_CTL_TLVD_DECLARE_DB_RANGE(jz4725b_out_tlv,
+	 0, 11, TLV_DB_SCALE_ITEM(-3350, 200, 0),
+	12, 23, TLV_DB_SCALE_ITEM(-1050, 100, 0),
+	24, 31, TLV_DB_SCALE_ITEM(  100,  50, 0),
+);
 
 static const struct snd_kcontrol_new jz4725b_codec_controls[] = {
-	SOC_DOUBLE_TLV("Master Playback Volume",
+	SOC_DOUBLE_TLV("DAC Playback Volume",
 		       JZ4725B_CODEC_REG_CGR1,
 		       REG_CGR1_GODL_OFFSET,
 		       REG_CGR1_GODR_OFFSET,
@@ -160,7 +171,13 @@ static const struct snd_kcontrol_new jz4725b_codec_controls[] = {
 		       REG_CGR10_GIR_OFFSET,
 		       0xf, 0, jz4725b_adc_tlv),
 
-	SOC_SINGLE("Master Playback Switch", JZ4725B_CODEC_REG_CR1,
+	SOC_DOUBLE_R_TLV("Master Playback Volume",
+			 JZ4725B_CODEC_REG_CGR9,
+			 JZ4725B_CODEC_REG_CGR8,
+			 REG_CGR8_GOR_OFFSET,
+			 0x1f, 1, jz4725b_out_tlv),
+
+	SOC_SINGLE("DAC Playback Switch", JZ4725B_CODEC_REG_CR1,
 		   REG_CR1_DAC_MUTE_OFFSET, 1, 1),
 
 	SOC_SINGLE("Deemphasize Filter Playback Switch",
-- 
2.36.1

