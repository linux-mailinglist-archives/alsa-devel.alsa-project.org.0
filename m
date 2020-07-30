Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99055233B64
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 00:31:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E931F1677;
	Fri, 31 Jul 2020 00:30:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E931F1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596148262;
	bh=hanNiH5TZaQQDzljGBMxyRT5Fb9dhVIQP7cLm7Gn7EU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jLseEZeJylx7QskjKvxeXoS2/9WZM8yPmEgqwM8IziGcYnor1tZu0Y8/e1cKlo4Z3
	 aXnY8WUiyfx0Dkglw7QtJ05T/HyRBk0+8biQlu1VhAok+v2HdjoLvVhQ5B8v5zOzj5
	 q2zJwC7AL8PZChv3DkmILsUM1qnlj9b1TFaVwFug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CEB2F8028D;
	Fri, 31 Jul 2020 00:28:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23062F802BD; Fri, 31 Jul 2020 00:28:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFF73F80292
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 00:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFF73F80292
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RnZjZySU"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 83DED20838;
 Thu, 30 Jul 2020 22:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596148080;
 bh=hanNiH5TZaQQDzljGBMxyRT5Fb9dhVIQP7cLm7Gn7EU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=RnZjZySUVVIjDJv5WePEKMOmOPA2H4FKz7pFT/+4TTAyS3LFKfJ4Upp4oKvgG4rjZ
 Gl6JqvRW0fgW9V9HCQIqPN4U9osx66aln762v9IXGikslPyFF/N7HhhtNa6OjD68Ja
 QuMhOk5+0hgX8wD9WdaOA8SPCax8Ql5cvmgBkI8c=
Date: Thu, 30 Jul 2020 23:27:39 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 Dan Murphy <dmurphy@ti.com>
In-Reply-To: <20200730142419.28205-1-dmurphy@ti.com>
References: <20200730142419.28205-1-dmurphy@ti.com>
Subject: Re: [PATCH 1/2] ASoC: tlv320adcx140: Fix GPO register start address
Message-Id: <159614804535.1473.15036781071494882878.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Thu, 30 Jul 2020 09:24:18 -0500, Dan Murphy wrote:
> The header was updated to align with the data sheet to start the GPO_CFG
> at GPO_CFG0.  The code was not updated to the change and therefore the
> GPO_CFG0 register was not written to.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tlv320adcx140: Fix GPO register start address
      commit: 806a8afedef82c5f156b1c9b1de1205f9abfd21e
[2/2] ASoC: tlv320adcx140: Move device reset to before programming
      commit: 982f4a4134893cd48c466e7a56422d7c65837d10

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
