Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 182F079B8C1
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:08:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53A3B150C;
	Tue, 12 Sep 2023 02:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53A3B150C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477336;
	bh=XmvvSnPPZfJmsrUyZ/7/dR8/drInjaaG1l50K2Joi1E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VWz7FSN2CkV4vmvNAPVpksZBlk531+3lPkNFmujqlHShNIIK1YMpbXSgcS2O04nys
	 U2/2b4De1ZyFk9yfJGX3eAQ/LRB+/mxeoq1nH2/trNWC3trMFadT5FcVtBUNAgRoUV
	 tmbztYWX3P+IfZA9fXXNg9xpevmV3St6f9p3T7rg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C392F8057E; Tue, 12 Sep 2023 02:02:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7A0AF8057A;
	Tue, 12 Sep 2023 02:02:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA70FF8057E; Tue, 12 Sep 2023 02:02:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40C11F80568
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 02:01:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40C11F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J0Rk2Gsw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 001FC61486;
	Tue, 12 Sep 2023 00:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCECC433BD;
	Tue, 12 Sep 2023 00:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476913;
	bh=XmvvSnPPZfJmsrUyZ/7/dR8/drInjaaG1l50K2Joi1E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J0Rk2Gsw9fmnC318IRR7A9MwTuYhIUXoxBG/mV08+o+a9NMDng3RLoWLdjqDSbyj6
	 T7Trxr8PMmaa+NyAoxw1FbB/8CMFZfypZzHMxJkHe7rYA5r3OfEVEjgdviBY6qB7V+
	 VmWcqFOHxxHKLkziEo4zjmpWs8NlKQ7PqWTJ3L+sAJqbNh6gG8SH+Pe/az3z/BOzz8
	 ajXfxuTAGfgEK4sZrCJxiiuvsYDBCIlIpuIDi5um+azat7+RPw09UPts++GnRP7112
	 jpFRygQisPn4UE+mP2iZcsD7E+NxrvBEuppmLYhz6i0Ioomnnn9P3TUQil0Q/sTtfX
	 Tt/1YPvx4itFQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Sameer Pujar <spujar@nvidia.com>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
In-Reply-To: <1694098945-32760-1-git-send-email-spujar@nvidia.com>
References: <1694098945-32760-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH v2 0/2] Fix redundant PLLA update
Message-Id: <169447691068.2390116.10518505217580469969.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 01:01:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: OUOMSVMSCNHE45TGZOOP4IQLTWXFZOQG
X-Message-ID-Hash: OUOMSVMSCNHE45TGZOOP4IQLTWXFZOQG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OUOMSVMSCNHE45TGZOOP4IQLTWXFZOQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 07 Sep 2023 20:32:23 +0530, Sameer Pujar wrote:
> This small series fixes redundant PLLA updates that happen for
> each DAI link in the audio path. This helps to resolve DMIC clock
> issue seen on Jetson TX2 platform.
> 
> Sameer Pujar (2):
>   ASoC: soc-utils: Export snd_soc_dai_is_dummy() symbol
>   ASoC: tegra: Fix redundant PLLA and PLLA_OUT0 updates
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-utils: Export snd_soc_dai_is_dummy() symbol
      commit: f101583fa9f8c3f372d4feb61d67da0ccbf4d9a5
[2/2] ASoC: tegra: Fix redundant PLLA and PLLA_OUT0 updates
      commit: e765886249c533e1bb5cbc3cd741bad677417312

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

