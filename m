Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4F8212879
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 17:49:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E90F916D0;
	Thu,  2 Jul 2020 17:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E90F916D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593704957;
	bh=C5NUiizv1j+Nd6aQD/bkutUY7qnfv6PuLdHFK48cf00=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YQ4iTGKd3v+RaRqx+bslZkWep4dnThJcf7wQPZR/loRyAQST2/A1bGQvfJFFfUiTn
	 w47zD+zq8z1NUyP6odad6GaFkQmxRlJzL/HXRhNdYJzcOqNE2w5aGG1lstOXD3Xy1d
	 hQa/Z+0qi34E6OSbZ+ktgaj+CamNZYPVqMIwmngo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB9A7F802BE;
	Thu,  2 Jul 2020 17:46:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9D9DF80245; Thu,  2 Jul 2020 17:46:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58A39F80245
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 17:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58A39F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OaXsPp8u"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 813B020885;
 Thu,  2 Jul 2020 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593704808;
 bh=C5NUiizv1j+Nd6aQD/bkutUY7qnfv6PuLdHFK48cf00=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=OaXsPp8urbdfLENKQsnnZ/J4yPHz/soyJ78m7otw34xg57vj4YZDeD3hNYHbkH98J
 YNfQdPQi5quPEv0KhKoUo7weWz4Z6HONfj7/ZB9rCM2Ba93MAH4KvCYJ0funoYNWww
 Id1iQKDL+TEM/+NkF6ykrs0wbctW29QNmC9Fl90w=
Date: Thu, 02 Jul 2020 16:46:45 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
References: <20200701181320.80848-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/7] ASoC: codecs: wm/cs: fix kernel-doc and W=1 warnings
Message-Id: <159370480067.5443.9245355177534477130.b4-ty@kernel.org>
Cc: tiwai@suse.de, Charles Keepax <ckeepax@opensource.cirrus.com>
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

On Wed, 1 Jul 2020 13:13:13 -0500, Pierre-Louis Bossart wrote:
> I've been doing a lot of cleanups to get to zero warnings with W=1,
> here's the first batch for Cirrus/Wolfson codecs.
> 
> Pierre-Louis Bossart (7):
>   ASoC: codecs: cs4270: fix kernel-doc
>   ASoC: codecs: cs42l42: remove always-true comparisons
>   ASoC: codecs: wm8986: fix missing kernel-doc arguments
>   ASoC: codecs: wm8960: fix kernel-doc
>   ASoC: codecs: wm9713: remove spurious kernel-doc comment start
>   ASoC: codecs: wm8994: fix kernel-doc
>   ASoC: codecs: wm8400: add _maybe_unused as needed
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: codecs: cs4270: fix kernel-doc
      commit: 7fdc1512096217c2888959bf662ebff9f37021aa
[2/6] ASoC: codecs: cs42l42: remove always-true comparisons
      commit: 5502ce4ea214658c4ed80afc024a6fa6a6837023
[3/6] ASoC: codecs: wm8986: fix missing kernel-doc arguments
      commit: 824186fbf73499adad545a3ae30b0a3feef4f05a
[4/6] ASoC: codecs: wm8960: fix kernel-doc
      commit: 419eac3cff69c07bf38902be1b245dee3b309342
[5/6] ASoC: codecs: wm9713: remove spurious kernel-doc comment start
      commit: 442950a3dc9ced1e3416e497f97636cc4c955ccf
[6/6] ASoC: codecs: wm8994: fix kernel-doc
      commit: 7c4084e1127026546b102152cebda297b8237870

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
