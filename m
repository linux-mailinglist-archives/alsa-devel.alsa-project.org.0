Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC20411854
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 17:34:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 919BC16BB;
	Mon, 20 Sep 2021 17:34:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 919BC16BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632152097;
	bh=f6tcROz9EjoLl2mHaX7AcHG7HmHZI2rJ93ZH3eRTIjY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vCz1UhgD2ERU4ojguOuxh4LLnxHBT2vYdvibAtbRHwWYYfDHjmRVQdAEJP4jvWEts
	 vvZceTUvEosgS4T/bDVTNTNqVmxgAmKGAXWLESh5yag0aJzosXRpP31VKk2ZalV4Jf
	 gURlyQAQq/syNCUa2z4qJR9AoMOFhyjeo4j/MU9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85E5AF80507;
	Mon, 20 Sep 2021 17:32:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3926BF80246; Mon, 20 Sep 2021 17:32:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABBE4F804BB
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 17:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABBE4F804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cEwJIBtQ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9794B610FB;
 Mon, 20 Sep 2021 15:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632151914;
 bh=f6tcROz9EjoLl2mHaX7AcHG7HmHZI2rJ93ZH3eRTIjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cEwJIBtQvFgThdAWISL/tsD43Ik8cgNlVGUSLdokrssFaHehJcZRdlmJgGTdSkrNP
 cxEVoYebYmJAkpwn4Q+Rzfi0FNrXMtHpy1gXuY4S/GDp7/Ng40sao5NNpfbtkUPEJy
 kBvbr0ANdfaO7+ZLISatlXoKydAUaEDT4mxeaYt8VWtpJmmzKsL35k3Ap65gL3QwKT
 7ysggilLWcKtnKufQvsK2LZRmf3CwdPBmET2AVtV6QciB59DCq1lC1RF6AFjMJxcvV
 eEfej8rxtai5NBfiajSIaUF9Y+9jyBzS45gWJVyud+8PnICYrNHKs/y3VYdrTlbSxJ
 +GkXc6y1xfZJg==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: ab8500: Update to modern clocking terminology
Date: Mon, 20 Sep 2021 16:30:50 +0100
Message-Id: <163215150720.38322.5479784152445262998.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210916141335.43818-1-broonie@kernel.org>
References: <20210916141335.43818-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>
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

On Thu, 16 Sep 2021 15:13:35 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the ab8500 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ab8500: Update to modern clocking terminology
      commit: ef92ed2623ead917e4f10465451aa12cd7977241

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
