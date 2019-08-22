Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A27F99EF6
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 20:36:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C452165F;
	Thu, 22 Aug 2019 20:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C452165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566499003;
	bh=dz6DHaqHEGNUHc2CPhAvvlptPc9PvmgS/K5XNSGvWPY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bbYomgwAoGi54qbzXLxV62Wea51d98Rreui+WTOtVHLyoBHuqlT6DTOH569CtiZvI
	 bFegAXkL2UgAqYQbM1JyRrVixIozgcuTMcNGPJbJmjJbIbCTuAZhg1dwIipWo2E3sP
	 sPC7jj35p/lRKyBNYe8Oo8abpr9822ISJg33iP74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4375AF8060D;
	Thu, 22 Aug 2019 20:33:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EED51F805FF; Thu, 22 Aug 2019 20:33:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBF02F8036D
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 20:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBF02F8036D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="B7xOYdtQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=KaIblbdsifQYmuKNE+w2SpO0N4xOfJHrs9C/2FmfrZg=; b=B7xOYdtQsuYl
 gcTvlWklp/5RLjDegoZLiJvaqTfSepAv23GGVA29kfqKPtiEyX6YSntNd/gequv1mSzNyra0ejtPX
 rwGgwItVMfQ5GHBrCrUOwGYBHjT6PYqNcLhH7bejqaxBz78so83Q1Haaj8SYSQwlsN/41QZ3GJ/dc
 +I9UQ=;
Received: from 92.40.26.78.threembb.co.uk ([92.40.26.78]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i0rtL-0007fN-4u; Thu, 22 Aug 2019 18:33:01 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 9A081D02CCA; Thu, 22 Aug 2019 19:32:56 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jaska Uimonen <jaska.uimonen@intel.com>
In-Reply-To: <20190821211138.14618-1-jaska.uimonen@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190822183256.9A081D02CCA@fitzroy.sirena.org.uk>
Date: Thu, 22 Aug 2019 19:32:56 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: topology: fix get control data
	return type and arguments" to the asoc tree
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

   ASoC: SOF: topology: fix get control data return type and arguments

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

From b2f3e0c9e4ee2e07fd880cc0c4da20c42d633d4b Mon Sep 17 00:00:00 2001
From: Jaska Uimonen <jaska.uimonen@intel.com>
Date: Thu, 22 Aug 2019 00:11:38 +0300
Subject: [PATCH] ASoC: SOF: topology: fix get control data return type and
 arguments

sof_get_control_data returns negative values even though the return
value is defined unsigned (size_t). So change the return value type to
int and add the data size as pointer argument to sof_get_control_data to
avoid ambiquity in the meaning of the return type.

Fixes: cac974a51ebb ("ASoC: SOF: topology: use set_get_data in process load")
Reported by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Jaska Uimonen <jaska.uimonen@intel.com>
Link: https://lore.kernel.org/r/20190821211138.14618-1-jaska.uimonen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/topology.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 28a7a6e06a53..fc85efbad378 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1752,17 +1752,19 @@ static int sof_widget_load_siggen(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
-static size_t sof_get_control_data(struct snd_sof_dev *sdev,
-				   struct snd_soc_dapm_widget *widget,
-				   struct sof_widget_data *wdata)
+static int sof_get_control_data(struct snd_sof_dev *sdev,
+				struct snd_soc_dapm_widget *widget,
+				struct sof_widget_data *wdata,
+				size_t *size)
 {
 	const struct snd_kcontrol_new *kc;
 	struct soc_mixer_control *sm;
 	struct soc_bytes_ext *sbe;
 	struct soc_enum *se;
-	size_t size = 0;
 	int i;
 
+	*size = 0;
+
 	for (i = 0; i < widget->num_kcontrols; i++) {
 		kc = &widget->kcontrol_news[i];
 
@@ -1800,7 +1802,7 @@ static size_t sof_get_control_data(struct snd_sof_dev *sdev,
 		if (wdata[i].pdata->magic != SOF_ABI_MAGIC)
 			return -EINVAL;
 
-		size += wdata[i].pdata->size;
+		*size += wdata[i].pdata->size;
 
 		/* get data type */
 		switch (wdata[i].control->cmd) {
@@ -1819,7 +1821,7 @@ static size_t sof_get_control_data(struct snd_sof_dev *sdev,
 		}
 	}
 
-	return size;
+	return 0;
 }
 
 static int sof_process_load(struct snd_soc_component *scomp, int index,
@@ -1855,12 +1857,11 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 			return -ENOMEM;
 
 		/* get possible component controls and get size of all pdata */
-		ipc_data_size = sof_get_control_data(sdev, widget, wdata);
+		ret = sof_get_control_data(sdev, widget, wdata,
+					   &ipc_data_size);
 
-		if (ipc_data_size <= 0) {
-			ret = ipc_data_size;
+		if (ret < 0)
 			goto out;
-		}
 	}
 
 	ipc_size = sizeof(struct sof_ipc_comp_process) +
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
