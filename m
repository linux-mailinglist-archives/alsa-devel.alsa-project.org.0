Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5B222B799
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 22:23:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0643A16A0;
	Thu, 23 Jul 2020 22:22:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0643A16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595535799;
	bh=vCjA4xAHthSGepbuGA6kdiCjzE3kR6rTvpa8c9jbL9U=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eInwNBlPDibOTFhse9OUZs10e9W9gjm2r2iAO7qL+RqV5gbPE/13gGsvKlLiw+SZF
	 RNIW8YB14VctVYqiX1NqO9fJXVTDSbho9C6OYw3lomzCZIPWfLLwE1oTpNU2Sjxyls
	 mqmnQHUpdS6z5BVDbtx5eCEe619oS7tuZE+m6bZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9FA2F802DC;
	Thu, 23 Jul 2020 22:20:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FB48F802DD; Thu, 23 Jul 2020 22:20:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A59EFF80279
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 22:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A59EFF80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="c4fbNaJI"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C120B207BB;
 Thu, 23 Jul 2020 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595535604;
 bh=vCjA4xAHthSGepbuGA6kdiCjzE3kR6rTvpa8c9jbL9U=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=c4fbNaJIGSCpqPBYzahcz+q7OorgPf3XhLcT9Cf3ysLkbI/UkuixZWdP94r2NxfJ8
 AiGV9IST2KNScmeLrkuz4/g1HmvfRaknpW5rooZXF4iRII7URZfnkBXL1t0xbazEzT
 Yp4NhqPFz5180ezkGShvyX2xNhHX6gWVmyAF6krk=
Date: Thu, 23 Jul 2020 21:19:49 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 alsa-devel@alsa-project.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, peter.ujfalusi@ti.com
In-Reply-To: <20200718110857.11520-1-grandmaster@al2klimov.de>
References: <20200718110857.11520-1-grandmaster@al2klimov.de>
Subject: Re: [PATCH] ASoC: ti: Replace HTTP links with HTTPS ones
Message-Id: <159553557415.41908.3344593909115840356.b4-ty@kernel.org>
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

On Sat, 18 Jul 2020 13:08:57 +0200, Alexander A. Klimov wrote:
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

[1/1] ASoC: ti: Replace HTTP links with HTTPS ones
      commit: f68440508deac56a715a0b48c375f557e10692ac

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
