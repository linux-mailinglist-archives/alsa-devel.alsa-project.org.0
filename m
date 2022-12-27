Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4042656A49
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 12:59:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 848FD73A7;
	Tue, 27 Dec 2022 12:59:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 848FD73A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142390;
	bh=W8nLcU84eflNXEY56jXPt3LCLy9g+sWNpH7hpDshvk8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=u3dyLPj/e5UqUDugIlVc/dLTAYwhhWyVPygpUfeFjbDRjr0M2PuWggs2PtD3lYsdU
	 8+eCmSdL3u3xCcbK3/ythO9na6JM0EDmQN6tEyuGJnv9/rhszOXNzzwnb8jeYlCvb8
	 vlDhPtkvOxd9RFQ8iT1irJzdVj90EghXFZlzpB7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80AE8F8056F;
	Tue, 27 Dec 2022 12:57:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBF8EF80552; Tue, 27 Dec 2022 12:57:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A635F80543
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 12:57:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A635F80543
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Bt7+t0pI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC33DB80F9D;
 Tue, 27 Dec 2022 11:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3656FC433D2;
 Tue, 27 Dec 2022 11:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142230;
 bh=W8nLcU84eflNXEY56jXPt3LCLy9g+sWNpH7hpDshvk8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Bt7+t0pIOPkgi60kiACa3xiV4+aLKdLznDfYRat+YRLOibtaefHtFwPjeNTUUX0wV
 cHfaTf8Kb+V5dlZXUF0nPVi2S+nTpFBSU7FuOoliWHpVF8NsazGBOJYbYukWSw7uT5
 dhpoGPU+ZYEATAsn1L/3NwkyCaOJ1YDK+0NndChuh8SxqBxrUEglJnUJgRe1p0polQ
 cohQxx/Ii4ctulfK2Ny0xR+uMDjj/c1CgacvZA8zOu8fLmEWt6ym0LzeNHr8VAiOmI
 yQnbDGS7EiZTvmSyx5OSjIHgcQTRrxp73NLs38qBNuAeu6nwiuOtej0MCCVmr4DRdI
 jjms4rsLr6DfQ==
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?q?S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20221214185500.3896902-1-amadeuszx.slawinski@linux.intel.com>
References: <20221214185500.3896902-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/4] Add support for DSP volume controls
Message-Id: <167214222879.82924.3882348798393283149.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:57:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12-dev-7ab1d
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
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 14 Dec 2022 19:54:56 +0100, Amadeusz Sławiński wrote:
> Some devices like DMIC don't expose native controls or need volume limit
> due to possible HW damage. Add support for volume controls allowing to
> change volume level in DSP. Maximum volume level is imposed by the
> topology file which defines given path.
> 
> Amadeusz Sławiński (4):
>   ASoC: Intel: avs: Add peakvol runtime-parameter requests
>   ASoC: Intel: avs: Add control volume operations
>   ASoC: Intel: avs: Parse control tuples
>   ASoC: Intel: avs: Peakvol module configuration
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: avs: Add peakvol runtime-parameter requests
      commit: 905ea24f0f17d826e6b90ece706bfefde3d7b2e5
[2/4] ASoC: Intel: avs: Add control volume operations
      commit: 585b9427edd65ad124e23affb80fca3d15a6375d
[3/4] ASoC: Intel: avs: Parse control tuples
      commit: be2b81b519d7121290cfecc5fdfb4907ecc41c39
[4/4] ASoC: Intel: avs: Peakvol module configuration
      commit: 29d6523698f68011eda67619faa6358a46952e96

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
