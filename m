Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F2D763E2A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 20:09:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A649843;
	Wed, 26 Jul 2023 20:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A649843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690394968;
	bh=JVyjq9khiHsaa2EzqXPO6ynI006tU7vtTMC1jiwR+lg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OKvqZsZZgVSFH6igRY5EVBf8Tx0Au+AhrzRtWGijzjvJfo2tvJrDrB5TlqrmvQhbr
	 IzhpFoftZEf1c/S4e8GM+r2MzunEISG2MRUWnHc5IB68WEehNjh3gYKhkyzr345ND6
	 ETxs8sv6kBWJP3XjYviFtmXdQPg33x6rfthi7MTQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26376F80535; Wed, 26 Jul 2023 20:08:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60BE2F80153;
	Wed, 26 Jul 2023 20:08:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6EAECF801F5; Wed, 26 Jul 2023 20:08:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B9800F80149
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 20:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9800F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fkGjnpPm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7B78661BE6;
	Wed, 26 Jul 2023 18:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 274A9C433C7;
	Wed, 26 Jul 2023 18:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690394883;
	bh=JVyjq9khiHsaa2EzqXPO6ynI006tU7vtTMC1jiwR+lg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fkGjnpPm2GN3CUoAPKXuLP9eeBpcwqunRDJ2uVsc51l75wjEbLoqZMcg4QHIVs83Q
	 rMzVLrseDVPKqkWwMlUZJcll6X9W7Fnx/+W6wwc+erJDonNi87y2gbF5lDekoIujFO
	 pxrJvZz03Dxwh3uz9kny7Geznh9PYBouiLp6NDk25ugUBL689MCzzqScMB3BNiHHz9
	 WpSlbyNuEE2aGtDx3Zi+lCRVbu21lYb84DuS98biRiXwadpusVYPzaWtabhM4hKxvm
	 duTIdYUQOjs3XodEhaXjxPRik8tBM6tfcKP77EXYels+KytNt6xnPZsr7boxBGO5i4
	 e2XzKTh73t8pA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 justinstitt@google.com
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>
In-Reply-To: 
 <20230725-sound-soc-intel-avs-remove-deprecated-strncpy-v1-1-6357a1f8e9cf@google.com>
References: 
 <20230725-sound-soc-intel-avs-remove-deprecated-strncpy-v1-1-6357a1f8e9cf@google.com>
Subject: Re: [PATCH] ASoC: intel: avs: refactor strncpy usage in topology
Message-Id: <169039488086.108395.14504873016968111035.b4-ty@kernel.org>
Date: Wed, 26 Jul 2023 19:08:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: D6Y6JPD2COKXAZZZWATVBDAAOCSZSUXN
X-Message-ID-Hash: D6Y6JPD2COKXAZZZWATVBDAAOCSZSUXN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D6Y6JPD2COKXAZZZWATVBDAAOCSZSUXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jul 2023 22:08:38 +0000, justinstitt@google.com wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1].
> 
> A suitable replacement is `strscpy` [2].
> 
> There are some hopes that someday the `strncpy` api could be ripped out
> due to the vast number of suitable replacements (strscpy, strscpy_pad,
> strtomem, strtomem_pad, strlcpy) [1].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: intel: avs: refactor strncpy usage in topology
      commit: f6500ec12c1ec745fbec20fd4734b832bbfd4aac

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

