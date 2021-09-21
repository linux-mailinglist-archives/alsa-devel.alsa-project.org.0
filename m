Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB36413635
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 17:28:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D2360825;
	Tue, 21 Sep 2021 17:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D2360825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632238108;
	bh=vhLzjTgLnOT8QnJf7y/WSgDwF6yaNzF8AzzcaXhlpgM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tywiiNhdA5omQfhNTmhkpezsrLuYaD2lypQlxUZmFWIblwPFdrIosuhHmVKP7e5p0
	 Vyr58yFc3XkM7/RpP+tz4Qg/QM0hdaYUhrplg3fVc0V90Bl1ZhpR+qEh9Gh1ZGT74M
	 Jhz+g0v37+s6mXvzckWCiAmErvpJz6IzUUW3l+w8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84AC4F804E7;
	Tue, 21 Sep 2021 17:26:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59EAEF804E2; Tue, 21 Sep 2021 17:26:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85DF4F80124
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 17:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85DF4F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MohmUdb3"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6D1961215;
 Tue, 21 Sep 2021 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632237969;
 bh=vhLzjTgLnOT8QnJf7y/WSgDwF6yaNzF8AzzcaXhlpgM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MohmUdb3bmGffzzxtnXNhA6agKbH70gjj8JdakpsgSojS9mXK6M55oQLxrvxK/6AK
 oZvoD54oC8f6oMZN/yA19bqE65wOeCobAYp6MLU1BSH2QSenSpFThMI0co3hza5S8K
 /qQnn3yt7CWD5D7Hwfr3FcJN7iUfpd6v29REudwxaZOdkOB9hxgBuztUm8Pa8qrXYS
 XvuNU/NtivjHppwO6nV9FB23KXQUCdZ1nyVZxfEUsYWUBPuUFQT7oPy+oCW90EvdqG
 4ld1bbfG76aZm4u5FdXXTAC8WMz3KXsMSl3yHh6puxgJr3OHQeMC+VCy3mK7VsKbKb
 j2cQ8whYH6Ynw==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, Xiubo.Lee@gmail.com, tiwai@suse.com, perex@perex.cz,
 alsa-devel@alsa-project.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add support for i.MX8ULP
Date: Tue, 21 Sep 2021 16:25:12 +0100
Message-Id: <163223651318.32236.12273348857072894060.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1631238562-27081-1-git-send-email-shengjiu.wang@nxp.com>
References: <1631238562-27081-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
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

On Fri, 10 Sep 2021 09:49:22 +0800, Shengjiu Wang wrote:
> On i.MX8ULP the spdif works with EDMA, so add compatible
> string and soc specific data for i.MX8ULP.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Add support for i.MX8ULP
      commit: a635d66be1642e59af17383a27b2c61409121241

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
