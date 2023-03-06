Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B826AC127
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 14:32:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A0621103;
	Mon,  6 Mar 2023 14:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A0621103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678109575;
	bh=JHC0hb+WAOY9fqstxdj26yXXntSJNh6emfvVp8hEuGo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=g5GVxox6Yjlok4ovUj8O/GSPv9EDr8gS8KGTNxg755vo46SofPJTWo9sGP2hKUaPw
	 loiqp1mxmdOOyeXeukpZ9M6/mltC8n49Y8eEJiLNsuUsRz5trT0s4Uwhid9EB8FOc0
	 sLNKpdkmEQt0tukaTmX4H3ElYEbdMcUmrO8Mt/n8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4426F8042F;
	Mon,  6 Mar 2023 14:32:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C24CF80482; Mon,  6 Mar 2023 14:31:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A2D9F800C9
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 14:31:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A2D9F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=D4YBAEUO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B997360F24;
	Mon,  6 Mar 2023 13:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB130C4339E;
	Mon,  6 Mar 2023 13:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678109509;
	bh=JHC0hb+WAOY9fqstxdj26yXXntSJNh6emfvVp8hEuGo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=D4YBAEUOswQGwANMpLl1pETCzSNx7Ao0XyXYhOD8oGJ4poUBPTQNlY9NI+tD8Rfa4
	 v2tq1GTztJjUtuMysmF3B3Il4m5jJrMQlRaGF4jAIwl8PRnRc4gI+qlCdLBCJ0ecnf
	 YELopH+vQwJpWojdhKHIkVT3hl03AdnipCaHlJK9qcGPcX0MiCrPI2vjNXiLFReAEr
	 JxkrbpQ8YJfOxRKxmJAROGa34Pz1nby1g2F2GV2Uu6DnRpW+8Cx3vvk8uw4ao0L4BC
	 H8fFgbKjK/y+riJuIzRwl04PmsZxb3+F+nFImjhxlRfdp3OW/eU/yAJ1ixjRe5/q80
	 PU20dLstNpHnw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Cernekee <cernekee@chromium.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Crt Mori <cmo@melexis.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kamel Bouhara <kamel.bouhara@bootlin.com>
In-Reply-To: <20230222083300.218523-1-kamel.bouhara@bootlin.com>
References: <20230222083300.218523-1-kamel.bouhara@bootlin.com>
Subject: Re: [PATCH 0/2] Add support for the TAS5733
Message-Id: <167810950662.75807.17494624901046895740.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 13:31:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: SASSYRRM6SR7AOUQRLXKZNOU2MXQCUNG
X-Message-ID-Hash: SASSYRRM6SR7AOUQRLXKZNOU2MXQCUNG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SASSYRRM6SR7AOUQRLXKZNOU2MXQCUNG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Feb 2023 09:32:58 +0100, Kamel Bouhara wrote:
> This small series extends the tas571x driver to support the TAS5733
> audio power amplifier.
> 
> Kamel Bouhara (2):
>   ASoC: tas571x: add tas5733 compatible
>   ASoC: tas571x: add support for TAS5733
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tas571x: add tas5733 compatible
      commit: 95a29d5f626a37dbefd0883f294ec4e22a8a7911
[2/2] ASoC: tas571x: add support for TAS5733
      commit: f5db4d00f73871988beba0277ea29cff73d38445

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

