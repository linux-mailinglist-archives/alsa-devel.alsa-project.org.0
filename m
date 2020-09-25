Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED52C279277
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 22:44:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B02A1926;
	Fri, 25 Sep 2020 22:44:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B02A1926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601066694;
	bh=HonZv4hNRo+3wBNx9Gmw1MHWUnZgz2J0kg7+tpl7x6U=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/rCXSERQmih4zwaYWCNClFOHsHrDimaA/fveAIscfKbpSuqYTARB4fzb7dwQ4Jq6
	 JZ1/EB51SotFujA5GYVutyZM1kwLX3qY4RN4m4H0g6iTNzAuWjgWEJH5Bd7GnI8/od
	 q8iUizFp9CnNETQj5860eKKD1Bu7bAX+PSqmJogE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E99C4F802A2;
	Fri, 25 Sep 2020 22:42:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4865DF80254; Fri, 25 Sep 2020 22:42:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7311BF801EC
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 22:42:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7311BF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UKbEk/8r"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E8FC02086A;
 Fri, 25 Sep 2020 20:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601066541;
 bh=HonZv4hNRo+3wBNx9Gmw1MHWUnZgz2J0kg7+tpl7x6U=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=UKbEk/8rJ74U5rMYLVMWNTSrXYqlhZJucwj0Rl8k1vQ80+sTQcQsRb9A/G7G2Bra6
 Jy78NrSKv/cxswUeV5t28NOeYdZM9WX5AZjvtQm59h7KCnk7r+ibkQZUMJq1j5Yte5
 Yy33ex/GgewHTuOsCdEQ/Aw6hMI0uolqRp+duG7U=
Date: Fri, 25 Sep 2020 21:41:26 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20200925105908.20640-1-rf@opensource.cirrus.com>
References: <20200925105908.20640-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 1/3] ASoC: cs4234: Add dtschema binding document
Message-Id: <160106647647.2866.786430937655896288.b4-ty@kernel.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
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

On Fri, 25 Sep 2020 11:59:06 +0100, Richard Fitzgerald wrote:
> Document the bindings for the CS4234 ASoC codec driver.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: Update Cirrus Logic Codecs maintainers
      commit: 6bf28e8a05fda0547658fd51d0acc83dcac6c703

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
