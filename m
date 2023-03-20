Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6216C1FC4
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 19:33:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DC88210;
	Mon, 20 Mar 2023 19:32:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DC88210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679337228;
	bh=3r2HtIjH5nWuv0CjX4W1HrwLYTiBFSaOf5Q1w39yq44=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QfB6sDDM/06GTv0/zUxVnb4cBUSo3FdSL2pMHEpITO/8x+oKM8yzLJ5Dz9ehgOAoL
	 xhTcUoz6ZRxB11uF6uhZmCouCQIzrI0qO7H9Gha7HdLRy57iSFZdPaIdTe6dnKuWK3
	 hH3pEhzG5qQnCIAGejEO2iQnppHR1p/ezjGbSlqc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98D09F8027B;
	Mon, 20 Mar 2023 19:32:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4670DF8027B; Mon, 20 Mar 2023 19:32:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9FDCF80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 19:32:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9FDCF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c7TLvup/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 84DEF6179C;
	Mon, 20 Mar 2023 18:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04AEC433A4;
	Mon, 20 Mar 2023 18:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679337119;
	bh=3r2HtIjH5nWuv0CjX4W1HrwLYTiBFSaOf5Q1w39yq44=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c7TLvup/omv6Ed2ppWGMDa/Xmashqq7uQTDrE3JqqHkFhMT2W1lmeq8S553K7QIij
	 hkR/i3F/fh5YHUm1TIe1CnEgo9P1T+Dtwqe1UX8yqWEmNPcnXrO1fNd/N7bCBEbXoT
	 8Ao91gSzJqw4LbfVamA1HC1EmWNpE6ZgpvM4p460+TL3EXZsbkXZLxCPylM5FxD918
	 Ugc2WZNxuhoOv5e5SSVjG/xTNWIV6K6ySTnLxlmojLJJqJZBApMUuN6kcKv3WLu6cP
	 8HeK3ynLsO4TCk8KTgTW+CM2BiWjwTtn8i8Rf91K81M3PGUj4FMGJknAItd91dPYFm
	 rf3TirKYkp04g==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
References: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/2] ASoC: fsl: define a common DRIVER_NAME
Message-Id: <167933711770.198283.14739386513152159335.b4-ty@kernel.org>
Date: Mon, 20 Mar 2023 18:31:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: GOZBFH5P743Z5Y7YY6RCZ2T5JPXLL7B5
X-Message-ID-Hash: GOZBFH5P743Z5Y7YY6RCZ2T5JPXLL7B5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GOZBFH5P743Z5Y7YY6RCZ2T5JPXLL7B5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 16 Mar 2023 13:36:10 +0100, Alexander Stein wrote:
> Instead of copying the driver name manually, use a common define.
> No functional change.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: fsl: define a common DRIVER_NAME
      commit: 1d52cba3b99278f178bfadf88e666648a217a813
[2/2] ASoC: fsl: Specify driver name in ASoC card
      commit: 9934844f6b49fb9964f878f12912abe689eaed5d

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

