Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D75F1DBB0E
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 19:19:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 423A51812;
	Wed, 20 May 2020 19:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 423A51812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589995191;
	bh=IF7mBuk7hlUj+8Y2d8voF/ENe1gpZEcH2MG/8xI3a9Q=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FiwkhJ2QCzgXlPCXoS0fI5JC++B/g2bSmra6PofYp7I+TjSc1g2hT6FFdLimbqT2u
	 X9kFNoVbkmQWTJSKAtebOanOQdzirFXnaV1Jb6wvkWtqlcyjP7gYt360SAxc6P0hOq
	 zbi9aV4uFxTztvVf4zEw0FL3u/L2x0fXWq54yt10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A757DF80132;
	Wed, 20 May 2020 19:17:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21FF8F8026F; Wed, 20 May 2020 19:17:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EF50F80216
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 19:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EF50F80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pQ2jGo2q"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A852206B6;
 Wed, 20 May 2020 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589995042;
 bh=IF7mBuk7hlUj+8Y2d8voF/ENe1gpZEcH2MG/8xI3a9Q=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=pQ2jGo2qMb0VGrJoBb4Znp/E2AwKc/VKl5O5/y8O0hIaSwvCeXvrfx8l/pHechlzY
 Ttv78Y0U3ec7bW0snbxcFSk1+u4UKOH3Lrx8y6R3dQTP8fLNJz4AisWONE0BbhZgMI
 m/Kk5gGM9kV+9muQMN5tyOIJadyaGTi1o93u56R8=
Date: Wed, 20 May 2020 18:17:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Pavel Dobias <dobias@2n.cz>, alsa-devel@alsa-project.org
In-Reply-To: <20200520071904.15801-1-dobias@2n.cz>
References: <20200520071904.15801-1-dobias@2n.cz>
Subject: Re: [PATCH 1/6] ASoC: max9867: fix ADC level control
Message-Id: <158999503367.4807.9375424664001249891.b4-ty@kernel.org>
Cc: ladis@linux-mips.org
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

On Wed, 20 May 2020 09:18:59 +0200, Pavel Dobias wrote:
> Fix swapped channels in ADC level control.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: max9867: fix ADC level control
      commit: 53a58bf96bcdd47c670a957920f3a1bcf7215b39
[2/5] ASoC: max9867: don't use regmap defaults
      commit: d0de8c69f90196fb872f1739756bb0348144d18c
[3/5] ASoC: max9867: add filter controls
      commit: af53d5738cb0fd61da0bc3f5a884df7af237d20d
[4/5] ASoC: max9867: add mono playback switch
      commit: 80b9fa4dead406f9a0aef5b364eb237872986c2c
[5/5] ASoC: max9867: add digital microphone controls
      (no commit info)

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
