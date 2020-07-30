Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EB4233B63
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 00:30:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 136BC1689;
	Fri, 31 Jul 2020 00:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 136BC1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596148236;
	bh=Oeyh74HxiGgRjXiOD6SLqRmC7a5ZmDzaNWynafKQomk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kV+N9WBlwwOAANDbOJVmiKTg9iV7My1dIvMgwIX4G0egPAOlysT/VHpB7I/I+tPD2
	 vYzMp//N6G42rHcHDr0WbtGPL4ctx1qpbp/r7te0hyBHUlPCgPJP1GbRVUdsWkKe1C
	 vSzhbbE5+ESzhgG+paIhXjTz7DPFfO2S2UV9i3fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 105B5F80240;
	Fri, 31 Jul 2020 00:27:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA1F3F8021E; Fri, 31 Jul 2020 00:27:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14DD9F80111
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 00:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14DD9F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ccE/9pTa"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB6FD20829;
 Thu, 30 Jul 2020 22:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596148072;
 bh=Oeyh74HxiGgRjXiOD6SLqRmC7a5ZmDzaNWynafKQomk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ccE/9pTaRyjTtAmFUwlMuRSB7ANa3eKAvc7DYlV88u+A7x10Nfzo5tEXoZH6hfuGV
 JvQJ/E27fcZIDVX0HQW0BMi3seBXR2mtpKhdiU3AskCSaHGQD1lzmbwreKbNPuFIKo
 82iSe4NDABQiksP+GPb2voo3/nstn4NaA5L1IC4s=
Date: Thu, 30 Jul 2020 23:27:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
In-Reply-To: <20200728160255.31020-2-Vishnuvardhanrao.Ravulapati@amd.com>
References: <20200728160255.31020-1-Vishnuvardhanrao.Ravulapati@amd.com>
 <20200728160255.31020-2-Vishnuvardhanrao.Ravulapati@amd.com>
Subject: Re: [PATCH v2 1/5] ASoC: amd: Renaming snd-soc-card structure and
 fields
Message-Id: <159614804535.1473.8457456333395054937.b4-ty@kernel.org>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Akshu Agrawal <akshu.agrawal@amd.com>, Alexander.Deucher@amd.com
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

On Tue, 28 Jul 2020 21:32:51 +0530, Ravulapati Vishnu vardhan rao wrote:
> As in future our machine driver supports multiple codecs
> So changing naming convention of snd_soc_card struct and its fields.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: amd: Renaming snd-soc-card structure and fields
      commit: 9c04b5a48fca1facff07f28ba6d87de900238beb
[2/5] ASoC: amd: Passing card structure based on codec
      commit: 0fe4b561f7df6c338c6f4c95ba949fc5abe5c4e5
[3/5] ASoC: amd: Adding support for ALC1015 codec in machine driver
      commit: 414e3cab7d3e60395d23f76acdf95d5d81425b48
[4/5] ASoC: amd: Adding DAI LINK for rt1015 codec
      commit: f7b2651b96717f54d666a61aa3fa0b3d4e79d81a
[5/5] ASoC: amd: Added hw_params support for ALC1015
      commit: c3936ba9e0e4f472221320c33e20be3a8b795616

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
