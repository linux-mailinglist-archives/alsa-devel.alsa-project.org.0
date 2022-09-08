Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D779E5B1D7F
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 14:44:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9140F170E;
	Thu,  8 Sep 2022 14:43:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9140F170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662641074;
	bh=37cWeoqH7Gzne38FCrMcNkjD+PXkpO/LbEOstYxMLno=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U0Q75QO2BjYiE6CC3dqhVUm1Lj/w76AO+MVkXHQG6GQbjpV1L5lzrzm1y+e7XIcxD
	 FmIqDD/T7VLS1TSHnXuz4OAuPoWxD+KN1xlW6Zf/xWUH5DwKhaBb/dKhNBeu5fhoXU
	 kvdWOJL4mUPUbLEn69VKINfjdOxus88ciyw3XPEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 604C8F80533;
	Thu,  8 Sep 2022 14:42:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05476F800CB; Thu,  8 Sep 2022 14:42:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13B7CF801F7
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 14:42:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13B7CF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M4RUdgwv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3158F61CE1;
 Thu,  8 Sep 2022 12:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED797C433D7;
 Thu,  8 Sep 2022 12:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662640964;
 bh=37cWeoqH7Gzne38FCrMcNkjD+PXkpO/LbEOstYxMLno=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=M4RUdgwvzlEQfim9qXJ441hh/BHscU0kgTV6UsMa+oQGIKjoHf6+ki/q5Ar37xCAd
 HeKVNhanydWqI1h8ytT2EPnQgYS+QcgannGglwCjUjHOxCpAd9UuEjrWZVnzDBwZIG
 mfbXqFdSV08wg5MivYul+I0CAXOXT/1fn5LiR566AW45vgkcG9sydlGAPODZR1/UVQ
 YAhU0nXROs7XdQ80b1hckbek3TTyMJQISjuBBS9rMhz2+3se3uBCTHQuYcgLtEqg4h
 fwmcA28ptADnic3tS7Ue/2JD6ABuyNMR1sDOpQp0sn253vYY/vmV1mA3crBdDEGq+x
 R/MEb/oEwnHCg==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, linux-kernel@vger.kernel.org,
 Steve Lee <steve.lee.analog@gmail.com>, lgirdwood@gmail.com, 
 tiwai@suse.com, alsa-devel@alsa-project.org
In-Reply-To: <20220908060359.13606-1-steve.lee.analog@gmail.com>
References: <20220908060359.13606-1-steve.lee.analog@gmail.com>
Subject: Re: [v2] ASoC: max98390: Remove unnecessary amp on/off conrtol
Message-Id: <166264096268.88408.10282562173881107177.b4-ty@kernel.org>
Date: Thu, 08 Sep 2022 13:42:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: krzk@kernel.org, ryans.lee@analog.com
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

On Thu, 8 Sep 2022 15:03:59 +0900, Steve Lee wrote:
>  The Amp is already control in userspace before trigger calibrate function.
> Remove unnecessary control in calibrate function and
> add condition to check calibration is ready.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98390: Remove unnecessary amp on/off conrtol
      commit: 6ac246105b4fd737ed51b8ac3ef031f837686dee

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
