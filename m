Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A112521EA
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:23:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37F6B16C7;
	Tue, 25 Aug 2020 22:22:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37F6B16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598386993;
	bh=szuNKAgkYT+TQfIGw71gUSENj7MHo65z1qImg5hqvgk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XyIcxltnylTu1abJjoge/O57+jfaowdEuG3xxqxf6YdZt1qTuAFXrjmA1MxIfvIjK
	 knrtF4n7fY/4dURVjfsY4FdAhDHv4pt570/4dfqMy53QG0N3BG1u1UVGuqiHTWT4Xz
	 3O+cy+g7Db8x5JEyaLflLaudHRG8JpIQxmY/9ujM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC15FF80371;
	Tue, 25 Aug 2020 22:11:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7210CF80335; Tue, 25 Aug 2020 22:11:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 096D7F80329
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 096D7F80329
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="imQNwuyL"
Received: by mail-qt1-x841.google.com with SMTP id k18so10004764qtm.10
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M8q6dm5mmw5Td1zETyvacyXoL82xchupi74RSawN6Ew=;
 b=imQNwuyLRMz5z0nzGwpPGnvNRsiTUDsrlb+zOR2FcUlFwU250vFohtXoCv4nlWk+Wx
 eTYcFbLTxBF8JzPhxleqYGePOa53egjh2l9A/4rS6xW4Rr9Z1VP1PadByPS9eex02Gfm
 C1lfqMvVAAsHKiwsX1mSceREoHLK1Tc5b/NK3poSMbhDZPQigQgL91raIs6kRFwgZKZ1
 upvFSlKAZuvFZ1vaweFxvMmxoeJrPKOS172nOqF7wZxnnJu4R+GdBbjCYzFn1TTeiQUP
 8Ta9i3hjBbm/m+aSulhS7O402Dy6kg03KjCGk2YS8x68Mngnko2geUs5ApYQsTcisz2x
 4hHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M8q6dm5mmw5Td1zETyvacyXoL82xchupi74RSawN6Ew=;
 b=eVzJ+7TtSxBwCbBr/pfxMwueeSGDC2vpaggW9ySumrz24VPww5vncmUTl0Jrud30QL
 Casf0iMlZWtvZFqiR+me5KuT4Gi5WHTwL6ArFcGFOiw4ylvXWtfauvpuVBtrfyEP34ds
 AFATkXmkJh1QAWoJSYftnCavvvqIzcczEObqNAIzXqXHh1EOd8uTVp5zIxnSDfOmySlX
 mTCjNCc3V4jAbBUXdkvRMn/Y/unyZXOo7RGv2TOyZw6u64t8QMBvHpgbQzzz7OteOSvT
 OTD+ALtMAEgKi47TZfjj8pNRdxSRPc9SdI8UtNxsYtr9NKFqGdGKvGswiBPV8JQrbGUf
 XvCw==
X-Gm-Message-State: AOAM532T2uvF8FDgJ4vttix3L8BCG/QnMl2lWRvEQhCodSkDSxroeXpl
 b81Bdf/5rlvjQjYPWIC58+o=
X-Google-Smtp-Source: ABdhPJx39Ct45gM/LOal2j67L7+GsQQ64KOaqVJApGUDQWFazLfIF2VZeVgHVOeJe8XD/oYWuABbeA==
X-Received: by 2002:ac8:5546:: with SMTP id o6mr10591181qtr.211.1598386296965; 
 Tue, 25 Aug 2020 13:11:36 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:36 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 19/20] ALSA: hda/ca0132 - Add AE-7 custom controls.
Date: Tue, 25 Aug 2020 16:10:38 -0400
Message-Id: <20200825201040.30339-20-conmanx360@gmail.com>
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

Add headphone gain and DAC filter controls, which use the same commands
as the AE-5. Also, change input source enumerated control item count to
exclude front microphone.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 8c6e38734489..52f6d3740e0a 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -5839,6 +5839,13 @@ static int ca0132_alt_input_source_put(struct snd_kcontrol *kcontrol,
 	int sel = ucontrol->value.enumerated.item[0];
 	unsigned int items = IN_SRC_NUM_OF_INPUTS;
 
+	/*
+	 * The AE-7 has no front microphone, so limit items to 2: rear mic and
+	 * line-in.
+	 */
+	if (ca0132_quirk(spec) == QUIRK_AE7)
+		items = 2;
+
 	if (sel >= items)
 		return 0;
 
@@ -7029,20 +7036,25 @@ static int ca0132_build_controls(struct hda_codec *codec)
 		}
 	}
 
-	if (ca0132_quirk(spec) == QUIRK_AE5) {
+	switch (ca0132_quirk(spec)) {
+	case QUIRK_AE5:
+	case QUIRK_AE7:
 		err = ae5_add_headphone_gain_enum(codec);
 		if (err < 0)
 			return err;
 		err = ae5_add_sound_filter_enum(codec);
 		if (err < 0)
 			return err;
-	}
-
-	if (ca0132_quirk(spec) == QUIRK_ZXR) {
+		break;
+	case QUIRK_ZXR:
 		err = zxr_add_headphone_gain_switch(codec);
 		if (err < 0)
 			return err;
+		break;
+	default:
+		break;
 	}
+
 #ifdef ENABLE_TUNING_CONTROLS
 	add_tuning_ctls(codec);
 #endif
-- 
2.20.1

