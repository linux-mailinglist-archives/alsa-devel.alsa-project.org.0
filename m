Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2F6117545
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:12:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FAC916AD;
	Mon,  9 Dec 2019 20:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FAC916AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918769;
	bh=30Nm2kIaJPRnBVDcPyIXNB8pwp/au6W/PbYFKu0GeOU=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ikkq5bFji1Sx/hzD9sN9RIKyMkzOR2DF5yZIxIQVDVphhSFLZ+cnBuMPbrT6Yoef3
	 F1Noi1Lu8HEA4H6O8AIegWExM7hBqRgl89qvGgz9GscDkP77dVYJsjZDr3EVXz8O29
	 4U8mXSrgoBotNVBLx5HpxaYhQQ5ChXvDAclF4A+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FA7DF8033F;
	Mon,  9 Dec 2019 19:59:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 290BEF80316; Mon,  9 Dec 2019 19:59:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 00CB6F80303
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00CB6F80303
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9D79328;
 Mon,  9 Dec 2019 10:59:20 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6653F3F6CF;
 Mon,  9 Dec 2019 10:59:20 -0800 (PST)
Date: Mon, 09 Dec 2019 18:59:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
In-Reply-To: <20191202155834.22582-1-geert+renesas@glider.be>
Message-Id: <applied-20191202155834.22582-1-geert+renesas@glider.be>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Nilkanth Ahirrao <anilkanth@jp.adit-jv.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [alsa-devel] Applied "ASoC: rsnd: Calculate DALIGN inversion at
	run-time" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: rsnd: Calculate DALIGN inversion at run-time

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 49df1e3925824cf44e590daac635974270185841 Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Mon, 2 Dec 2019 16:58:34 +0100
Subject: [PATCH] ASoC: rsnd: Calculate DALIGN inversion at run-time

There is no need to store the inverted DALIGN values in the table, as
they can easily be calculated at run-time.  This also protects against
the introduction of inconsistencies between normal and inverted values
by a future table modification.

Reorder the two subexpressions in the AND check, to perform the least
expensive check first.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/20191202155834.22582-1-geert+renesas@glider.be
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/core.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 399dc6e9bde5..d20f03dfdee6 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -376,20 +376,15 @@ u32 rsnd_get_adinr_bit(struct rsnd_mod *mod, struct rsnd_dai_stream *io)
  */
 u32 rsnd_get_dalign(struct rsnd_mod *mod, struct rsnd_dai_stream *io)
 {
-	static const u32 dalign_values[8][2] = {
-		{0x76543210, 0x67452301},
-		{0x00000032, 0x00000023},
-		{0x00007654, 0x00006745},
-		{0x00000076, 0x00000067},
-		{0xfedcba98, 0xefcdab89},
-		{0x000000ba, 0x000000ab},
-		{0x0000fedc, 0x0000efcd},
-		{0x000000fe, 0x000000ef},
+	static const u32 dalign_values[8] = {
+		0x76543210, 0x00000032, 0x00007654, 0x00000076,
+		0xfedcba98, 0x000000ba, 0x0000fedc, 0x000000fe,
 	};
-	int id = 0, inv;
+	int id = 0;
 	struct rsnd_mod *ssiu = rsnd_io_to_mod_ssiu(io);
 	struct rsnd_mod *target;
 	struct snd_pcm_runtime *runtime = rsnd_io_to_runtime(io);
+	u32 dalign;
 
 	/*
 	 * *Hardware* L/R and *Software* L/R are inverted for 16bit data.
@@ -425,15 +420,15 @@ u32 rsnd_get_dalign(struct rsnd_mod *mod, struct rsnd_dai_stream *io)
 	if (mod == ssiu)
 		id = rsnd_mod_id_sub(mod);
 
-	/* Non target mod or non 16bit needs normal DALIGN */
-	if ((snd_pcm_format_width(runtime->format) != 16) ||
-	    (mod != target))
-		inv = 0;
-	/* Target mod needs inverted DALIGN when 16bit */
-	else
-		inv = 1;
+	dalign = dalign_values[id];
+
+	if (mod == target && snd_pcm_format_width(runtime->format) == 16) {
+		/* Target mod needs inverted DALIGN when 16bit */
+		dalign = (dalign & 0xf0f0f0f0) >> 4 |
+			 (dalign & 0x0f0f0f0f) << 4;
+	}
 
-	return dalign_values[id][inv];
+	return dalign;
 }
 
 u32 rsnd_get_busif_shift(struct rsnd_dai_stream *io, struct rsnd_mod *mod)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
