Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F14D392662B
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 18:31:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A192BEBE;
	Wed,  3 Jul 2024 18:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A192BEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720024292;
	bh=tbw4IjqXUR04CkMFwlqotJR1pTI1NbAbfwA6PTNVkYE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uh5xLxgL+9r259y9GN1NAgLS+ec3FX8TGNXhw530gbE5mm4f9lZ7TAnO6HV9XDsnR
	 XpxUpDKZnE6lezfEg6u5EJMRlA0KveYcHyR4pAbUdgRCRh8n1maTahoWkohL9C+BB3
	 IPdlTIhmfPfqnKqdUndIicHhGGjH4gdVC3G/cYmY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 226DEF805B0; Wed,  3 Jul 2024 18:30:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACBD8F805AE;
	Wed,  3 Jul 2024 18:30:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE190F8025E; Wed,  3 Jul 2024 18:30:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 458BAF800FE
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 18:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 458BAF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uhGbs0cz
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF43ECE1C10;
	Wed,  3 Jul 2024 16:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF21C2BD10;
	Wed,  3 Jul 2024 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720024239;
	bh=tbw4IjqXUR04CkMFwlqotJR1pTI1NbAbfwA6PTNVkYE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=uhGbs0cz+lh5Jr0TI6K7d7JJFV3jwor1ByoZyfHg+ROERKhTX2KwjYle0gI70vSRu
	 a9ZFvzQDl+Xq9VYbMo8c4lLE2ap46PcOrE4ZUVt+eNxQZHu7xgVzJ/jI2axq56jx9T
	 ZHYQtQRbq/O8WqlZfiSE5mRUlBEwn63DKMxGXFOAFQWvCVhfkeadv7EZVX7FTK3uRq
	 FiTh/wrl/Mt2KheRaaqlwYupBX+7XVmU6mA14+cRZScuSJoHbHuG6iiw/nOPe6TTNe
	 7SYj8qxx0I0sMsZc3Vn9ooFLIpJqf+ao7gcS65cPtSuOa9+D3XapmMgsB9XAHB4LHu
	 ZVoewSoyUGuXw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20240628094354.780720-1-chancel.liu@nxp.com>
References: <20240628094354.780720-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Improve suspend/resume flow in
 fsl_xcvr_trigger()
Message-Id: <172002423642.71782.11871848740483876915.b4-ty@kernel.org>
Date: Wed, 03 Jul 2024 17:30:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 3MIST4MOPPV76RF3ELMWPGNIVKHD3QQS
X-Message-ID-Hash: 3MIST4MOPPV76RF3ELMWPGNIVKHD3QQS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3MIST4MOPPV76RF3ELMWPGNIVKHD3QQS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 28 Jun 2024 18:43:54 +0900, Chancel Liu wrote:
> In the current flow all interrupts are disabled in runtime suspend
> phase. However interrupts enablement only exists in fsl_xcvr_prepare().
> After resume fsl_xcvr_prepare() may not be called so it will cause all
> interrupts still disabled even if resume from suspend. Interrupts
> should be explictily enabled after resume.
> 
> Also, DPATH reset setting only exists in fsl_xcvr_prepare(). After
> resume from suspend DPATH should be reset otherwise there'll be channel
> swap issue.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: Improve suspend/resume flow in fsl_xcvr_trigger()
      commit: c288f0a1c08efa65f9e3bb7954eb3cefb966c97d

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

