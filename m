Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A868E53FC6A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:53:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49180169A;
	Tue,  7 Jun 2022 12:52:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49180169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599228;
	bh=yC8T59/BRz/X+JQAGI6Qd3OPd0knEKaMRtnGwawWGZ0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQSgYVRYveI9Cl8GBIJsI1X4PDoR4YMDdLE22Jq/WyWSakLgLdja9NF//1U9gybWU
	 5Wu/cPDxNYsKQT3exIrZKWc8E63sU4FMmSJDdk9QZvf6b1ogY4vgFy9AIrsne8d8sp
	 4LQu8Yo11stkp4S2Hb3Z+TS81PTAgSXflpfNP8Qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D883F805F7;
	Tue,  7 Jun 2022 12:46:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DF57F805F6; Tue,  7 Jun 2022 12:46:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B490CF805ED
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:46:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B490CF805ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZR9M1HA5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7435361532;
 Tue,  7 Jun 2022 10:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27D4CC34114;
 Tue,  7 Jun 2022 10:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598778;
 bh=yC8T59/BRz/X+JQAGI6Qd3OPd0knEKaMRtnGwawWGZ0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZR9M1HA576G0+38VjdH59zkBtS7IVBu0+sGDgE+T0hGBANC9CdwjgIzCtFCWFpqqS
 i7UVNw+QSu8iIaL3zH8F2/V6QGgQLB8hqJbw2i+3dF+pARUuMd+MWTXj7LMivPV0lV
 T0iWWl0GBhI8hicugm5FwMQQK5HwYyjhJH7txhg2fh0OoVHSXEB7zSCvOUnXTJsCcq
 qvaiNO9iNuW1/FUXE+r7F6HrsHSNGZEGmbUq9UeItxUMRiwR5GGyhDdtiP2ENhat+H
 Ohx+86yp++tUCljsC25Pcnt0HuQIr5UW5hpPOwCKD74MRQuZ4WovsgRwD0hj7PzK19
 08NimK5PxNlAw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, shengjiu.wang@nxp.com, lgirdwood@gmail.com,
 shengjiu.wang@gmail.com, perex@perex.cz, alsa-devel@alsa-project.org
In-Reply-To: <1653966123-28217-1-git-send-email-shengjiu.wang@nxp.com>
References: <1653966123-28217-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Add support for i.MX8MN
Message-Id: <165459877588.301808.14404334130275114401.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Tue, 31 May 2022 11:02:03 +0800, Shengjiu Wang wrote:
> The SAI module on i.MX8MN is almost same as i.MX8MP,
> So reuse same soc data as i.MX8MP.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Add support for i.MX8MN
      commit: 9688073ee98cb2894d5434fe91dd256383727089

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
