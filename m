Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B52737BFD9
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 13:33:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 534E816AD;
	Wed, 31 Jul 2019 13:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 534E816AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564572795;
	bh=MvYkydvAnRH/4Ls9jO2nytHmJ6xc6VHsBdWUgS/CK1Q=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RYuXKNh9x1uaHE3BJJ5rNfA6MDPJ+hrM5cJMkS1+G5xlBIKduayBDvs2TZm0gbmSO
	 RTWBWAyG0Tg1LZ5BoMoxdwK/Jcz2U1Ggr3IX/g7feMPuBXA+l3VwJwpOX6S4yz6V3J
	 6w3UmoBUPVVu36gCQ807H/TU4GAUVlBJRhcPRxw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5C1BF80519;
	Wed, 31 Jul 2019 13:30:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41F57F80527; Wed, 31 Jul 2019 13:30:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30D75F80133
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 13:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30D75F80133
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="MbMlhN47"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=9Wkim4QpIpwitrv+hQNTQ5R7unfghjTi9CFobdjOMdw=; b=MbMlhN47KEz6
 E3HFA3g9cMWzxoY9NyYeE83BhbTF7/D3vUS2Pgv6jBy2LYhloUcsCKeNmozP6PkDyuu3+BIfMk639
 MpM85zk4bHulMchxhxteGvuvYtqmnIA7sXe6RtpLc9DVVdsYh1GbZcNxusc0HDGNosvVuTiRq0ee5
 yR2CA=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsmni-0001me-IA; Wed, 31 Jul 2019 11:29:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E36502742CC3; Wed, 31 Jul 2019 12:29:45 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Gustavo A. R. Silva <gustavo@embeddedor.com>
In-Reply-To: <20190729221534.GA18696@embeddedor>
X-Patchwork-Hint: ignore
Message-Id: <20190731112945.E36502742CC3@ypsilon.sirena.org.uk>
Date: Wed, 31 Jul 2019 12:29:45 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: [alsa-devel] Applied "ASoC: ti: Mark expected switch fall-throughs"
	to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============7324135832987247995=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============7324135832987247995==
Content-Type: text/plain

The patch

   ASoC: ti: Mark expected switch fall-throughs

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

From 22581e7c51f50fbbadba70499bb5e2d09f830cbb Mon Sep 17 00:00:00 2001
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Date: Mon, 29 Jul 2019 17:15:34 -0500
Subject: [PATCH] ASoC: ti: Mark expected switch fall-throughs
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mark switch cases where we are expecting to fall through.

This patch fixes the following warning (Building: arm):

sound/soc/ti/n810.c: In function ‘n810_ext_control’:
sound/soc/ti/n810.c:48:10: warning: this statement may fall through [-Wimplicit-fallthrough=]
   line1l = 1;
   ~~~~~~~^~~
sound/soc/ti/n810.c:49:2: note: here
  case N810_JACK_HP:
  ^~~~

sound/soc/ti/rx51.c: In function ‘rx51_ext_control’:
sound/soc/ti/rx51.c:57:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   hs = 1;
   ~~~^~~
sound/soc/ti/rx51.c:58:2: note: here
  case RX51_JACK_HP:
  ^~~~

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
Link: https://lore.kernel.org/r/20190729221534.GA18696@embeddedor
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/n810.c | 1 +
 sound/soc/ti/rx51.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/sound/soc/ti/n810.c b/sound/soc/ti/n810.c
index 2c3f2a4c1700..3ad2b6daf31e 100644
--- a/sound/soc/ti/n810.c
+++ b/sound/soc/ti/n810.c
@@ -46,6 +46,7 @@ static void n810_ext_control(struct snd_soc_dapm_context *dapm)
 	switch (n810_jack_func) {
 	case N810_JACK_HS:
 		line1l = 1;
+		/* fall through */
 	case N810_JACK_HP:
 		hp = 1;
 		break;
diff --git a/sound/soc/ti/rx51.c b/sound/soc/ti/rx51.c
index bc6046534fa5..ccd0e8a07dd1 100644
--- a/sound/soc/ti/rx51.c
+++ b/sound/soc/ti/rx51.c
@@ -55,6 +55,7 @@ static void rx51_ext_control(struct snd_soc_dapm_context *dapm)
 		break;
 	case RX51_JACK_HS:
 		hs = 1;
+		/* fall through */
 	case RX51_JACK_HP:
 		hp = 1;
 		break;
-- 
2.20.1


--===============7324135832987247995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7324135832987247995==--
