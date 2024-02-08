Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A681F84E99D
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 21:22:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0839852;
	Thu,  8 Feb 2024 21:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0839852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707423772;
	bh=AwnJISLAcr+jBWBhT8Idv4eVNhgvLSP3fAzQTR1pX9o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LWJM2nXC+6t96PBG6mG+wVKr7Hgs3S03099udH363cFMedGrRW5fDnpVkTCDA0eGh
	 Okl4DnXZkJx68NtvBqcCjMWzA961AnVyLeEUSpSDeGRMFmKYCZMHpDQ92R/XDa2194
	 WoLMYde8D+C8Alf408URW3EkR13KpM9yGR7mwskk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 136F8F80571; Thu,  8 Feb 2024 21:22:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81D47F800E3;
	Thu,  8 Feb 2024 21:22:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53E76F801EB; Thu,  8 Feb 2024 21:22:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B194EF80153
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 21:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B194EF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ULp/gQv4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 91D3BCE1E7A;
	Thu,  8 Feb 2024 20:22:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF01C433F1;
	Thu,  8 Feb 2024 20:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707423721;
	bh=AwnJISLAcr+jBWBhT8Idv4eVNhgvLSP3fAzQTR1pX9o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ULp/gQv4RebT7gcbxaL3CpfrFYFPhdb/guXPCtRT4ECFXXlpKRmp9sasfkPtjO0Ni
	 eJ3W3voHTcsw0Un0dlpT5Z731xjfgTJhrh1Bxlf5t+GXfqx+uZEEkOQ9rWpp00xEK5
	 8ocpTOdpoXDcRVwVbINse4JVkCF80nIXhIlaZKijueCyeX+celCdBUZXHyvja98O0Q
	 vuwMdTQ7g5U3+UdBI3OfbYiNzVnkKmfXcNQuwbttsDIJckR+Gw321PHa5AHJPO5FkU
	 UfmLPfKcC0SEank5bgJkxlbCwL1h+kSbwUt3yI7y04q6/frakRPGB9Pjo74EamUz+E
	 T5iHviSU8uwjw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 =?utf-8?q?=C5=81ukasz_Majczak?= <lma@chromium.org>
In-Reply-To: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
References: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v2 0/3] ASoC: Intel: avs: Add support for sending
 initial module config
Message-Id: <170742372000.1997067.17428489843842276238.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 20:22:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: XFFUMJMWJ6RA5NGIANOAFEYQQEYES2CL
X-Message-ID-Hash: XFFUMJMWJ6RA5NGIANOAFEYQQEYES2CL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFFUMJMWJ6RA5NGIANOAFEYQQEYES2CL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 Feb 2024 11:23:57 +0100, Amadeusz Sławiński wrote:
> In some cases it may be desirable to provide default initial
> configuration for FW module using payload. To facilitate such solution
> extend topology to contain initial config information, parse it and then
> send data to FW if present.
> 
> Amadeusz Sławiński (3):
>   ASoC: Intel: avs: UAPI: Add tokens for initial config feature
>   ASoC: Intel: avs: Add topology parsing support for initial config
>   ASoC: Intel: avs: Send initial config to module if present
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: avs: UAPI: Add tokens for initial config feature
      commit: a5766cd479fd212e9831ceef8e9ab630c91445ab
[2/3] ASoC: Intel: avs: Add topology parsing support for initial config
      commit: 1b4217ebbb3e9d9b014db660618a4ddb61b3c321
[3/3] ASoC: Intel: avs: Send initial config to module if present
      commit: 8a49ef789b1be68242624d460df2ada8087308a7

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

