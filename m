Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2263170F5
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 21:15:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6F5E16D1;
	Wed, 10 Feb 2021 21:14:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6F5E16D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612988104;
	bh=6VD934QtyZZaM8ReuEkP/ZVzoJd8SSpH/9s4rOk/+Rg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nxsuTWNbzYHxSniN6hDrxwrwTP7V8kVGZe8n0Rk+wBAd7SdkB0RqZYznfdWaZZFP5
	 Ua7cxqFryXnzZXiJQ3eZEUAz1d/g7M88YEG+KRzlOEmkadcDBewSM5qXBy534SsmZV
	 HMdURv47dEgG9EVNjU/YdNGTMwyDsHy0oqqxMA5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C961DF80278;
	Wed, 10 Feb 2021 21:12:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11DD9F8026C; Wed, 10 Feb 2021 21:12:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73404F8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 21:12:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73404F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C/y1y35u"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74D2264EDC;
 Wed, 10 Feb 2021 20:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612987957;
 bh=6VD934QtyZZaM8ReuEkP/ZVzoJd8SSpH/9s4rOk/+Rg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=C/y1y35ukOfck4AahT02/Y5Roh2rCEwxwSAeIBmcYSHeLZtO5QbFtuDA/rqwBgbBj
 MixkJ3r3GZRVBQ3DqXZf+B9brhq5WHSSsXxsEju7jvvRzhdWvmwxGNj3G6ySeNGOyE
 hGbmdK4wAZq5muEq+Hf5wbWeHO8wSp9agy6xEe4+NSvw02XxhRv0NmvucFfjQ2mWfX
 ezWQucllw3ZoOwMS2lMVkJ4XCXlihnIvS6N+WJGjaxXcCo0eTHRmd/jcaLAEiBu/k8
 yT6PQ/aOFdMwoSRSuJc2udkcVdoQYQCC7baqcdC2XbzcBWmfs/QZbXqjupXGG7bGqB
 mgSYR1k/RD8zA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20210210105237.2179273-1-kai.vehmanen@linux.intel.com>
References: <20210210105237.2179273-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: fix runtime pm usage mismatch after probe
 errors
Message-Id: <161298789619.5497.9324383367396478714.b4-ty@kernel.org>
Date: Wed, 10 Feb 2021 20:11:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>,
 yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

On Wed, 10 Feb 2021 12:52:37 +0200, Kai Vehmanen wrote:
> With current delayed probe implementation, sof_probe_complete is not
> called in case of errors. And as this function is responsible for
> decrementing runtime pm usage counter, this will result in following
> problem:
> 
>  - probe driver in conditions where probe will fail (to force
>    the condition on Intel SOF systems, set
>    "snd_sof_intel_hda_common.codec_mask=0")
>  - unload driver (runtime-pm usage_count is leaked)
>  - fix the issue by installing missing fw, modifying module parameters,
>    etc actions
>  - try to load driver again -> success, probe ok
>  -> device never enters runtime suspend
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: fix runtime pm usage mismatch after probe errors
      commit: 271d9373db1c76f239fe3124e552b6b58b2af984

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
