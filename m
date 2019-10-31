Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7922AEB150
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Oct 2019 14:37:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 164F7203C;
	Thu, 31 Oct 2019 14:36:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 164F7203C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572529021;
	bh=dwPHE7Dx26l/rWLfaTr8n8eJHeadsvuYnYZi9hZ0+8w=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gVbJC/qXVCHDqVu1L7DWt5+e4oa/z0w5iEc1qYRebQ1xr9fv/zjj9nHhYR7CY7e5x
	 ku7wwdqH/EUXV683NNUKBEm//G78vhGQokl23N2Baoydu+36ib9pZGTMSgDbpXLhkI
	 N3gKvMJc2CIFzbDN/Ucmvhb3igs8a1tVvW1Ko7p0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3140F805FE;
	Thu, 31 Oct 2019 14:33:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C213F805FC; Thu, 31 Oct 2019 14:33:44 +0100 (CET)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01E4DF80394
 for <alsa-devel@alsa-project.org>; Thu, 31 Oct 2019 14:23:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01E4DF80394
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KsXd+39J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=+33TbxMHFj5pAl/K9V+w7oGZgPDx7JmyBow3N/qBMjc=; b=KsXd+39J3PE7
 cTXwX2aQf53nCWtJ+Sql9VwhtzZ8Fe9mFSapqWnBdVPXKfd7BVdMHGfr5OCXa+h/sYQoHJV1Lrcv2
 CFJhrz/CN/qgPV5lMhGAHS+pWjBJkMOEdnghuKOLQxC8Z71x0rttVuKW337ihvKYrH8gEaoFsKb3u
 I8Wwg=;
Received: from [91.217.168.176] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iQAQK-0007oX-Ok; Thu, 31 Oct 2019 13:23:36 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 61936D020AF; Thu, 31 Oct 2019 13:23:36 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20191031115414.20951-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20191031132336.61936D020AF@fitzroy.sirena.org.uk>
Date: Thu, 31 Oct 2019 13:23:36 +0000 (GMT)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, tzungbi@google.com,
 Mark Brown <broonie@kernel.org>, derek.fang@realtek.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt1011: improve the
	rt1011_set_dai_fmt() function" to the asoc tree
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

   ASoC: rt1011: improve the rt1011_set_dai_fmt() function

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

From 5cf93491ff98cff0d2f9725e7c44e0bd38325697 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Thu, 31 Oct 2019 19:54:14 +0800
Subject: [PATCH] ASoC: rt1011: improve the rt1011_set_dai_fmt() function

If there is a wrong format setting,
the driver will goto the end of the function directly.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20191031115414.20951-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1011.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 8a74f374d779..57a3a34b5f18 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1631,6 +1631,7 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	default:
 		ret = -EINVAL;
+		goto _set_fmt_err_;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
@@ -1641,6 +1642,7 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	default:
 		ret = -EINVAL;
+		goto _set_fmt_err_;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -1657,6 +1659,7 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	default:
 		ret = -EINVAL;
+		goto _set_fmt_err_;
 	}
 
 	switch (dai->id) {
@@ -1674,6 +1677,7 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		ret = -EINVAL;
 	}
 
+_set_fmt_err_:
 	snd_soc_dapm_mutex_unlock(dapm);
 	return ret;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
