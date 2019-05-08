Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 904F4172C8
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 09:45:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AC741908;
	Wed,  8 May 2019 09:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AC741908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557301505;
	bh=FQg/VayvjaqtjGSu7UL349roE2CUYeReXyXjgH1RxTk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ad0jd78KQB3K2+OQ7rpWbgP1a15mTrWvnkFjQ7k5SE9Qh5wOtc5CodIGw+nvJemRQ
	 tEnXDgHyBaxBMghuQPwrENSiPgF4+q7SZQILJWkIrgZjrFy6dGWhsjOPFJQ31z+dU6
	 Q0FTRFnfezDf6ahLkj3rBlF+L6xs5WXNcKUKhf+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8681CF8970E;
	Wed,  8 May 2019 09:44:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20A49F896FF; Wed,  8 May 2019 09:44:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFDAAF80796
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 09:44:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFDAAF80796
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LFq+5r3f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Ka41KXkKipubdXy6SFTlMZnWRUhvn4QbBJ3AtTUn8GY=; b=LFq+5r3fBY+Q
 7U9VgVg+XbBBMyx5ZfkuGhNov5afPlE7ZyCJGHCO1fRAaIRLAGyJMGobeRz0Zrv788OXiKjgSH/c3
 NdbuMDJcPZlZNthLvC2z4Iiyf75y6UF4n/09dDyNiGdK4nFyStumnRkS/TGVEy6WepvYqz1hPuTsE
 i1FgE=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOHFD-0007MS-Of; Wed, 08 May 2019 07:44:05 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id ED666440033; Wed,  8 May 2019 07:47:08 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20190507193910.23943-1-tiwai@suse.de>
X-Patchwork-Hint: ignore
Message-Id: <20190508064708.ED666440033@finisterre.sirena.org.uk>
Date: Wed,  8 May 2019 07:47:08 +0100 (BST)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Propagate
	sof_get_ctrl_copy_params() error properly" to the asoc tree
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

   ASoC: SOF: Propagate sof_get_ctrl_copy_params() error properly

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 54d198d5019dd98b9bcb9099a389608d7e2cccad Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 7 May 2019 21:39:10 +0200
Subject: [PATCH] ASoC: SOF: Propagate sof_get_ctrl_copy_params() error
 properly

This fixes a compile warning below by properly handling the error code
from sof_get_ctrl_copy_params():
  include/linux/kernel.h:843:43: warning: 'sparams.pl_size' may be used uninitialized in this function [-Wmaybe-uninitialized]
  sound/soc/sof/ipc.c:639:34: note: 'sparams.pl_size' was declared here

The function returns an error before setting sparams.pl_size, so it'd
assign an uninitialized value at a later point.

Fixes: 53e0c72d98ba ("ASoC: SOF: Add support for IPC IO between DSP and Host")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/ipc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index ba1bb17a8d1e..f0b9d3c53f6f 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -567,7 +567,7 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
 	size_t offset = 0;
 	size_t msg_bytes;
 	size_t pl_size;
-	int err = 0;
+	int err;
 	int i;
 
 	/* allocate max ipc size because we have at least one */
@@ -576,9 +576,13 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
 		return -ENOMEM;
 
 	if (send)
-		sof_get_ctrl_copy_params(cdata->type, cdata, partdata, sparams);
+		err = sof_get_ctrl_copy_params(cdata->type, cdata, partdata,
+					       sparams);
 	else
-		sof_get_ctrl_copy_params(cdata->type, partdata, cdata, sparams);
+		err = sof_get_ctrl_copy_params(cdata->type, partdata, cdata,
+					       sparams);
+	if (err < 0)
+		return err;
 
 	msg_bytes = sparams->msg_bytes;
 	pl_size = sparams->pl_size;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
