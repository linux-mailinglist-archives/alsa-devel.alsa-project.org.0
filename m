Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D87351D7EE7
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 18:44:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E2B81723;
	Mon, 18 May 2020 18:43:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E2B81723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589820276;
	bh=hUrbPUnkx9sLpumkz9APRFvwFI3/14wZO/czESprIeQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XV/Hlw0XTGJwGIH/p9X8dIhGxEHSkVfCCR5XCJ8B5+98Et5FYn5zONhnved3MURjH
	 KhWm+U6Vcv+0s+wDf8HY9oxzIPL/0aUhE07+x3e/z26KkBcrDfW+NBeTSO0rbt2FPC
	 QcNGmP43XLL86/g08jmkqBAoPpS0xlWMPk5O9OjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A405F80299;
	Mon, 18 May 2020 18:41:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CC49F80292; Mon, 18 May 2020 18:41:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC622F80274
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 18:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC622F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ykTtA9DF"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D26B820758;
 Mon, 18 May 2020 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589820079;
 bh=hUrbPUnkx9sLpumkz9APRFvwFI3/14wZO/czESprIeQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ykTtA9DFhGxlQjRWR3p2FXWxKwUWNAzU86nWeSFtYy8dKfbpHlOmyDpCygPAYQsCB
 Wwjj0sbE4hWc1QTNSV+RXBYlqi7voas2FH+IGofcW/HReUTh1LjhT21YiFKAey3nKu
 nR2AI9SRblXzU5a5hTClctb4L1T6ZBtmMLwJ80gI=
Date: Mon, 18 May 2020 17:41:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>, perex@perex.cz, timur@kernel.org,
 nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com
In-Reply-To: <20200518105951.19200-1-tangbin@cmss.chinamobile.com>
References: <20200518105951.19200-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: Fix indentation to put on one line
 affected code
Message-Id: <158982005877.28736.8093617646435280099.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
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

On Mon, 18 May 2020 18:59:51 +0800, Tang Bin wrote:
> In the function fsl_micfil_startup(), the two lines of dev_err()
> can be shortened to one line.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: fsl_micfil: Fix indentation to put on one line affected code
      commit: 11106cb37ade76719bb3feac9fa6ba68173a38a0

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
