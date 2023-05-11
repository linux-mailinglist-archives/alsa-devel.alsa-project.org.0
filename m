Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 840626FEB4C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 07:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD874FA3;
	Thu, 11 May 2023 07:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD874FA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683783635;
	bh=lZHIGykf0/w5SWyGFtUgZIwxhpIradYJaIud1dnBpBc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uYrYpEoY8wXVmfl3F1e4/iKKSsO8UlsC319SPs1qm51fXUn8889DmU3pqEKU9002y
	 l6uY8Lxu2/BtMmvMGBD+8SAWRN6cTpTLPMf4mKN1l9m4DZpGsMcJkxLs1G6uELhu+M
	 xoa7RGgyyTl3uQd8C/tPm7BhxKUSAJXka6PjLtNQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E620F80310;
	Thu, 11 May 2023 07:39:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1883F804B1; Thu, 11 May 2023 07:36:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FDCFF8014C
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 07:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FDCFF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ozh5dAUY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6452564AC2;
	Thu, 11 May 2023 05:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A862FC433EF;
	Thu, 11 May 2023 05:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683783385;
	bh=lZHIGykf0/w5SWyGFtUgZIwxhpIradYJaIud1dnBpBc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ozh5dAUYF1mfWYlZJO31hcG6KboNE1ojUnqgKeV9ar+mpD2P1YHv6kyN30RLDTclB
	 U8EW63E2dRkW5cmgkZmbrqfRfGm/GEIyls8w8ATk0WHWrq2C410l3GO0oIXAsKRjuu
	 PNaSvVtUHaZgbouset5V9rQtB63HMNFVOyJWUvUhjQO0qj9Tqw5uicfIzw9RHBOOI7
	 sETV0bBCb9oFd59dkKXcEedcB7U4mQV5KCrH8rmoGpi4jVIjqGt+xqK8H97smXGlHq
	 B4U3GDfrhrDROk8EH/hISp2/p1mkh47pOpZfiiof+I33t8IxdVHitWTd/Cp1hbDvNp
	 UezXXq2XEmwdQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Andrew Davis <afd@ti.com>, Shi Fu <shifu0704@thundersoft.com>,
 Shenghao Ding <shenghao-ding@ti.com>, kevin-lu@ti.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
In-Reply-To: <20230509153412.62847-1-povik+lin@cutebit.org>
References: <20230509153412.62847-1-povik+lin@cutebit.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Adjust #sound-dai-cells on TI's
 single-DAI codecs
Message-Id: <168378338222.323079.1310653155844733439.b4-ty@kernel.org>
Date: Thu, 11 May 2023 14:36:22 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: GQ2Y7SVVLM4KJSDDZSR6FWUXHLB26W25
X-Message-ID-Hash: GQ2Y7SVVLM4KJSDDZSR6FWUXHLB26W25
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQ2Y7SVVLM4KJSDDZSR6FWUXHLB26W25/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 09 May 2023 17:34:12 +0200, Martin Povišer wrote:
> A bunch of TI's codecs have binding schemas which force #sound-dai-cells
> to one despite those codecs only having a single DAI. Allow for bindings
> with zero DAI cells and deprecate the former non-zero value.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Adjust #sound-dai-cells on TI's single-DAI codecs
      commit: efb2bfd7b3d210c479b9361c176d7426e5eb8663

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

