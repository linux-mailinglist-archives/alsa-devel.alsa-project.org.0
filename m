Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F039B671E19
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 14:38:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC698265B;
	Wed, 18 Jan 2023 14:37:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC698265B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674049117;
	bh=3ruic/hzMpiL1XOjcNxPMaBS/YIxVFZr6JqY6ZGCLAQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=vqIuLDl1asiiRYnq0u/x4fHrACp6tF62YfXOqW4sBXIYCu1Y9/2ZEUATxyo9Uxf9+
	 CD+l72stsHlh3XT1obk9NnRm8rCto5N4rrEHiiY4q48/Ck2UZ/sDfmW/h3Uu5r0AWy
	 9yjrpnDFwuQbJjEiZUEAa02o5QxlvAwHBOGZC65U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4689EF805D7;
	Wed, 18 Jan 2023 14:30:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 501CEF805D6; Wed, 18 Jan 2023 14:30:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09B2AF805D2
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 14:30:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09B2AF805D2
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lgaG+1OZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BCE846177A;
 Wed, 18 Jan 2023 13:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0E3C433EF;
 Wed, 18 Jan 2023 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674048636;
 bh=3ruic/hzMpiL1XOjcNxPMaBS/YIxVFZr6JqY6ZGCLAQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lgaG+1OZNSWF4xS2PZXOI2C74qpj/MBFC9Yq7PH2RvY4AHp2T+DB4BROb3CuPmjrQ
 HuUXrGDooTtbJLvT2Ls1tFPM79goy13B7ReXlNIuOQRD/wf2w+mIhZEBErDo6FlMi1
 5+SxUsD4U4WUl254+10Gggt5YIV0LDa7lIKCNRWIEzUKEebS+NxA32BSPu1VdnpQtB
 7pxUu0wWsymXg84cMiK/PAr97tqjNfjSPNGweT6XkIyVh9uZft8vM9AlPqT/lUb5hg
 mP29wFsAJ9sRBsYavTmwRobYybhGLq6uggxAZL2KCeaCvuTHUz7Anv0IQ4V4XQGrYy
 YitnQ2Ojx2u9Q==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230117123534.2075-1-peter.ujfalusi@linux.intel.com>
References: <20230117123534.2075-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: sof-audio: start with the right widget type
Message-Id: <167404863431.726895.13719393942033151736.b4-ty@kernel.org>
Date: Wed, 18 Jan 2023 13:30:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-77e06
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 17 Jan 2023 14:35:34 +0200, Peter Ujfalusi wrote:
> If there is a connection between a playback stream and a capture stream,
> all widgets that are connected to the playback stream and the capture
> stream will be in the list.
> So, we have to start with the exactly right widget type.
> snd_soc_dapm_aif_out is for capture stream and a playback stream should
> start with a snd_soc_dapm_aif_in widget.
> Contrarily, snd_soc_dapm_dai_in is for playback stream, and a capture
> stream should start with a snd_soc_dapm_dai_out widget.
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: sof-audio: start with the right widget type
      commit: fcc4348adafe53928fda46d104c1798e5a4de4ff

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

