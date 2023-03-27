Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BF96CA7E5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 16:40:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32123827;
	Mon, 27 Mar 2023 16:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32123827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679928055;
	bh=EsdXipIKGdY7ATYG78J9Z9yaMrQxXO8d8/OO8i6W5SY=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lokpu1wp9LIoh4hnaryfyOc5pzk3XLSxnJR4HZXFeSE53+VmS4DOBzeZ2BT6wrmWG
	 aspoGOPJHS8v2zAkO/khAU89wfwuNvQ//sUxPcw9QBOBy0CKmN7dV+SXKx8ra29AGc
	 LKuj8D8npBxxbRRyP+kfBAwAZRLGidIPbT5YOi+g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 74153F80423;
	Mon, 27 Mar 2023 16:39:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46D3EF80272; Mon, 27 Mar 2023 16:39:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45905F8024E
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 16:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45905F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dvuWYExi
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A2070612F3;
	Mon, 27 Mar 2023 14:38:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79339C4339B;
	Mon, 27 Mar 2023 14:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679927939;
	bh=EsdXipIKGdY7ATYG78J9Z9yaMrQxXO8d8/OO8i6W5SY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dvuWYExiu9980W03fdTI/k4ti4dKwXhkNFTNZmjQY9/zLaUBwPagfyzbmv30RbDLn
	 q9Pc6HZs92NEPkDsuLAHwBa5DR5ZuuLuMh7FLAWDy9Z1Sf1ceaBrk+IAnrD2atGEoc
	 ER5RShhQqEkWJYBJgnaCc57m4EmUxQ0U888a9FCf+qfOcxcma2Ok8kUaQ4PJWTIZ9R
	 9Ggr8UO3hcnWfPEjMYGLVKVPjkKueCi6glVrLtb+9moS6WN3lLx64R9jJCS4zJk1zA
	 zwqlrFb3tTR3HNfBiCCHReXK8L6BLcbfaRjbkDwQtHyiaelCA7455DGS7HL+b8bSsx
	 /Dxyqqh8wRQzQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bkke7qzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkke7qzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: audio-graph-card2-custom-sample.dtsi: use
 card->name to avoid long name
Message-Id: <167992793823.3167684.10733627448390613491.b4-ty@kernel.org>
Date: Mon, 27 Mar 2023 15:38:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: IUXXWFS6TLZMR3DDW4QZAQ2EJGVTZBPQ
X-Message-ID-Hash: IUXXWFS6TLZMR3DDW4QZAQ2EJGVTZBPQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUXXWFS6TLZMR3DDW4QZAQ2EJGVTZBPQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 Mar 2023 04:33:41 +0000, Kuninori Morimoto wrote:
> Current Card2 Custom Sample will be too long Card name, and be error
> 
> 	audio-graph-card2-custom-sample audio-graph-card2-custom-sample \
> 		ASoC: driver name too long \
> 		audio-graph-card2-custom-sample' -> 'audio-graph-car'
> 
> This patch uses short name to avoid it
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: audio-graph-card2-custom-sample.dtsi: use card->name to avoid long name
      commit: ad58151fa04280a938c173bcba05ba42a4073d92

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

