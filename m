Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 473ED7B570F
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 18:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E990850;
	Mon,  2 Oct 2023 18:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E990850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696262720;
	bh=8qJEwNB1r3i7uX/wCuY3MI9oUQXs00pwUZfeUFu2Wa4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hbv0jfL6+50doEqY6q7qP4e5n0l5cHqqOVGOMZeutj9ln2AsujTte0TK8QFBfJ19q
	 UZt6TeRCBpp6hcipjoVdTIxf+DH8JU+NR3xAU9cmiimO4l4XtcvrhOz/PioBwl8cui
	 af43tmxsdYIAbXgwVaxgxBS5drLWd5AWdjpHoO0s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0F15F801EB; Mon,  2 Oct 2023 18:04:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62AC1F802E8;
	Mon,  2 Oct 2023 18:04:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05570F80310; Mon,  2 Oct 2023 18:04:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB7D2F800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 18:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB7D2F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c6E8Sl6b
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B8671B810AC;
	Mon,  2 Oct 2023 16:04:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F482C433C7;
	Mon,  2 Oct 2023 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696262654;
	bh=8qJEwNB1r3i7uX/wCuY3MI9oUQXs00pwUZfeUFu2Wa4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c6E8Sl6bRHKCpnPuDEkjUP8m62ng1h5HdZ4K+RPH2y0QjeEsutJ8N7IvMi8u9zQxN
	 dmor+nnzXLmhDarfGtMBWwnq0rPIoIdRL/53G9uuUbDAiZkLPLDiEAu420tJNVGVKj
	 DLpVshz9xcSHK4lLlmAFPjeo8x9w76dZSza7DKxEPgvNS1597bbBczp4Vqz2ufI1E2
	 eWaC4fruQAjd9AttbYGae3L9WhQWl4OJgZ43bxKZXfuID3zOvyOmJkhAs2zMTKWkU4
	 WuoeqHl6XjCtT9fTwTKgM/1LuNqZMKH7PhhrpufTlHPaA390/I/0lxbyuy5h3zgnIk
	 5/gHuPY8FSTIQ==
From: Mark Brown <broonie@kernel.org>
To: Tony Lindgren <tony@atomide.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
References: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
Subject: Re: [PATCH 0/5] GPIO descriptors for TI ASoC codecs
Message-Id: <169626265184.76713.15106250462877000294.b4-ty@kernel.org>
Date: Mon, 02 Oct 2023 17:04:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: AKOIRHWH365F23TLF5CE5EYZ24CBSYVE
X-Message-ID-Hash: AKOIRHWH365F23TLF5CE5EYZ24CBSYVE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKOIRHWH365F23TLF5CE5EYZ24CBSYVE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 26 Sep 2023 15:25:28 +0200, Linus Walleij wrote:
> This cleans up and rewrites the GPIO usage in the TI
> ASoC components to use GPIO descriptors exclusively.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: ti: Convert N810 ASoC to GPIO descriptors
      commit: 22041ed154aaf89f31306014a305dde516c308ea
[2/5] ASoC: ti: Convert RX51 to use exclusively GPIO descriptors
      commit: 5b12dd84499a74be9d133e020e424025359a244f
[3/5] ASoC: ti: Convert TWL4030 to use GPIO descriptors
      commit: 1b8a62937e0b23c41956feec778ca7776a01df48
[4/5] ASoC: ti: Convert Pandora ASoC to GPIO descriptors
      commit: 319e6ac143b9e9048e527ab9dd2aabb8fdf3d60f
[5/5] ASoC: ti: osk5912: Drop unused include
      commit: 67ebde42034ec8d199ec7877efed4bd08eb0c5e0

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

