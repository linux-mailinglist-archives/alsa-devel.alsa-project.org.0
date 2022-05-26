Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF6F5351B7
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 17:56:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A397616CB;
	Thu, 26 May 2022 17:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A397616CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653580583;
	bh=iEQvsWwcbaWh1NV2sOmAGSY+hE+1zTIi/WH5c3t5nAU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=av+6hc2XCrWGN5NSEjx/DchsVoasO9o0I3qxi8BR4nKFebG/tHxEs1w5PCOMP+ue1
	 EvWnTxitXToSCt2/TexOH8qV4m56CEfYfYogbjFP5hIk1dOPkaWnxVn7PpwVX5XDO7
	 DD/EYx0+VDDHiws805SBqLqcc7x2lKOIUMtkekw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1932DF800D0;
	Thu, 26 May 2022 17:55:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E6D2F8014B; Thu, 26 May 2022 17:55:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96660F800D0
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 17:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96660F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tB0eFipr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12EAB61CAE;
 Thu, 26 May 2022 15:55:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0A6C385A9;
 Thu, 26 May 2022 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653580516;
 bh=iEQvsWwcbaWh1NV2sOmAGSY+hE+1zTIi/WH5c3t5nAU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tB0eFiprf4DqevrPpRwrfj9gLDdtpD5kPuNh7IBD4qXAWdQU7sjH5iXLOz0qRUnsC
 ZRv4q3d9/NZOCOuoFRpjoNTLuSNrcLPe/OviRmLrB9/cLzcFdEB8xycTZ050MQJMD7
 /oYtpGCX6KShuAleNIslf2zzQDUBZ0OEQ0fVh5FLxhukaG1rAjwpa9SXhY1l04QZ8H
 18ukj+eZid8rHkANFwbXIE4aVjSrMzwePuCZc/75NJzTcIyBUxt1+ftQXPZSLHxiv0
 75qGuuXRstr6ht3YbCLXOBUJtjYnp7cn++WMDmWfIijpo3WLX6Ft1WdLFVJBOGxAWD
 CYXxP6N34P1SA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, oder_chiou@realtek.com
In-Reply-To: <20220516103055.20003-1-oder_chiou@realtek.com>
References: <20220516103055.20003-1-oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt5640: Do not manipulate pin "Platform Clock" if
 the "Platform Clock" is not in the DAPM
Message-Id: <165358051449.3156723.1346644211878300206.b4-ty@kernel.org>
Date: Thu, 26 May 2022 16:55:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, spujar@nvidia.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

On Mon, 16 May 2022 18:30:55 +0800, Oder Chiou wrote:
> The pin "Platform Clock" was only used by the Intel Byt CR platform. In the
> others, the error log will be informed. The patch will set the flag to
> avoid the pin "Platform Clock" manipulated by the other platforms.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5640: Do not manipulate pin "Platform Clock" if the "Platform Clock" is not in the DAPM
      commit: 832296804bc7171730884e78c761c29f6d258e13

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
