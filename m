Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E814248C20
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 18:56:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB13A178A;
	Tue, 18 Aug 2020 18:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB13A178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597769810;
	bh=Rofmd0QiMs/9k+UeK1IF5bpm3qfZbJPjgTGC8mXF5mo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EJzcPMZCLZTW+aHmBKFpjxQP5vGjnmRPqtZbwbmwjxQlbnKwMlXo+yTlgKy5VGFJk
	 oFMGoyfhZknUzXzMRFXwiX4IvPJr4j633jgz90PlcD5x9COEN/+U6cluutYIg+kSHu
	 5fdfBKL0LYo5tl6e6p8ERjSC8xYkYAOVPHTklKWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5506F802C4;
	Tue, 18 Aug 2020 18:54:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD739F800D3; Tue, 18 Aug 2020 18:54:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14048F800D3
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14048F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RuLvDdVL"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 957D3207D3;
 Tue, 18 Aug 2020 16:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769655;
 bh=Rofmd0QiMs/9k+UeK1IF5bpm3qfZbJPjgTGC8mXF5mo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=RuLvDdVLs1Oeefo7spMC8e0Ij5aM8bFFrsLuPKzM9D5Wzsz2MvNc7mMhAsl1hALMl
 Nf11Lqt2Y3X5wb/dzEbKuj7NJExtqMZv/o18SmuzEq8vQALb9lxqvlOaffeuFza0OI
 +O2nP3ITQ9psaIqAM7xB7MSgL915CJ7g4RBtHDfM=
Date: Tue, 18 Aug 2020 17:53:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20200811105818.7890-1-srinivas.kandagatla@linaro.org>
References: <20200811105818.7890-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: add a dedicated menuconfig
Message-Id: <159776961932.56094.5932457968960769416.b4-ty@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 john.stultz@linaro.org, tiwai@suse.com, lgirdwood@gmail.com
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

On Tue, 11 Aug 2020 11:58:18 +0100, Srinivas Kandagatla wrote:
> Currently list of Qualcomm drivers is growing, so put them in to a
> proper menu so that it does not mix up with other ASOC configs in menuconfig.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: add a dedicated menuconfig
      commit: db24fa5756e944a711a66692af7e25a2189bfe52

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
