Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9A62C9AC
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 17:09:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83EBF180F;
	Tue, 28 May 2019 17:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83EBF180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559056191;
	bh=hKS/ci3uET++IV7LUa6wDQWYF1pNtNzXgw+VHdDRbD8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Q514hxTPIIWNKwNliu0fD4CtUAbJlTDawuD6UNM7zbZwh8l6gpDeI+3/d/fEFF24J
	 ytrpfxY7cmlWXtG+CJTpcsfFTCjcSn6dlBlTEUO2nTuefwGVHHjKERJripZzQccnet
	 WcwoY+NRyczl6a9aDPVP3nYGVkDgeGhENwq2NK1Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FC73F89719;
	Tue, 28 May 2019 17:07:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D0B9F8972D; Tue, 28 May 2019 17:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 218A1F896EB
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 17:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 218A1F896EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YinwQT2P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=zBn80fC5Q5JXN/PuriJtjh1Ix7xFmFlu2MjGizy1QZg=; b=YinwQT2P/24D
 oPWN6JIuSJvY/pXJ4YfhJXAHxooUW6wITq8ekIqT3cF9Div6FvFPYJocCJ9KjqFhADXz957BC6YmD
 icL3Gf6sd/cMDtDkklbaUQHK4q92XC8voeUNuJkuX6wJ5sYBVBfqCOaZ/LZCV4+SqebYowWrWcczk
 CdePM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hVdgo-0002nu-Hv; Tue, 28 May 2019 15:06:58 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D7F0D440046; Tue, 28 May 2019 16:06:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Gustavo A. R. Silva <gustavo@embeddedor.com>
In-Reply-To: <20190523155800.GA2428@embeddedor>
X-Patchwork-Hint: ignore
Message-Id: <20190528150657.D7F0D440046@finisterre.sirena.org.uk>
Date: Tue, 28 May 2019 16:06:57 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Use struct_size() in kmemdup()" to
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Use struct_size() in kmemdup()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From b11c5b5e573968d69aa9fec7507de7aa8fbf76e6 Mon Sep 17 00:00:00 2001
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Date: Thu, 23 May 2019 10:58:00 -0500
Subject: [PATCH] ASoC: SOF: Use struct_size() in kmemdup()

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes, in particular in the
context in which this code is being used.

So, replace code of the following form:

sizeof(*w) + sizeof(struct sof_ipc_window_elem) * w->num_windows

with:

struct_size(w, window, w->num_windows)

Notice that variable size is unnecessary, hence it is removed.

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/loader.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 628fae552442..16b016b76fd8 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -19,15 +19,13 @@ static int get_ext_windows(struct snd_sof_dev *sdev,
 {
 	struct sof_ipc_window *w =
 		container_of(ext_hdr, struct sof_ipc_window, ext_hdr);
-	size_t size;
 
 	if (w->num_windows == 0 || w->num_windows > SOF_IPC_MAX_ELEMS)
 		return -EINVAL;
 
-	size = sizeof(*w) + sizeof(struct sof_ipc_window_elem) * w->num_windows;
-
 	/* keep a local copy of the data */
-	sdev->info_window = kmemdup(w, size, GFP_KERNEL);
+	sdev->info_window = kmemdup(w, struct_size(w, window, w->num_windows),
+				    GFP_KERNEL);
 	if (!sdev->info_window)
 		return -ENOMEM;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
