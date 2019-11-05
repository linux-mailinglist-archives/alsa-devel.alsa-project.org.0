Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9799CF0AD3
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 01:02:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 304B516E8;
	Wed,  6 Nov 2019 01:01:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 304B516E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998557;
	bh=sCecSCIEXw+AZXKVgzsv7d4wexu/kiZAhE3DutGe4Qk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=b8wGr/In4zff/0TYcp2uwys6wHfDBGm/TZ2df4LopodZu003ct4zfZg/39NtPbHu9
	 Q9VxbpaVZrBDkpn6OMOQYw8KCZjk+4L3RPU5qN/OT4qOhwkZXYTLFHJ0KN7NKHNWAe
	 cB80ecSoCTAgXLx+sgfzF1o+eAdnrJAdqpTKXueg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83282F80730;
	Wed,  6 Nov 2019 00:51:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83736F80659; Wed,  6 Nov 2019 00:51:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CB68F8060E
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB68F8060E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="I4ShHdAd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Pmc7unf0AvzQTat7eZWWOMP+O/M+M4SPK/63rQzvM5M=; b=I4ShHdAdc7Oz
 /QZdfeQT8cKmU8ZrigO2s0Yq0YdFTZbFpViQttbOyNPRDwy2EI//4OqJIkre9egHcqnBDnrCWnpMO
 q563IXhMzVZK3Qi05iKciGNB45lgR7W90MDG1E7DMcc3OmN5CRYVRCxBNukNQ6VOz/COzIPgFf65z
 lKjuA=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8bc-00081z-1G; Tue, 05 Nov 2019 23:51:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 852B7274301E; Tue,  5 Nov 2019 23:51:23 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a79a3jns.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235123.852B7274301E@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:23 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: remove duplicated
	soc_is_dai_link_bound()" to the asoc tree
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

   ASoC: soc-core: remove duplicated soc_is_dai_link_bound()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 95b562e57f0b3a21a3945297862cb51bc2072c7b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:46:15 +0900
Subject: [PATCH] ASoC: soc-core: remove duplicated soc_is_dai_link_bound()

soc_is_dai_link_bound() check will be called both
*before* soc_bind_dai_link() (A), and
*under*  soc_bind_dai_link() (B).
These are very verbose code. Let's remove one of them.

*	static int soc_bind_dai_link(...)
	{
		...
(B)		if (soc_is_dai_link_bound(...)) {
			...
			return 0;
		}
		...
	}

	static int snd_soc_instantiate_card(...)
	{
		...
		for_each_card_links(...) {
(A)			if (soc_is_dai_link_bound(...))
				continue;

*			ret = soc_bind_dai_link(...);
			if (ret)
				goto probe_end;
		}
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87a79a3jns.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e1b0d861807c..3cc36c2d99da 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2065,9 +2065,6 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
 	 * Components with topology may bring new DAIs and DAI links.
 	 */
 	for_each_card_links(card, dai_link) {
-		if (soc_is_dai_link_bound(card, dai_link))
-			continue;
-
 		ret = soc_bind_dai_link(card, dai_link);
 		if (ret)
 			goto probe_end;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
