Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E7A6B98B7
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 16:14:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB2C513B7;
	Tue, 14 Mar 2023 16:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB2C513B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678806865;
	bh=HYGfl2nv/L/zNAt09zcNi7tEiIXFZVfStqNB2ZQJs78=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NFl58/GDHV2b385P1Myhrp6FBb/AYyBlHyeU40IkNf4fWz1GUnMK180pn/X48G1K3
	 6okavFnWKD+iEmBTW57Xtp3eK+WCDSH5bIdru5mDe9ZDt12EdnyW9NWZQkj8kKciR2
	 YvpiTvpgP36Nparl57B/lAIFRsAUzBbLh9CUi52U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4F9BF80542;
	Tue, 14 Mar 2023 16:12:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B83C9F80534; Tue, 14 Mar 2023 16:12:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B81C1F80529
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 16:12:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B81C1F80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s/E/MIf0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CA4D0B819C8;
	Tue, 14 Mar 2023 15:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37261C4339B;
	Tue, 14 Mar 2023 15:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678806752;
	bh=HYGfl2nv/L/zNAt09zcNi7tEiIXFZVfStqNB2ZQJs78=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=s/E/MIf0GLDV6n+oz0kIR4lHk3t8lSPBjj87apXdPREeNbyogHtT3tC2i9+gVWANR
	 MUM4dcrHVynn3BLeiYhm2GZF/Dc3rVz3GB34q9QE9QPZLC5llfrkA5J7cxLZ/M+PmZ
	 tcIRFGHfId0VYJEmPf0/gSlM/6OWSE5DBV2M/vcPs9n2h+gDeknKNmYCRmu6bSQlYq
	 rjlPxtR2VSQN+YG6/L+g6h/n5kHnR3oJkAu4yQERrJjc1QL/ZKZJ1w1jxGP+D+PpuJ
	 D0ViDzm836zkXso3N5AJQSW58aSdN3o0B1MkVeaTefjNUrl79SvMxXbD8GnaiWtx5H
	 fgHDDuKywK98Q==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1678346017-3660-1-git-send-email-shengjiu.wang@nxp.com>
References: <1678346017-3660-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: soc-pcm: fix hw->formats cleared by
 soc_pcm_hw_init() for dpcm
Message-Id: <167880675094.43040.10172504832541716184.b4-ty@kernel.org>
Date: Tue, 14 Mar 2023 15:12:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: Y6WUUKG6OFBGT66IHNNZCYWVZPQT5SAG
X-Message-ID-Hash: Y6WUUKG6OFBGT66IHNNZCYWVZPQT5SAG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y6WUUKG6OFBGT66IHNNZCYWVZPQT5SAG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 Mar 2023 15:13:37 +0800, Shengjiu Wang wrote:
> The hw->formats may be set by snd_dmaengine_pcm_refine_runtime_hwparams()
> in component's startup()/open(), but soc_pcm_hw_init() will init
> hw->formats in dpcm_runtime_setup_fe() after component's startup()/open(),
> which causes the valuable hw->formats to be cleared.
> 
> So need to store the hw->formats before initialization, then restore
> it after initialization.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: fix hw->formats cleared by soc_pcm_hw_init() for dpcm
      commit: 083a25b18d6ad9f1f540e629909aa3eaaaf01823

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

