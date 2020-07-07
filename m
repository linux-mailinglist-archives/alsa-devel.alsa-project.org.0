Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B59216E9E
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:21:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6D2542;
	Tue,  7 Jul 2020 16:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6D2542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594131688;
	bh=JvMHWS5oVH4hJWhlbLg3xOagK5SJNSGlwa487H/MIj0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9Dxzqc8HZ0rk3fcdTgcdd+5xgsOKlWLOKbmCbiVedcR1CU9n8p2+i7zT6Gm3lOAz
	 Q1KIpsJY7Uxmyon9t++XjgtjVRAZi9vBedIWZhlKQFZizXQPZJOMua3eY8PdEiC0aI
	 KubX3w3Ppwc8GqZaEw5wxcIxseA64D9alT1oGoXI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E95BBF802DD;
	Tue,  7 Jul 2020 16:17:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66457F802DC; Tue,  7 Jul 2020 16:17:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09F9AF802D2
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:17:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09F9AF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sAfOmiyf"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09CD920773;
 Tue,  7 Jul 2020 14:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594131449;
 bh=JvMHWS5oVH4hJWhlbLg3xOagK5SJNSGlwa487H/MIj0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=sAfOmiyf8FHFWKOA6FwaxwupDn1VBbapkTzn+i6k/rVy8xYFmWsZn5ZYG3i5u/jm7
 Ip0g94Gq0sMn6tahJkEelS0HPHNK4BnzNDrUJLNoe4UPdYVDvhfBd2GQIrulNt1aRx
 atJusenmrdQQCelNdL6Ew9Q0dZLKWmxR1sc4I8AI=
Date: Tue, 07 Jul 2020 15:17:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
In-Reply-To: <20200702193102.25282-1-nicoleotsuka@gmail.com>
References: <20200702193102.25282-1-nicoleotsuka@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Shengjiu to reviewer list of
 sound/soc/fsl
Message-Id: <159413142466.34737.11451730915770619660.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, festevam@gmail.com, shengjiu.wang@nxp.com,
 timur@tabi.org, linux-kernel@vger.kernel.org, Li.Xiubo@freescale.com,
 linuxppc-dev@lists.ozlabs.org
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

On Thu, 2 Jul 2020 12:31:02 -0700, Nicolin Chen wrote:
> Add Shengjiu who's actively working on the latest fsl/nxp audio drivers.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: Add Shengjiu to reviewer list of sound/soc/fsl
      commit: 503ed52225ed3d369c8e0dedf13556a7bc1e5c2b

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
