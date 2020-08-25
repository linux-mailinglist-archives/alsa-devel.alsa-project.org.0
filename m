Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B89292521D1
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:19:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 647B4169A;
	Tue, 25 Aug 2020 22:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 647B4169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598386752;
	bh=Ok4MROe0A3eiouy/+ihCQHQvlNg57o3Y3hYGntOYG3c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AHBJfRZLfPiyu7kTQWdWUFU4LQJLXfJQKSVrt2/u5yfVMkTyTLZLquGnfTEru1dLw
	 X29ujsd/suhPNlIyww2A6a+Uv3nJ29z6LAt7n4Rk+ZK08PYIRiNVmA8nDOD7eAZonj
	 Hf7cSnSyBrfMNpdII0rozQVQX/eiQyyXZ96D5yco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A32DEF80338;
	Tue, 25 Aug 2020 22:11:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26FCAF80323; Tue, 25 Aug 2020 22:11:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D80D9F802FD
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D80D9F802FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WfEif/1s"
Received: by mail-qt1-x842.google.com with SMTP id e5so10015146qth.5
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CK7w9dc4QEie3FM7RAdOzFBvSfRdAgHCNQ27lrrbOwc=;
 b=WfEif/1s1wQfKX0K3003AOn/g06TpEbch7S5cExqpsGTPF6AqIRGubrr0PaZApSwjr
 iZHE8eWRZKBf79M7xtGaLse3bY18ralBifMC7HzOvqZ5JUVYTXC3z8GkttBMrQ8sFBIU
 /swcSznR3mbIvuQiOEBc+RkZmJopRdLznTGJ9b3ikamAv+08G5Rl/c6m/rus/WAeDSxB
 j6rOXCusGzdsqBL4399j2rAQx/xii0/Pm9ELnczTo0zC+kTgeVoobx3jaT/JBgtanQ0k
 vwAnwBEMaoFoIvTY/DTUsLGYBM4S9BJwoVkTCCBHKt/TdHuOZTJxubfHA1Aw14qiuYDV
 hlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CK7w9dc4QEie3FM7RAdOzFBvSfRdAgHCNQ27lrrbOwc=;
 b=lJdjSXVNsxtabQV+LczbD5/gUenobgciqGwYsmVPrsK4udw/f7iWz7R+0tk/YS2DMl
 fYi3YDLChVmwqytjssNwsryFjb3FWuny+XtMUeH9XNlERiEHkByYGimnNdWxZCYB9a4M
 0PiFdsYN/HLsgp2OCeWd3nAG+Kkz66iyLaRCKFz6z4ed0Yaeoww5WIQQfF/PcjK4GDHO
 JSHOlkEEznaaL54B/ORCnTd1N7ILTN3XHnGURmoTWgrssOJ0ceOlLLtnoaKaOuYr/e5C
 52OzzBBgRths4DFCCeB+tMj8jmRpJcYotYqPZgsSW/UPPRmsmEGtC+69xIyuH8gRpMd3
 eRow==
X-Gm-Message-State: AOAM5304WwOEg0EdnoMYEgqlTbE9CVpPodVuKa+lHTW9s+oA2kGJH/LS
 zzD4cF4LxcwbEZ/WJh2Eh0g=
X-Google-Smtp-Source: ABdhPJyvJM4iHOoReBTxyCWr9WSwa4ON8hLoyGqE+zrFQQmkldJAHqDDiTqX3ggU/xngnufmn//E7A==
X-Received: by 2002:ac8:4643:: with SMTP id f3mr11144298qto.128.1598386280785; 
 Tue, 25 Aug 2020 13:11:20 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:20 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 11/20] ALSA: hda/ca0132 - Add SoundBlaster AE-7 pincfg.
Date: Tue, 25 Aug 2020 16:10:30 -0400
Message-Id: <20200825201040.30339-12-conmanx360@gmail.com>
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

Add AE-7 pincfg, based on the values set within Windows.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 284f63dc2749..6791aaf18e63 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1238,6 +1238,20 @@ static const struct hda_pintbl r3di_pincfgs[] = {
 	{}
 };
 
+static const struct hda_pintbl ae7_pincfgs[] = {
+	{ 0x0b, 0x01017010 },
+	{ 0x0c, 0x014510f0 },
+	{ 0x0d, 0x414510f0 },
+	{ 0x0e, 0x01c520f0 },
+	{ 0x0f, 0x01017114 },
+	{ 0x10, 0x01017011 },
+	{ 0x11, 0x018170ff },
+	{ 0x12, 0x01a170f0 },
+	{ 0x13, 0x908700f0 },
+	{ 0x18, 0x500000f0 },
+	{}
+};
+
 static const struct snd_pci_quirk ca0132_quirks[] = {
 	SND_PCI_QUIRK(0x1028, 0x057b, "Alienware M17x R4", QUIRK_ALIENWARE_M17XR4),
 	SND_PCI_QUIRK(0x1028, 0x0685, "Alienware 15 2015", QUIRK_ALIENWARE),
@@ -9105,6 +9119,10 @@ static void ca0132_config(struct hda_codec *codec)
 		codec_dbg(codec, "%s: QUIRK_AE5 applied.\n", __func__);
 		snd_hda_apply_pincfgs(codec, ae5_pincfgs);
 		break;
+	case QUIRK_AE7:
+		codec_dbg(codec, "%s: QUIRK_AE7 applied.\n", __func__);
+		snd_hda_apply_pincfgs(codec, ae7_pincfgs);
+		break;
 	default:
 		break;
 	}
@@ -9186,6 +9204,7 @@ static void ca0132_config(struct hda_codec *codec)
 		spec->dig_in = 0x09;
 		break;
 	case QUIRK_AE5:
+	case QUIRK_AE7:
 		spec->num_outputs = 2;
 		spec->out_pins[0] = 0x0B; /* Line out */
 		spec->out_pins[1] = 0x11; /* Rear headphone out */
-- 
2.20.1

