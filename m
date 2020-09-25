Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 737CB279274
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 22:44:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 422AF1919;
	Fri, 25 Sep 2020 22:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 422AF1919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601066685;
	bh=eYynM7RcUl9T2R03Gzczex/EjCscDdA1EQyumjaJdJo=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s6eZQQTIlaYw4n+/SLr46H4NMI8Ipg1pS8zoBhwcbIrwb6H3fnXQcRNyRAr0chpCB
	 EH9SENYeYSYl9P9HcVq8HC5aeYjqYpDIGPPyWipdCq6AL4Ka01nOmnZipYVXsFrVYw
	 SyL2xvbPYT2CqyNCLP8rFqZnKYnxVjG84wZG/iTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2E3BF8028F;
	Fri, 25 Sep 2020 22:42:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE9A2F80162; Fri, 25 Sep 2020 22:42:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14F35F80162
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 22:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14F35F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fcdk23Uc"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BBAE92086A;
 Fri, 25 Sep 2020 20:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601066536;
 bh=eYynM7RcUl9T2R03Gzczex/EjCscDdA1EQyumjaJdJo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=fcdk23UcLZoGUC1rmqRbEtIxyUX0aqP4NHgeBHEeZ0iA4Jpf9zjgmQvq9UpD3WEQU
 wFdTxl899cN1bMKvxrGZMHv5KkbS02bl0TpCjjO3YVmUfn9mmC6Sy/fl4oOPzKpTyY
 Zg/aRtYF79RmHZKYFbtkO5lKJwPsfUwWXj7B5Rc8=
Date: Fri, 25 Sep 2020 21:41:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20200924151518.15841-1-daniel.baluta@oss.nxp.com>
References: <20200924151518.15841-1-daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH 0/2] Enable runtime PM for SOF device
Message-Id: <160106647646.2866.8438524820840222353.b4-ty@kernel.org>
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

On Thu, 24 Sep 2020 18:15:16 +0300, Daniel Baluta wrote:
> This enables runtime PM for SOF device. Next patchseries will
> provide PM suspend/resume handlers for i.MX8 specific devices.
> 
> Daniel Baluta (2):
>   ASoC: SOF: Activate runtime PM with SOF OF device
>   ASoC: SOF: Add .prepare/.complete callbacks
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Activate runtime PM with SOF OF device
      commit: 4fefc39894d8975d58b02b4b5f635d20891778ca
[2/2] ASoC: SOF: Add .prepare/.complete callbacks
      commit: dd759805d6f78262cb9aa63ef37e3bc263ef1978

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
