Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D8D8A2301
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Apr 2024 02:48:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 964F62C03;
	Fri, 12 Apr 2024 02:48:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 964F62C03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712882937;
	bh=tkAwC8xYx2SEMYsDRYYQ97QABsmy3xXHEjMopBbT+c8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SBJdwLLCMUhsfvsZau7d+nPUiP0RkKr0DV1BURTGQO4iZbK+oDQUmemBUQsL1iZ3d
	 kWKe7xsHQEK2fTavtf3DDwWMOaCCGNeonjt7dJQ9155nSVOyskl/SEzHfXmn7A+vR5
	 IjqCSPUlg8LBywSfNVK2CO/2V+8Zo1/RJ41Vkut4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EA9CF805BF; Fri, 12 Apr 2024 02:48:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC6A8F80238;
	Fri, 12 Apr 2024 02:48:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34FE2F8028B; Fri, 12 Apr 2024 02:42:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 638DCF80236
	for <alsa-devel@alsa-project.org>; Fri, 12 Apr 2024 02:41:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 638DCF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bNdyU1Ch
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF66062190;
	Fri, 12 Apr 2024 00:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1D8C072AA;
	Fri, 12 Apr 2024 00:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712882473;
	bh=tkAwC8xYx2SEMYsDRYYQ97QABsmy3xXHEjMopBbT+c8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bNdyU1ChaQuXySi1UCUMOwqufaYdRlPh3Y+g2ASclM16FitpF0x3TWGfDh1b4j6Fy
	 gHaUvNHwpzh7tpoh5MlJIvdxgQ7QB9bdGEqtc2e4LlRSLbBsFxcu32AKqxs8QQ4nYJ
	 G0zWoM7HT3nh/8KFZbrkFzrefPRMKAGJznuW1aCAgpRYIk5gqFzdU6+oC7veRazQh4
	 sfUlK6sugnZjU8YhIgRPzJ9bzGlzP4h8B6GnwwWyDjk/y4kyYjSwNOa5urJ71yHKae
	 B4mHUlDFoh0s5DiLY/Ab29znpyGzR3XxqRZFzFGrjlFiK3P/JgyVpGTkibqXxqD6BU
	 SCLdwdeaZhlsQ==
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <20240411142648.650921-1-sbinding@opensource.cirrus.com>
References: <20240411142648.650921-1-sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1] ASoC: cs35l41: Update DSP1RX5/6 Sources for DSP
 config
Message-Id: <171288247200.110635.15927713546125669144.b4-ty@kernel.org>
Date: Fri, 12 Apr 2024 01:41:12 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: RL7WAWPDE2IJLKYSTNHQKUKG3ECSIB5I
X-Message-ID-Hash: RL7WAWPDE2IJLKYSTNHQKUKG3ECSIB5I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RL7WAWPDE2IJLKYSTNHQKUKG3ECSIB5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 Apr 2024 15:26:48 +0100, Stefan Binding wrote:
> Currently, all ASoC systems are set to use VPMON for DSP1RX5_SRC,
> however, this is required only for internal boost systems.
> External boost systems require VBSTMON instead of VPMON to be the
> input to DSP1RX5_SRC.
> Shared Boost Active acts like Internal boost (requires VPMON).
> Shared Boost Passive acts like External boost (requires VBSTMON)
> All systems require DSP1RX6_SRC to be set to VBSTMON.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l41: Update DSP1RX5/6 Sources for DSP config
      commit: eefb831d2e4dd58d58002a2ef75ff989e073230d

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

