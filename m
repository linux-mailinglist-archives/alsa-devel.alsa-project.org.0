Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C741BE3D9
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 18:29:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 192341694;
	Wed, 29 Apr 2020 18:28:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 192341694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588177743;
	bh=ZxG00pU6mh+bsa3od1jPgbNbeOCwD7dTA7vu7VZxcds=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IOjHUlBdYTS4y3tiWMKRtc7fWTvwB16+gygLZ4QFqQKxbAPZ2paEQSasg7iKcmGN2
	 1mK90Ce8L1VBrvP0Icna+4R3ajC7edPYZyLR97Ke71Yad7IDLYD+OuVPjFyxHOVzSP
	 vqn3cQkGFgy8sykvAWrtagb6lmICiK3KthXVI8sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66275F8028F;
	Wed, 29 Apr 2020 18:26:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2B78F8028C; Wed, 29 Apr 2020 18:26:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BB3BF80232
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 18:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BB3BF80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BIiFzqNu"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 699DD208E0;
 Wed, 29 Apr 2020 16:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588177581;
 bh=ZxG00pU6mh+bsa3od1jPgbNbeOCwD7dTA7vu7VZxcds=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=BIiFzqNu5iPwGOBNXDpDBcob5SyW973d/kLZVuKjlbT/FfPFk7AhvVXaBtHd+IN8z
 zz7sXxBd9dC76ogdj2LICsR6t/mZV0bwK2HV0fANXCvrZndi8LhmxVlsGP96t1V/7Y
 M078OF279W+7Cls7Q7UdZiNdmngc2M/DYut3PoFg=
Date: Wed, 29 Apr 2020 17:26:18 +0100
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, s.hauer@pengutronix.de, lgirdwood@gmail.com,
 shawnguo@kernel.org, perex@perex.cz, Tang Bin <tangbin@cmss.chinamobile.com>
In-Reply-To: <20200429093823.1372-1-tangbin@cmss.chinamobile.com>
References: <20200429093823.1372-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: mxs-saif: Fix unused assignment
Message-Id: <158817756638.27768.4592113861894397863.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>
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

On Wed, 29 Apr 2020 17:38:23 +0800, Tang Bin wrote:
> Delete unused initialized value, because 'ret' will be assigined
> by the function of_alias_get_id().
> 
> Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  sound/soc/mxs/mxs-saif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: mxs-saif: Fix unused assignment
      commit: da33574f7f1c110ec58ea43251a9a85801d6e015

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
