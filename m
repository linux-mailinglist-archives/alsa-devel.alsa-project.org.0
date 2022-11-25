Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8802638C2A
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Nov 2022 15:29:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72941171E;
	Fri, 25 Nov 2022 15:28:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72941171E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669386567;
	bh=K/FHHBqLCTxLtwJeVPx3oxns6XW1ItKPgYSrNh6CKKg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uhy4SXT3YFp1yZGCYnZwLTzIU3hozMBBvviHF26lj8MKGiHLRl33ni8Sulr5UNDey
	 xIBVEGriM0U2OlDSnwue4AZkMH10yTiYZi5ghoNPATFMTwKwQe3gPta3XT2ufVou7x
	 96j68e85xhwXpdJ+NLmDhtjRNKYwNHpF45MfmMN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 428E7F80557;
	Fri, 25 Nov 2022 15:27:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52171F80567; Fri, 25 Nov 2022 15:27:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0ACEF80557
 for <alsa-devel@alsa-project.org>; Fri, 25 Nov 2022 15:26:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0ACEF80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZcJf0Tp4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6A8BBB82AFF;
 Fri, 25 Nov 2022 14:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706C6C433D6;
 Fri, 25 Nov 2022 14:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669386418;
 bh=K/FHHBqLCTxLtwJeVPx3oxns6XW1ItKPgYSrNh6CKKg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZcJf0Tp4FmMNPsU2927a9KiNrLinZ3d3kXIQQHr80d/yr3bcTioY1pc7XRT0eWkxz
 Ldx26m3MdwKpkIdgs3wJVgn5DkiM/2ipmGx8ifLPoYoLomgkd6j4ulW7896/3my5+F
 o+gzzIHRFh2DlCrozMe1Pe0w33SxacKEskD6hzmzB2lHmg42MSjiaDdiwOW7NYLti4
 99chJ7yGQgO8QbgTIjrFYFfhWIsQljSeEkWrwyVSjptaS/oPP2sp8C3/jGYZ5ZM0D+
 4QxW3RrSQbGRC/5ObTbE0qAKSC9CeRxN2UUpfJ0EIZGDo/knU+xfN6bvvaW7/CWNcf
 i1IYEhUCfUijg==
From: Mark Brown <broonie@kernel.org>
To: David Lin <CTLIN0@nuvoton.com>
In-Reply-To: <20221124055658.53828-1-CTLIN0@nuvoton.com>
References: <20221124055658.53828-1-CTLIN0@nuvoton.com>
Subject: Re: [PATCH 1/2] ASoC: nau8315: add new acpi id and compatible id
Message-Id: <166938641618.506633.18411481069532293849.b4-ty@kernel.org>
Date: Fri, 25 Nov 2022 14:26:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, ctlin0.linux@gmail.com, WTLI@nuvoton.com,
 SJLIN0@nuvoton.com, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com
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

On Thu, 24 Nov 2022 13:56:57 +0800, David Lin wrote:
> Add new acpi id and compatible id for nau8315.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: nau8315: add new acpi id and compatible id
      commit: 9ffe8bbb8fcf93d1bf0a948635de1ced9247a811
[2/2] ASoC: dt-bindings: add compatible string for NAU8318
      commit: b992f35568cb5768c5944fc3b4f02df337dc1ece

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
