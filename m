Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2606FE35A
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:41:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4F521082;
	Wed, 10 May 2023 19:40:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4F521082
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683740471;
	bh=6vN1qjoLswKSnnAk8KEC4jI7iVIbvr4zLsn/t1JSnq0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gTiToUquG0caLV0BNFRl4gvgo4Fr4dAU5FSJhQI9yuYLZJJsCENA4tci7sOm7gSBD
	 vlGMreKqedNbY98/6OI0NEaIW3yM+Sm71bO5tjTxHbqpPTBFuiGi6U82xzjZqOpV/T
	 Uxw7KbgzNgWevV36A84auTRXZPnKKxc+Ta8WU+1A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A037F80553;
	Wed, 10 May 2023 19:39:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54BB1F80552; Wed, 10 May 2023 19:39:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57B91F802E8
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 19:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57B91F802E8
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 25BFA24172;
	Wed, 10 May 2023 13:39:18 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pwnmX-tSu-00; Wed, 10 May 2023 19:39:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 03/14] ALSA: emu10k1: fix+optimize E-MU stereo capture DSP
 code
Date: Wed, 10 May 2023 19:39:06 +0200
Message-Id: <20230510173917.3073107-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
References: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2CISBOQPI5ARS4RIWB2CHKR6W7TZGYXI
X-Message-ID-Hash: 2CISBOQPI5ARS4RIWB2CHKR6W7TZGYXI
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CISBOQPI5ARS4RIWB2CHKR6W7TZGYXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Presumably, JDC added the seemingly superfluous indirection over the
temporary register because without it he'd get only zero readings.
However, switching the X and Y operands (or using EMU32 as the A
operand in the temporary load) works just fine. Presumably a DSP bug?

The original code was also actually buggy, though: both channels used
the left volume control.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emufx.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index eb40159a2eeb..795b2573fef4 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1324,11 +1324,9 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 		/* EMU1010 DSP 0 and DSP 1 Capture */
 		// The 24 MSB hold the actual value. We implicitly discard the 16 LSB.
 		if (emu->card_capabilities->ca0108_chip) {
-			/* Note:JCD:No longer bit shift lower 16bits to upper 16bits of 32bit value. */
-			A_OP(icode, &ptr, iMACINT0, A_GPR(tmp), A_C_00000000, A3_EMU32IN(0x0), A_C_00000001);
-			A_OP(icode, &ptr, iMAC0, A_GPR(capture+0), A_GPR(capture+0), A_GPR(gpr), A_GPR(tmp));
-			A_OP(icode, &ptr, iMACINT0, A_GPR(tmp), A_C_00000000, A3_EMU32IN(0x1), A_C_00000001);
-			A_OP(icode, &ptr, iMAC0, A_GPR(capture+1), A_GPR(capture+1), A_GPR(gpr), A_GPR(tmp));
+			// For unclear reasons, the EMU32IN cannot be the Y operand!
+			A_OP(icode, &ptr, iMAC0, A_GPR(capture+0), A_GPR(capture+0), A3_EMU32IN(0x0), A_GPR(gpr));
+			A_OP(icode, &ptr, iMAC0, A_GPR(capture+1), A_GPR(capture+1), A3_EMU32IN(0x1), A_GPR(gpr+1));
 		} else {
 			A_OP(icode, &ptr, iMAC0, A_GPR(capture+0), A_GPR(capture+0), A_GPR(gpr), A_P16VIN(0x0));
 			A_OP(icode, &ptr, iMAC0, A_GPR(capture+1), A_GPR(capture+1), A_GPR(gpr+1), A_P16VIN(0x1));
-- 
2.40.0.152.g15d061e6df

