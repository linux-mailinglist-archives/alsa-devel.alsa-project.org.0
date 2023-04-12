Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 282F46DFBC0
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 18:48:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BD13109C;
	Wed, 12 Apr 2023 18:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BD13109C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681318136;
	bh=I6ap0UQCbGkXAJiaJevqh7ON+yUC8QpHtszKmRg7634=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WLEWIJPeT95mgi0Ou5HkAtp2fQA2q9vtg65TGyoBTRN+8AMkKYpxc3emtlWslp8rJ
	 P/UmMW9DH82xYQkIrPS2pyDLzo7fEo3ajwkdFLTLihjqH3mIF2MQ8EL28Gcx7arz0W
	 MF+6t4IQAM6PdzUcOb1E955Qv/4pSwT2kCW0vbW8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFE32F8055C;
	Wed, 12 Apr 2023 18:46:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D3A9F80551; Wed, 12 Apr 2023 18:46:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6023DF80549
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 18:46:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6023DF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Cb/6h+IH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0353F63759;
	Wed, 12 Apr 2023 16:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA87C433D2;
	Wed, 12 Apr 2023 16:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681317978;
	bh=I6ap0UQCbGkXAJiaJevqh7ON+yUC8QpHtszKmRg7634=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Cb/6h+IH0WdthIWcnh79yGN0QJT4G2ycy6yUNpmhAzzJ5aEsDXAjEkkzhrHrzyXZh
	 kqXAj4FkS0Vpfjwpa6ESr9kEIWhDy6dxG4eySTCttWFORiOgcqq8LT5TmafaW78Al4
	 WiXd8BGHHY8CXimHCE2nPqb0hzP12sGHzmzxPhJ3izEBVTLJq+/zvznwcBso0zJJ9Y
	 88wk3t4GtVCXoD20TZyfpWL+lMOObX2pUlp3+yUcadfG8tIC4DLCViHMwP7XG2debY
	 ucG4l9zgwOAspUGmmSl1wgpxzGwNHEeI3zSOZOsP1E7loatDZoOtFrZ/TDIqdpS+NU
	 o/QeUBEescxmQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230412061457.27937-1-peter.ujfalusi@linux.intel.com>
References: <20230412061457.27937-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: mtl: fix page fault in dspless mode
 when DSP is disabled
Message-Id: <168131797639.93781.6297436322389790089.b4-ty@kernel.org>
Date: Wed, 12 Apr 2023 17:46:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: RSKWFFV6XY7NHSFTEXVPPAQAR3XLBPAL
X-Message-ID-Hash: RSKWFFV6XY7NHSFTEXVPPAQAR3XLBPAL
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 fred.oh@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RSKWFFV6XY7NHSFTEXVPPAQAR3XLBPAL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Apr 2023 09:14:57 +0300, Peter Ujfalusi wrote:
> The patch to make DSPless mode work even if the DSP is
> disabled in BIOS missed to touch the MTL code to add
> the needed checks.
> If the DSP is disabled this can lead to page fault due to not
> accesible registers.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: mtl: fix page fault in dspless mode when DSP is disabled
      commit: ef0128afa1655f8d024dc5058fbfa0c6deecf117

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

