Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F9C4C789B
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:17:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A43618AC;
	Mon, 28 Feb 2022 20:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A43618AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646075823;
	bh=WPs+/MpfLpUyXUzLDI/5P1RsgYS+lhbhH/wp7H9PSR8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WixqqAzLQ/BXF/Q1nt22XZ5xQZyknddT189EAMwkJJ4Rex4QSg3PcXddrjdp+45Dc
	 G/zys6U3g5Eb+OpN1+RCXB4HPKUsAEIgJNhVas7rtNtchXKwdQOoUv7WKjVluMHr5Y
	 gVBXK/6nd8brc0R8bU9Bgm3tclOwZW6LvDlgRLoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23E98F80511;
	Mon, 28 Feb 2022 20:15:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B22A2F8015B; Mon, 28 Feb 2022 20:15:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EACF8F8013C
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EACF8F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NlgRe8zi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4BCE6104B;
 Mon, 28 Feb 2022 19:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CBAC340F2;
 Mon, 28 Feb 2022 19:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075715;
 bh=WPs+/MpfLpUyXUzLDI/5P1RsgYS+lhbhH/wp7H9PSR8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NlgRe8zilehP/UkhbqIZTI929ni/wnz0RSmg8jqPv83nacDPFKQ886wW1INi0A2Me
 bukozPhsEU0x4WrKv7e+3di9tbRuivIuG617H5bxVosK64buO0YKrLjtwOzG8Y+EvH
 4LstGvv5C5hq092zETVfXJQC/yLbBrMnD7S2MCGcEvT7pfdjkBf9NcvwZojorxQVkA
 dA0WYstejNK3TTmagfSXbJ2kDUgTN4dZ2IesLN3v8yGH4wm4sc1PqD9GErf+rL6QnD
 GDFOkD8T+DBnHPZ2wge4Q4vhrpJbxTP0kcrolsj0CB1BcBV/dg9vPx1aj61Ru0QGBs
 D+Dy5bNOTo9qA==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220222223453.3190333-1-broonie@kernel.org>
References: <20220222223453.3190333-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: es8316: Use modern ASoC DAI format terminology
Message-Id: <164607571420.3538791.11863341971504990159.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Tue, 22 Feb 2022 22:34:53 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the es8316 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: es8316: Use modern ASoC DAI format terminology
      commit: b6be2012b0393003d5cb9d23504c8e17c995437b

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
