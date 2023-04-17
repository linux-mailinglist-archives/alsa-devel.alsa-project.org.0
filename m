Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 222806E51DF
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 22:29:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F295CDF5;
	Mon, 17 Apr 2023 22:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F295CDF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681763374;
	bh=jTUKGS4yE6dGIJLV1sOj+vFZpr3b/IpFoTct4m0Hq2g=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R9mr7RqWTmRRRkSAEQFy45RWZTBma2OyUSy8A35KKuh413V7o6QKthAXTH9LGdKXX
	 ci0LpwXbUBM50305sW4nztPDyVhM+uyp8V3qbxJw4Uh/LSZ3vk7Nw4QLQ/qeRlUYvm
	 McDGwpCpzHinl6qtdkpwUMM94A62yI+clU8R0TYc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2F21F804F2;
	Mon, 17 Apr 2023 22:27:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F6CDF80266; Mon, 17 Apr 2023 22:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D612DF8023A
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 22:27:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D612DF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XZCyyjyx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B0F361128;
	Mon, 17 Apr 2023 20:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DDADC4339B;
	Mon, 17 Apr 2023 20:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681763266;
	bh=jTUKGS4yE6dGIJLV1sOj+vFZpr3b/IpFoTct4m0Hq2g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XZCyyjyxzcZQzG6lCLUfJCEqUBRP0qLMwCzDSoB+ZjpdCHx0IB5PPsL0btoPeUmyR
	 cUN8Sw0p7Vsk8oyw1KslYMeJH+JaZ839letabf4nApeHj4jPvi6VBDLXxikYNddoGK
	 Ra2h3wrArKnQWdR982Uf3YO3Wie6EEZ8sX9J++nUKGlwJG8/zBwRF8CTuSL9zPPzVO
	 etVpnrG23fGEV6lLIn7lfO5cfoxw1BdFfpKr6yrGTNM4wmb6Lmc9XMl9LqrAnvk2bM
	 45zYm/PBs6eNBw+itcI3v+mq92HzJNfWsrxg1erv2INbnw4uaHwTc3Ff/+Z+8Yxe1g
	 BpRwBKz11Hdlw==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Dan Carpenter <error27@gmail.com>,
 Liliang Ye <yll@hust.edu.cn>
In-Reply-To: <20230403152647.17638-1-yll@hust.edu.cn>
References: <20230403152647.17638-1-yll@hust.edu.cn>
Subject: Re: [PATCH 1/2] ASoC: fsl_mqs: move of_node_put() to the correct
 location
Message-Id: <168176326315.1296984.11419887064802720363.b4-ty@kernel.org>
Date: Mon, 17 Apr 2023 21:27:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: TLPKPWDCZ4VGAVJDWE4MXXTCISVQRIPG
X-Message-ID-Hash: TLPKPWDCZ4VGAVJDWE4MXXTCISVQRIPG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: hust-os-kernel-patches@googlegroups.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLPKPWDCZ4VGAVJDWE4MXXTCISVQRIPG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Apr 2023 23:26:47 +0800, Liliang Ye wrote:
> of_node_put() should have been done directly after
> mqs_priv->regmap = syscon_node_to_regmap(gpr_np);
> otherwise it creates a reference leak on the success path.
> 
> To fix this, of_node_put() is moved to the correct location, and change
> all the gotos to direct returns.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_mqs: move of_node_put() to the correct location
      commit: 1c34890273a020d61d6127ade3f68ed1cb21c16a

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

