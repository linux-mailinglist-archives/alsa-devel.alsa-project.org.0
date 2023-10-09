Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5567BE638
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 18:20:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AD88ECA;
	Mon,  9 Oct 2023 18:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AD88ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696868452;
	bh=z6yr09RTbY+vBbPiE9irQn/sce73HKsMlGyR/Bbw4K8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V1EVMTLoyr1vBkKpOI0u4mDs033UYwFdgX9/Cu1gVy+Xpv+gyWDW0d1K9vu2Mzofa
	 q3RBqpu5uVk8d1H4joiFzWr42bsHWM5FBlWT67RtKy5r4khLRuLJLtYBZmxG+jtzGD
	 wPonbKFXxiF7v0KQE67sDj4Y9E4qGvBB+2v15G4k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23BB9F8057F; Mon,  9 Oct 2023 18:19:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E507AF8055B;
	Mon,  9 Oct 2023 18:19:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F159F80563; Mon,  9 Oct 2023 18:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60CCAF8055B
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 18:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60CCAF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d7tIzyvM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D23EECE17F5;
	Mon,  9 Oct 2023 16:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88AEFC433C8;
	Mon,  9 Oct 2023 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696868335;
	bh=z6yr09RTbY+vBbPiE9irQn/sce73HKsMlGyR/Bbw4K8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=d7tIzyvMklZSjUJ3iPelluGg1uQA3RlW5d9ZpLm4axxc/FA5+7oeicawuR4mFdEYb
	 SLEgC8ONPWxNzHPrStYBFI0x+LNVESDR1uAbcaPyRV0Cin+LTMkjgItCntqmD0eo5t
	 ponK+Sk8DBvCLJsQcM56kL7kn/EX2Tscpj5WbO5VcEAU5y5NYUwuZOdVcPbTmeRgwy
	 5mwEW62OEPZaFxR2JvJ36ZuilnOwvfG2FFKx6gapctie0mRQwXGA/H3OaJtqAjTNrH
	 zBvnRUSpGUEuiLg/tHACEdkoAELDGpwtLHF4ID9Ap1RW4b/eXCQNVJJhjQMLUriMDP
	 3JdxcND04It8g==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 cujomalainey@chromium.org
In-Reply-To: <20231006084041.18100-1-peter.ujfalusi@linux.intel.com>
References: <20231006084041.18100-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-client: fix build when only IPC4 is
 selected
Message-Id: <169686833328.101967.1607871264971694226.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 17:18:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 3NNV6T4OADU5PKY6PAKR7O6TRH7VOD7O
X-Message-ID-Hash: 3NNV6T4OADU5PKY6PAKR7O6TRH7VOD7O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NNV6T4OADU5PKY6PAKR7O6TRH7VOD7O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 06 Oct 2023 11:40:41 +0300, Peter Ujfalusi wrote:
> When IPC3 is not selected, sof-client.c still makes a hard-coded
> reference to an IPC3-specific function:
> 
> ERROR: modpost: "sof_ipc3_do_rx_work" [sound/soc/sof/snd-sof.ko]
> undefined!
> 
> Fix by making the code conditional.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-client: fix build when only IPC4 is selected
      commit: d65d4a2c3867a04ee4ae9c99747a6398b58e269b

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

