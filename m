Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D115703150
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:18:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E5A110E;
	Mon, 15 May 2023 17:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E5A110E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684163889;
	bh=0/QHv5syKldIx6Izi10gF/2602sEGKGg+ks2Dzfrh3k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cnM1zf+GzqrZPQJqhb8+HHUzlOMYIm+w4w16oclu27OZwSyWkY0nvbSIwpfugLVcC
	 P5TnnXQkGtY4U2geTnmpqEg14WwY5TTYqQXI9MZ0MP6BjR5qeTLYR/ZuvWULHnfYjw
	 fL0X+zCf0WvP2EOUV4NvZHz26nafTIcNEiBJE7E0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0228CF80272; Mon, 15 May 2023 17:16:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AF27F80272;
	Mon, 15 May 2023 17:16:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F7CFF80272; Mon, 15 May 2023 17:16:53 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EBBF2F8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 17:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBBF2F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iXl13xff
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4B0F260FAB;
	Mon, 15 May 2023 15:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A330AC433EF;
	Mon, 15 May 2023 15:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684163806;
	bh=0/QHv5syKldIx6Izi10gF/2602sEGKGg+ks2Dzfrh3k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iXl13xff5bNEeUjC8Xe/XbIVfSAS2Q7eE+5bRYTAurGTORsccHt28jEHV32OvQL8w
	 A4RAb/8kN8eQzYEqFS53x/qFTr0pQYfBgCNdtLVjtJHAJOR0nVguZUOQZtDzoVeumx
	 1K7efLMRezxO9jURrufTomus8WZIF38PHyMf2wAKBsQw5Dvxmlj6Kfe6IjerzlPjo8
	 Ie1Bmdrdcx+me7yne0XZYP3y4DlFCR7+J1NUusb0CzhQBwZHmeMkVj3cAz8ld+55bZ
	 vvPYJyBkHMn2LZtO/WumVqQqpp421lZzDGqQ070JSUxQTC0kK2L8A73Tq0ZhG0oLaa
	 NA3tMWAvEevdA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, vkoul@kernel.org
In-Reply-To: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
References: <20230512174611.84372-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: SOF: Intel: hda-mlink: fixes and extensions
Message-Id: <168416380551.410886.17288442659995359967.b4-ty@kernel.org>
Date: Tue, 16 May 2023 00:16:45 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 6SVBAYE2ZIPVX3FWUWWPYBSDI7BRHCG4
X-Message-ID-Hash: 6SVBAYE2ZIPVX3FWUWWPYBSDI7BRHCG4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SVBAYE2ZIPVX3FWUWWPYBSDI7BRHCG4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 12 May 2023 12:46:05 -0500, Pierre-Louis Bossart wrote:
> With additional testing with multiple links and multiple DAI types, we
> found a couple of mistakes with refcounts, base address, missing
> initialization.
> 
> A new helper was also added due to a change in the SoundWire
> programming sequences, with the host driver in charge of setting up
> the DMA channel mapping instead of the firmware.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: SOF: Intel: hda-mlink: fix sublink refcounting
      commit: 7430dea49410de3d154fb87f931d079a0a643b1a
[2/6] ASoC: SOF: Intel: hda-mlink: add helper to get SoundWire hlink
      commit: dcb88fc47d0e79fd54a19a63a4c8a7594ba0838e
[3/6] ASoC: SOF: Intel: hda-mlink: fix base_ptr computation
      commit: af8c32b1a3d55f9b42294aee7e7c7eca85ee3bd2
[4/6] ASoC: SOF: Intel: hda-mlink: use 'ml_addr' parameter consistently
      commit: 7dfd1ccdb71e5b819c2898b59c58b89f26038292
[5/6] ASoC: SOF: Intel: hda-mlink: initialize instance_offset member
      commit: 9643456ec3c48adfe535c56f659ab705365f4572
[6/6] ASoC: SOF: Intel: hda-mlink: add helper to program SoundWire PCMSyCM registers
      commit: ccc2f0c1b6b613cd0014c3dcd465a4b57856b0fe

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

