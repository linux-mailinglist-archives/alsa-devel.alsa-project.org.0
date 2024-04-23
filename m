Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 210AE8AE0C8
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 11:13:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD5501909;
	Tue, 23 Apr 2024 11:13:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD5501909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713863623;
	bh=DbSe3xJTG/wsJlhVHw+X4gsBLue00y+X3lq4gNx/WHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tzgozHupZixE/x507LodwHxSVK2YL+D2888nR0V7eLBzVlROImZjiXcMulzXzXWbz
	 zZmcl1e5TgehVxhoYqHJexp3Vkw+8pq2OV4nj8EWf0x2BViG2cth/wkAeDDY/vz48c
	 tklC7ukQgxbrin79FWxBxhZE7cTIci9XzpMYpS14=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23F4FF8056F; Tue, 23 Apr 2024 11:13:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42C05F805A0;
	Tue, 23 Apr 2024 11:13:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57DD5F80423; Tue, 23 Apr 2024 11:12:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57B22F8003A
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 11:12:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57B22F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A9W7i5X9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 055EC6125A;
	Tue, 23 Apr 2024 09:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D928FC116B1;
	Tue, 23 Apr 2024 09:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713863519;
	bh=DbSe3xJTG/wsJlhVHw+X4gsBLue00y+X3lq4gNx/WHw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=A9W7i5X9gGu1js6nvhetxsI4lWSZAwqYGnb5vvIH+zJNaY7Oj/6rfGTv2QAMYfRuI
	 sha9hXhYyLE3uQEUzPD6tIfxGhh67d5lvUd1UbqdH6s+BVA9rjbsJPCPuIO0aPGLAI
	 IzglsUZNfFzEXExHr/r1VttHxaPvO2ovvB46n0QVk0yMk1Hcqw1TgJ8t2ghtGR/05a
	 oMUHZB6NZNxwauuCJnnpv5rh3EJBArNqJzkWxeU1b7TYgjvOeSGYIHbk05FFbXVGg0
	 NEkPXcE3IcMUm7YPaPTAm5YFPrZvM7YVh2CeWsfXVZBhASHDsTImU9J9rRwMEB1l2p
	 oiw+QFtL4bF4w==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <drhodes@opensource.cirrus.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: James Schulman <james.schulman@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
In-Reply-To: <1ee32bfb-6f6c-4b61-887b-6f655abbfc47@moroto.mountain>
References: <1ee32bfb-6f6c-4b61-887b-6f655abbfc47@moroto.mountain>
Subject: Re: [PATCH] ASoC: cs35l41: Delete unnecessary condition in
 cs35l41_pcm_hw_params()
Message-Id: <171386351644.1781735.13200288316295785566.b4-ty@kernel.org>
Date: Tue, 23 Apr 2024 18:11:56 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: PXH2YNIW4XHQV367SMVEYEWSF5FXXWTZ
X-Message-ID-Hash: PXH2YNIW4XHQV367SMVEYEWSF5FXXWTZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PXH2YNIW4XHQV367SMVEYEWSF5FXXWTZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 Apr 2024 12:52:34 +0300, Dan Carpenter wrote:
> This code returns -EINVAL if "i" is out of bounds a few lines earlier.
> Delete this unnecessary check and pull the code in a tab.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l41: Delete unnecessary condition in cs35l41_pcm_hw_params()
      commit: 181d58cfe90f6a2ad53f6811d318fbc7149df8c1

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

