Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBB972258D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 14:23:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 565396C1;
	Mon,  5 Jun 2023 14:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 565396C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685967827;
	bh=RG/sVuLzHHaXk4V4qOv1AU1NRzho4Tut9DnxdceFTDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ApLrxJ0DsaecgmGlfOm/zz2YJnfd8aDRG+fZJOndNmWEWRbdWTEWRwXfFjNLCc3y3
	 dietJTfm/9SmpXDXtj6ztEeT2ylj1YVWM8YutU6fo4lYj9EvO6/PbeLBlKTV27MH8T
	 J2bN+XJVK3JLA0j3CYSjxlJC9FSqf0EaTMCFBrnw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C857AF80520; Mon,  5 Jun 2023 14:22:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85A82F8016C;
	Mon,  5 Jun 2023 14:22:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0079F80254; Mon,  5 Jun 2023 14:22:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B85AF80130
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 14:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B85AF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bKwK3Guo
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 504A060BB5;
	Mon,  5 Jun 2023 12:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BA0C433D2;
	Mon,  5 Jun 2023 12:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685967766;
	bh=RG/sVuLzHHaXk4V4qOv1AU1NRzho4Tut9DnxdceFTDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bKwK3Guo5usWClTGIX1KsZugxGTOwUCmNYL1JyjPDQbPT3AxIMKbFuWzD+xa06pSg
	 YWuLvRSyT5jAKHQ4Vx/FCTRSfpzBsKcXfBqccNglRXw61HZUJBc68PRwa55qKcnzkM
	 2Abs+TryP3wgPKN6NkWlsxl0oUK81qp1nKZBZpOjgMfiiNyaDUSdVPb5oIdx2qpCCf
	 JOsmAYK6dew557oVpjnn7UE/meNolRroAenk7cXZapT8Jia51MpxCtb80yCqSWBHzU
	 wYeTSE5ZRSWZ62yWvlIyyJgK+aFPAX0bD3vbo6vK625Y331nv7emEwESR5fV1Gy9Ud
	 cNBOp06XFo/dQ==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, WTLI@nuvoton.com, SJLIN0@nuvoton.com,
 ctlin0.linux@gmail.com
In-Reply-To: <20230602040924.188913-1-CTLIN0@nuvoton.com>
References: <20230602040924.188913-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH 0/3] Add NAU8825C support
Message-Id: <168596776485.22528.4449942736234980502.b4-ty@kernel.org>
Date: Mon, 05 Jun 2023 13:22:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: DLW3VPESEVFXZFISJQOXIE3WDBLUUDGC
X-Message-ID-Hash: DLW3VPESEVFXZFISJQOXIE3WDBLUUDGC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DLW3VPESEVFXZFISJQOXIE3WDBLUUDGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Jun 2023 12:09:21 +0800, David Lin wrote:
> This series adds nau8825c support. The driver can be used on
> NAU8825B and NAU8825C.
> 
> David Lin (3):
>   ASoC: nau8825: Add registers patch for NAU8825C
>   ASoC: nau8825: Update the calculation of FLL for NAU8825C
>   ASoC: nau8825: Update output control for NAU8825C
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: nau8825: Add registers patch for NAU8825C
      commit: b81a2cc9a2f2314dad78ca14f12d2fbf8e071c3e
[2/3] ASoC: nau8825: Update the calculation of FLL for NAU8825C
      commit: 6d64c33f0f0018bd26836680175b4ee05f3cf54c
[3/3] ASoC: nau8825: Update output control for NAU8825C
      commit: 955b503b6317859632c7ea214babfa22305d1de4

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

