Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DC76E8136
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 20:26:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60CA6EE6;
	Wed, 19 Apr 2023 20:25:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60CA6EE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681928809;
	bh=2P38Dw70hIslqESCsP4xROGp7y6M/3NfsY5sjrm73kc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JmfSlMSk0/XrNFyc10r/lxinkmjzKPSYDILnSxMRzTHe4oslR8vTJjKK4/liX+Q6E
	 Z3bupL+N2eOQ+UHn0JYuXjSON4uGROrPwt/m+/R1/ytE2+JRtQyfPmFrxB489RRvvH
	 S0DlQ7L2Xg7TEXjk23/Y027LqLMTm7cAGx6ZcgaI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C584CF80149;
	Wed, 19 Apr 2023 20:25:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2081BF80155; Wed, 19 Apr 2023 20:25:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE47CF800D0
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 20:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE47CF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CDQvHa09
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3AC5F6417A;
	Wed, 19 Apr 2023 18:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADE1C433EF;
	Wed, 19 Apr 2023 18:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681928745;
	bh=2P38Dw70hIslqESCsP4xROGp7y6M/3NfsY5sjrm73kc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CDQvHa098OUr1TV+UYmGrjfxifLo/RGveTTYnTeR6EbI4whpre6POiH8WZIEoYCUs
	 SbKSYpcb7j0Ovj8KoEu2B/SQcXoRCQxCvJE9OlhofYZEMW4Ov0km+NRxLoGAZm9Sh3
	 L0S7b2F0fH1KvR692twl6VSdpPcnJo5Fa7mQHGrxhLoXsLDXFjvynHtGSqDPqo3s9o
	 xIV5+PwIaZM9bKV7S/r0c28xMBBLGgW44usD9vNJHeTKlTLhNC/mYXtngjQBTGOFwU
	 2zinwSVQbf5Higgr0d7Gr+wkVA1CWh8RbyBjwgziBfRYOltTtMJ60clU3rOGcUABFK
	 9i7F+w/0JL5ug==
From: Mark Brown <broonie@kernel.org>
To: kuninori.morimoto.gx@renesas.com, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, linux-imx@nxp.com,
 alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1681900158-17428-1-git-send-email-shengjiu.wang@nxp.com>
References: <1681900158-17428-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] Revert "ASoC: fsl: remove unnecessary
 dai_link->platform"
Message-Id: <168192874180.115075.9783971012630228095.b4-ty@kernel.org>
Date: Wed, 19 Apr 2023 19:25:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00e42
Message-ID-Hash: INRL4ETVQP6S467NBOFDSILGPS7UASAQ
X-Message-ID-Hash: INRL4ETVQP6S467NBOFDSILGPS7UASAQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/INRL4ETVQP6S467NBOFDSILGPS7UASAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Apr 2023 18:29:18 +0800, Shengjiu Wang wrote:
> This reverts commit 33683cbf49b5412061cb1e4c876063fdef86def4.
> 
> dai_link->platform is needed. The platform component is
> "snd_dmaengine_pcm", which is registered from cpu driver,
> 
> If dai_link->platform is not assigned, then platform
> component will not be probed, then there will be issue:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Revert "ASoC: fsl: remove unnecessary dai_link->platform"
      commit: 09cda705860125ffee1b1359b1da79f8e0c77a40

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

