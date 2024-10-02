Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C4D98CB5E
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2024 04:57:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A39986E;
	Wed,  2 Oct 2024 04:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A39986E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727837879;
	bh=cQxureHNPMD18RXuzOxmVrs25ScKxLAruO/HtRJl0eU=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DYfebLb4Y5G8v54TFkQwBhCf5m6EksSZOrtBPfJUjSb+HnSyFkZ69xunDZp8nhEmO
	 QzA7vW6MOVvlQpFlh6Pj0cwrFuwG1Dfb5VWY+4WF7jIIAzlLneRNLnl2pvgvI+d69U
	 R0MAET9iO+FVGxV2hu5RUc+BEVmNEVhFwl7Z67k8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DD60F805BB; Wed,  2 Oct 2024 04:57:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18D30F80527;
	Wed,  2 Oct 2024 04:57:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85BE1F80517; Wed,  2 Oct 2024 04:57:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16058F80104
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 04:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16058F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=uCKSq/w0
Received: from hwang4-ThinkPad-T14s-Gen-2a.. (unknown [120.85.104.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 996B33F0E1;
	Wed,  2 Oct 2024 02:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1727837835;
	bh=fOcbFN2psEtgjEpNtJy2uV3fiD1cmaNpijGxr2R8lmg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=uCKSq/w02F0zh4E5rq36wkBEOLI2v4oCA18oRR49CK9LwnM85JaB8pgSgvot9XJoo
	 b+fcRr1o6TmIkXITyoAl53f/y0TKGOAo3nvEyTAc1sMhccRP6svs6w27JHhd9XuSHs
	 9MOLjtNc3puFLMjvd9bEAgn+kkcOubKkuXMfVdOXWgsdGs6MjbTRZg6pNrYZnv7nq+
	 hDJ57air7patY0Hh1NXfdVnJ/hSlKZ+x0JJb2YtbCDMItvvF+zuIzEH2HcrmJs/VjI
	 33QAeenDKEeMIxPEC3e1hXd/Ysmu+Qu72UwXgujuBcBBHrfuAtbpYhsdbUNG8JbmcI
	 YlkWPufUAMFRA==
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com
Subject: [PATCH] ASoC: imx-card: Set card.owner to avoid a warning calltrace
 if SND=m
Date: Wed,  2 Oct 2024 10:56:59 +0800
Message-Id: <20241002025659.723544-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EZMGKSPWGMNZDI7636TE477SFYGB5ESK
X-Message-ID-Hash: EZMGKSPWGMNZDI7636TE477SFYGB5ESK
X-MailFrom: hui.wang@canonical.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZMGKSPWGMNZDI7636TE477SFYGB5ESK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In most Linux distribution kernels, the SND is set to m, in such a
case, when booting the kernel on i.MX8MP EVK board, there is a
warning calltrace like below:
 Call trace:
 snd_card_init+0x484/0x4cc [snd]
 snd_card_new+0x70/0xa8 [snd]
 snd_soc_bind_card+0x310/0xbd0 [snd_soc_core]
 snd_soc_register_card+0xf0/0x108 [snd_soc_core]
 devm_snd_soc_register_card+0x4c/0xa4 [snd_soc_core]

That is because the card.owner is not set, a warning calltrace is
raised in the snd_card_init() due to it.

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/soc/fsl/imx-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 98b37dd2b901..a7215bad6484 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -710,6 +710,7 @@ static int imx_card_probe(struct platform_device *pdev)
 
 	data->plat_data = plat_data;
 	data->card.dev = &pdev->dev;
+	data->card.owner = THIS_MODULE;
 
 	dev_set_drvdata(&pdev->dev, &data->card);
 	snd_soc_card_set_drvdata(&data->card, data);
-- 
2.34.1

