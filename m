Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC9E93FD59
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 20:30:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE3D83B;
	Mon, 29 Jul 2024 20:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE3D83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722277851;
	bh=IgGPgeudGRZ3VVlhR5DSGTj9KvKP6DefgGLMu8OF8Qw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i6vBiPd1X/glzOiMsMiVGMJl+ITC/gWR0insK0h+S+61Or6ANtglZsg/ERleewQYg
	 tBikVVEcLwhBxj3m21rqUn/+EZ7M3vo+sYTE4+xxMzRW/c9tekjdILTsHrAgwp4Uw9
	 B4xCQhTnvcNMxS4WxpI4ABpYga9gJtER17+TXrYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2906BF805FA; Mon, 29 Jul 2024 20:29:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9D99F805BE;
	Mon, 29 Jul 2024 20:29:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC76AF80579; Mon, 29 Jul 2024 19:17:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64C29F8007E
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 19:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64C29F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hvM9NnbE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2C9A261BB2;
	Mon, 29 Jul 2024 17:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67709C4AF0A;
	Mon, 29 Jul 2024 17:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273463;
	bh=IgGPgeudGRZ3VVlhR5DSGTj9KvKP6DefgGLMu8OF8Qw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hvM9NnbEV128nkj8XteXiokTuYFvJikp8m0r2kZrxGzwq3fb45cwuPyyin9o7702Y
	 lgybZW+YK89nWs7DJmu/nPFHmz2W9I5lgRUMahRm3nPnDXdYrOqjnNV4Ef0oilZm0G
	 dzzmLJ7lgnfgj/xcKa1BHKtHvN3ZMUgnOJHgx5n/Mxl96//LFp4oCEMZlg5ap8v+T5
	 R0UmgkJIPx5e+PZPizSQ/ykiZX28KlzN0NMGC7rll1Lt5I5a2ZFAnVPbZxlBhASud1
	 XYktslMZBBAvyHAtfDOwyhUKdDfUc5HJcuHkGwwEpCAzoKypxppdfwIAVYgo6qXDl9
	 r/o3sd2n3u/AA==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Jerome Audu <jau@free.fr>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20240727-sti-audio-fix-v2-1-208bde546c3f@free.fr>
References: <20240727-sti-audio-fix-v2-1-208bde546c3f@free.fr>
Subject: Re: [PATCH v2] ASoC: sti: add missing probe entry for player and
 reader
Message-Id: <172227346114.109775.10465470972478318748.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: JG7TKEDZYF52ORXZIBRVEHERVTERE7XJ
X-Message-ID-Hash: JG7TKEDZYF52ORXZIBRVEHERVTERE7XJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JG7TKEDZYF52ORXZIBRVEHERVTERE7XJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 27 Jul 2024 15:40:15 +0200, Jerome Audu wrote:
> This patch addresses a regression in the ASoC STI drivers that was
> introduced in Linux version 6.6.y. The issue originated from a series of
> patches (see https://lore.kernel.org/all/87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com/)
> that unintentionally omitted necessary probe functions for the player
> and reader components.
> 
> Probe function in `sound/soc/sti/sti_uniperif.c:415` is being replaced
> by another probe function located at `sound/soc/sti/sti_uniperif.c:453`,
> which should instead be derived from the player and reader components.
> This patch correctly reinserts the missing probe entries,
> restoring the intended functionality.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sti: add missing probe entry for player and reader
      commit: 6b99068d5ea0aa295f15f30afc98db74d056ec7b

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

