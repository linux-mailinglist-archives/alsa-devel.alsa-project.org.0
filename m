Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA331E276D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 18:47:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CC7A176B;
	Tue, 26 May 2020 18:46:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CC7A176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590511653;
	bh=tJ9FbVqns1orYj2OI8Q7PaS75f7ujA0N3F+MvNp0aag=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pUhjUQiGgqsu1k7x/z/8tgD6+lh0KMoOxLwo9XRsiKfQC9FCG1bBv4waBeq9Oy58V
	 qzE3TDRuBpL7GiDMh+7wGLz7Va654XTUg9GkeDjgNQMOANZ98qo6jobMTqdYWZP19c
	 Wy6jNY5fnVKZpqx1jFh/as3TW2gnG9DIUxiP81C0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B8DBF80150;
	Tue, 26 May 2020 18:45:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E0B8F80150; Tue, 26 May 2020 18:45:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 436ADF80100
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 18:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 436ADF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L9g8ieFH"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E92B20787;
 Tue, 26 May 2020 16:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590511544;
 bh=tJ9FbVqns1orYj2OI8Q7PaS75f7ujA0N3F+MvNp0aag=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=L9g8ieFH0Pb6ZBWYqWQd/yGSizqsM5DJN0FSi0OrEfmDKAgXYhZUBdUqeM0GCkXVn
 E5Z8hXAqOzvbIOnnfR5fGbwU+X258jz3bV3qhqTGLTwy3QICgNsJnFDRpPeiLfvCRs
 JwFoxLxKFYtm+7bvo2drNZoGpZcDg9lySg+PFzJ0=
Date: Tue, 26 May 2020 17:45:42 +0100
From: Mark Brown <broonie@kernel.org>
To: kjlu@umn.edu, Dinghao Liu <dinghao.liu@zju.edu.cn>
In-Reply-To: <20200525071732.5887-1-dinghao.liu@zju.edu.cn>
References: <20200525071732.5887-1-dinghao.liu@zju.edu.cn>
Subject: Re: [PATCH] ASoC: tas2552: Fix runtime PM imbalance in
 tas2552_component_probe
Message-Id: <159051153753.36309.16172218299424026187.b4-ty@kernel.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Richard Fontana <rfontana@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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

On Mon, 25 May 2020 15:17:30 +0800, Dinghao Liu wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2552: Fix runtime PM imbalance in tas2552_component_probe
      commit: 0d71a5cf691a8226151ceeb79fb872925f053df5

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
