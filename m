Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D389772FFE
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 21:56:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FF743E7;
	Mon,  7 Aug 2023 21:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FF743E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691438216;
	bh=tEbnU09vPVyTnjYTEByjdm9ue6dsfCiNeNTAbZgnfDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H4PiV0JisXwvvVhwdwra9Aek9Blkhq9Hx6GI+n8FP3pSZwSmyiocHEcUmkgstePS1
	 bDHdPVCPuRI+MDophE3Ku7Audr0jBNfcbxxfzcN5vPpWcY+KrfXjsnluYNrQkY2Ra9
	 p1Tbsn9tnFxWjftjzXFEi5Lzv5EnSuXhIdgcaXVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3354F805AE; Mon,  7 Aug 2023 21:54:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49A6DF8058C;
	Mon,  7 Aug 2023 21:54:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C069EF80087; Mon,  7 Aug 2023 21:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F883F80087
	for <alsa-devel@alsa-project.org>; Mon,  7 Aug 2023 21:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F883F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s6yMBKDj
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 68F4962188;
	Mon,  7 Aug 2023 19:54:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB06C433C7;
	Mon,  7 Aug 2023 19:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691438059;
	bh=tEbnU09vPVyTnjYTEByjdm9ue6dsfCiNeNTAbZgnfDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s6yMBKDj6TChjpPAPdjqPI7Gd0bKNEE9JS0/iM2SgMgn4guDb/EJsyG9xRT0GkHpC
	 MLO/k6WFXGFlW7PdRWGXfY5b6SWVm0ut+Wmw28lv/CHBSRHc2IZnKfWFRBa6tqL/KI
	 iWRysJziuE1tfcEFlkZdZa/Lact4HWRgkMO4RWJweRv5WRv310xlclO3CxNimpAwNZ
	 lOGkpSUe+SBIgK53uhxBA9V/JnPGMQgCQtGda4KnGklcdyNsmuMbjZKGFAessEugp0
	 5dJFzxlgoI7znv2RbOr0OBOYlD9NFY6Dm77c0yyhdt0Czv8x/2GD8MSpUh5JDIBwUU
	 hS6PNI26UN4/A==
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-mips@vger.kernel.org, alsa-devel@alsa-project.org
In-Reply-To: <20230712-asoc-jz-maple-v1-1-3f745adf96e5@kernel.org>
References: <20230712-asoc-jz-maple-v1-1-3f745adf96e5@kernel.org>
Subject: Re: [PATCH] ASoC: jz4740: Update to use maple tree register cache
Message-Id: <169143805855.302632.5921951627576966633.b4-ty@kernel.org>
Date: Mon, 07 Aug 2023 20:54:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: EQ66TXZDXQDAVBCMHTDOWIEWXP45VEJP
X-Message-ID-Hash: EQ66TXZDXQDAVBCMHTDOWIEWXP45VEJP
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jul 2023 12:14:21 +0100, Mark Brown wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache. In
> v6.5 it has also acquired the ability to generate multi-register writes in
> sync operations, bringing performance up to parity with the rbtree cache
> there.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: jz4740: Update to use maple tree register cache
      commit: 1ec6dffdedae4cbbd6e33b1d9be0e5a3dbb31804

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

