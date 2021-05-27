Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7E13943F5
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 16:17:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39C8216D6;
	Fri, 28 May 2021 16:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39C8216D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622211420;
	bh=ccirT3gfVkmi1HXQ2sLn0J6QwVjyXbjrtw2sELpz75Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XzOK2BIQsFMDZyZSm2wVbNZzuQ8u4Fo420MMq064u4/9WhFzIjLf55/ZemhF4mgmh
	 /oN6sP/A3GoiGyrvPGTiNGBtySMz8OXcJNfxWP+EXGOCC6JME3S2EPWn3Z3zWPvh/M
	 iRzGvx5puWm/18b6AmZVXvtQ1I0I5goUj1258dxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD720F804C2;
	Fri, 28 May 2021 16:14:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEEA6F80149; Thu, 27 May 2021 18:35:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBC5AF8012E
 for <alsa-devel@alsa-project.org>; Thu, 27 May 2021 18:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBC5AF8012E
Received: from evilbit.green-communications.fr ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis)
 id 1MxDgs-1lWi1Y41ay-00xb4U; Thu, 27 May 2021 18:35:05 +0200
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl-asoc-card: Set .owner attribute when registering
 card.
Date: Thu, 27 May 2021 18:34:09 +0200
Message-Id: <20210527163409.22049-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.32.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2Xcz2Picz7QfmT/3RZBi3M8YNs4IfW4bK0TwJV+1zVrQF9+vlSl
 SpyEYVbT+4phkVcPD0ZG9bn4CAhEsIknv5lWwzPzDyXjwUVbUyGnIcI/zSyao3qv97Uyo4i
 8I+4g8168s60kXemjwIW7S501zxCz+aUwNwwO7y+Pb2ZprPbNdy7M8pHZeG2EZATaEWW/9y
 6O8qBSxcDQtKbzu8xhHQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bzReOWb16ek=:V0+42pMgaYxIojg4mvWBbg
 pEcUglREpACdHscuIlYtm7rEF3ODNcM1E0WQzBzhTFSs7DhVRluMSngL55mjhF42QxYVfR6yN
 Y65WkxbZGGMseBbZaK3721OpVPaZT3j2d3whJBH8Ep+YS3iBF2L2spCuH5Auajt641GTL42GW
 kZof8yQyY9aoOgnyJac80gSxutgWZfgb4Ak7fxwPfzQESJbWM+oeXTICXrW5GCrCKvCz3bhat
 2o9CPY6I3ZwHe5auyuKNq9RcQ7TdfEFm5KMHsn8mAXeUdPiGv68RVfSTL1M6WJG/6oHGiYyQR
 HaZkmeFqcTTe7HE2p0nVlYu5a/pBdX/bhesH0c8R/h8aIokRObk+EJDP8PICJNXBQOjZtpZXJ
 YjmDi/YZ3cxgRpEEEJOP/vNHx5P6984xxPB7G6loLa7hFlOWvrT7mggU/pHi2T2HMSGaaZ9LX
 I5+TKzR4hj5c+LinK2iGQJA6VuoWGUcp2B9Xhhb5O2b1stq40h5gqLrsyKkryYU2ZogkQFvtD
 kkykOYd/i9PhIrXzooyIfBz6g9K+osu7eGuFTYF6CFTnYg9QWm7CUZ6cn3PK6CoMw==
X-Mailman-Approved-At: Fri, 28 May 2021 16:14:26 +0200
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Otherwise, when compiled as module, a WARN_ON is triggered:

WARNING: CPU: 0 PID: 5 at sound/core/init.c:208 snd_card_new+0x310/0x39c [snd]
[...]
CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.10.39 #1
Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
Workqueue: events deferred_probe_work_func
[<c0111988>] (unwind_backtrace) from [<c010c8ac>] (show_stack+0x10/0x14)
[<c010c8ac>] (show_stack) from [<c092784c>] (dump_stack+0xdc/0x104)
[<c092784c>] (dump_stack) from [<c0129710>] (__warn+0xd8/0x114)
[<c0129710>] (__warn) from [<c0922a48>] (warn_slowpath_fmt+0x5c/0xc4)
[<c0922a48>] (warn_slowpath_fmt) from [<bf0496f8>] (snd_card_new+0x310/0x39c [snd])
[<bf0496f8>] (snd_card_new [snd]) from [<bf1d7df8>] (snd_soc_bind_card+0x334/0x9c4 [snd_soc_core])
[<bf1d7df8>] (snd_soc_bind_card [snd_soc_core]) from [<bf1e9cd8>] (devm_snd_soc_register_card+0x30/0x6c [snd_soc_core])
[<bf1e9cd8>] (devm_snd_soc_register_card [snd_soc_core]) from [<bf22d964>] (fsl_asoc_card_probe+0x550/0xcc8 [snd_soc_fsl_asoc_card])
[<bf22d964>] (fsl_asoc_card_probe [snd_soc_fsl_asoc_card]) from [<c060c930>] (platform_drv_probe+0x48/0x98)
[...]

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index c62bfd1c3ac7..4f55b316cf0f 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -744,6 +744,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	/* Initialize sound card */
 	priv->pdev = pdev;
 	priv->card.dev = &pdev->dev;
+	priv->card.owner = THIS_MODULE;
 	ret = snd_soc_of_parse_card_name(&priv->card, "model");
 	if (ret) {
 		snprintf(priv->name, sizeof(priv->name), "%s-audio",
-- 
2.32.0.rc0

