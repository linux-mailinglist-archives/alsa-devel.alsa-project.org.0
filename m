Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEBB6E10CC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 17:16:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C407F25;
	Thu, 13 Apr 2023 17:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C407F25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681398979;
	bh=h7KzqElfNX2f7QoU1g1x1vARdeArVAPCJ+inLnzOy1A=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mdb0h5c3/bIJ9Z++LyL1v3CfRTvALYiKMIcMBAd7u72xMoz72Pln8tkr+ZM5wyqJx
	 zY8YObpiSW1Z5KgLVUDg4v0iKa+pVO00P1uTqbdGQTqab6adQWk4i6jrmCwemz+sfW
	 NUR9qj9nFLxod176Fe9U3QWvuinA8TYJ13cgoZJM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70CABF804F2;
	Thu, 13 Apr 2023 17:14:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03B43F8032B; Thu, 13 Apr 2023 17:14:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CB3BF8023A
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 17:14:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CB3BF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BQpUdVdM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4784F63F5B;
	Thu, 13 Apr 2023 15:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DE2C433D2;
	Thu, 13 Apr 2023 15:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681398864;
	bh=h7KzqElfNX2f7QoU1g1x1vARdeArVAPCJ+inLnzOy1A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BQpUdVdMEcWwYyDMBNI0G19U6uxSa/VIwZjZBAGO/E2WJCeRPNUPr1tv+OCk6gSlZ
	 YUKT/AnoSLVzt1+fGt0LchlJDUauJ+QaTSRPVD0gaOp8fqllGgGWpK8TqOeWnzLosF
	 xXAq5SW+mxtSmKv0tGEeLzKXFp2YwYIYtSTJSJ6C9KBFIFI4HU+vTuxwIOH5YcMMu9
	 LAk9DTfeDgwORIs2JkKqauAClTpCwMmI7UR5/8jVKYtnYtcGdVxZVPRO+PVbgS8A9I
	 lCo7qHHacBVWOs9mUeNoBnYxskY0d6+xqTQdONwCh97uQMce3tFz5GZP6l05nEivTN
	 UsCaASo4bOTAQ==
From: Mark Brown <broonie@kernel.org>
To: David Rau <David.Rau.opensource@dm.renesas.com>
In-Reply-To: <20230413024134.8612-1-David.Rau.opensource@dm.renesas.com>
References: <20230413024134.8612-1-David.Rau.opensource@dm.renesas.com>
Subject: Re: [PATCH] ASoC: da7219: Improve the relability of AAD IRQ
 process
Message-Id: <168139886267.3579559.15217836331679376399.b4-ty@kernel.org>
Date: Thu, 13 Apr 2023 16:14:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: U4EQKCR3FC5OEIRMT5P65SD7MVVRA6SC
X-Message-ID-Hash: U4EQKCR3FC5OEIRMT5P65SD7MVVRA6SC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: support.opensource@diasemi.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bailideng@google.com, groeck@google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4EQKCR3FC5OEIRMT5P65SD7MVVRA6SC/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Apr 2023 02:41:34 +0000, David Rau wrote:
> - Configure the default gound switch delay time before enabling IRQ
>   to avoid the unexpected delay time is set up
> - Apply DA7219 AAD own work queue to handle AAD events
> - Replace msleep with queue_delayed_work to have better relability
> 
> This commit improves the control of ground switches in AAD IRQ
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7219: Improve the relability of AAD IRQ process
      commit: 2c17277893747e30e41d1a7b57b80f2b298da278

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

