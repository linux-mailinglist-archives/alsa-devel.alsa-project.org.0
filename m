Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA634255D1D
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 16:53:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DEBF174F;
	Fri, 28 Aug 2020 16:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DEBF174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598626432;
	bh=tYgV+FBYe1Z6jN+MAv7hfYtP2hXvmNwxY+Gt1pXHABI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CbcRlkdFs2SUSrknJf0fMsnCj+wxgUrluKqsVo8ZcrgtaZ8rs2d6vy3UeRQdDjFny
	 S4PdXtbKraU5jxnPkj8jnCOPkVimeSergm9Qn0Ie9gK21rhognnrioDFfE/nIhbM2I
	 VqdCV6HDi7/TQMuV6RPuofkyB3uLHTHjHG1Ere4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7263F801F2;
	Fri, 28 Aug 2020 16:51:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73586F8016F; Fri, 28 Aug 2020 16:51:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10A58F80105
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 16:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10A58F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Fm4UIVpP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4417420848;
 Fri, 28 Aug 2020 14:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598626275;
 bh=tYgV+FBYe1Z6jN+MAv7hfYtP2hXvmNwxY+Gt1pXHABI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Fm4UIVpPsATiFzzlVYRYNdoZ6ROoTuq4/1WSb1YxgMGinj0LSzfoqVLfypYTKOvTp
 OSR265HcdMgWAFSS7sjBj5ZUfeEElwft/BRMMlE7/mQAFlJiMcBrYiAgI8yOv8dldQ
 MNzAXpN0JGtgDwZiEHh/QTIlWr6DLobJ2OYTTsdI=
Date: Fri, 28 Aug 2020 15:50:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>, lgirdwood@gmail.com, perex@perex.cz,
 robh@kernel.org, tiwai@suse.com
In-Reply-To: <20200828112855.10112-1-dmurphy@ti.com>
References: <20200828112855.10112-1-dmurphy@ti.com>
Subject: Re: [PATCH] ASoC: tlv320adcx140: Add digital mic channel enable
 routing
Message-Id: <159862623263.40815.9298257186480426843.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Fri, 28 Aug 2020 06:28:55 -0500, Dan Murphy wrote:
> Add the audio routing map to enable the digital mic paths when the
> analog mic paths are not enabled.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adcx140: Add digital mic channel enable routing
      commit: ece2a74c5913d244e13c42c61ca2e162932fa3b4

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
