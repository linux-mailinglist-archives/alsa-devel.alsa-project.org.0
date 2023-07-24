Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EC275E6B8
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 03:22:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 260B3851;
	Mon, 24 Jul 2023 03:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 260B3851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690161760;
	bh=YjmouUrr+1cMf8auTWXQnuNA3sNRN3GciSUrytcu4/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dJI9zLEVzwxiflu1Se3VK/1jbIlKtqp7y+piO8W7MqTxHT1qJ+b9O0ZH+gm4qK+oQ
	 G4xT9Y5ckLzx8wpd3XuRor/Fhd0KDJZKBAk8VzP9WBpdNKA8+NGn652N5OJIQPpPza
	 Wlaj8rGFxs7Mrx2cYgiVjHmi7N+yjKhJIWpv9l34=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64C29F80553; Mon, 24 Jul 2023 03:21:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0404F800D2;
	Mon, 24 Jul 2023 03:21:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D34CF801F5; Mon, 24 Jul 2023 03:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65B63F80153
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 03:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65B63F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UEe3b/Qg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B48760C7A;
	Mon, 24 Jul 2023 01:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90E7C433C7;
	Mon, 24 Jul 2023 01:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690161699;
	bh=YjmouUrr+1cMf8auTWXQnuNA3sNRN3GciSUrytcu4/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UEe3b/QgOKfL2sUR8y8ELXj9UDjwq9sVYmPLYrfCXxP8li004HPprZCWDQ6RWAky6
	 zIsD6+FhnzbyUOdPf1BbCW9cweFdqzbDHQYGy8CKmmBj03LIovmLUDh8ZfiTm07bAb
	 WUlRtc4zGVqc4XWL+VD7Xc9958ncOSkQS6vyc3tA3K5d0O+QZOD8yE9d4y9n+KCtIb
	 qA38fFj9vM/x7CP0ipBHy0EBpfhT49KWlL42GlyrWKpyafPNC/slbkhRDEGR1qt/QY
	 ArHrpu9Qj1ouCksww8Vr0wAh0/wYJcsU/E4/jW6adk9XzWLHHRXAtaYVD7sR70Xwkm
	 rlsWBaFJikyVw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 06/41] ALSA: emu10k1: roll up loops in DSP setup
 code for Audigy
Date: Sun, 23 Jul 2023 21:20:39 -0400
Message-Id: <20230724012118.2316073-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230724012118.2316073-1-sashal@kernel.org>
References: <20230724012118.2316073-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.40
Content-Transfer-Encoding: 8bit
Message-ID-Hash: STMWEMNWHHRKH5QQMQSQYKN4HAIMV4FQ
X-Message-ID-Hash: STMWEMNWHHRKH5QQMQSQYKN4HAIMV4FQ
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/STMWEMNWHHRKH5QQMQSQYKN4HAIMV4FQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

[ Upstream commit 8cabf83c7aa54530e699be56249fb44f9505c4f3 ]

There is no apparent reason for the massive code duplication.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Link: https://lore.kernel.org/r/20230510173917.3073107-3-oswald.buddenhagen@gmx.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/emu10k1/emufx.c | 112 +++-----------------------------------
 1 file changed, 9 insertions(+), 103 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 6cf7c8b1de47d..4ca65f425f39c 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1563,14 +1563,8 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 	gpr += 2;
 
 	/* Master volume (will be renamed later) */
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+0+SND_EMU10K1_PLAYBACK_CHANNELS), A_C_00000000, A_GPR(gpr), A_GPR(playback+0+SND_EMU10K1_PLAYBACK_CHANNELS));
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+1+SND_EMU10K1_PLAYBACK_CHANNELS), A_C_00000000, A_GPR(gpr), A_GPR(playback+1+SND_EMU10K1_PLAYBACK_CHANNELS));
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+2+SND_EMU10K1_PLAYBACK_CHANNELS), A_C_00000000, A_GPR(gpr), A_GPR(playback+2+SND_EMU10K1_PLAYBACK_CHANNELS));
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+3+SND_EMU10K1_PLAYBACK_CHANNELS), A_C_00000000, A_GPR(gpr), A_GPR(playback+3+SND_EMU10K1_PLAYBACK_CHANNELS));
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+4+SND_EMU10K1_PLAYBACK_CHANNELS), A_C_00000000, A_GPR(gpr), A_GPR(playback+4+SND_EMU10K1_PLAYBACK_CHANNELS));
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+5+SND_EMU10K1_PLAYBACK_CHANNELS), A_C_00000000, A_GPR(gpr), A_GPR(playback+5+SND_EMU10K1_PLAYBACK_CHANNELS));
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+6+SND_EMU10K1_PLAYBACK_CHANNELS), A_C_00000000, A_GPR(gpr), A_GPR(playback+6+SND_EMU10K1_PLAYBACK_CHANNELS));
-	A_OP(icode, &ptr, iMAC0, A_GPR(playback+7+SND_EMU10K1_PLAYBACK_CHANNELS), A_C_00000000, A_GPR(gpr), A_GPR(playback+7+SND_EMU10K1_PLAYBACK_CHANNELS));
+	for (z = 0; z < 8; z++)
+		A_OP(icode, &ptr, iMAC0, A_GPR(playback+z+SND_EMU10K1_PLAYBACK_CHANNELS), A_C_00000000, A_GPR(gpr), A_GPR(playback+z+SND_EMU10K1_PLAYBACK_CHANNELS));
 	snd_emu10k1_init_mono_control(&controls[nctl++], "Wave Master Playback Volume", gpr, 0);
 	gpr += 2;
 
@@ -1654,102 +1648,14 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 			dev_dbg(emu->card->dev, "emufx.c: gpr=0x%x, tmp=0x%x\n",
 			       gpr, tmp);
 			*/
-			/* For the EMU1010: How to get 32bit values from the DSP. High 16bits into L, low 16bits into R. */
-			/* A_P16VIN(0) is delayed by one sample,
-			 * so all other A_P16VIN channels will need to also be delayed
-			 */
-			/* Left ADC in. 1 of 2 */
 			snd_emu10k1_audigy_dsp_convert_32_to_2x16( icode, &ptr, tmp, bit_shifter16, A_P16VIN(0x0), A_FXBUS2(0) );
-			/* Right ADC in 1 of 2 */
-			gpr_map[gpr++] = 0x00000000;
-			/* Delaying by one sample: instead of copying the input
-			 * value A_P16VIN to output A_FXBUS2 as in the first channel,
-			 * we use an auxiliary register, delaying the value by one
-			 * sample
-			 */
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16( icode, &ptr, tmp, bit_shifter16, A_GPR(gpr - 1), A_FXBUS2(2) );
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0x1), A_C_00000000, A_C_00000000);
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16( icode, &ptr, tmp, bit_shifter16, A_GPR(gpr - 1), A_FXBUS2(4) );
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0x2), A_C_00000000, A_C_00000000);
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16( icode, &ptr, tmp, bit_shifter16, A_GPR(gpr - 1), A_FXBUS2(6) );
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0x3), A_C_00000000, A_C_00000000);
-			/* For 96kHz mode */
-			/* Left ADC in. 2 of 2 */
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16( icode, &ptr, tmp, bit_shifter16, A_GPR(gpr - 1), A_FXBUS2(0x8) );
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0x4), A_C_00000000, A_C_00000000);
-			/* Right ADC in 2 of 2 */
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16( icode, &ptr, tmp, bit_shifter16, A_GPR(gpr - 1), A_FXBUS2(0xa) );
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0x5), A_C_00000000, A_C_00000000);
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16( icode, &ptr, tmp, bit_shifter16, A_GPR(gpr - 1), A_FXBUS2(0xc) );
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0x6), A_C_00000000, A_C_00000000);
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16( icode, &ptr, tmp, bit_shifter16, A_GPR(gpr - 1), A_FXBUS2(0xe) );
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0x7), A_C_00000000, A_C_00000000);
-			/* Pavel Hofman - we still have voices, A_FXBUS2s, and
-			 * A_P16VINs available -
-			 * let's add 8 more capture channels - total of 16
-			 */
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16(icode, &ptr, tmp,
-								  bit_shifter16,
-								  A_GPR(gpr - 1),
-								  A_FXBUS2(0x10));
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0x8),
-			     A_C_00000000, A_C_00000000);
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16(icode, &ptr, tmp,
-								  bit_shifter16,
-								  A_GPR(gpr - 1),
-								  A_FXBUS2(0x12));
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0x9),
-			     A_C_00000000, A_C_00000000);
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16(icode, &ptr, tmp,
-								  bit_shifter16,
-								  A_GPR(gpr - 1),
-								  A_FXBUS2(0x14));
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0xa),
-			     A_C_00000000, A_C_00000000);
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16(icode, &ptr, tmp,
-								  bit_shifter16,
-								  A_GPR(gpr - 1),
-								  A_FXBUS2(0x16));
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0xb),
-			     A_C_00000000, A_C_00000000);
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16(icode, &ptr, tmp,
-								  bit_shifter16,
-								  A_GPR(gpr - 1),
-								  A_FXBUS2(0x18));
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0xc),
-			     A_C_00000000, A_C_00000000);
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16(icode, &ptr, tmp,
-								  bit_shifter16,
-								  A_GPR(gpr - 1),
-								  A_FXBUS2(0x1a));
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0xd),
-			     A_C_00000000, A_C_00000000);
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16(icode, &ptr, tmp,
-								  bit_shifter16,
-								  A_GPR(gpr - 1),
-								  A_FXBUS2(0x1c));
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0xe),
-			     A_C_00000000, A_C_00000000);
-			gpr_map[gpr++] = 0x00000000;
-			snd_emu10k1_audigy_dsp_convert_32_to_2x16(icode, &ptr, tmp,
-								  bit_shifter16,
-								  A_GPR(gpr - 1),
-								  A_FXBUS2(0x1e));
-			A_OP(icode, &ptr, iACC3, A_GPR(gpr - 1), A_P16VIN(0xf),
-			     A_C_00000000, A_C_00000000);
+			/* A_P16VIN(0) is delayed by one sample, so all other A_P16VIN channels
+			 * will need to also be delayed; we use an auxiliary register for that. */
+			for (z = 1; z < 0x10; z++) {
+				snd_emu10k1_audigy_dsp_convert_32_to_2x16( icode, &ptr, tmp, bit_shifter16, A_GPR(gpr), A_FXBUS2(z * 2) );
+				A_OP(icode, &ptr, iACC3, A_GPR(gpr), A_P16VIN(z), A_C_00000000, A_C_00000000);
+				gpr_map[gpr++] = 0x00000000;
+			}
 		}
 
 #if 0
-- 
2.39.2

