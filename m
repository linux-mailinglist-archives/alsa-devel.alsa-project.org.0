Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF37EC25C
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 12:59:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38BF2212B;
	Fri,  1 Nov 2019 12:58:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38BF2212B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572609562;
	bh=rZX97fHDvY5UkDc9Ug1BQ0n/h0tBnshVFGPYf9oW4EE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hzJ+xliW9cPDc1bAgypGK5HYKbaRuI9maZjUXIMlET2/CkS20qT/FL6Hkng2NMBLX
	 LZYEwRMFStTJ7GeA2KKwySKKkERFDlv+X13Je3EKYLR4bwlUjqqT+QDOMeVykSdqFO
	 G8oBqgHByPf52fTfuC3Z1RhKjvn+4GJOXrEYVWaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9C05F803D6;
	Fri,  1 Nov 2019 12:57:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA9F2F803D6; Fri,  1 Nov 2019 12:57:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F115BF8015A
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 12:57:26 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2C5F1A003F;
 Fri,  1 Nov 2019 12:57:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2C5F1A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1572609445; bh=Su2E0RbtN0rgLNiTqdFEocXAFBKDX9UEfnwBA7z2szs=;
 h=From:To:Cc:Subject:Date:From;
 b=4qVAglTjcymiHoHrIwgwY7at28rGAXb+th55f90jTVoxX4POSoStSaqJxcscQXebW
 bI3JPRxNiKYtoIcpaZt0gSPERhoFNwVj9JR0VVeiO+XgIDinHAjs0uVYUIZT/add4I
 3CM2rtcBPErP4ht73BuaSQwHPINS2Ww4eaHmWRmw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  1 Nov 2019 12:57:21 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Date: Fri,  1 Nov 2019 12:57:18 +0100
Message-Id: <20191101115718.3092-1-perex@perex.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Kailang Yang <kailang@realtek.com>
Subject: [alsa-devel] [PATCH] ALSA: hda - fix the Headset Mic Jack name for
	Realtek
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

The HDA auto parser creates kcontrol 'Headset Mic Jack'. Use this
name also for the alc_fixup_headset_jack() function. It is necessary
to have common name for the user space like the UCM configs:

https://github.com/alsa-project/alsa-ucm-conf/pull/5

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Cc: Kailang Yang <kailang@realtek.com>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 80f66ba85f87..2633e45144d5 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5679,7 +5679,7 @@ static void alc_fixup_headset_jack(struct hda_codec *codec,
 	case HDA_FIXUP_ACT_PRE_PROBE:
 		snd_hda_jack_detect_enable_callback(codec, 0x55,
 						    alc_headset_btn_callback);
-		snd_hda_jack_add_kctl(codec, 0x55, "Headset Jack", false,
+		snd_hda_jack_add_kctl(codec, 0x55, "Headset Mic Jack", false,
 				      SND_JACK_HEADSET, alc_headset_btn_keymap);
 		break;
 	case HDA_FIXUP_ACT_INIT:
-- 
2.20.1
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
