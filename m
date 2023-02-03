Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC85E689C62
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 15:57:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EC72868;
	Fri,  3 Feb 2023 15:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EC72868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675436277;
	bh=eEGNAnaXLsNmCdIMPQ111OgMwhkshA87XIXK/XShWCY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=F10DLbgaTRY3GP8H6opiX6ihGRccUGNPGuURXmUgHNihF5BGX1T0Gyk1VdXEBv8Wk
	 1nhhJBvatPlk6vcW4Ly6pGvsRfNCdt2XFeBVm3hWpGUOX/CFv59aj7wfBferfeHBtg
	 MoxrYjZis2Kmy1seZR9XGijaPQNyD5arPOQx1+kU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68728F80022;
	Fri,  3 Feb 2023 15:56:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47C63F80254; Fri,  3 Feb 2023 15:56:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44CB7F80254
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 15:56:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44CB7F80254
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vJgs2cOq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A72E261F65;
 Fri,  3 Feb 2023 14:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FC5C433D2;
 Fri,  3 Feb 2023 14:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675436165;
 bh=eEGNAnaXLsNmCdIMPQ111OgMwhkshA87XIXK/XShWCY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=vJgs2cOqEK31OUMYvbuISPMT0nywLiRNhui5sSOrOPRFE4GHnZw40n4zbArzPTW0B
 5F/YEHsOtIok05vj03SxsSD/ak+C5B4ZNqG2zESwGBsEZv1ZEvXMBxjwg8BSU7C7W+
 XKyZiPFXjPQMkBSdyFlaLAJ1IbE87pO3Im+Uo+cEHZeYIANXVQYMXX950dQjvqyJ16
 VjqiWeE1ToeEPnJF1OLi7Xt6jUF88xruPiTBEG4fVhFMgt0FLCeJNgFMER+eO3Ni2d
 GbQeuj4CY1vCwFjxCcNFJusmlLWB/uny0WHxH/VE56c25QwVUX8YRAwo4xjFqLh+nH
 CwgCzB7j9RUTA==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, Yang Li <yang.lee@linux.alibaba.com>
In-Reply-To: <20230203011504.78918-1-yang.lee@linux.alibaba.com>
References: <20230203011504.78918-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] ASoC: codecs: fix platform_no_drv_owner.cocci
 warning
Message-Id: <167543616380.928818.16403862674733683634.b4-ty@kernel.org>
Date: Fri, 03 Feb 2023 14:56:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Abaci Robot <abaci@linux.alibaba.com>, tiwai@suse.com, lgirdwood@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 03 Feb 2023 09:15:04 +0800, Yang Li wrote:
> ./sound/soc/codecs/aw88395/aw88395.c:572:3-8: No need to set .owner here. The core will do it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: fix platform_no_drv_owner.cocci warning
      commit: 1c9ded98bd4e5b87756423e0abededda6f4ba0b8

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

