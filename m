Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D00C88C6E4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:28:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBE242BC9;
	Tue, 26 Mar 2024 16:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBE242BC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711466934;
	bh=F6sUfcI9QR2xWONCcuwbnAKV6tmHdtr9+98sV20UKp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VVVzl0HN2nR0aqicvK3k7JgWBQAtMCuMQph0eBp71nXQvzaQ5uolCDuyxhM/PnwCM
	 rBpFjUU3QLdCWrvy/1/YHNdXsKZqkfD2gXQDLJhe8uB0ti08Sp9Fq91B+CUVXn/mSN
	 jyFF9arY9h3OhhjcBl7CBx5Z1uxeWkv1r1X+8JBk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 537B4F805E2; Tue, 26 Mar 2024 16:28:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C390DF805F0;
	Tue, 26 Mar 2024 16:28:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D91D7F805E0; Tue, 26 Mar 2024 16:27:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9413F805D9
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:27:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9413F805D9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Bm4GiVxC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 315D3CE1843;
	Tue, 26 Mar 2024 15:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE24FC433A6;
	Tue, 26 Mar 2024 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711466866;
	bh=F6sUfcI9QR2xWONCcuwbnAKV6tmHdtr9+98sV20UKp8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bm4GiVxCedja/Jx8UhogGl+SbWC1b8kpxvHFXqwIeUVUWSC5TyjUPkf/AgNxR7rvl
	 Vt2DbbIDQfKO/AsUQr1ph7l1E59YeMCY7mTUo/i3tHUfjwwvHcW2cx5TJ2iqhSEGZF
	 vv3goEkdkspcC3gxH46SyAhr5riikrbWM+3L8R1V8ZqmxDZalB3tbjrZaOBHlO/T/B
	 OfXoJfpbqMft0kmLGiKDhULP7us89vMufHzSYHk9iSH1q0avNzCh6yjD5ukJ//TDdK
	 Wh+ZFtWetwDNA/NKVNFtVcIqsQmQEZQZLuminZvR2hkXLn8fn3WpwMd1ClMbXDcOZy
	 MFZyGYC8jeNQA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
In-Reply-To: <20240308090502.2136760-1-cezary.rojewski@intel.com>
References: <20240308090502.2136760-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 0/5] ASoC: Harden DAPM route checks and Intel fixes
Message-Id: <171146686463.132239.1157973134119038922.b4-ty@kernel.org>
Date: Tue, 26 Mar 2024 15:27:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: 3UVDR5JFFVT2HI5WCD4LO5I34KZ7DYNT
X-Message-ID-Hash: 3UVDR5JFFVT2HI5WCD4LO5I34KZ7DYNT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UVDR5JFFVT2HI5WCD4LO5I34KZ7DYNT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 08 Mar 2024 10:04:57 +0100, Cezary Rojewski wrote:
> Set of loosely connected patches. Most impactful change is dropping any
> permisiveness when snd_soc_dapm_add_routes() fails in soc-topology.c To
> do it safely, disable route checks for all skylake-driver boards.
> 
> Relevant background:
> 
> Since commit daa480bde6b3 ("ASoC: soc-core: tidyup for
> snd_soc_dapm_add_routes()") route checks are no longer permissive. Probe
> failures for Intel boards have been partially addressed by commit
> a22ae72b86a4 ("ASoC: soc-core: isable route checks for legacy devices")
> and its follow up but only skl_nau88l25_ssm4567.c is patched. The rest
> of the boards still need fixing.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Intel: Disable route checks for Skylake boards
      commit: 0cb3b7fd530b8c107443218ce6db5cb6e7b5dbe1
[2/5] ASoC: topology: Do not ignore route checks when parsing graphs
      commit: 6974857c2b2c7e2d2db59c0e23cc42b0efc58cd8
[3/5] ASoC: Intel: avs: ssm4567: Do not ignore route checks
      commit: e6719d48ba6329536c459dcee5a571e535687094
[4/5] ASoC: Intel: avs: ssm4567: Board cleanup
      commit: 3a2be3f05110fa1a5c682ff72a26681ed4f54cef
[5/5] ASoC: Intel: avs: i2s_test: Remove redundant dapm routes
      commit: 60c10c678b582d41532fefa12667d8adca75811b

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

