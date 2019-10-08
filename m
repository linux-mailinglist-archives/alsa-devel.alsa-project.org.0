Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57243CFB39
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:22:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3A0916B2;
	Tue,  8 Oct 2019 15:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3A0916B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540957;
	bh=ISNpG5MOiK0yR0MHukTDt85q25w8NFxjVuPwhul7dYA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=uqPlwtQn7gDocXP34/HVHNWH5uezjRcgn1BTwUmmIIlXxjwYGPr4tu/TffdODwnPf
	 67afEIQobEjFIZ3lgrSEcpwl8qh24t3sbdRFOe1SSJZOodsMCVxqFkbDSoGANZQc8v
	 hQl8zmcYJErnQrd9+0abaqrWSVMom/kTgaaQpcUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 539D4F89673;
	Tue,  8 Oct 2019 14:54:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4EF1F80671; Tue,  8 Oct 2019 14:54:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 341B0F8065E
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 341B0F8065E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Oq2UZ/iK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=BG68NqVOXumpkWCkn0OWV2VnbqS6lWwOjOIssdMs54E=; b=Oq2UZ/iKXvYY
 2k9XJAOIPBnHG81Y57F9wo7mHYd1VdMS8WY+SI1RGIevxLvhKvsBqYB/ev15F59uCw/38fwLhD/uV
 CVR6Yw2GKJxF/ipPxbWttia4pz9/yZ+xliwNksZRBzI1z3PcjhgFANWkJSL1+47HJeFTKaA/y7yuT
 e+bXo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHoze-0008Ph-Q0; Tue, 08 Oct 2019 12:53:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 435272740D4A; Tue,  8 Oct 2019 13:53:34 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r23vaf39.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125334.435272740D4A@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:34 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: add snd_soc_pcm_lib_ioctl()"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: soc-core: add snd_soc_pcm_lib_ioctl()

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

From 8ec241c495dde3d19a0459304298c2468c60182b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:31:06 +0900
Subject: [PATCH] ASoC: soc-core: add snd_soc_pcm_lib_ioctl()

add snd_soc_pcm_lib_ioctl() to bypass to snd_pcm_lib_ioctl()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87r23vaf39.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  5 +++++
 sound/soc/soc-core.c | 12 ++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index d93cb46c536d..32748f78060a 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1390,6 +1390,11 @@ static inline void snd_soc_dapm_mutex_unlock(struct snd_soc_dapm_context *dapm)
 	mutex_unlock(&dapm->card->dapm_mutex);
 }
 
+/* bypass */
+int snd_soc_pcm_lib_ioctl(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream,
+			  unsigned int cmd, void *arg);
+
 #include <sound/soc-component.h>
 
 #endif
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index d39d908f3204..bd2ac1912466 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -277,6 +277,18 @@ static inline void snd_soc_debugfs_exit(void)
 
 #endif
 
+/*
+ * This is glue code between snd_pcm_lib_ioctl() and
+ * snd_soc_component_driver :: ioctl
+ */
+int snd_soc_pcm_lib_ioctl(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream,
+			  unsigned int cmd, void *arg)
+{
+	return snd_pcm_lib_ioctl(substream, cmd, arg);
+}
+EXPORT_SYMBOL_GPL(snd_soc_pcm_lib_ioctl);
+
 static int snd_soc_rtdcom_add(struct snd_soc_pcm_runtime *rtd,
 			      struct snd_soc_component *component)
 {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
