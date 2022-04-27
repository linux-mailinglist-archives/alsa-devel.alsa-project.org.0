Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4E35124F5
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 00:04:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6063AE0F;
	Thu, 28 Apr 2022 00:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6063AE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651097068;
	bh=vOvUWLj1hOSCmQyloq9ZBqf7B2AGhnapjeyVbc+ogW8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AMXtwuLULeAc24cyj7arv3QfvHzZX2kXt02ovT1SnvBBAMdPmnJcohInPTanOnbLg
	 gHuhXBCEzu7afuDi8P1tn1iVSKdxxJOh59XMpcRJcdwOkQlPxhnwwUKAqbYuh00Kwb
	 igbQ8AVC8UmffZsTrdNJHvKjB1nx7rVRKHqMQFzw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90EDDF800AE;
	Thu, 28 Apr 2022 00:02:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E182F80256; Thu, 28 Apr 2022 00:02:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC62CF8016E
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 00:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC62CF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y6y8nqz0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6DB3DB82AD2;
 Wed, 27 Apr 2022 22:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B848C385A9;
 Wed, 27 Apr 2022 22:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651096951;
 bh=vOvUWLj1hOSCmQyloq9ZBqf7B2AGhnapjeyVbc+ogW8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Y6y8nqz0dIahmgg7YPdcLTkyxhz3oJUsuPAwkfn70+rjOppDZFIm2DQ2K/FbO7PU7
 2+FXEHWtT8mOPnXiDQbSmyDNg/O2KTCraDuZ9dSKnXfNNTai+P51ZAk8Md6HQVpsfD
 w157DTas+fn2V0Su8xhJznzHOVKfFWa93RsGZpFLmzITRZy2C76t6dQL7hYUeHOA8x
 qGS6DpzwQYfV5E3uClSaJZWFmf6aL203xrbc9GwUiOVNRlpOGHoydU3Av87ihB9v0q
 jcXhn2FY0D+SfeOahXSpTYF9QOgMyBJZrLwJ3+o/1shtiYa5120oNIINJ/AcX/TkIp
 SVn61fOztOdZA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220421162640.302311-1-pierre-louis.bossart@linux.intel.com>
References: <20220421162640.302311-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: bump SOF_ABI_MINOR
Message-Id: <165109694982.498174.10424071829594478684.b4-ty@kernel.org>
Date: Wed, 27 Apr 2022 23:02:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, daniel.baluta@nxp.com, kai.vehmanen@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 21 Apr 2022 11:26:40 -0500, Pierre-Louis Bossart wrote:
> Commit a0f84dfb3f6d9 ("ASoC: SOF: IPC: dai: Expand DAI_CONFIG IPC flags")
> did not update the SOF_ABI_MINOR, bump to version 20 before new
> changes are added.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: bump SOF_ABI_MINOR
      commit: afe57ecab58b976c54fcbc31d718f936a0cc98cc

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
