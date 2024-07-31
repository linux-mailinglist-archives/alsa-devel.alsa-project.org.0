Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2B4943175
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 15:55:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3675E2C91;
	Wed, 31 Jul 2024 15:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3675E2C91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722434116;
	bh=h4jkxfwJQEcLEg45LO0JMK3kGyr4gy5FVoR95arp49E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZMrJVnh2Wchz6I3ShPjed3ESUr0HV8BbdmCVVvLLj4MSPCXH2hPJWinVJjZ7Lmfbx
	 vsgEphN04DgMQucanFmqwKSqRaMfWabiZhlNItpmPlkK7k1BUaTztmCj41ijLkqy8n
	 kgKFrjyoVREN5ODPYQc5VFOKrGP66bF9GBl0Eawo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89590F805AF; Wed, 31 Jul 2024 15:54:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0E8CF805B0;
	Wed, 31 Jul 2024 15:54:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A70C0F8057A; Wed, 31 Jul 2024 15:53:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89EE5F80269
	for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2024 15:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89EE5F80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fsCfmhZS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3EA3962388;
	Wed, 31 Jul 2024 13:53:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D1EC116B1;
	Wed, 31 Jul 2024 13:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722434006;
	bh=h4jkxfwJQEcLEg45LO0JMK3kGyr4gy5FVoR95arp49E=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fsCfmhZSDqAoNxS7TL+g2Cyvt+P/djSELkOmXa7C+3x69n/p7AFXQLdp2LZdv1Uva
	 N6idLgS1d45bF4NwpxbF4ai0HmK61KoO0CBvLcOAIr0a3XT/+daWBl+E7Y9Htsof+3
	 6oeBJt5ZvQyZjPAH6gUD4Nd0+7yFubIJL3QzbOAaAwo/Efb/XaE28ORi0xDqbbYIYi
	 Zw8l179LS9wrWRqCetYFm+GD9YWwsPEgYBC84TU5FxTr0Zyq2D/2s7dJva9X0yRnIj
	 Ks4BYMr873zY+q6Hx/Rk8GzroKrJpVeSA5K2DQOSPzzuvxBgXm3h7d6UJK4iav9xQ8
	 0uEV4bU/px5XA==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
References: <1721897694-6088-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_micfil: Check the difference for i.MX8
 and i.MX9
Message-Id: <172243400439.75630.6636735348572180704.b4-ty@kernel.org>
Date: Wed, 31 Jul 2024 14:53:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: ZGCOYCK73SZGSCQZEZYDFUHF5ANWQHSX
X-Message-ID-Hash: ZGCOYCK73SZGSCQZEZYDFUHF5ANWQHSX
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZGCOYCK73SZGSCQZEZYDFUHF5ANWQHSX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 Jul 2024 16:54:52 +0800, Shengjiu Wang wrote:
> There are some register difference for i.MX8 and i.MX9
> REG_MICFIL_FIFO_CTRL definition is updated.
> REG_MICFIL_FSYNC_CTRL, REG_MICFIL_VERID, REG_MICFIL_PARAM are added from
> i.MX9
> 
> Shengjiu Wang (2):
>   ASoC: fsl_micfil: Expand the range of FIFO watermark mask
>   ASoC: fsl_micfil: Differentiate register access permission for
>     platforms
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_micfil: Expand the range of FIFO watermark mask
      commit: 4ddd51ccff911a2e9e961307692532a325f6c78a
[2/2] ASoC: fsl_micfil: Differentiate register access permission for platforms
      commit: aa4f76ef09a993efa9b5fab6ddf5d6d324baaea3

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

