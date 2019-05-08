Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE6F17539
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:36:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70DFB1948;
	Wed,  8 May 2019 11:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70DFB1948
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557308202;
	bh=52t+4zlJjK0cGZ4utB8rtCEkgFDwgKWu1T5pwH/4H/o=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ZhJtvPe5E/iIZHkTRsqSRkf1xhhXHM5OdfNeZ8mzkLOi6N2UdwRKtdiwzn7roexQD
	 VQ1wA/sEtIWo4AElVTqXdupu+6qIIMkNNWFkxnmiMX5R3JZFC6ZY/Nc1RxeYBQh04L
	 n5vNWN1/DXq2wTC3T0RpeEmg4cb11ORklMSOYIOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22724F896FF;
	Wed,  8 May 2019 11:34:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0EFDF896F0; Wed,  8 May 2019 11:34:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58869F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58869F8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="XsnlfFf5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=wN3wXBVL+Q97siyoU6e++S2m+Eymzr+Lcl1//VYUVcA=; b=XsnlfFf5kq8+
 7+dSNy6zeJohxZw5GZK+5ryaiggXwqlSONFMuKs60BDvMYFjowB0edi+MwXAX30bYq6zlGTouFzkP
 n6ldgGa52mMPMFlIMvjSiLGuPzwXBgXwUIo4ChyliM8Ch1CjnDuG7OYujPLHW07S0AgZ5wxEkKShu
 dgdFU=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOIyO-0007l2-1M; Wed, 08 May 2019 09:34:51 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 5E0E444000C; Wed,  8 May 2019 10:34:42 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: 
X-Patchwork-Hint: ignore
Message-Id: <20190508093442.5E0E444000C@finisterre.sirena.org.uk>
Date: Wed,  8 May 2019 10:34:42 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Fix unused variable warnings" to
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
Content-Type: multipart/mixed; boundary="===============6460744888605321225=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============6460744888605321225==
Content-Type: text/plain

The patch

   ASoC: SOF: Fix unused variable warnings

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

From 2a79e3d342e4b8883ff7fe2cf1b3e9192c26f61a Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 8 May 2019 10:50:37 +0200
Subject: [PATCH] ASoC: SOF: Fix unused variable warnings
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The recent fix for the build fix caused a couple of unused variable
compiler warnings when CONFIG_SND_SOC_SOF_NOCODEC isn't set:
  sound/soc/sof/core.c:263:6: warning: unused variable ‘ret’ [-Wunused-variable]
  sound/soc/sof/core.c:262:28: warning: unused variable ‘machine’ [-Wunused-variable]

Fix them by adding another ifdef.

Fixes: ce38a75089f7 ("ASoC: SOF: core: fix undefined nocodec reference")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 5ddbfa8f1a28..32105e0fabe8 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -259,8 +259,10 @@ int snd_sof_create_page_table(struct snd_sof_dev *sdev,
 static int sof_machine_check(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *plat_data = sdev->pdata;
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC)
 	struct snd_soc_acpi_mach *machine;
 	int ret;
+#endif
 
 	if (plat_data->machine)
 		return 0;
-- 
2.20.1


--===============6460744888605321225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6460744888605321225==--
