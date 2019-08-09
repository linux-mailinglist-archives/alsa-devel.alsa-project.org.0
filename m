Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAEF87A3A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 14:34:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB0C786E;
	Fri,  9 Aug 2019 14:34:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB0C786E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565354092;
	bh=kqpbjol7Do+i6m5UzVmR73Wg8UjdyYYj1HD2nK4KDqI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Hw4MpDOD5XsfTZNPkg17SEpq2/AfFu9Goej+wt1wBr9xK12iHfOk1qGp9JhoqgE7Z
	 dblsdplvVlCOTpdyOCoPc0vX9BC4So7fhB9OLQu6Bflbr0Cm+aZha7w7DRG4rxD6Vv
	 mLvj0dZ4clChmwmh/kN/pa7V38AuCjxO9TyuRYdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 826C4F805F5;
	Fri,  9 Aug 2019 14:32:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3E0AF805F8; Fri,  9 Aug 2019 14:31:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2721F804CB
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 14:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2721F804CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AgxNKyoV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PyQuYLbbrwNRJG3gNFH017zJOzH4VmU8ZGkFtnwQFNA=; b=AgxNKyoVBu5N
 atv//A0uWBWonkiqidrTepGbSepFwLPqLJhOwfvBFOP5lCGmQWYIlL2bdKDYj5Ib2sYBjDSR0uEel
 9YmIg0JyrNbedmwTg+rjGqZ5A3tXUUBoWpZnWgKzZEIvdVdpfukPBZHjLP42TwkV4Z++jhZqLrn01
 uTzj8=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hw43k-00060u-6G; Fri, 09 Aug 2019 12:31:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 48D422743057; Fri,  9 Aug 2019 13:31:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190807150203.26359-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190809123151.48D422743057@ypsilon.sirena.org.uk>
Date: Fri,  9 Aug 2019 13:31:51 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Introduce
	snd_sof_dsp_get_window_offset" to the asoc tree
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

   ASoC: SOF: Introduce snd_sof_dsp_get_window_offset

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

From e17422cda9d60339d71e117d3fdfd444e83669a4 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Wed, 7 Aug 2019 10:02:00 -0500
Subject: [PATCH] ASoC: SOF: Introduce snd_sof_dsp_get_window_offset

This will allow us to export the offset for a memory window.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190807150203.26359-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/ops.h      | 9 +++++++++
 sound/soc/sof/sof-priv.h | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index c820606f19a1..824d36fe59fd 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -128,6 +128,15 @@ static inline int snd_sof_dsp_get_mailbox_offset(struct snd_sof_dev *sdev)
 	return -ENOTSUPP;
 }
 
+static inline int snd_sof_dsp_get_window_offset(struct snd_sof_dev *sdev,
+						u32 id)
+{
+	if (sof_ops(sdev)->get_window_offset)
+		return sof_ops(sdev)->get_window_offset(sdev, id);
+
+	dev_err(sdev->dev, "error: %s not defined\n", __func__);
+	return -ENOTSUPP;
+}
 /* power management */
 static inline int snd_sof_dsp_resume(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 3aefb8ec3ef9..de11f28bae3a 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -199,6 +199,8 @@ struct snd_sof_dsp_ops {
 	int (*get_bar_index)(struct snd_sof_dev *sdev,
 			     u32 type); /* optional */
 	int (*get_mailbox_offset)(struct snd_sof_dev *sdev);/* mandatory for common loader code */
+	int (*get_window_offset)(struct snd_sof_dev *sdev,
+				 u32 id);/* mandatory for common loader code */
 
 	/* DAI ops */
 	struct snd_soc_dai_driver *drv;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
