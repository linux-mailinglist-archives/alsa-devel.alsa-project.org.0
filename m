Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D78895C95
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 21:30:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1162D2C58;
	Tue,  2 Apr 2024 21:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1162D2C58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712086256;
	bh=irLkQWFufDbVi6k1LpDXZz/gHAQUlWWBaSIRfGXRKQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c/JopRilCvf4xlGXwj+rvgRHURhdBP6TGJT8Cc4olWvitsWpJ6/gRNtMQ1VXmTfJ5
	 8QW9E0vi88PRxjTdds+4pIZt1uDrpJECc+YfqOx1pZyXUhlqvGaFHbKQXn5m3OrEeq
	 8OXLzwGAn2S7mibjFMk59Y3k4eiTreNDKrJ2Xvoo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CDC6F805AE; Tue,  2 Apr 2024 21:30:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA507F805A0;
	Tue,  2 Apr 2024 21:30:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A81E7F8020D; Tue,  2 Apr 2024 21:30:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 875C9F8015B
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 21:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 875C9F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aHdbJpQj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D783961062;
	Tue,  2 Apr 2024 19:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A220C43390;
	Tue,  2 Apr 2024 19:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712086205;
	bh=irLkQWFufDbVi6k1LpDXZz/gHAQUlWWBaSIRfGXRKQM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aHdbJpQjlDhpNp7jtWLG8WFj8tIVE95YAbQ2u6oUY52J8w9m3PCWgOqRRwqac4e4R
	 VuEGJjPPfFP9psTw3psm7XJpKXfKSOwMI/9K0lp1Lw0jjih3e+drk0OG8zqWrg/7+m
	 AJxO8ye/RPdA9mz3d+V9qeplLqVV8htW4LPIOiIV4umC3HVRZ+yFIL01sFUBj7KS1n
	 6BqYd+CvyFhdc55ksHXcWlhbpRgguCA+AeQakbIbsSg9dKTB/u+ZyosPxIT6xqfjMN
	 1aB+i9CuPLTt9NnR2ClKrjvkDujkafMRmtgBT/xYiwEFrZw5YbacCzvPyu07w0nfQB
	 kMbGulrGImJ8g==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240402130640.3310999-1-amadeuszx.slawinski@linux.intel.com>
References: <20240402130640.3310999-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: avs: boards: Add modules description
Message-Id: <171208620375.89523.10607476689901938291.b4-ty@kernel.org>
Date: Tue, 02 Apr 2024 20:30:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: J5BGVUZNQFWGIUIHMVCVW4CSEPWVBR6O
X-Message-ID-Hash: J5BGVUZNQFWGIUIHMVCVW4CSEPWVBR6O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J5BGVUZNQFWGIUIHMVCVW4CSEPWVBR6O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 02 Apr 2024 15:06:40 +0200, Amadeusz Sławiński wrote:
> Modpost warns about missing module description, add it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: avs: boards: Add modules description
      commit: d619b0b70dc4f160f2b95d95ccfed2631ab7ac3a

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

