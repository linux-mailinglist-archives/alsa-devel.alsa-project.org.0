Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBE4CFB31
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:21:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B66261698;
	Tue,  8 Oct 2019 15:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B66261698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540875;
	bh=N4d5cRekZj4TzgQ0r45dRd+15yDlNMRs0FeRdyZcH3w=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SHVM6raRIndWvYRKS75sl5h4Q4Hfo4My3dXwKyWJtpnFTSeqrluHZvFlsSk1OEQuu
	 qpV69sdCqOVEqhy9QdpEvsQYBuNws5mPwvEJxZ/nLZvCOnkQIdGbIjsQLmhcFnL3zY
	 t32d+N02iQT5rRSRmiOzUB8hOVHHeA0eUEH5Fx2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D4F2F8962F;
	Tue,  8 Oct 2019 14:54:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FE04F80798; Tue,  8 Oct 2019 14:54:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83772F80671
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83772F80671
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="HVSdCjjm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=AwXRVjzjJUXTb5UyN6oVANOuZxhOXPjvgM82D2Msmd4=; b=HVSdCjjmJoaS
 OqvDO4vPmZAYstPgi/3i3BzAZkM1iNwP98wP0t4sUBU46PNZG30+0lKmwUM8n5a0Py1PoBsl2Nq9n
 Dp+aMhM5nlD1zsi98SP2A/SdpC6S50sxsN7On0AxeASIenfTLjVkCJAGBE4fS/YjkHcmfNrWjJXQA
 drTiU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHoze-0008Pm-V9; Tue, 08 Oct 2019 12:53:35 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7C78E2740D4B; Tue,  8 Oct 2019 13:53:34 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87sgobaf3g.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125334.7C78E2740D4B@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:34 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: add new
	pcm_construct/pcm_destruct" to the asoc tree
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

   ASoC: soc-core: add new pcm_construct/pcm_destruct

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

From c64bfc9066007962fca1b9b2d426b1efc171cac9 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:30:59 +0900
Subject: [PATCH] ASoC: soc-core: add new pcm_construct/pcm_destruct

Current snd_soc_component_driver has pcm_new/pcm_free, but,
it doesn't have "component" at parameter.
Thus, each callback can't know it is called for which component.
Each callback currently is getting "component" by using
snd_soc_rtdcom_lookup() with driver name.

It works today, but, will not work in the future if we support multi
CPU/Codec/Platform, because 1 rtd might have multiple same driver
name component.

To solve this issue, each callback need to be called with component.
This patch adds new pcm_construct/pcm_destruct with "component"
parameter.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87sgobaf3g.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-component.h |  6 ++++++
 sound/soc/soc-component.c     | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index a6a3b696d5b0..aa2e2cbc1ee5 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -46,10 +46,16 @@ struct snd_soc_component_driver {
 	int (*write)(struct snd_soc_component *component,
 		     unsigned int reg, unsigned int val);
 
+	/* remove me */
 	/* pcm creation and destruction */
 	int (*pcm_new)(struct snd_soc_pcm_runtime *rtd);
 	void (*pcm_free)(struct snd_pcm *pcm);
 
+	int (*pcm_construct)(struct snd_soc_component *component,
+			     struct snd_soc_pcm_runtime *rtd);
+	void (*pcm_destruct)(struct snd_soc_component *component,
+			     struct snd_pcm *pcm);
+
 	/* component wide operations */
 	int (*set_sysclk)(struct snd_soc_component *component,
 			  int clk_id, int source, unsigned int freq, int dir);
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 2d9cb763e63a..d2b052ac88cd 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -588,6 +588,13 @@ int snd_soc_pcm_component_new(struct snd_pcm *pcm)
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
 
+		if (component->driver->pcm_construct) {
+			ret = component->driver->pcm_construct(component, rtd);
+			if (ret < 0)
+				return ret;
+		}
+
+		/* remove me */
 		if (component->driver->pcm_new) {
 			ret = component->driver->pcm_new(rtd);
 			if (ret < 0)
@@ -607,6 +614,10 @@ void snd_soc_pcm_component_free(struct snd_pcm *pcm)
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
 
+		if (component->driver->pcm_destruct)
+			component->driver->pcm_destruct(component, pcm);
+
+		/* remove me */
 		if (component->driver->pcm_free)
 			component->driver->pcm_free(pcm);
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
