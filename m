Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2A787559C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 18:55:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0374383E;
	Thu,  7 Mar 2024 18:55:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0374383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709834143;
	bh=N/G00rBhFeUtQPFUnLF5UqWzkC0ItgBzrXMdpGLMz58=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K11ijo/hkJCz78S2X9ZL1uXX1Mf3JAHkLo6bQ7okw5iiOa2acKuuZScA/qIDZN81D
	 mFEFxeyHS/LIhP1m0t46im7KTFNYjSD8CKc2dM3SqJv5YOo1koTK7H7WYeLekVprvi
	 Q+19/9MAvjXCoyM0NQWThjj7aZAuqnoiVYl5cF3M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B909F805AB; Thu,  7 Mar 2024 18:55:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ABADF80570;
	Thu,  7 Mar 2024 18:55:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9765F8024E; Thu,  7 Mar 2024 18:55:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96593F80087
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 18:55:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96593F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JnuyfUZ5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E7BE2CE25A1;
	Thu,  7 Mar 2024 17:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE23C433C7;
	Thu,  7 Mar 2024 17:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709834097;
	bh=N/G00rBhFeUtQPFUnLF5UqWzkC0ItgBzrXMdpGLMz58=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JnuyfUZ5k6RipLTJCjx0fB7LjTyCGUd8FcKG8zqs2T3r6UC2h3eX1v8ATZzAxx+Yp
	 pYZncg0OdtOt84ZvuAKkfXJKxNwf0HqcEWVnhbyHjrW3ZDMAPYsq/e1g36Zm69DCGz
	 y03mX2SOJHbBLK4ffQeATEek14ejx7XdAnKqQTZNV8SsaEAQww09Gh64i4Qnb7DucA
	 aY1B0UKXp3Jjv3ap6vh20yzAeTNc12yiFLnaimwhxwPpSVfQY1bupmajce3ey2MnRU
	 cHYXCVHj6fjAf7K3bh58r0ZIk1s3RA+wvMov59fRY/lH65ywsvr7EfRgW+oBrgc4M2
	 Q9OzcxFbbUI9Q==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20240307163734.3852754-1-andriy.shevchenko@linux.intel.com>
References: <20240307163734.3852754-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: Intel: catpt: Carefully use PCI bitwise
 constants
Message-Id: <170983409454.99823.12509782331460236693.b4-ty@kernel.org>
Date: Thu, 07 Mar 2024 17:54:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: P2C7RNEBUNFB3OGZD6TRK6AFLCJOPEH3
X-Message-ID-Hash: P2C7RNEBUNFB3OGZD6TRK6AFLCJOPEH3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P2C7RNEBUNFB3OGZD6TRK6AFLCJOPEH3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Mar 2024 18:37:34 +0200, Andy Shevchenko wrote:
> PM constants for PCI devices are defined with bitwise annotation.
> When used as is, sparse complains about that:
> 
>   .../catpt/dsp.c:390:9: warning: restricted pci_power_t degrades to integer
>   .../catpt/dsp.c:414:9: warning: restricted pci_power_t degrades to integer
> 
> Force them to be u32 in the driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: catpt: Carefully use PCI bitwise constants
      commit: 6c023ad32b192dea51a4f842cc6ecf89bb6238c9

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

