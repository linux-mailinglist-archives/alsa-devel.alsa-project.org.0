Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D932371868A
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 17:39:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DB66207;
	Wed, 31 May 2023 17:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DB66207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685547573;
	bh=6DI2DHRWOc9zMk59x0sHc4F3JGtBtQ2RPhE5y3189E0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tPN2yFuz1Lh5Q0b1ryJytIk+nAy3KmxUccC76qz7Zln04mqj4dc6OGrERNV1KVCuK
	 W5S1P0tQCjg2DGY6JSGglfIRH3Vhd9sgT6laKk0XUSUvXMl3XuGjn4OdWtlFeB8MF4
	 SiyWYr/f2FV7MU13A8NTyQVaWbFv9NA2jYBYhZnU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0538F8026A; Wed, 31 May 2023 17:38:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B76E9F8026A;
	Wed, 31 May 2023 17:38:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F283F8042F; Wed, 31 May 2023 17:38:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D773EF80149
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 17:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D773EF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=t6keJnQe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7164A6118B;
	Wed, 31 May 2023 15:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A015C433D2;
	Wed, 31 May 2023 15:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685547497;
	bh=6DI2DHRWOc9zMk59x0sHc4F3JGtBtQ2RPhE5y3189E0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t6keJnQeBk9PfD2pdHKnE06p4FRWh4o1iijTE9iAq9h8kNGQcMKzK3nc+ScgXBCtJ
	 Pr/XO3y8ZDcbzr1ScAQAJlYjHFiMzaUSQEs+pIyxy/9mkQ8A74XSrp5/6cWHjXpi5w
	 SFzk6w80c8ptgQHOyKFH5pPCeRc91mOMJ6AeZvi5ZSNh0O53gLWuLcB3VzUFXDsDHj
	 N6j1JNG43fo+7ONffElq0mzxOdL80Ssv/YTeSqjNJmD8kYXYZ2QCMrlWFUQu5YQ2do
	 Vn/6krjMfIqeHbxVggrfn2byCu+FD8rfD8J5zX7YiOY1KS0732F2c42YxIpy6y9j2g
	 jJGxpd1XfTu5w==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/5] ASoC: minor cleanup for soc_get_playback_capture()
Message-Id: <168554749705.125455.17566588901813177203.b4-ty@kernel.org>
Date: Wed, 31 May 2023 16:38:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: A2SYR3SLP7OAZULI6ODYOG524YUTNJJD
X-Message-ID-Hash: A2SYR3SLP7OAZULI6ODYOG524YUTNJJD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2SYR3SLP7OAZULI6ODYOG524YUTNJJD/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 May 2023 00:49:27 +0000, Kuninori Morimoto wrote:
> This is minor cleanup patches for soc_get_playback_capture().
> 
> Link: https://lore.kernel.org/r/87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87353uqjiu.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.intel.com
> 
> Kuninori Morimoto (5):
>   ASoC: soc-pcm.c: indicate error if stream has no playback no capture
>   ASoC: soc-pcm.c: use dai_link on soc_get_playback_capture()
>   ASoC: soc-pcm.c: cleanup soc_get_playback_capture() error
>   ASoC: soc-pcm.c: use temporary variable at soc_get_playback_capture()
>   ASoC: soc-pcm.c: tidyup playback/capture_only at soc_get_playback_capture()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: soc-pcm.c: indicate error if stream has no playback no capture
      commit: 092830cf550667d5fa6286605167d232f2c1f61e
[2/5] ASoC: soc-pcm.c: use dai_link on soc_get_playback_capture()
      commit: cfcb31c456b15e298f88fb5ebedf7b32b009d32d
[3/5] ASoC: soc-pcm.c: cleanup soc_get_playback_capture() error
      commit: a1c0221fa5baeae6c9dc30294c2c6d01f1f4379b
[4/5] ASoC: soc-pcm.c: use temporary variable at soc_get_playback_capture()
      commit: c3e9b6d6ef5a0a3e841c3aa29e7afc48a0b73806
[5/5] ASoC: soc-pcm.c: tidyup playback/capture_only at soc_get_playback_capture()
      commit: e1f653ce847bab7285dd135cabe3ce544e574c75

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

