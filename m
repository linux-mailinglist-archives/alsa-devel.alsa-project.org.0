Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA92D3AF4D3
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:20:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5046B1741;
	Mon, 21 Jun 2021 20:19:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5046B1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299625;
	bh=UhTZsYzhUdlEliU2/OiZ3hZdAFB95g/ChwcL0/nvWOE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C8VcvJ2IgEb13SY4+Z0X/f5UKim8e8hphspaATvsMHecR49KfHk5jxfrNarKJKI/Z
	 cAKZEl4Wx1NH8s8fh8hNAYfGA7BCiVWUEpxym3BnDez6CVgSnjphVynDWEnRGlUa2t
	 Y2SfXmvdLZjP3jV49lFB8NSnzdXf12/2cCTOmNKs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 531BEF805C5;
	Mon, 21 Jun 2021 20:10:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2553DF804B0; Mon, 21 Jun 2021 20:10:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20DE0F805AB
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:10:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20DE0F805AB
Received: by m.b4.vu (Postfix, from userid 1000)
 id 9D55761E5F19; Tue, 22 Jun 2021 03:40:08 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:40:08 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 27/31] ALSA: usb-audio: scarlett2: Add sw_hw_ctls and mux_ctls
Message-ID: <264f1171f618e84d0f3b6f76a6af7e4497c20481.1624294591.git.g@b4.vu>
References: <cover.1624294591.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624294591.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

Save the struct snd_kcontrol pointers for the sw_hw and mux controls.
This is in preparation for speaker switching support which needs to be
able to update those controls.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 1b398a06d4b2..efa65bdb48c8 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -394,12 +394,14 @@ struct scarlett2_data {
 	struct snd_kcontrol *sync_ctl;
 	struct snd_kcontrol *master_vol_ctl;
 	struct snd_kcontrol *vol_ctls[SCARLETT2_ANALOGUE_MAX];
+	struct snd_kcontrol *sw_hw_ctls[SCARLETT2_ANALOGUE_MAX];
 	struct snd_kcontrol *mute_ctls[SCARLETT2_ANALOGUE_MAX];
 	struct snd_kcontrol *dim_mute_ctls[SCARLETT2_DIM_MUTE_COUNT];
 	struct snd_kcontrol *level_ctls[SCARLETT2_LEVEL_SWITCH_MAX];
 	struct snd_kcontrol *pad_ctls[SCARLETT2_PAD_SWITCH_MAX];
 	struct snd_kcontrol *air_ctls[SCARLETT2_AIR_SWITCH_MAX];
 	struct snd_kcontrol *phantom_ctls[SCARLETT2_PHANTOM_SWITCH_MAX];
+	struct snd_kcontrol *mux_ctls[SCARLETT2_MUX_MAX];
 	struct snd_kcontrol *direct_monitor_ctl;
 	u8 mux[SCARLETT2_MUX_MAX];
 	u8 mix[SCARLETT2_INPUT_MIX_MAX * SCARLETT2_OUTPUT_MIX_MAX];
@@ -2553,7 +2555,8 @@ static int scarlett2_add_line_out_ctls(struct usb_mixer_interface *mixer)
 				 i + 1);
 			err = scarlett2_add_new_ctl(mixer,
 						    &scarlett2_sw_hw_enum_ctl,
-						    i, 1, s, NULL);
+						    i, 1, s,
+						    &private->sw_hw_ctls[i]);
 			if (err < 0)
 				return err;
 		}
@@ -2871,7 +2874,8 @@ static int scarlett2_add_mux_enums(struct usb_mixer_interface *mixer)
 
 			err = scarlett2_add_new_ctl(mixer,
 						    &scarlett2_mux_src_enum_ctl,
-						    i, 1, s, NULL);
+						    i, 1, s,
+						    &private->mux_ctls[i]);
 			if (err < 0)
 				return err;
 		}
-- 
2.31.1

