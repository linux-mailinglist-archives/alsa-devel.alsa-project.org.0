Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8EC26E4D7
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 21:00:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21BCB1680;
	Thu, 17 Sep 2020 20:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21BCB1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600369211;
	bh=SJN4xfUdkl7bi48FKRfNPPAsTv9Fk8jme/sg3RpIUiI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=If53nlyqwxv9wmqN6ZPHApC7ahDGeeiAbFjW167iix1UPQdtMRxC5lnmeJq69HXVX
	 KCqcVPvZqfqaLh34+zjn51geNQJz9GxVJLNLXO0u1z81xyB/jtQbHybUkYtcyeCU6E
	 zvfXrKZ9BkLiBVEm2c72YyQgbTuN4Tvg/zuJKN0I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D617F8028B;
	Thu, 17 Sep 2020 20:57:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50279F8027C; Thu, 17 Sep 2020 20:57:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D037AF8025E
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 20:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D037AF8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xZiC/FkG"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC5B3206A1;
 Thu, 17 Sep 2020 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600369064;
 bh=SJN4xfUdkl7bi48FKRfNPPAsTv9Fk8jme/sg3RpIUiI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=xZiC/FkGQ0IWa40HGPG6OTJ68weDC26g+OAq/cpzzemPVP5Sdmya55zK6KGh1plmO
 VOFswtms6tVavILDSklQIXy4GxHQshtKaI32zl4jzteOyI/cDbVdzKrPXEisBwv3td
 BvkyJF8ttDOFDWWynnKVUhGDXof61/P8A97Uwk4U=
Date: Thu, 17 Sep 2020 19:56:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20200902133043.19504-1-matthias.schiffer@ew.tq-group.com>
References: <20200902133043.19504-1-matthias.schiffer@ew.tq-group.com>
Subject: Re: [PATCH 1/2] ASoC: codec: tlv320aic32x4: fix missing
 aic32x4_disable_regulators() in error path
Message-Id: <160036900935.20113.2391843531663465832.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
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

On Wed, 2 Sep 2020 15:30:42 +0200, Matthias Schiffer wrote:
> The regulators need to be disabled in the aic32x4_register_clocks()
> failure case as well.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codec: tlv320aic32x4: fix missing aic32x4_disable_regulators() in error path
      commit: 251e5c8694db01cd10828e39c07f90d958d7b303
[2/2] ASoC: codec: tlv320aic32x4: do software reset before clock registration
      commit: df44bc16e616809172cda90fd816596ded4ea219

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
