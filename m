Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F43720830
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 19:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A4A0820;
	Fri,  2 Jun 2023 19:11:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A4A0820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685725917;
	bh=Sm9tqdONmLaACZgnEVSVfiPc4+bYFHegJgO3G2ZQySs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G/I5cMLYto3BeiIO9hPMahWz8eA/Ca21SOAnRJj2Boz7yOWaTmfo37jCZe5NcUnlU
	 7J6l0NfwaXlEChjnDZkiLY/M2hb6U5g+tYYRC1Gmu/OYlW0WhVQmQZCHiY5ic8Zd2M
	 Zx2V/JLn866L/mkO5CsrVAtIDyiQy+BkQX7QEbpo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A001F80553; Fri,  2 Jun 2023 19:10:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27936F80548;
	Fri,  2 Jun 2023 19:10:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E435FF80149; Fri,  2 Jun 2023 19:10:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42804F800BD
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 19:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42804F800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T4HBsuap
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 671FB617B2;
	Fri,  2 Jun 2023 17:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDB9C4339B;
	Fri,  2 Jun 2023 17:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685725802;
	bh=Sm9tqdONmLaACZgnEVSVfiPc4+bYFHegJgO3G2ZQySs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T4HBsuapNljICDcLypo93MZPmrKun/442h0PJT1po9Gl2s9PPfeYgHpLKEdmZZInm
	 sTfysp9TP0A6fHTcFKdoJorTkO3M0TyZCd4kqh/Ot74C7o5c0V8Jk3QG6nIz8sNm/A
	 S/uAyaWedYNMVZyKTRDxftCB2SMrVWYl7pskLL2t9o5/2dVbvba5yLXwfH4D8e1Umj
	 gvxLjRePIN3u0IpZiUxefVs+DJV9G7xgZjYkJK+bEpxpPgR/EK2T6vWEvF+E5znMss
	 BPOhJ9qu7I7fpTXUBfPy+RPjQI/r7G1mtENuKTx7n3RMgz8HClCQqH202HtOUoTmd3
	 d5Ywa9rfjNugg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Robert Hancock <robert.hancock@calian.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230602011936.231931-1-robert.hancock@calian.com>
References: <20230602011936.231931-1-robert.hancock@calian.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: fix PCM constraint error
 check
Message-Id: <168572580128.93025.9865775498537143509.b4-ty@kernel.org>
Date: Fri, 02 Jun 2023 18:10:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: AIOQ4P2OYIL3CFTYTMQCY3O7ASLQ6QWZ
X-Message-ID-Hash: AIOQ4P2OYIL3CFTYTMQCY3O7ASLQ6QWZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AIOQ4P2OYIL3CFTYTMQCY3O7ASLQ6QWZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 01 Jun 2023 19:19:35 -0600, Robert Hancock wrote:
> The code in asoc_simple_startup was treating any non-zero return from
> snd_pcm_hw_constraint_minmax as an error, when this can return 1 in some
> normal cases and only negative values indicate an error.
> 
> When this happened, it caused asoc_simple_startup to disable the clocks
> it just enabled and return 1, which was not treated as an error by the
> calling code which only checks for negative return values. Then when the
> PCM is eventually shut down, it causes the clock framework to complain
> about disabling clocks that were not enabled.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: fix PCM constraint error check
      commit: 635071f5fee31550e921644b2becc42b3ff1036c

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

