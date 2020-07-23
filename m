Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A6A22B78F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 22:22:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89978168D;
	Thu, 23 Jul 2020 22:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89978168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595535743;
	bh=Y7nw8Vj09mHRDx3rm4JyQd5kgvD3ZNpz+G6aAJc4te0=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BlX4tblVnk74U7sV+ARryysuas9ojPc7c9ApDzHCOvIMTHa+d2iYTINvUSXeo8SJ3
	 +252pI4dfu6d8csLhsimen+6R/GWwDN7PJVkN+hHNYPuHXuNUwZ1sJ9aovWdLUT++v
	 rkgDYSxPpeWCqLEkVsInFBBIDO7WN0Wq9iFVHeZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8737FF80278;
	Thu, 23 Jul 2020 22:19:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEE33F80274; Thu, 23 Jul 2020 22:19:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F379F8024A
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 22:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F379F8024A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Sr85O+3y"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3BE720792;
 Thu, 23 Jul 2020 20:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595535594;
 bh=Y7nw8Vj09mHRDx3rm4JyQd5kgvD3ZNpz+G6aAJc4te0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Sr85O+3yxJUO8fWXvZDwDrg8K1cyNWE7lAskp1wdT4mHhoGLrLmHZNdOTjHA2qb70
 Bmr4bN3gKnZ+mTEQomX12S2gdeAHORaIpsJHw9FOC1b1XTnWVb4aq+udfnNCGVXOVV
 RX0wjNh34aSfg7xtVa6mPbGHgNjtv/trfEmXRoQ8=
Date: Thu, 23 Jul 2020 21:19:39 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, nicoleotsuka@gmail.com,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>, festevam@gmail.com,
 Xiubo.Lee@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com, lgirdwood@gmail.com, s.hauer@pengutronix.de,
 timur@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20200718111209.11760-1-grandmaster@al2klimov.de>
References: <20200718111209.11760-1-grandmaster@al2klimov.de>
Subject: Re: [PATCH] ASoC: fsl: Replace HTTP links with HTTPS ones
Message-Id: <159553557415.41908.3982034267221660398.b4-ty@kernel.org>
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

On Sat, 18 Jul 2020 13:12:09 +0200, Alexander A. Klimov wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: Replace HTTP links with HTTPS ones
      commit: 1ce8f643ed875d754ff09bf2096dfac3b905ab80

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
