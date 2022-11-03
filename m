Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0B66184D3
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 17:36:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C69B61689;
	Thu,  3 Nov 2022 17:35:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C69B61689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667493407;
	bh=NtaRBSuTx4gEY3TFWYZ6lJZlhJEbnOaOQ4bJzzzyP+Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vpazmTBk5PAjm51pDOOxpBUyYLWKxCnnU1poJw9kFHF0VIDoSYHXdYSNB0T3E6+pq
	 kn6GQMXiY4vr176xMck1EGC3pfPMLjCSYCrLVPPS1P+Wd7RgtjRjjl8/Ud4N9nECYd
	 TQxuPLX4hklmyLY7X/acEXgGthBC0byavlY3YI+Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4FD8F8055C;
	Thu,  3 Nov 2022 17:35:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39FCEF80526; Thu,  3 Nov 2022 17:35:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B697CF8051C
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 17:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B697CF8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ESO1GdyN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 28032B82955;
 Thu,  3 Nov 2022 16:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B6EC433B5;
 Thu,  3 Nov 2022 16:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667493300;
 bh=NtaRBSuTx4gEY3TFWYZ6lJZlhJEbnOaOQ4bJzzzyP+Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ESO1GdyN04Cfhk8H6tukrp5qdl5/qNbXrw2eqb+rP+pswB7OCFb8WTNDmDdyn0nJ/
 UYAVc00ZLSt5teJG4ByiEJzho3HIvxCdFGgQ894Vi3OfsvVTSYRmYcfq0dVXGGPwrg
 bHxOEFW6Rphy2AOtDKQZ2SCZWUHwHehp/Q1zO9upk026dwJm8daWabyOuD+yGjQqK6
 bw5/KVP0O0vQqa328liPezzjhpb/tiuFmu0CTA9DxCZdJbbUqaINMZBwhU7sdy0NiC
 CXP8KFsBK+4bcoaGPKgyEc/6+xFhR2y/5xan+xjTclyDh1hYebgbOlQBELyq/bvnAV
 OebWJ2JkJiE3Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Maarten Zanders <maarten.zanders@mind.be>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20221028191303.166115-1-maarten.zanders@mind.be>
References: <20221028191303.166115-1-maarten.zanders@mind.be>
Subject: Re: [PATCH] ASoC: simple-mux: add read function
Message-Id: <166749329885.480833.18370914734469838368.b4-ty@kernel.org>
Date: Thu, 03 Nov 2022 16:34:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 28 Oct 2022 21:13:01 +0200, Maarten Zanders wrote:
> During initialisation DAPM tries to read the state of the MUX
> being connected, resulting in this error log:
> input-mux: ASoC: error at soc_component_read_no_lock on input-mux: -5
> 
> Provide a read function which allows DAPM to read the state of the
> MUX.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-mux: add read function
      commit: f7d97cb564a2ac5517ee7cc933de729e533d659a

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
