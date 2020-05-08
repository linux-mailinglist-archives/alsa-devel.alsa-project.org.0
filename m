Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C885D1CB5AE
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 19:17:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71A72829;
	Fri,  8 May 2020 19:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71A72829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588958260;
	bh=Mi3mkL21mFkTxbfu4inxijc64euefMaBjgzvJAZkVr8=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sTkZf2gRFjAETh5g4wwOdSm09QpiBLg+hXqq4FnkjqVPgL4/i1rwu1a3rz1rm5Gtc
	 2vUM13SwpXEVo9vJsmusN1GD98C1MiFjezxiIrlaMfzFeAWhSTPlrMWKBSYb3LgS87
	 DYhGNRCXvNlWtxa84LGfss3BvIbDLC2DQtn60quk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 722B7F802A1;
	Fri,  8 May 2020 19:14:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD074F802BC; Fri,  8 May 2020 19:14:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3E96F802A1
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 19:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3E96F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0kTPBDsV"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C197C206D3;
 Fri,  8 May 2020 17:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588958040;
 bh=Mi3mkL21mFkTxbfu4inxijc64euefMaBjgzvJAZkVr8=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=0kTPBDsV1m5zI5N7T6k4brBReXBdIzEmE0/ap0WDTIDdPHIdwKH2CuMPror9co+N+
 kR57GABl8RgrwiqR1mSCUb1pzwFyqdaiucXMqBhIoeCM6XDgzF6J1ScpEgHbDtzbzX
 zNbnMqGvsGThKWJA9++WOEDFQeeEpy0hwA9EYy24=
Date: Fri, 08 May 2020 18:13:57 +0100
From: Mark Brown <broonie@kernel.org>
To: plai@codeaurora.org, Tang Bin <tangbin@cmss.chinamobile.com>,
 perex@perex.cz, bgoswami@codeaurora.org
In-Reply-To: <20200504072820.5328-1-tangbin@cmss.chinamobile.com>
References: <20200504072820.5328-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: qcom: Use devm_platform_ioremap_resource_byname()
 to simplify code
Message-Id: <158895800278.30774.4078741389607548443.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
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

On Mon, 4 May 2020 15:28:20 +0800, Tang Bin wrote:
> Use devm_platform_ioremap_resource_byname() instead of
> platform_get_resource_byname() + devm_ioremap_resource().
> 
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  sound/soc/qcom/lpass-cpu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> [...]

Applied to

   local tree regulator/for-5.7

Thanks!

[1/1] ASoC: qcom: Use devm_platform_ioremap_resource_byname() to simplify code
      (no commit info)

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
