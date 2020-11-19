Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CF02B98FB
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 18:11:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE6061725;
	Thu, 19 Nov 2020 18:10:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE6061725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605805874;
	bh=smS4nswuo6M6xhzzDjKO/tk/isVy6aZ56JzF77NAViE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N9oroTNOtpCoz+xGJeOZZnCEk8mCR4ZBXGrvKv95O+GfOI4aSDxRXYORWPXLZ3DaR
	 IUlSY5CK6VHE2UgQpFR9+A0+qQjkexXHRKuFO+7QUjIT7mnggpseD9pYYNBLH2G2we
	 gQMiIfM+0Nw1WWpqXoUfpNzp/0sif5HeysLNs0fM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BFDEF80247;
	Thu, 19 Nov 2020 18:09:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1927F800EE; Thu, 19 Nov 2020 18:09:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2CEEF800C5;
 Thu, 19 Nov 2020 18:09:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2CEEF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2H/QGU/2"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5EEF82467A;
 Thu, 19 Nov 2020 17:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605805759;
 bh=smS4nswuo6M6xhzzDjKO/tk/isVy6aZ56JzF77NAViE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=2H/QGU/2zyUlFt3bzQbYjDFbT5HNXPO/d/gftoHa48jocgz8N1TtOHnoTz14jOVnJ
 z2+aUeYxpbaPGUk7pi3o5JQuE/gef/UTaLMXU0RisIAlJdsNJevjo9V7pBGfcxAVV1
 zF9veijWDNQsIIqXiAG0p8k216zxJivenrAqYpEM=
Date: Thu, 19 Nov 2020 17:08:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20201117145223.21222-1-gustaw.lewandowski@linux.intel.com>
References: <20201117145223.21222-1-gustaw.lewandowski@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: Intel: catpt: select WANT_DEV_COREDUMP
Message-Id: <160580573379.54454.482571650475952899.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, patch@alsa-project.org, tiwai@suse.de,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>
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

On Tue, 17 Nov 2020 15:52:23 +0100, Gustaw Lewandowski wrote:
> Select WANT_DEV_COREDUMP for catpt driver.
> 
> Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
> Signed-off-by: Gustaw Lewandowski <gustaw.lewandowski@linux.intel.com>
> 
> --
> Changes in v2:
>  - change should be added to catpt only

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: catpt: select WANT_DEV_COREDUMP
      commit: 73ea3a5dbbefa792746e258e267a1e066a6ac855

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
