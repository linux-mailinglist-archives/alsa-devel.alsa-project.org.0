Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D298157A1
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 04:30:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3230A1702;
	Tue,  7 May 2019 04:29:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3230A1702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557196249;
	bh=KzxoFfdUKCs6pYcPYeliuxeIqhZQErWL6Atgtb2YrnE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=sp9aIOQLiIjyX3+CRtXf70mqtGPC0Zx5/Zx9pPxrzXnLF2AuIpyZuJ2w6LwtWmTdf
	 FURIJ1ti6sExL7yIesRLeHqSWOPU6e6U2JLatJqmwft1ma1q8IldR7+X34X7MgwgxK
	 lYPIGyiTnfCtTC+OIqz6CD3ACj5iTO6ZuV7vhnuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D17A2F89674;
	Tue,  7 May 2019 04:29:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BDD6F80726; Tue,  7 May 2019 04:29:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5797FF89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 04:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5797FF89671
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="pf25/2Cl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=DDe46NmqUYgvltbsaECV64TPICiKVbZXvabF466kyyM=; b=pf25/2Cl2O51
 Cqpm48W6Ceh/vG+32GcqhAWGSjA2vwUkY0e76gu3V3mchI93l+APnO+ps+aYBNL1+W1kQKfQHDek2
 /tzWVqwVpfKebwQgKagBYaXH+SYqNdyRPY1pTbZx35l4ljWyEhc1IrXoIBBQR9Rf661Hb9/xkznDw
 OmIG4=;
Received: from kd111239185057.au-net.ne.jp ([111.239.185.57]
 helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNpqg-0003RE-V7; Tue, 07 May 2019 02:28:55 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 9D800440017; Tue,  7 May 2019 03:28:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20190506150224.1394-3-tiwai@suse.de>
X-Patchwork-Hint: ignore
Message-Id: <20190507022851.9D800440017@finisterre.sirena.org.uk>
Date: Tue,  7 May 2019 03:28:51 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Fix a compile warning with
	CONFIG_PCI=n" to the asoc tree
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
Content-Type: multipart/mixed; boundary="===============7513827711148578589=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============7513827711148578589==
Content-Type: text/plain

The patch

   ASoC: SOF: Fix a compile warning with CONFIG_PCI=n

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

From c41d384c39f17ffb5326531da2374a1ab5859403 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 6 May 2019 17:02:23 +0200
Subject: [PATCH] ASoC: SOF: Fix a compile warning with CONFIG_PCI=n
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A trivial fix for the randconfig build error:
  sound/soc/sof/ops.c:20:6: warning: ‘ret’ is used uninitialized in this function [-Wuninitialized]

Fixes: d1d95fcb63e3 ("ASoC: SOF: Add DSP HW abstraction operations")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ops.c b/sound/soc/sof/ops.c
index 80f907740b82..7a27c3b719e7 100644
--- a/sound/soc/sof/ops.c
+++ b/sound/soc/sof/ops.c
@@ -17,7 +17,7 @@ bool snd_sof_pci_update_bits_unlocked(struct snd_sof_dev *sdev, u32 offset,
 {
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	unsigned int old, new;
-	u32 ret;
+	u32 ret = 0;
 
 	pci_read_config_dword(pci, offset, &ret);
 	old = ret;
-- 
2.20.1


--===============7513827711148578589==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7513827711148578589==--
