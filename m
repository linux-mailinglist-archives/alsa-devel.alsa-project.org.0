Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B066A306241
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jan 2021 18:41:26 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACFD61730;
	Wed, 27 Jan 2021 18:16:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACFD61730
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E6B2F80269;
	Wed, 27 Jan 2021 18:14:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97541F80277; Wed, 27 Jan 2021 18:14:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0225F800F0
 for <alsa-devel@alsa-project.org>; Wed, 27 Jan 2021 18:14:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0225F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AtlSoqmt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 074EA64DA4;
 Wed, 27 Jan 2021 17:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611767676;
 bh=1m++LiMxr6/GeKxBb1e6vmPpJo9MAanwj2boIbNLQAQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AtlSoqmt+c8VQOzssp+UyYTJJve8656Jk5lDqWkZTUh20iVnJ3OFsnOFFucmzXAxO
 iDo9GOI5c5C/HOEZvbn19lUarHWRUjfiYG8TGLNJA7cWaHaHdPxsjcmQSrevoPt2Je
 Wi13p+hPWFroldv7IJ5QoAbEh19UrgvwuEZeXw7+8R7yelYPRbyzYNJidd5nj5dOHw
 Y2orMCptR7Gx+pfGkqifzzr9OCJmuDFP20ojB+d/zYK8oVbmTcTmW/agzK8qstR9cq
 dn9MZr0KZYVKvJemG+1c3KIR0tCLccsNWPq6cfnrDBGYLCSwZOa589tI+VRh5hM7ux
 QaPGtc9w7pWXw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20210126171749.1863-1-srinivas.kandagatla@linaro.org>
References: <20210126171749.1863-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/2] ASoC: soc-component: add
 snd_soc_component_read/write_field()
Message-Id: <161176762855.34530.6617138298808888904.b4-ty@kernel.org>
Date: Wed, 27 Jan 2021 17:13:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On Tue, 26 Jan 2021 17:17:48 +0000, Srinivas Kandagatla wrote:
> It's often the case that we would write or read a particular field
> in register. With the current soc_component apis, reading a particular
> field in register would involve first read the register and then
> perform shift operations.
> 
> Ex:
> to read from a field mask of 0xf0
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-component: add snd_soc_component_read/write_field()
      commit: 1da0b9899abdbc7103d3ec6b1a888efda41dbb59
[2/2] ASoC: codecs: lpass-wsa-macro: make use of snd_soc_component_read_field()
      commit: 7db4c4cd767e5c2418e7892c6b2f06982d34369a

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
