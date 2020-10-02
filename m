Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9CA281D43
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 22:59:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C85B81AD2;
	Fri,  2 Oct 2020 22:58:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C85B81AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601672384;
	bh=J0puacgmnRfuguK83QIcHTJ2NU8YvJ8K23H6qn76ywk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Og8nf3EFcPYQvsItMMnAkPKSnvqVfaAy9sPYk5kDvmIvYKSZlEyxpYdMm1d+WCYI6
	 87DZhLMXvZaB9y/aXhS94TbmT1mi92X/LiYpXaOZC4fczMvfepJ/WLmRiiE7HwIMAH
	 cG9W+26z0UjZYTZxIXHLf7vWaG5ysHXxRLyMsmD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91C70F802BD;
	Fri,  2 Oct 2020 22:58:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88973F80247; Fri,  2 Oct 2020 22:58:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3ECFF801F9
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 22:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3ECFF801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oefR/7xO"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2E06206B6;
 Fri,  2 Oct 2020 20:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601672309;
 bh=J0puacgmnRfuguK83QIcHTJ2NU8YvJ8K23H6qn76ywk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=oefR/7xOOL0tH57aV3gCtChZ+mUOPM00QMUAV4v44qS/B0i3BdfBv8z5sD1alcKBc
 x+Xwj45RUxzhFMlIRACzv2BgpplLVslufVzGtZbi5dhGPi8NpIhgXRDuxfwnNm55N+
 nqTm73+zbk4wOxyRNPtHXGf8ZNo7FBNpf3YOJTL8=
Date: Fri, 02 Oct 2020 21:57:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>
In-Reply-To: <20201002172841.37344-1-broonie@kernel.org>
References: <20201002172841.37344-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: fsl_spdif: Remove unused np
Message-Id: <160167211500.21762.1332337728354203094.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>
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

On Fri, 2 Oct 2020 18:28:41 +0100, Mark Brown wrote:
> 


Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Remove unused np
      commit: 1c71497bb5b819bf3a32cfc35e293060b6590c39

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
