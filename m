Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEE99AB823
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2024 23:02:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51479950;
	Tue, 22 Oct 2024 23:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51479950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729630942;
	bh=xqtlUhw8rmrDSpNkrqtyPtQIJUIMIG4Xa/kCuAim9xs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=u7TpW+DOJ/DfGkJMt91IA+usrevzHbAXRv3JYEOQ+Cv02NMxPOHC8qjVMNShI9gb2
	 rVIRM/D9SVi/DJn9W4HzlxSNqjjvFyQjkZb5DDDNW/YPV95YFY8F++joo8sViHPwvo
	 Dhf/7GeyxSU5FePkUriZg4APZabgrKjgUPnjVKHo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A057CF805B3; Tue, 22 Oct 2024 23:01:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E941F80579;
	Tue, 22 Oct 2024 23:01:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 367DEF8016C; Tue, 22 Oct 2024 23:01:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06150F80149
	for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2024 23:00:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06150F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sRySlJva
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92B345C5CDB;
	Tue, 22 Oct 2024 21:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BAFDC4CEE3;
	Tue, 22 Oct 2024 21:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729630830;
	bh=xqtlUhw8rmrDSpNkrqtyPtQIJUIMIG4Xa/kCuAim9xs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=sRySlJvaDIgA7CqpeVCHlCjQ9N3IDeVH64OWYdmvNY7+5xl4VEWoVhw9/MPcuQgnf
	 CjEVJa21+IvZCM5NRpxh0eVky+wFMAVGZXkeixfxhlUvDW1I2bD9aTb2AXSGn4j2Su
	 tGtIkgCGfsoOg8lzflkZsZ93+pv5E69x6WOT6W7KHZvdy3vopi8SEAuqkgTR2FdIg/
	 aXPBI0WTQZ8L6vy3jDSa1XU2b1OeSx/koxQx95XBW/S/CM+VfiJMPkzYvchVKvBv0l
	 DI2zIFB51RfszhjbrHuyL5KorFUaGmputCN/bdy+V9ohn61/BV5Ra5CEVSs7E6NxW6
	 PLR67TCUEBhAQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1728368873-31379-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728368873-31379-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 0/2] ASoC: fsl_xcvr: enable some interrupts
Message-Id: <172963082823.164184.11756068817626809151.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 22:00:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-9b746
Message-ID-Hash: J5OVVKV53WE64MTSGQJJOS3MVDJGDGHB
X-Message-ID-Hash: J5OVVKV53WE64MTSGQJJOS3MVDJGDGHB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J5OVVKV53WE64MTSGQJJOS3MVDJGDGHB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 08 Oct 2024 14:27:51 +0800, Shengjiu Wang wrote:
> Enable interrupt of cmdc status update and the interrupts for
> wrong preamble received.
> 
> Shengjiu Wang (2):
>   ASoC: fsl_xcvr: enable interrupt of cmdc status update
>   ASoC: fsl_xcvr: reset RX dpath after wrong preamble
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl_xcvr: enable interrupt of cmdc status update
      commit: 06461e288abcd6d67d0a870cd25731c79ebe66ab
[2/2] ASoC: fsl_xcvr: reset RX dpath after wrong preamble
      commit: 1e5d0f106164d2089826c16bb521891d1d06d3ad

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

