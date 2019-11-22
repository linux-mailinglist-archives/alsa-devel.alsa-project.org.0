Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CA9107920
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 20:58:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DF90183E;
	Fri, 22 Nov 2019 20:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DF90183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574452727;
	bh=NO+hPAFj7vnhtAqVvOkQ4NvW9K7ELHrSuTM6Zwi3TTY=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cF3HosBqAW2/uMOcIg9CWw/YOyuewn5T1OUx/5BLoqgOGDcZ6xEBDwYP0Esin5+PY
	 pZQHKVk5mIMIuYE+Y8+HyrHXgel8ywaOe4qJnCGTd6pL9GsYyy9dyhvYUw4TtIk7ie
	 alg3fIs5FbndSjKY1PlKw4hLflc6YQZevIXErE90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2E9FF80161;
	Fri, 22 Nov 2019 20:55:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9346F80159; Fri, 22 Nov 2019 20:55:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B06FEF80157
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 20:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B06FEF80157
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF12D1045;
 Fri, 22 Nov 2019 11:55:28 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B35C3F6C4;
 Fri, 22 Nov 2019 11:55:28 -0800 (PST)
Date: Fri, 22 Nov 2019 19:55:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Nilkanth Ahirrao <anilkanth@jp.adit-jv.com>
In-Reply-To: <20191121111023.10976-1-erosca@de.adit-jv.com>
Message-Id: <applied-20191121111023.10976-1-erosca@de.adit-jv.com>
X-Patchwork-Hint: ignore
Cc: Nilkanth Ahirrao <external.anilkanth@jp.adit-jv.com>,
 alsa-devel@alsa-project.org, Andrew Gabbasov <andrew_gabbasov@mentor.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>, Jiada Wang <jiada_wang@mentor.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: [alsa-devel] Applied "ASoC: rsnd: fix DALIGN register for SSIU" to
	the asoc tree
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
Content-Type: multipart/mixed; boundary="===============8786124070077557827=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============8786124070077557827==
Content-Type: text/plain

The patch

   ASoC: rsnd: fix DALIGN register for SSIU

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From ef8e14794308a428b194f8b06ad9ae06b43466e4 Mon Sep 17 00:00:00 2001
From: Nilkanth Ahirrao <anilkanth@jp.adit-jv.com>
Date: Thu, 21 Nov 2019 12:10:23 +0100
Subject: [PATCH] ASoC: rsnd: fix DALIGN register for SSIU
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current driver only sets 0x76543210 and 0x67452301 for DALIGN.
This doesn’t work well for TDM split and ex-split mode for all SSIU.
This patch programs the DALIGN registers based on the SSIU number.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jiada Wang <jiada_wang@mentor.com>
Cc: Andrew Gabbasov <andrew_gabbasov@mentor.com>
Fixes: a914e44693d41b ("ASoC: rsnd: more clear rsnd_get_dalign() for DALIGN")
Signed-off-by: Nilkanth Ahirrao <anilkanth@jp.adit-jv.com>
Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/20191121111023.10976-1-erosca@de.adit-jv.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/rcar/core.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index e9596c2096cd..a6c1cf987e6e 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -376,6 +376,17 @@ u32 rsnd_get_adinr_bit(struct rsnd_mod *mod, struct rsnd_dai_stream *io)
  */
 u32 rsnd_get_dalign(struct rsnd_mod *mod, struct rsnd_dai_stream *io)
 {
+	static const u32 dalign_values[8][2] = {
+		{0x76543210, 0x67452301},
+		{0x00000032, 0x00000023},
+		{0x00007654, 0x00006745},
+		{0x00000076, 0x00000067},
+		{0xfedcba98, 0xefcdab89},
+		{0x000000ba, 0x000000ab},
+		{0x0000fedc, 0x0000efcd},
+		{0x000000fe, 0x000000ef},
+	};
+	int id = 0, inv;
 	struct rsnd_mod *ssiu = rsnd_io_to_mod_ssiu(io);
 	struct rsnd_mod *target;
 	struct snd_pcm_runtime *runtime = rsnd_io_to_runtime(io);
@@ -411,13 +422,18 @@ u32 rsnd_get_dalign(struct rsnd_mod *mod, struct rsnd_dai_stream *io)
 		target = cmd ? cmd : ssiu;
 	}
 
+	if (mod == ssiu)
+		id = rsnd_mod_id_sub(mod);
+
 	/* Non target mod or non 16bit needs normal DALIGN */
 	if ((snd_pcm_format_width(runtime->format) != 16) ||
 	    (mod != target))
-		return 0x76543210;
+		inv = 0;
 	/* Target mod needs inverted DALIGN when 16bit */
 	else
-		return 0x67452301;
+		inv = 1;
+
+	return dalign_values[id][inv];
 }
 
 u32 rsnd_get_busif_shift(struct rsnd_dai_stream *io, struct rsnd_mod *mod)
-- 
2.20.1


--===============8786124070077557827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8786124070077557827==--
