Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EB6787B9C
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:45:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53218A4B;
	Fri, 25 Aug 2023 00:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53218A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692917125;
	bh=DlnGJX17MyL1LSD68GKcwNwP0OejT/tAXjf9NDu5tfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZHsuoroEUrilwFkeOM1LonD7qKS3KOb4RQZosUN7Lr7D/6gJxBZH/R2Wgyi4rhTIz
	 ppx+M9zeHJDmwLqbMTOnds3ajm5YhKJjbGqCaZcPJWko5amRPAYqQdt4FKUo6KQrHI
	 p5nAhoYMEXpsK93oZ7Rg7dg7aeg4tPMbBvup5MuA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E398F804DA; Fri, 25 Aug 2023 00:43:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F1A8F804DA;
	Fri, 25 Aug 2023 00:43:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A4D4F80074; Fri, 25 Aug 2023 00:43:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40DA7F80074
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 00:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40DA7F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y1GVtErO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26DB7638D7;
	Thu, 24 Aug 2023 22:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB7AC433C7;
	Thu, 24 Aug 2023 22:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692917018;
	bh=DlnGJX17MyL1LSD68GKcwNwP0OejT/tAXjf9NDu5tfg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y1GVtErOBt3Cwfy1RUkA17OAvCXx5nRto2lkvAuCAKjliQir0FL5o7neqYpTrZK5O
	 HItCvFcVS6sABYYWjZXNWwPtVYVe1/6UnnLKv/90D4zvW0R2IcConfNV6N1GwtZP9X
	 +kbp/1KCgMkio3gizOefCmNMGUi3sH2oJUtrmSZnivyYgrWgedaPzaK65NIcHRhjdR
	 UfUkJ17NWGrro/QO/Rb70gi2st9k8TQnABRWX4nfo5MVqAM3VF4Ux9ntFZE2PulL/X
	 i31l2sohEGb/r/xwGxJInIjcAonqYioPZ8SKcpoeJvZOeGi73mRe3KxhUEQJUc4ki/
	 T9XM/irbmXdQg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
In-Reply-To: <20230824193837.369761-1-cristian.ciocaltea@collabora.com>
References: <20230824193837.369761-1-cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH] ASoC: soc-core.c: Do not error if a DAI link component
 is not found
Message-Id: <169291701565.2997200.6576849021679425893.b4-ty@kernel.org>
Date: Thu, 24 Aug 2023 23:43:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: HYNS4CAOWMWVBZ6VFS664PQAO52S64EQ
X-Message-ID-Hash: HYNS4CAOWMWVBZ6VFS664PQAO52S64EQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HYNS4CAOWMWVBZ6VFS664PQAO52S64EQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 24 Aug 2023 22:38:37 +0300, Cristian Ciocaltea wrote:
> A recent cleanup of soc_dai_link_sanity_check() is responsible for
> generating lots of confusing errors before returning -EPROBE_DEFER:
> 
>   acp5x_mach acp5x_mach.0: ASoC: Component acp5x_i2s_dma.0 not found for link acp5x-8821-play
>   [...]
>   acp5x_mach acp5x_mach.0: ASoC: Component spi-VLV1776:00 not found for link acp5x-CS35L41-Stereo
>   [...]
>   acp5x_mach acp5x_mach.0: ASoC: Component spi-VLV1776:01 not found for link acp5x-CS35L41-Stereo
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core.c: Do not error if a DAI link component is not found
      commit: 199cd64140f222c66b68ebe288a3fcd0570e2e41

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

