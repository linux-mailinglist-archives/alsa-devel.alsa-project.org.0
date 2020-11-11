Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E952AF571
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 16:50:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E3F61762;
	Wed, 11 Nov 2020 16:49:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E3F61762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605109809;
	bh=LeU5+FDYWn5oeLQA3g3HlCIyg9cm9+2i7iakNb+8puc=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=drdB20si4F1ZsCe/uucFtcUzmAJK9VtZEY9hcFpf82OAtftd7VU6Lk41UsEsVi4LO
	 YhsB1rGCTQnU7/9t2YAkLJrDHIqN+eQqdB6+80c+BIVFznficzTaUuZ0qlWEEYH8BT
	 oAUNOgKtV6VFKe+LshnlLwbn1gpI2KiuYe0BTPkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6B9AF804BC;
	Wed, 11 Nov 2020 16:47:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12987F802C4; Wed, 11 Nov 2020 16:47:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96482F800AE
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 16:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96482F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XSMot6lV"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EECF32074B;
 Wed, 11 Nov 2020 15:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605109665;
 bh=LeU5+FDYWn5oeLQA3g3HlCIyg9cm9+2i7iakNb+8puc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=XSMot6lVZM+aEBCMmBgn8TJG+nsHLRIGdRfnSS6H5k4SFO1w5bp5fXdWwBifh++KI
 4wL7bvYhXE/tUEiGlXZ5XphXS7sju2AcSbZPYvm/WCbg5AZ7J/xEzLD+hAh05RnYit
 hU9i10K99rwZLZr1svivnHxIsSsv2yUUnsZwIbwU=
Date: Wed, 11 Nov 2020 15:47:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20201111103245.152189-1-jonathanh@nvidia.com>
References: <20201111103245.152189-1-jonathanh@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Don't warn on probe deferral
Message-Id: <160510963228.12073.2844895860087376928.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org
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

On Wed, 11 Nov 2020 10:32:45 +0000, Jon Hunter wrote:
> Deferred probe is an expected return value for snd_soc_register_card().
> Given that the driver deals with it properly, there's no need to output
> a warning that may potentially confuse users.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Don't warn on probe deferral
      commit: 34d3daba23399440dedddd0f9ccd6c1057314139

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
