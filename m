Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F23562521D2
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:19:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 965CF16B8;
	Tue, 25 Aug 2020 22:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 965CF16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598386774;
	bh=wgU52xAFzUzt6ogkPnIzI1HV5TvKgXRuGYHPulS501U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rWjS+pmkvNbN6OsPbRlg+ORNZKcdJULLr/PmGpc2ABT4jJ/3GT+nla+9cTYHdZTJz
	 GFLzZfGYUQQzREwzSzErAIELQPjZXWEyZqoYZkKD4W2H7SDN5xU9sQX5baRAS24ayB
	 rxC3lO1R2IXx6RaoSQH4Zsi4jQJfc3Mk1oOwOKjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD75BF8033F;
	Tue, 25 Aug 2020 22:11:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92D04F80329; Tue, 25 Aug 2020 22:11:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2B30F802E3
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2B30F802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ou1n83iI"
Received: by mail-qt1-x843.google.com with SMTP id e5so10015241qth.5
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6KCEXxjjMuztLh2ZKBk7fpQJO49EcBKsDSWHrcA1YjE=;
 b=ou1n83iINZVayZF+5/4NQ8fWcmYn+puyxhECrLBGA/9Pi6AeRazxDZUiLeIKBxV1xA
 W2ifKzkJIm0ZGrAzcZXGusOPXC2wpIPQF5tmAH2DYQ0LD9bWrsgRiDgmDfuCBJZtqupk
 5yS80YeXeOy1AetQnD6SAkmZeAeIjQ2BMcaG+4r/bWxLuyWsnl2VhszcJqhpaMpeNBPN
 FzEwnjyQOLb8Vx5165Dg8xGRxfR1MHE4l9On4VtUx1ZbTemuYEEXycZue40zUZycPPE8
 xQZJDf7DzIvAPAVPcmpnu90r4RmHEwV5WUZni3DHTeqgg1E/Slx6jy7bdFeEcuyh/ANh
 wpbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6KCEXxjjMuztLh2ZKBk7fpQJO49EcBKsDSWHrcA1YjE=;
 b=COvhn8fXXW4ss3X9vtrgw/qdRTcSXgl/0h+/tkiSw6F4BeQiCYD0D6RDHK5ex5mjt2
 cxnpFaDFm6abIXO0M59qAjjjanbeWchKMgsL0c+CWzXxwaYq4P46ipH1yIaON2VpYoRG
 PxT6D8FbYMTBr+7V9lLp5zOhkb5DOUJd2IoXFNGKwMyvem/i88WIy8GAR0b/QxGjwZR+
 AK/SVTSb2agshbfkJ9ODTREjOtr6UtEfPnPGUcv/2+pMtuK+aEPatcYHoiiwt6R+wmOH
 ptJF+sMEemL2o1UWVXeXU4WbTdh5kpRhI8LYNJUsZjSUSK92N7uuBmz7DHJFF86YE3Q0
 BmuQ==
X-Gm-Message-State: AOAM532c+MYdTDD4uT+5RQsi7tSW6sN0KUSpswdFqh8ZuTgDHHbEANti
 Lo5XeeSwa+dJTkl9SCS4v98=
X-Google-Smtp-Source: ABdhPJzxu5DKXVBCbp+1pCgWNh4/59iIAiqMthDfWcscPTmjm+6JuAQU4ZlvrVlesFetNCi9rol2Tw==
X-Received: by 2002:ac8:6c55:: with SMTP id z21mr10889848qtu.68.1598386282746; 
 Tue, 25 Aug 2020 13:11:22 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:22 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 12/20] ALSA: hda/ca0132 - Set AE-7 bools and select mixer.
Date: Tue, 25 Aug 2020 16:10:31 -0400
Message-Id: <20200825201040.30339-13-conmanx360@gmail.com>
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

Set the boolean values used for desktop cards, and select the desktop
mixer.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 6791aaf18e63..bd5d4f0bd6f5 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -9403,6 +9403,10 @@ static int patch_ca0132(struct hda_codec *codec)
 		spec->mixers[0] = desktop_mixer;
 		snd_hda_codec_set_name(codec, "Sound BlasterX AE-5");
 		break;
+	case QUIRK_AE7:
+		spec->mixers[0] = desktop_mixer;
+		snd_hda_codec_set_name(codec, "Sound Blaster AE-7");
+		break;
 	default:
 		spec->mixers[0] = ca0132_mixer;
 		break;
@@ -9413,6 +9417,7 @@ static int patch_ca0132(struct hda_codec *codec)
 	case QUIRK_SBZ:
 	case QUIRK_R3D:
 	case QUIRK_AE5:
+	case QUIRK_AE7:
 	case QUIRK_ZXR:
 		spec->use_alt_controls = true;
 		spec->use_alt_functions = true;
-- 
2.20.1

