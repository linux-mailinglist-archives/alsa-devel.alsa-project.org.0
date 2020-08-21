Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E7C24E076
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 21:07:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B3A51698;
	Fri, 21 Aug 2020 21:06:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B3A51698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598036828;
	bh=igdG24kX99t0ahMe77cqUREklUBVsPaleN/EdGplyUc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VDQSaU+XWd7Z9JanaQMF/6YdFb3YAmgBUc2DFiu7VVKrRYtUrnMJSOlIpA7jUC6lE
	 BCVlBUnc5yqLyfHemyLFQokNVUoTHV3rzFPYDMrpGuwp8r0n5TbEYztDoLoDC2DKN9
	 B966+kwxOoc7E13YzXUgfNM0o9SZCB8DbEi3InMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE497F8038D;
	Fri, 21 Aug 2020 20:54:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DBCDF80328; Fri, 21 Aug 2020 20:54:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 404C7F802FD
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:54:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 404C7F802FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Gg5bZtNE"
Received: by mail-qk1-x743.google.com with SMTP id u3so2261529qkd.9
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+7lmgRcS/6fJp6h5ROUarTA7VyvP90YaETxkd0V3RrY=;
 b=Gg5bZtNErShDFFliPCKHJSHXYpOYbTHAPgKnjGKH7Zh5psQoONprAgu2PZDZAHs7jO
 GGt/Mr1vvLjFMeBFzVhkXEH0tZvddFX0ptPH15Ttcrp3AvKnaWJEe2AXKdP2MUmAJMAN
 91lef8AX6/3GKeLUVM6JFYvYxYsGa+swb+POOiMfJBFAnKQjipsB0HVljr6SNOXhZ4wi
 knhvroQk4W0HEHPtjLHSTgbRA8iO6kuyQB6iblPHdxIdiayMDfEv1CLOricB7Fp8awb0
 AwllXhunB8EOrsiyovQb3UicmRbyugu8gAkyEcMrLpyDYVmCk40V1+ved5X9E7SVl3N5
 SSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+7lmgRcS/6fJp6h5ROUarTA7VyvP90YaETxkd0V3RrY=;
 b=ugJX7HTt7z7yH+E3QQeJyBHS1jbzmusH0MR4Uc8PDgrh582O0hwAAXyzkI+ABBf0Qe
 azqZPWUuMpGgnPQ5/7ltXC8uQh0Ps2ksH4RZbNkaEaiHhBdu0yChTQF/LGTVu9JFrDDZ
 Iht0qOxFESyzAhyaZhfecuEy1FMucoirbUSJr34ZwI/FN8c2+JhJGkm2cMT5o3Af0yCQ
 491BoDV0ftET/BTAqTfg1tY4n/LH1ViuYzNIkwTOhKfofmQl/3G8YW0B6J9ykVSaXOiK
 t6GQ9MwiVD5LK1TS/3tYKJ/nLl5M8iVYTXfAlFBG38qtOsJShsMJ3Q81/M82Bh6Wobiv
 BZtw==
X-Gm-Message-State: AOAM533moWr1cRgj8Z6/BVL6wwr3su5oh+PMB6aqtJ1RB1aR101NJM0L
 ezslgg0TjA1rt82BMCu9pyM=
X-Google-Smtp-Source: ABdhPJzLNHO6gRBGrFLUhGPu/Ih6ZLGxsDG8HffwpSpchiVDouTbRlCpvrfSdr0/MuufzA2SGnC+6w==
X-Received: by 2002:a05:620a:1523:: with SMTP id
 n3mr3892360qkk.245.1598036058814; 
 Fri, 21 Aug 2020 11:54:18 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id o72sm2468426qka.113.2020.08.21.11.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:54:18 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 20/20] ALSA: hda/ca0132 - Add AE-7 exit commands.
Date: Fri, 21 Aug 2020 14:52:37 -0400
Message-Id: <20200821185239.26133-21-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200821185239.26133-1-conmanx360@gmail.com>
References: <20200821185239.26133-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, conmanx360@gmail.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
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

Add exit commands for the AE-7.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 9c70d85b21e0..4d26440eceb0 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -8838,6 +8838,32 @@ static void ae5_exit_chip(struct hda_codec *codec)
 	snd_hda_codec_write(codec, 0x01, 0, 0x724, 0x83);
 }
 
+static void ae7_exit_chip(struct hda_codec *codec)
+{
+	chipio_set_stream_control(codec, 0x18, 0);
+	chipio_set_stream_source_dest(codec, 0x21, 0xc8, 0xc8);
+	chipio_set_stream_channels(codec, 0x21, 0);
+	chipio_set_control_param(codec, CONTROL_PARAM_NODE_ID, 0x09);
+	chipio_set_control_param(codec, 0x20, 0x01);
+
+	chipio_set_control_param(codec, CONTROL_PARAM_ASI, 0);
+
+	chipio_set_stream_control(codec, 0x18, 0);
+	chipio_set_stream_control(codec, 0x0c, 0);
+
+	ca0113_mmio_command_set(codec, 0x30, 0x2b, 0x00);
+	snd_hda_codec_write(codec, 0x15, 0, 0x724, 0x83);
+	ca0113_mmio_command_set_type2(codec, 0x48, 0x07, 0x83);
+	ca0113_mmio_command_set(codec, 0x30, 0x30, 0x00);
+	ca0113_mmio_command_set(codec, 0x30, 0x2e, 0x00);
+	ca0113_mmio_gpio_set(codec, 0, false);
+	ca0113_mmio_gpio_set(codec, 1, false);
+	ca0113_mmio_command_set(codec, 0x30, 0x32, 0x3f);
+
+	snd_hda_codec_write(codec, 0x01, 0, 0x793, 0x00);
+	snd_hda_codec_write(codec, 0x01, 0, 0x794, 0x53);
+}
+
 static void zxr_exit_chip(struct hda_codec *codec)
 {
 	chipio_set_stream_control(codec, 0x03, 0);
@@ -9457,6 +9483,9 @@ static void ca0132_free(struct hda_codec *codec)
 	case QUIRK_AE5:
 		ae5_exit_chip(codec);
 		break;
+	case QUIRK_AE7:
+		ae7_exit_chip(codec);
+		break;
 	case QUIRK_R3DI:
 		r3di_gpio_shutdown(codec);
 		break;
-- 
2.20.1

