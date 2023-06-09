Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D70729953
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 14:15:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DED5E6C0;
	Fri,  9 Jun 2023 14:15:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DED5E6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686312957;
	bh=uEkHK/OWnkh6TBr8Tflth6P5jYUmDTQTMsMjbj0gNak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jh86tVF/4BVAce5FZsTH6GK4/w/SppLc2i6NyFI9WSN8D3RDLNtvs3Le6tQnydO2u
	 3Gs9I5qPwns69RqEG6++X4RMVLBrfP4yBe8yvktH1T4wnSbtr5/vKqB1ymUYdL2+Uh
	 lJ/FdnMYgqc61B1HOp/EsUZcFKhqDuuaDKxZYo0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4476F80494; Fri,  9 Jun 2023 14:14:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35E11F8016C;
	Fri,  9 Jun 2023 14:14:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37431F80199; Fri,  9 Jun 2023 14:14:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ECD6BF800C8
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 14:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECD6BF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SETVrGFe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64044615A1;
	Fri,  9 Jun 2023 12:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30DC8C433D2;
	Fri,  9 Jun 2023 12:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686312871;
	bh=uEkHK/OWnkh6TBr8Tflth6P5jYUmDTQTMsMjbj0gNak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SETVrGFe66DeI9nDQrp9PDzhE14TlMnCnBvWMHQ/nPJb9roX+1jNaMI5zJsNhhxVq
	 HmIvOmR3qqU3ZNKi+qgWOB/19H5DVN+M4CP5I8Cb9EoSIOmZ7/AFy5J+ex8OOqve9m
	 K9Wo2iLgFdPQrsGvtnXVMJ33IVIaTtF1hvugL6gEqhl094LyGYjgAgGOwzLrUdzFDi
	 aWKa98PyqnFvhdmgV/SWzbhwqAo8Y2RTotx+gEMXiRKCxRwUAHJZeDpSRRK0ar8fCC
	 LESA1UpBK1eJ003zMU1EZ/DgfneDbojR3eLLXssIcpjNKKF3gmEt9/R2GyqN03HQGm
	 868D2dF3WfNdw==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Walker Chen <walker.chen@starfivetech.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230608135750.11041-1-walker.chen@starfivetech.com>
References: <20230608135750.11041-1-walker.chen@starfivetech.com>
Subject: Re: [PATCH v2 0/2] Fix error check and cleanup for JH7110 TDM
Message-Id: <168631286990.42950.16318348817986270915.b4-ty@kernel.org>
Date: Fri, 09 Jun 2023 13:14:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: UOKGZRWUAYH5BGZUGMGZWP752DVBRZL4
X-Message-ID-Hash: UOKGZRWUAYH5BGZUGMGZWP752DVBRZL4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOKGZRWUAYH5BGZUGMGZWP752DVBRZL4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 Jun 2023 21:57:48 +0800, Walker Chen wrote:
> Some minor issues were found during addtional testing and static
> analysis. The first patch fix the error check for the return value of
> devm_reset_control_array_get_exclusive(). The second patch drop some
> unused macros.
> 
> Fixes: fd4762b6b5cf ("ASoC: starfive: Add JH7110 TDM driver")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: starfive: Fix an error check in jh7110_tdm_clk_reset_get()
      commit: 3582cf94ff49469ffe78e96014550f7d4e466fbd
[2/2] ASoC: starfive: Remove some unused macros
      commit: 8bd81864533bd02d6922deadeed643c813dfe142

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

