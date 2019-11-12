Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7BF990E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 19:48:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D0A166E;
	Tue, 12 Nov 2019 19:47:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D0A166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573584525;
	bh=HRxhskfj8z9UcDOmOC1mi7A53brtfHzKDg41xCS79r0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Qh+ESRY1iXH/nP7Q4s19W8i5jvK2kN7SLjO4tTYtMBAWDG2cMGBLtFzvDA+SPAtYe
	 eTEa5s4WoGtQZ1Tpf2AB/lB9/GmtNJNWyZbcnaZi/x0BV8qmZsx3MBUYSNcJGE9Bk1
	 7IveG5hRP+YKOFRzg4+FubU4sK+eqc3CaSfbBqjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09FCAF80483;
	Tue, 12 Nov 2019 19:47:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 091A8F8049C; Tue, 12 Nov 2019 19:47:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F71DF80144
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 19:47:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F71DF80144
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="VeX6MkCa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=+s5k5YzogR8qIWDzT7FWXL+/Pofa8ey24kjIjQyznGs=; b=VeX6MkCa5QXp
 QnvRQAkOdVGUqjfPEcAoUPt1eYnz5PwLTHVGLbBN5kNq3xdyT8KiGxOtt+yqixO/411ax+m1ScfQW
 G2vt56SYx2F+OouqyszYRIddU+Rzs+4L+T9EaPdceii5V3io04HolKNtDuH0VP7anxer+X3AR61Br
 jb0Lo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUbC1-0008WL-S7; Tue, 12 Nov 2019 18:47:09 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 62BEF274299F; Tue, 12 Nov 2019 18:47:09 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfsthkw9.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112184709.62BEF274299F@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 18:47:09 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: tidyup
	soc_probe_aux_devices()" to the asoc tree
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

   ASoC: soc-core: tidyup soc_probe_aux_devices()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 74bd3f92d0d173fe4c0a12cf736c505ceb15576a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 6 Nov 2019 10:08:06 +0900
Subject: [PATCH] ASoC: soc-core: tidyup soc_probe_aux_devices()

snd_soc_bind_card() is calling many initialize functions
for each card / link / dai / aux etc, etc, etc...
When error happen, the message is indicated at snd_soc_bind_card(),
not at each functions.
But, only soc_probe_aux_devices() case is indicating error at functions,
not at snd_soc_bind_card().
It is not an issue, but unbalanced.

This patch moves error message to snd_soc_bind_card().
Also avoids deep-nested code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87lfsthkw9.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f3d33a908fbc..92260a9569a2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1579,21 +1579,18 @@ static int soc_bind_aux_dev(struct snd_soc_card *card)
 
 static int soc_probe_aux_devices(struct snd_soc_card *card)
 {
-	struct snd_soc_component *comp;
+	struct snd_soc_component *component;
 	int order;
 	int ret;
 
 	for_each_comp_order(order) {
-		for_each_card_auxs(card, comp) {
-			if (comp->driver->probe_order == order) {
-				ret = soc_probe_component(card,	comp);
-				if (ret < 0) {
-					dev_err(card->dev,
-						"ASoC: failed to probe aux component %s %d\n",
-						comp->name, ret);
-					return ret;
-				}
-			}
+		for_each_card_auxs(card, component) {
+			if (component->driver->probe_order != order)
+				continue;
+
+			ret = soc_probe_component(card,	component);
+			if (ret < 0)
+				return ret;
 		}
 	}
 
@@ -2042,8 +2039,11 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 	/* probe auxiliary components */
 	ret = soc_probe_aux_devices(card);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(card->dev,
+			"ASoC: failed to probe aux component %d\n", ret);
 		goto probe_end;
+	}
 
 	/* probe all DAI links on this card */
 	ret = soc_probe_link_dais(card);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
