Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1082D2521ED
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B797C16AA;
	Tue, 25 Aug 2020 22:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B797C16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598387059;
	bh=Y10HF6MxCAdDnkM2Q6e8Z/U/mX4tcKG6wTEz0kxuWc8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YLvv9EtImsNJHcJRuNBGLUyY7OIZurm3ypJZcOA726+E9OrAPOH9Z1g+6xSidv0Fh
	 VF5r64Mx1lByxCgRrRb7VzkbJIm6LxchrTGsSK9uc/vzTzvStlezg3NtmD4GggaywT
	 Ut6c/D+ax9Mc/8v9b5rBXMsl37OcCNIC1nvDmXjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40A8BF80384;
	Tue, 25 Aug 2020 22:11:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7C72F80339; Tue, 25 Aug 2020 22:11:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4F5DF80332
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4F5DF80332
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LsC5rdn+"
Received: by mail-qv1-xf43.google.com with SMTP id w2so62243qvh.12
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/YG2y7YYQKcyizD32v+alkIg1GqrI1eey3uzGqUNIM=;
 b=LsC5rdn+JKeGTf0RY5xS6/YJy14TwVDXsYPwLnT70X+6Ql3ErrgsjybUvYsjd4CZSb
 2XCZLBy9whZP7kJ3DhpkEn4Pqg7dV+p/06m1nOn6gFaai7pONHDukOrZ1BW6yT7sgGQM
 E2MXZQMClifMICbIm8xsLsDJnAtVIQ6Z9AKup2xLGlxrLGE1Ty7JmqbHp5GY1iV3/kDW
 hd0VW9t5eKFcKJbzuqYZCXLfU1lES6dAP171rg4VjXaYCd3n+Ka+qTwKWlULrc2QaVWm
 QCqcGUcsKvlB0juz41pmJzSrk1tJeBW6k4+joY3hM9GOg2z7qj2wrBlN+Ai9ww+rhA4U
 c38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/YG2y7YYQKcyizD32v+alkIg1GqrI1eey3uzGqUNIM=;
 b=slm4aqMk0C0jmIJzpFZU217AuCQM5K4cb5s3Fw78IGxjuLN7wJAH+ZqKEJtKzLSqxn
 jopgW1hSIsTmR+EnL8eU+myQ/0KRDgMMWr6LFVOe727p7V2hU1PkMfRP3FOqt8wsR5PS
 7h2CwQD6RCFRZ9XtokJboyf4WV+32UR/Q7AMF/Aw5FwRGbj7TgsXN+KA/5Dg0maRLlQj
 R2omuJPyNYpWNFAe9GL8xCqdBqP7dujeJYy+OGlm1t5/l+qYrWp2px6sWEtm8AI07Vs+
 pzaThcCWlISAiyeqx4V5WQfT10J2qDWVP8Nnc57kx2q6Qe++gNsg+qbrpep1e04wRR8p
 kwwg==
X-Gm-Message-State: AOAM531arP51JRbbmq3sv/CASQp/9NJFfPH+8GmP3uezENZ27gD3F+gf
 sut9cKYAPOUg6YiMkFSu5FE=
X-Google-Smtp-Source: ABdhPJyIaDklSy5krYwDL1p2YCpM3OTQpYvynxWvLZOffa9sOD4vm46sbJdLPf4Hu90lF0UvHeJ/lw==
X-Received: by 2002:a0c:f505:: with SMTP id j5mr11017299qvm.166.1598386298988; 
 Tue, 25 Aug 2020 13:11:38 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:38 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 20/20] ALSA: hda/ca0132 - Add AE-7 exit commands.
Date: Tue, 25 Aug 2020 16:10:39 -0400
Message-Id: <20200825201040.30339-21-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200825201040.30339-1-conmanx360@gmail.com>
References: <20200825201040.30339-1-conmanx360@gmail.com>
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
index 52f6d3740e0a..9779978e4bc7 100644
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

