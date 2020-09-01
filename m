Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7AC2592F9
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 17:20:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30BCB17DC;
	Tue,  1 Sep 2020 17:19:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30BCB17DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598973610;
	bh=G9lRoCqtutdJhrTRAYTbOfsRmk/iYWksD4gRggGFpF0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HRAksfoEz47mhCY70To7/3dkaLbzOsKoR/0wZ+cNBJcF7qxYawKmwwauWQXQf2zVB
	 kyXORjRg5P7CKpmJb96ucEk3LIcWIbLEQrKE28PN7XheZJfPx1EQsLvxdmmc3PJa5i
	 iMt0kr3AYoHtyxAR1V71q9rmlj/Ie1LrMhSuwPoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DFE6F801DA;
	Tue,  1 Sep 2020 17:18:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E593AF80217; Tue,  1 Sep 2020 17:18:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0665F801DA
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 17:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0665F801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PUHaCQ7M"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9B09214F1;
 Tue,  1 Sep 2020 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598973501;
 bh=G9lRoCqtutdJhrTRAYTbOfsRmk/iYWksD4gRggGFpF0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=PUHaCQ7MHB9fNoxA52ESx3JqtH57jOx6fl017yOgjt+PabE3DmJPNbHso4Kuzk2WI
 ooVNY52/SDRcDxZDZU3rzL/CcHT2PKnNR/xVd7zMhg+txyQqdSVkR5KkNFwHTAO6vP
 6M4AZop+jfTjbbP2PRygCSj552WxSa1hVgoXnxB4=
Date: Tue, 01 Sep 2020 16:17:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Camel Guo <camel.guo@axis.com>, perex@perex.cz, tiwai@suse.com,
 lgirdwood@gmail.com, dmurphy@ti.com
In-Reply-To: <20200901135736.32036-1-camel.guo@axis.com>
References: <20200901135736.32036-1-camel.guo@axis.com>
Subject: Re: [PATCH v4] ASoC: tlv320adcx140: Fix accessing uninitialized
 adcx140->dev
Message-Id: <159897346138.26776.4795793830784524613.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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

On Tue, 1 Sep 2020 15:57:35 +0200, Camel Guo wrote:
> In adcx140_i2c_probe, adcx140->dev is accessed before its
> initialization. This commit fixes this bug.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adcx140: Fix accessing uninitialized adcx140->dev
      commit: 2569231d71dff82cfd6e82ab3871776f72ec53b6

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
