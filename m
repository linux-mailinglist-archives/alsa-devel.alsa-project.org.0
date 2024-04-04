Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ABC898DAC
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 20:03:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C44072CCB;
	Thu,  4 Apr 2024 20:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C44072CCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712253831;
	bh=ZfVQ/XIUwLShf3Q1HTMAdeFdFpZ2ogXhC20oHgmjWSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nWs16a9AzuCIFktI8bouzfbyAvGmnzBfGNiEbE+oG99MS++kA5/Eg61xLs588KjQq
	 lDrIq/w1JZ1biiyRVXWLPBXl1ObXtT1rnF6A+lQt07O6HOp8yVmnvsGHvlLJuPW1Lu
	 cZ3Uxm7zk+hi22DSdqV44IOnvOnlMh8i97r0sM0c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6576CF80589; Thu,  4 Apr 2024 20:03:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE16EF80007;
	Thu,  4 Apr 2024 20:03:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 766E0F8020D; Thu,  4 Apr 2024 20:03:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3455F80114
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 20:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3455F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EO2ufDTA
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 094516144E;
	Thu,  4 Apr 2024 18:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F78EC433F1;
	Thu,  4 Apr 2024 18:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712253782;
	bh=ZfVQ/XIUwLShf3Q1HTMAdeFdFpZ2ogXhC20oHgmjWSM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EO2ufDTAXbtvmNmUM/7j4fjiN9QrX4qtdUqbZLUhceLEEV0o27dK2mOpm9KA6LsYL
	 gWR+7VFOlBtwYXpib/G/PlxG8mSNLAYcPbbWaSgkgGTlDpyHN8HoMuLK+IY9SYqO99
	 AT/w2Oz0p63m6Gl2l6oACKyeLfau1iFYwk57E2H9KFdi/NbNO8Z9W1jWsON9kqagYM
	 W95dQ2XrrMPiKRkxYYpWGd5XZSFAyrrq+rQM4B5r7UUXrc/DJfg4x5jRwlmRWI4pd1
	 25SRp5s/6pBwmgJMo1L626OaVGW1ks09b9AoglussSnF4xs4t2ge8+ndOq3rricAF2
	 dsoQAAkua66fQ==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 cujomalainey@chromium.org, lmajczak@google.com
In-Reply-To: <20240403091629.647267-1-cezary.rojewski@intel.com>
References: <20240403091629.647267-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/4] ASoC: Drop soc-topology ABI v4 support
Message-Id: <171225378015.123813.8269519706443486701.b4-ty@kernel.org>
Date: Thu, 04 Apr 2024 19:03:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: WH5R4HWM6KDF7YZ5F466AD36RE6QAUCK
X-Message-ID-Hash: WH5R4HWM6KDF7YZ5F466AD36RE6QAUCK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WH5R4HWM6KDF7YZ5F466AD36RE6QAUCK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Apr 2024 11:16:25 +0200, Cezary Rojewski wrote:
> This patchset impacts UAPI.
> 
> The only known users of the soc-topology ABI v4 are Chromebook
> configurations. Starting from kernel v5.4, all of them are making use of
> soc-topology ABI v5. The patchset first removes obsolete code from the
> Intel's skylake-driver - the driver of choice for the mentioned
> Chromebooks - and then proceeds with removal of relevant soc-topology.c
> and uapi bits.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: Intel: Skylake: Remove soc-topology ABI v4 support
      commit: 251ea652050e715886b272f831cf5016150a60c8
[2/4] ASoC: topology: Remove ABI v4 support
      commit: c57468dc1f80a4a3bf6dd271688837d3c1f26e75
[3/4] ASoC: topology: Cleanup after ABI v4 support removal
      commit: 82c192540b242a8bf3c3d4140905650df9f327d4
[4/4] ASoC: topology: Remove obsolete ABI v4 structs
      commit: 4ba509bf3988f36b536b49b9e7022a6358f87f56

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

