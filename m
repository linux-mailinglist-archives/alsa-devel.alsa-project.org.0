Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0241B0E66
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 16:30:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9160B16A4;
	Mon, 20 Apr 2020 16:30:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9160B16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587393050;
	bh=dcc8TEqP56glDATskmdRD92f9tPx8qJ1MkwXi6NrCrs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eTOWdHjVUBlCp8/iypaLD1N2G0X75HmF6tsomdW7bBHpSkLSDaOmMhJeDBAL2PV/B
	 FvFgIidlbo1EHnZ3ef5sVNqm7qpUSxk8I3pS0JFguq7q9Y6REPdVjiXW43YeW+554a
	 TEn21ji2KIayH/YAxAL/1IKFoOFXnCqIvyovuqIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FC72F802A1;
	Mon, 20 Apr 2020 16:27:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB548F8028F; Mon, 20 Apr 2020 16:27:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C7FFF8021C
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 16:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C7FFF8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OD/T4g2C"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 869BF20857;
 Mon, 20 Apr 2020 14:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587392858;
 bh=dcc8TEqP56glDATskmdRD92f9tPx8qJ1MkwXi6NrCrs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=OD/T4g2CfIXPiogmjau5DsHG3oZy32csl9YVP2aayvGI917uMuHOBbAwTkpaogeO9
 KitpUbWRJNFfhkUh8HX2hlHY46aa/WTwccDb3iNxetnk43GzM1h+mjqjKN5gayXnq9
 sZWRZaU84sEhapUmifPyayJ1Q7dutahhq1ERRtK4=
Date: Mon, 20 Apr 2020 15:27:35 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Wei Li <liwei391@huawei.com>, rdunlap@infradead.org,
 lgirdwood@gmail.com, geert@linux-m68k.org, perex@perex.cz
In-Reply-To: <20200420202410.47327-1-liwei391@huawei.com>
References: <20200420202410.47327-1-liwei391@huawei.com>
Subject: Re: [PATCH 0/2] ASoC: Fix dependency issues of SND_SOC
Message-Id: <158739283776.7647.4620361063260583314.b4-ty@kernel.org>
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

On Tue, 21 Apr 2020 04:24:08 +0800, Wei Li wrote:
> Fix dependency issues of SND_SOC introduced by commit ea00d95200d02 
> ("ASoC: Use imply for SND_SOC_ALL_CODECS").
> 
> Wei Li (2):
>   ASoC: wm89xx: Fix build errors caused by I2C dependency
>   ASoC: Fix wrong dependency of da7210 and wm8983
> 
> [...]

Applied to

	https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/2] ASoC: wm89xx: Add missing dependency
      commit: 9bff3d3024e51122c0c09634056debcd6c7359ec
[2/2] ASoC: Fix wrong dependency of da7210 and wm8983
      (not applied)

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
