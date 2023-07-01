Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF617446A5
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Jul 2023 06:57:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D943825;
	Sat,  1 Jul 2023 06:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D943825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688187433;
	bh=mp4/SnB2HGxNNmLofSpDfCRV10WQj8BqBB1augGOWc8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PZcH4Uc/ATinkXZYMz0hh1cvMpzh1HLu7Hug0iUEXvjTuntOQJGk8GmyYFuogguP+
	 KEpDYRRKeUmssrrMK/IOdY/FNkCcyh5oTWNmHU2nj/crCAHx4noSfJZvqhox91yihK
	 Ibb7liDAvDoi3N4uQbKtY1VLkDwNDgCBM6GOsi3s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3F85F80212; Sat,  1 Jul 2023 06:56:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0F8FF80212;
	Sat,  1 Jul 2023 06:56:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7947DF80246; Sat,  1 Jul 2023 06:56:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80DCDF80093
	for <alsa-devel@alsa-project.org>; Sat,  1 Jul 2023 06:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80DCDF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lSUtVdDx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=V34U8x+xt3cNOs6Hq3uSEoa9SGtAD0arB4vReWdva5o=; b=lSUtVdDxXI/OgDHgSQt4HRzsPZ
	nZUMDWwJwXbwtuQPPn++hWmb1SWKpfIySTrWYpJi+T+SlP01upmKXwvBvdfomak79v8tIgY8nUnVu
	6twyGreYNzfVHePBTaAQdU3JghqV4afNehEvDkWlbLgX2NDiSRnhPPuGDcpbIqVHEreZKdeCuu8sO
	cZjaw9eq26IEOnBcjAukOdlv61tPwzAKWzOFOAi+6pEshlSGlRJ1sK7hE7ks7sSidPdNGJu5Wl6Yp
	wzYm/KdJskkownkXgL3XiipngKy4sgNShw+L3dc6SFudLnAu+QsL/wvWSsg+MM2BdDzUaZilsaD7j
	Xtfy1zrw==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qFSeQ-005BFi-07;
	Sat, 01 Jul 2023 04:56:02 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Grant Likely <grant.likely@secretlab.ca>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 RESEND RESEND] ASoC: fsl MPC52xx drivers require
 PPC_BESTCOMM
Date: Fri, 30 Jun 2023 21:56:01 -0700
Message-ID: <20230701045601.31452-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OIMDEVRJGO54HQWNNOTGOZGV4DWIVVV3
X-Message-ID-Hash: OIMDEVRJGO54HQWNNOTGOZGV4DWIVVV3
X-MailFrom: rdunlap@infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OIMDEVRJGO54HQWNNOTGOZGV4DWIVVV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Both SND_MPC52xx_SOC_PCM030 and SND_MPC52xx_SOC_EFIKA select
SND_SOC_MPC5200_AC97. The latter symbol depends on PPC_BESTCOMM,
so the 2 former symbols should also depend on PPC_BESTCOMM since
"select" does not follow any dependency chains.

This prevents a kconfig warning and build errors:

WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
  Depends on [n]: SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
  Selected by [m]:
  - SND_MPC52xx_SOC_PCM030 [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_MPC5200_SIMPLE [=y]
  - SND_MPC52xx_SOC_EFIKA [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && SND_POWERPC_SOC [=m] && PPC_EFIKA [=y]

ERROR: modpost: "mpc5200_audio_dma_destroy" [sound/soc/fsl/mpc5200_psc_ac97.ko] undefined!
ERROR: modpost: "mpc5200_audio_dma_create" [sound/soc/fsl/mpc5200_psc_ac97.ko] undefined!

Fixes: 40d9ec14e7e1 ("ASoC: remove BROKEN from Efika and pcm030 fabric drivers")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Grant Likely <grant.likely@secretlab.ca>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---
v2: use correct email address for Mark Brown.

 sound/soc/fsl/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -243,7 +243,7 @@ config SND_SOC_MPC5200_AC97
 
 config SND_MPC52xx_SOC_PCM030
 	tristate "SoC AC97 Audio support for Phytec pcm030 and WM9712"
-	depends on PPC_MPC5200_SIMPLE
+	depends on PPC_MPC5200_SIMPLE && PPC_BESTCOMM
 	select SND_SOC_MPC5200_AC97
 	select SND_SOC_WM9712
 	help
@@ -252,7 +252,7 @@ config SND_MPC52xx_SOC_PCM030
 
 config SND_MPC52xx_SOC_EFIKA
 	tristate "SoC AC97 Audio support for bbplan Efika and STAC9766"
-	depends on PPC_EFIKA
+	depends on PPC_EFIKA && PPC_BESTCOMM
 	select SND_SOC_MPC5200_AC97
 	select SND_SOC_STAC9766
 	help
