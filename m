Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B443C3007
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:43:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F4811729;
	Sat, 10 Jul 2021 04:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F4811729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625885021;
	bh=bJZpDz9NxLlI3Hwub0xn2z/Th0eq+i9p8YQI6id92D0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iurqcb7A76lasV1BuN6YxJPxnI6q62fvNjrS3lSW7/UlKhHOSqK2u2YbNQFFWmcZo
	 YPvQ99HefMDsYfowYXgL0Qt1bZAtOQrMZjoV9Mw3tixkt//NW7b7CeeZMYVCRrXCAT
	 1xCi4jxpBAcb/xKGtS1YVys/1br0kDa4Id35uV8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30689F80622;
	Sat, 10 Jul 2021 04:27:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD520F804FA; Sat, 10 Jul 2021 04:27:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0CE5F804F2
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:27:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0CE5F804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HNvJIPpN"
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB41B613FD;
 Sat, 10 Jul 2021 02:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884042;
 bh=bJZpDz9NxLlI3Hwub0xn2z/Th0eq+i9p8YQI6id92D0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HNvJIPpNJGiqzznJAT/m0od+eJ4+8UTNuXndj5UZZLlprSb+35uW7vZ2Ol3+3WHCT
 PpRl/Z/Zo7pqjX3eLEWgSu2M/0kfNb8V4RBG0LcKEfENu3ZB3GHXp+ZDD84HrwCckd
 5pc8cxd6+YX8rScKrQzRZPJiMtZrpmLSaoh/SBzAOBKgEPPZrDcgXxUoE4mGSWRV7l
 EPOVne3lyr2NTYHERFIZRZxNz/uRdtOfLHB9OUIwYTbENQekWrHJrHqJDRvXkiNrLD
 bwQAxMMuseYyuilKX60fBVCUc+DJUDDaQRApmgx8m0ypXJyoChrj5AkDmx4V55ClDV
 UCuF1Z1dQh5fg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 10/63] Revert "ALSA: bebob/oxfw: fix Kconfig entry
 for Mackie d.2 Pro"
Date: Fri,  9 Jul 2021 22:26:16 -0400
Message-Id: <20210710022709.3170675-10-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022709.3170675-1-sashal@kernel.org>
References: <20210710022709.3170675-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
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

From: Takashi Sakamoto <o-takashi@sakamocchi.jp>

[ Upstream commit 5d6fb80a142b5994355ce675c517baba6089d199 ]

This reverts commit 0edabdfe89581669609eaac5f6a8d0ae6fe95e7f.

I've explained that optional FireWire card for d.2 is also built-in to
d.2 Pro, however it's wrong. The optional card uses DM1000 ASIC and has
'Mackie DJ Mixer' in its model name of configuration ROM. On the other
hand, built-in FireWire card for d.2 Pro and d.4 Pro uses OXFW971 ASIC
and has 'd.Pro' in its model name according to manuals and user
experiences. The former card is not the card for d.2 Pro. They are similar
in appearance but different internally.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://lore.kernel.org/r/20210518084557.102681-2-o-takashi@sakamocchi.jp
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/firewire/Kconfig       | 4 ++--
 sound/firewire/bebob/bebob.c | 2 +-
 sound/firewire/oxfw/oxfw.c   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/firewire/Kconfig b/sound/firewire/Kconfig
index e6b4ca469b2a..c16d2dd9a66f 100644
--- a/sound/firewire/Kconfig
+++ b/sound/firewire/Kconfig
@@ -38,7 +38,7 @@ config SND_OXFW
 	   * Mackie(Loud) Onyx 1640i (former model)
 	   * Mackie(Loud) Onyx Satellite
 	   * Mackie(Loud) Tapco Link.Firewire
-	   * Mackie(Loud) d.4 pro
+	   * Mackie(Loud) d.2 pro/d.4 pro (built-in FireWire card with OXFW971 ASIC)
 	   * Mackie(Loud) U.420/U.420d
 	   * TASCAM FireOne
 	   * Stanton Controllers & Systems 1 Deck/Mixer
@@ -84,7 +84,7 @@ config SND_BEBOB
 	  * PreSonus FIREBOX/FIREPOD/FP10/Inspire1394
 	  * BridgeCo RDAudio1/Audio5
 	  * Mackie Onyx 1220/1620/1640 (FireWire I/O Card)
-	  * Mackie d.2 (FireWire Option) and d.2 Pro
+	  * Mackie d.2 (optional FireWire card with DM1000 ASIC)
 	  * Stanton FinalScratch 2 (ScratchAmp)
 	  * Tascam IF-FW/DM
 	  * Behringer XENIX UFX 1204/1604
diff --git a/sound/firewire/bebob/bebob.c b/sound/firewire/bebob/bebob.c
index 441c58283b47..eeb0e4b2f77a 100644
--- a/sound/firewire/bebob/bebob.c
+++ b/sound/firewire/bebob/bebob.c
@@ -387,7 +387,7 @@ static const struct ieee1394_device_id bebob_id_table[] = {
 	SND_BEBOB_DEV_ENTRY(VEN_BRIDGECO, 0x00010049, &spec_normal),
 	/* Mackie, Onyx 1220/1620/1640 (Firewire I/O Card) */
 	SND_BEBOB_DEV_ENTRY(VEN_MACKIE2, 0x00010065, &spec_normal),
-	// Mackie, d.2 (Firewire option card) and d.2 Pro (the card is built-in).
+	// Mackie, d.2 (optional Firewire card with DM1000).
 	SND_BEBOB_DEV_ENTRY(VEN_MACKIE1, 0x00010067, &spec_normal),
 	/* Stanton, ScratchAmp */
 	SND_BEBOB_DEV_ENTRY(VEN_STANTON, 0x00000001, &spec_normal),
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 6184a7c8f2b3..bebb2b8296cb 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -350,7 +350,7 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 	 *  Onyx-i series (former models):	0x081216
 	 *  Mackie Onyx Satellite:		0x00200f
 	 *  Tapco LINK.firewire 4x6:		0x000460
-	 *  d.4 pro:				Unknown
+	 *  d.2 pro/d.4 pro (built-in card):	Unknown
 	 *  U.420:				Unknown
 	 *  U.420d:				Unknown
 	 */
-- 
2.30.2

