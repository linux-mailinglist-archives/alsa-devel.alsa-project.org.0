Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 705D6249DA3
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 14:18:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17E6817C1;
	Wed, 19 Aug 2020 14:17:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17E6817C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597839518;
	bh=GBk62PxPjZzTlz8AWrdKuFgqMFGxf6UKQ3BDWxpQOrY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=niRHw220nrsup2LOVypL59khfdyyVN5Cng+KFqF5Fv/23epOPs8Qbotj/eZfnLv9i
	 8xGBlRbTSuuXEOvu2guWmz+BOHixQpbAFsF6TkvRIMYYsqrqsHd817bzqhz8DwAD8P
	 69yk2D4AaU9T+JJKumxHuFYmmKbdSGv52DNTJQ7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0208F80260;
	Wed, 19 Aug 2020 14:16:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D4A5F8025A; Wed, 19 Aug 2020 14:16:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BB52F800D3
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 14:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BB52F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OGrCckyz"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 289C120738;
 Wed, 19 Aug 2020 12:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597839371;
 bh=GBk62PxPjZzTlz8AWrdKuFgqMFGxf6UKQ3BDWxpQOrY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=OGrCckyza84VrnzFoWVQ7vYNqJO8JnD9uawyVVaFsq6cHVTYkIrHLONWAF55oHdq6
 WWqdcbVJuTQky8Qzi66sgWxF/S7DZJUNhoo0/IT+ncwJtznl7GBYEGWR2AzjibWe4V
 pzJYDfW+DA799J4jbQeuLFdIYEhth//lKqMHXMIU=
Date: Wed, 19 Aug 2020 13:15:40 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>
In-Reply-To: <20200722173524.30161-1-mateusz.gorski@linux.intel.com>
References: <20200722173524.30161-1-mateusz.gorski@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: skl_hda_dsp_generic: Fix NULLptr dereference
 in autosuspend delay
Message-Id: <159783932454.55025.10750746157554995989.b4-ty@kernel.org>
Cc: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

On Wed, 22 Jul 2020 19:35:24 +0200, Mateusz Gorski wrote:
> Different modules for HDMI codec are used depending on the
> "hda_codec_use_common_hdmi" option being enabled or not. Driver private
> context for both of them is different.
> This leads to null-pointer dereference error when driver tries to set
> autosuspend delay for HDMI codec while the option is off (hdac_hdmi
> module is used for HDMI).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: skl_hda_dsp_generic: Fix NULLptr dereference in autosuspend delay
      commit: 5610921a4435ef45c33702073e64f835f3dca7f1

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
