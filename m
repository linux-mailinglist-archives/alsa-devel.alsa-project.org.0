Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA44B4C78A3
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:18:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49D5C18C7;
	Mon, 28 Feb 2022 20:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49D5C18C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646075932;
	bh=4Jlglm5fNT18rQiN9KM7ADKbTgsO3FW5m1/p2ucm+XI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FogoSqoy8zHr0rk33NJi0qzZHQLDNxXxGdSZGX1phAgWbUU5YaLKuaKQrbZC/hyTE
	 RLabVcNGKxccCVV3ntcpL3ydW8GiFKfFBPO0+gKp4vzSg3xhfomzYd6pNvbGOLT0ND
	 J0g/VcOoYWSyh5Cm5G7hMOKdOxRoAb3TVScwW3Xk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29AADF8053A;
	Mon, 28 Feb 2022 20:15:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E319F80529; Mon, 28 Feb 2022 20:15:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03BFCF80515
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03BFCF80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="htDZB7o8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA52061580;
 Mon, 28 Feb 2022 19:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAE3C340F4;
 Mon, 28 Feb 2022 19:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075724;
 bh=4Jlglm5fNT18rQiN9KM7ADKbTgsO3FW5m1/p2ucm+XI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=htDZB7o8DYafXlwWCVXL0oR74jh/5iGxTLcPCmH+6c3Xro60diTdwhNxGEOm+JCib
 N4uQd4V2eKeIkEpfQhtPxsPxvY+Yu2wuE4vWJBek2yQkJvDt46psUQhg1nsM4S3L1e
 8SpjwuIZ2C8iAdXapFwxjIX5BLNDtpxDsZRPyLNLyamlQ077m8IfTZuddHbZmdwCVG
 2/RoA8awxl2g5G4xikrzYieIEDFza7zNQApaz2Ph+JQLaYf4L8c0SPdcS/c36hTe+v
 rb/0UWADwa8pVuLN0tMRGAVlj5qB9Chhv0v8kqI9hzhEeJtsgLeElLy6x3oTqeTbgK
 H1skXQvR9W4Uw==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220223001636.1321505-1-broonie@kernel.org>
References: <20220223001636.1321505-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ml26124: Use modern ASoC DAI format terminology
Message-Id: <164607572336.3538791.10496050392491628056.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:23 +0000
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

On Wed, 23 Feb 2022 00:16:36 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the ml26124 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ml26124: Use modern ASoC DAI format terminology
      commit: ca7176f695cfa7ddb8498b5114f47e7a443f97bb

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
