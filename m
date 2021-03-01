Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A49732953D
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:37:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4EF0165D;
	Tue,  2 Mar 2021 00:36:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4EF0165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614641862;
	bh=PrNvTgS8InZU7KzAmtxYmoKDk7AfFQJiiIAJT795I3I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G5/b4JXn92vNbSpz4vXRx2AbHpYSoLwW+T4qNIs2HuKOz15Q5n/g2GMIZ9QqcaS9b
	 fSQ+KvunlOSKBJEDtdVASmlOsepdGzKNM9aFPpF6PIcVQoFuPHUxgf8VXjw63Ud/u2
	 7+mmYPKNbzdkPE18jJ4Nu0nF2qcew6agsp6jT39c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F4E2F802DF;
	Tue,  2 Mar 2021 00:35:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6CCEF800E0; Tue,  2 Mar 2021 00:35:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AF01F800E0
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:35:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AF01F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vKr866UP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2390260295;
 Mon,  1 Mar 2021 23:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641752;
 bh=PrNvTgS8InZU7KzAmtxYmoKDk7AfFQJiiIAJT795I3I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=vKr866UPpHt6cWjDRcwEtfIQZ+qbV6Lq/qylC8kOZ1z/nrZZiKYfmeKeVxuLugtyb
 Kh8Zy5qlquTuxWLHdAApGGolDyHZ8S9VVDIDqT/3wHjJmn96K4y4prp8NM42etxXNG
 qvNHBgT2lwrlA35gclbgbJkGeuFrUpFzwUFZ+4+AsKzBHTOgVw/CR73vApOOLeeIdG
 DG+5NXK5kKMzo/K47BHrRbyttKKaBfo3jLPFzGOWmiewUq8G+Xbn5ENgWemSn/JC1V
 UbNnSvzZw4ychOCmOi3x488cLcDn/+j9f1qBpjeX4aQMlvgrUYko5kHT6Fn9ALeijI
 lnwNc4G1U7Ctw==
From: Mark Brown <broonie@kernel.org>
To: Benjamin Rood <benjaminjrood@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20210219183308.GA2117@ubuntu-dev>
References: <20210219183308.GA2117@ubuntu-dev>
Subject: Re: [PATCH] ASoC: sgtl5000: set DAP_AVC_CTRL register to correct
 default value on probe
Message-Id: <161464168098.31144.10427745936831814607.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, dmacdonald@curbellmedical.com
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

On Fri, 19 Feb 2021 13:33:08 -0500, Benjamin Rood wrote:
> According to the SGTL5000 datasheet [1], the DAP_AVC_CTRL register has
> the following bit field definitions:
> 
> | BITS  | FIELD       | RW | RESET | DEFINITION                        |
> | 15    | RSVD        | RO | 0x0   | Reserved                          |
> | 14    | RSVD        | RW | 0x1   | Reserved                          |
> | 13:12 | MAX_GAIN    | RW | 0x1   | Max Gain of AVC in expander mode  |
> | 11:10 | RSVD        | RO | 0x0   | Reserved                          |
> | 9:8   | LBI_RESP    | RW | 0x1   | Integrator Response               |
> | 7:6   | RSVD        | RO | 0x0   | Reserved                          |
> | 5     | HARD_LMT_EN | RW | 0x0   | Enable hard limiter mode          |
> | 4:1   | RSVD        | RO | 0x0   | Reserved                          |
> | 0     | EN          | RW | 0x0   | Enable/Disable AVC                |
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sgtl5000: set DAP_AVC_CTRL register to correct default value on probe
      commit: d74fcdc51afd431ca9d956e032e14d12f0ee4153

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
