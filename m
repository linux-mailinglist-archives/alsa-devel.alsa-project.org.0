Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED505974BB
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 19:07:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C63F71652;
	Wed, 17 Aug 2022 19:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C63F71652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660756042;
	bh=Yn4G40jkutTkprAgt1jA1gv9HiNNbx0FrohF6j9SElE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ilqr/4CArk5FLKut3iQtBT+ZG4zOixI7Zulq/LFHrCXAEeRgEp7EYOxpbsrS2Znj7
	 sJxCpqs0cDKfIRRihQThJrnPWoJI4hjktqp2ipNI4kn7L9vQzqbSb5LjBGGBWw0PKz
	 gkkINbmqcUjPXvISebWpi2tUlbHTreeONHPp5bIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50827F80290;
	Wed, 17 Aug 2022 19:05:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B35BAF80130; Wed, 17 Aug 2022 19:05:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58AAFF80088
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 19:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58AAFF80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JHMiiRft"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 96BF561226;
 Wed, 17 Aug 2022 17:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2272CC433D7;
 Wed, 17 Aug 2022 17:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660755950;
 bh=Yn4G40jkutTkprAgt1jA1gv9HiNNbx0FrohF6j9SElE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JHMiiRftde4ztyr+xYc/KByPBkP/hAf2Be2S6ME3hvu5Ci9CsJ7Fy9MF/r5RLyYlv
 KjcuiIj/+S+bzm8ZE9XnX9VLomegsXPQYC/RaruLK6qbram82CO8poNvxWv7bhh0Ym
 BsHzz3EgQ/F2MKgOiZlvoNGsWaLyzHRSOQXRH+2SiNNj6xb0HcXo/aOlSwxqpqTPGh
 hdzVQA5RYrhCcpc87CwV1vEM1TMWt5ccnW/FaI92eRVdjDBAtMvjblvBxPUBVmMQ3q
 IvqBXrbDxirVEq3Fy/JlDrQpNisdQqto+uOGLhU5dJIxmkzPSCDvqPRPHBQNQfwzLf
 sFuQhBqWTJsww==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20220817125508.1406651-1-rf@opensource.cirrus.com>
References: <20220817125508.1406651-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: soc-utils-test: Add test for
 snd_soc_params_to_bclk()
Message-Id: <166075594887.566556.11485960261417126250.b4-ty@kernel.org>
Date: Wed, 17 Aug 2022 18:05:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Wed, 17 Aug 2022 13:55:08 +0100, Richard Fitzgerald wrote:
> snd_soc_params_to_bclk() calculates the BCLK from only the information in
> snd_pcm_hw_params. It is therefore a subset of the functionality of
> snd_soc_tdm_params_to_bclk() so can use a subset of the test case table.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-utils-test: Add test for snd_soc_params_to_bclk()
      commit: e32e23a2b588424aec0c4c4435530f8022318b8f

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
