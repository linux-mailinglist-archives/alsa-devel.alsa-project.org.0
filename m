Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 360697AD856
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 14:57:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1412CAE9;
	Mon, 25 Sep 2023 14:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1412CAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695646670;
	bh=v1QQpPt7YcIPHxVTsqMuncLT5mIT7SksokPj6/CvQns=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SP9MzsYoC8dnamtna4r1YW3089k1H1Vj3vGvNsCDGc337qPJCiFMoKmJNfmeUygFF
	 I3aZtBngnLThxaxc6Kk6g1NMx0t5tsWA10C6x7q52/0j+kgyedwNOkmscWKpHUrCZp
	 SJuaKhHYiA9u0WgByAB10+sM2sRsv4M+5GqheLO8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54892F80166; Mon, 25 Sep 2023 14:56:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9ACAF80166;
	Mon, 25 Sep 2023 14:56:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9B4FF8016A; Mon, 25 Sep 2023 14:56:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84379F800AE
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 14:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84379F800AE
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ee18:727e:6235:2ac2])
	by albert.telenet-ops.be with bizsmtp
	id qCwn2A00B4XpEKH06CwnFJ; Mon, 25 Sep 2023 14:56:48 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qkl8R-004XvW-64;
	Mon, 25 Sep 2023 14:56:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qkl8p-00FRoC-3P;
	Mon, 25 Sep 2023 14:56:47 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Manuel Lauss <manuel.lauss@gmail.com>
Cc: alsa-devel@alsa-project.org,
	linux-sh@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: sh: dma-sh7760: Use %pad and %zu to format dma_addr_t
 and size_t
Date: Mon, 25 Sep 2023 14:56:46 +0200
Message-Id: <20230925125646.3681807-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JLRSYRUJ4F4EMIM6XJAXNDHTM4NSFSED
X-Message-ID-Hash: JLRSYRUJ4F4EMIM6XJAXNDHTM4NSFSED
X-MailFrom: geert@linux-m68k.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLRSYRUJ4F4EMIM6XJAXNDHTM4NSFSED/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

sound/soc/sh/dma-sh7760.c: In function ‘camelot_prepare’:
./include/linux/kern_levels.h:5:25: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 2 has type ‘unsigned int’ [-Wformat=]
    5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
sound/soc/sh/dma-sh7760.c:198:9: note: in expansion of macro ‘pr_debug’
  198 |         pr_debug("PCM data: addr 0x%08lx len %d\n",
      |         ^~~~~~~~

Fix this by using "%pad" and taking the address to format the DMA
address.  While at it, use "%zu" to format size_t.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309250903.XNAjFuxy-lkp@intel.com/
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 sound/soc/sh/dma-sh7760.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sh/dma-sh7760.c b/sound/soc/sh/dma-sh7760.c
index 121e48f984c50cab..85fe126233528252 100644
--- a/sound/soc/sh/dma-sh7760.c
+++ b/sound/soc/sh/dma-sh7760.c
@@ -195,9 +195,9 @@ static int camelot_prepare(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct camelot_pcm *cam = &cam_pcm_data[asoc_rtd_to_cpu(rtd, 0)->id];
 
-	pr_debug("PCM data: addr 0x%08lx len %d\n",
-		 (u32)runtime->dma_addr, runtime->dma_bytes);
- 
+	pr_debug("PCM data: addr %pad len %zu\n", &runtime->dma_addr,
+		 runtime->dma_bytes);
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		BRGREG(BRGATXSAR) = (unsigned long)runtime->dma_area;
 		BRGREG(BRGATXTCR) = runtime->dma_bytes;
-- 
2.34.1

