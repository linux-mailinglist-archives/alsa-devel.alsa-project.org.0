Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD97807A13
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 22:05:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE6EB843;
	Wed,  6 Dec 2023 22:05:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE6EB843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701896739;
	bh=UJfCLWvjaeHxoaivKdYpO1tpsskZ6FpSSxamVKiasE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TfSSVKoTUS4fpf0tHlG1m4+Fir6lvidTPMdfvqMhU+eIOCdEWThQT88aMfmUsNAAA
	 V3ycOWGbJ/ZSafr06uHfmzfk4ADc95wR1JJis54sy0z0TEc9AklXeTQvpTik7YXFhM
	 xBxd/w20NEsRrDA5bNjnLupTNhIJoMqF/lS70D1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 000F5F802E8; Wed,  6 Dec 2023 22:05:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EE00F80570;
	Wed,  6 Dec 2023 22:05:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC104F8025A; Wed,  6 Dec 2023 22:04:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A233BF800D2
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 22:04:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A233BF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DYm7U+61
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ADBA4CE20D1;
	Wed,  6 Dec 2023 21:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9626DC433C9;
	Wed,  6 Dec 2023 21:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701896684;
	bh=UJfCLWvjaeHxoaivKdYpO1tpsskZ6FpSSxamVKiasE4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DYm7U+61qFtJK81smqLMUbVvfv/kvSGlGzhucfORBTSpjL4ldqYMDfDfDHpl3QS51
	 ZfwIdNY4Lo1zwe53LxLdvQdvzp+DTiEAM6OGk0JCn7oTBJp4Qr3CXuMBlxb3Zvw8RS
	 DFJZ+RDIdH1eJA+Usvj8KVTVInPIEA/YZVmMjP11E6wts5cVh+4us1KelMs12S4nH2
	 Z5ufAi3MI+BzdXbIYBIv72wcZvk31qYHkttIdtTqboL1L6c5rOTvmhKoYJ8sttTiLb
	 hRW4skPR1kNhjkxDdirGoJybnqP2q/fLnys+vE8lZXQqxYMfEzi0+I1CwHwmL6O0Au
	 6Vax0YjMb5jMw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Marian Postevca <posteuca@mutex.one>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
In-Reply-To: <20231206110620.1695591-1-venkataprasad.potturu@amd.com>
References: <20231206110620.1695591-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH 1/7] ASoC: amd: Add new dmi entries for acp5x platform
Message-Id: <170189668133.80064.8230022680454634134.b4-ty@kernel.org>
Date: Wed, 06 Dec 2023 21:04:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: J5KGKJ62QA6MKRYTOHKGMJ3S3OICXKYS
X-Message-ID-Hash: J5KGKJ62QA6MKRYTOHKGMJ3S3OICXKYS
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J5KGKJ62QA6MKRYTOHKGMJ3S3OICXKYS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 06 Dec 2023 16:36:12 +0530, Venkata Prasad Potturu wrote:
> Add sys_vendor and product_name dmi entries for acp5x platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: amd: Add new dmi entries for acp5x platform
      commit: c3ab23a10771bbe06300e5374efa809789c65455
[2/7] ASoC: amd: vangogh: Add condition check for acp config flag
      commit: f18818eb0dbe0339c0efd02a34a3f5651749cb84
[3/7] ASoC: amd: Remove extra dmi parameter
      commit: e12678141835c539fc17a2318ec4017a845935bd
[4/7] ASoC: amd: acp: Add new cpu dai and dailink creation for I2S BT instance
      commit: 671dd2ffbd8b92e2228fa84ea4274a051b704dec
[5/7] ASoC: amd: acp: Add i2s bt support for nau8821-max card
      commit: e6a382cf7a69cc80e57978bbf0c7a674dfb09621
[6/7] ASoC: amd: acp: Enable dpcm_capture for MAX98388 codec
      commit: e249839bf33f3f9727d6220536ed5c7d4f5bc31d
[7/7] ASoC: amd: acp: Set bclk as source to set pll for rt5682s codec
      commit: ff5a698c0ffb08eee9c1ce0dfc79c91f273122d5

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

