Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 834671CB590
	for <lists+alsa-devel@lfdr.de>; Fri,  8 May 2020 19:15:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0751B826;
	Fri,  8 May 2020 19:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0751B826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588958121;
	bh=nNOMj7fWr0hfCONmtS8yznlSceUy4xHRuJjwRqMvih4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=breRBzipwYxGJ2VylB1vFL6XIL1wdbvcSbcHANl+DB2dkzn9KdEHPoNp+2Gvs48kT
	 dPJtJd9ctqO8yXBY+7tqT9B5ugy3O+14uInQO2BkrJvR56LiN9VKlVg8SSafRmeDOv
	 N7iis5qjcXwy98I5LR+OB6W6N3/ljfTTMsAtFZCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31ABEF80253;
	Fri,  8 May 2020 19:13:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0D3DF80249; Fri,  8 May 2020 19:13:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96D70F800E7
 for <alsa-devel@alsa-project.org>; Fri,  8 May 2020 19:13:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96D70F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e5cBrVN1"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE40F2083B;
 Fri,  8 May 2020 17:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588958005;
 bh=nNOMj7fWr0hfCONmtS8yznlSceUy4xHRuJjwRqMvih4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=e5cBrVN13xuZb//euliOWKPCF0H5WmI4AQugpfyjFE1KhFo/h15LtCE1ze0SLP/gu
 arPWF2gx9qhUku3cMTASiW8VbJbllAUIl5I2W5biPz8xuifWWU7Ph9eFO2AhEuEjCC
 MupA19cMtAaoUUejxsqBiUBiNs7fuBMb9Xh5P7Xw=
Date: Fri, 08 May 2020 18:13:22 +0100
From: Mark Brown <broonie@kernel.org>
To: plai@codeaurora.org, Tang Bin <tangbin@cmss.chinamobile.com>,
 perex@perex.cz, bgoswami@codeaurora.org
In-Reply-To: <20200504073558.2340-1-tangbin@cmss.chinamobile.com>
References: <20200504073558.2340-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: qcom: Remove the unnecessary cast
Message-Id: <158895800278.30774.3687945839123979957.b4-ty@kernel.org>
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

On Mon, 4 May 2020 15:35:58 +0800, Tang Bin wrote:
> It's not necessary to specify 'void const __force *' casting
> for 'drvdata->lpaif'.
> 
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  sound/soc/qcom/lpass-cpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> [...]

Applied to

   local tree regulator/for-5.7

Thanks!

[1/1] ASoC: qcom: Remove the unnecessary cast
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
