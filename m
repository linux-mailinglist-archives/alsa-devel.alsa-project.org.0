Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA3F2F4EAE
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:30:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C68CF1725;
	Wed, 13 Jan 2021 16:30:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C68CF1725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610551855;
	bh=BTCdFa/gvjTyKB3m7kRq1C8tfhpWS0HPZMfSql1L5mM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mSIUYLaqJ+u7D4FC10Iw7opP5u24OrhFOpQNVDnTr3fenebJgocopWYjqOBMauQHc
	 4Lt4Jmr+bmt48z0f7h0aTw48xtxif+zKiDbDT/OENRZrb0mp1AWhpCaAawa5nW1KSh
	 bvTKw3eKT7sZJV1uCcK+dMUO7KSpEGYA16nIwgxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C58CAF804ED;
	Wed, 13 Jan 2021 16:27:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B549F804F2; Wed, 13 Jan 2021 16:27:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C88DCF804ED
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:27:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C88DCF804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hDnXQW9g"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 997A023382;
 Wed, 13 Jan 2021 15:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610551671;
 bh=BTCdFa/gvjTyKB3m7kRq1C8tfhpWS0HPZMfSql1L5mM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hDnXQW9gqkZehUDjG3Ev6r/r4gi0VF/birGSGvQev7LjUU8sgIRtkDt1KSwPlpEuY
 YDQvTmdRkttlLIORr61dXJTL739xEezmasL+5weCc4rgyOIQUYIrY6MYblhhssEPxl
 ZQ3R8fh1Q49R/+bhy8eHba/2lS+XCPPIBS/K3xxgbfi+QK2Tz1MfDAQ3314pgXlGEi
 3QlAy31d8IHu8OqZdBAHfgbfxZjIl2IrJ8K8tfWS1n1PXvSWFpkpQ8GC4ONRW2m363
 kLri1u7VpZMlMdC7myxQX5DcJSQOsoSiZqCVRw7UDzUQRpIHNxucPPumDMw6RKVQLR
 R+xpSE0YfZSNw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87360c99kb.wl-kuninori.morimoto.gx@renesas.com>
References: <87360c99kb.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: (subset) [PATCH 0/6] ASoC: soc-pcm: cleanup code
Message-Id: <161055160365.21623.15982485347249643370.b4-ty@kernel.org>
Date: Wed, 13 Jan 2021 15:26:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 11 Dec 2020 14:54:53 +0900, Kuninori Morimoto wrote:
> These are not so important, but for
> soc-pcm cleanup patches.
> 
> Kuninori Morimoto (6):
>   ASoC: soc-pcm: move dpcm_set_fe_update_state()
>   ASoC: soc-pcm: add dpcm_set_be_update_state()
>   ASoC: soc-pcm: add soc_pcm_set_dai_params()
>   ASoC: soc-pcm: cleanup soc_pcm_apply_symmetry()
>   ASoC: soc-pcm: cleanup soc_pcm_params_symmetry()
>   ASoC: soc-pcm: setup pcm at one place in soc_new_pcm()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: soc-pcm: move dpcm_set_fe_update_state()
      commit: 9c6d7f9346b1526136dc142eb82085737112a3fe
[2/6] ASoC: soc-pcm: add dpcm_set_be_update_state()
      commit: a7e20444ef5e7ab74aec34f34eb0e53024c349e1
[3/6] ASoC: soc-pcm: add soc_pcm_set_dai_params()
      commit: 2805b8bd3e0bdda15b3458ab9818d80f5d5b157f
[4/6] ASoC: soc-pcm: cleanup soc_pcm_apply_symmetry()
      commit: a39748d03cbc7c0a55d217731c7e16a22a2d2bed

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
