Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22C231FA8
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 15:55:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A4FF16F7;
	Wed, 29 Jul 2020 15:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A4FF16F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596030911;
	bh=olcPQYLRhZ6J89WgrrA4eEkN7VMmNsAbPiHflKRaWSw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KAyZMv6aYx7qUSAYdjzAGn+mvZu7jOd2MuHrtNFTeMrZXmhACiMpVNyzut35/lkKq
	 BvjGi7H9ACGzuIl3YolM4nIb0hM9YToRNC5w6FilWlAIBmlBDJD1x8joqEiJmAUBBu
	 2eIjS7zsMfQaxTn6VAURi5Cu4LeVc0hZ5wElfbUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A52B7F801F7;
	Wed, 29 Jul 2020 15:52:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7ECAF800DE; Wed, 29 Jul 2020 15:52:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B734F800DE
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 15:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B734F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aIkjo0Ix"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C902122D37;
 Wed, 29 Jul 2020 13:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596030758;
 bh=olcPQYLRhZ6J89WgrrA4eEkN7VMmNsAbPiHflKRaWSw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=aIkjo0IxD6Tl6LoSB4teA8rDDrjPOIBXOOpiVpSrpbRXdtrXJJdBzmxAH3SrUVPgR
 iEuUay9sqUuis43Q43X0M332jVmgwOKsCAnccfgKrWrhCfm80uYmI4cgwTLzGwqExd
 88eH6H8D9rCeow13arEyI8R67G0LuYWRblsVGeo8=
Date: Wed, 29 Jul 2020 14:52:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com
In-Reply-To: <20200728160833.24130-1-dmurphy@ti.com>
References: <20200728160833.24130-1-dmurphy@ti.com>
Subject: Re: [PATCH 1/2] dt-bindings: tlv320adcx140: Add GPO config and drive
 config
Message-Id: <159603073224.46331.10451608793293246650.b4-ty@kernel.org>
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

On Tue, 28 Jul 2020 11:08:32 -0500, Dan Murphy wrote:
> Add properties for configuring the General Purpose Outputs (GPO). The
> GPOs. There are 2 settings for each GPO, configuration and the output drive
> type.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: tlv320adcx140: Add GPO config and drive config
      commit: 63b0383f3c1c32d7ff958bf3a58c58a84cbd7450
[2/2] ASoC: tlv320adcx140: Add GPO configuration and drive output config
      commit: 6617cff6a05e7e7a679499cb1d5cd2d3bc6390c3

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
