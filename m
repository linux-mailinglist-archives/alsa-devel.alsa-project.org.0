Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2ED4A0489
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 00:49:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 289E01751;
	Sat, 29 Jan 2022 00:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 289E01751
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643413764;
	bh=2FP0kMjTyBWf79RyoN93ttDxKW9dj8rCfxXBwnsnSxU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bTQQojJMbrjdU3JvukHHPw/P67UPgvXJgMsO7UUzcDaMogEQOJaIUt/CQqRK/qDVr
	 xFqn6P5b5BayLsYnekj2B2APC/LLUVrvZJUIVCJjvFOpfnimId9B+Fe2DmMPANVWak
	 1+tFA6plMm1g9SgBLZndlD4qCo/UOFWx2E7k/5LE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E57DF8051A;
	Sat, 29 Jan 2022 00:47:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A7F7F80249; Sat, 29 Jan 2022 00:47:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB944F80425
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 00:46:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB944F80425
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NscSZvsC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 54F6D61F40;
 Fri, 28 Jan 2022 23:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8E9C340E8;
 Fri, 28 Jan 2022 23:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643413611;
 bh=2FP0kMjTyBWf79RyoN93ttDxKW9dj8rCfxXBwnsnSxU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=NscSZvsCHgEhyC3i+5oHr4BXa6mGPoZPrNXcG136VsGt+5KrBLkYqWn7WQwA+Sg/4
 18bXuMWE/3py10P7OE445c64k1LUY1GzrzdiuR4uRtVWU8GBjuse0x+Fi5rgzR0SPr
 TxhrWsAMmoZAP343e8G4d/hikCOPwkC+3u3xs4th/Xcwym7PCxl7xBz+iDZ3ZzOoPT
 TSm6y54fzcEA8E1ks/t0YU/6nXiqFKaqUdSyePRfDdUQCjRTX2Ifb2mV9LNShEPPrk
 PITJyPi0WpkHH+/THNvcAnaB6zQTa9UN5hPTngx0zkZzF8M+c215Abq5IMyPMGbcEP
 HsnSq39sBW5Jw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
In-Reply-To: <20220128192443.3504823-1-broonie@kernel.org>
References: <20220128192443.3504823-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ops: Check for negative values before reading them
Message-Id: <164341361076.694662.932219840656877286.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 23:46:50 +0000
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

On Fri, 28 Jan 2022 19:24:43 +0000, Mark Brown wrote:
> The controls allow inputs to be specified as negative but our manipulating
> them into register fields need to be done on unsigned variables so the
> checks for negative numbers weren't taking effect properly. Do the checks
> for negative values on the variable in the ABI struct rather than on our
> local unsigned copy.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: ops: Check for negative values before reading them
      commit: 1601033da2dd2052e0489137f7788a46a8fcd82f

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
