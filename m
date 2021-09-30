Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E350741DCE5
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Sep 2021 17:01:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2188C16CA;
	Thu, 30 Sep 2021 17:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2188C16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633014112;
	bh=FW4bfXENYNJz8nTJMPGVz4f1Ny6J2BrfIvMigyobTMo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RhMYeZSn0VIxHDRLhTHAsin2vqdS1SDJjuUE+/TTufOpzoL3wV7xuySm0U0XdgG/B
	 G1RXDHdtyt8mcMNMIV25LYU4wtPWLcjtKaLcinIVLtM/eyaaInE6PySArZHt1d/Z5f
	 8pkHFrKwlCV6iWCiqcivpySlLh88xYrhwlfNWxqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74F87F804D1;
	Thu, 30 Sep 2021 17:00:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AE6FF804DA; Thu, 30 Sep 2021 17:00:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D510EF800F3
 for <alsa-devel@alsa-project.org>; Thu, 30 Sep 2021 17:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D510EF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BOvq5o/I"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55D9F61A02;
 Thu, 30 Sep 2021 14:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633013997;
 bh=FW4bfXENYNJz8nTJMPGVz4f1Ny6J2BrfIvMigyobTMo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BOvq5o/I3elkOx2X2fUjTbvoqAe0UG/Kw/PpxvvcyPsFubvr9iSltIHZC0mluzUuq
 +3qjPVqIPtsZfP+1kslUhPFAVPtV32V7P8u8hGFfbQT2OoQZiWpkDiKzuTyB8D77aQ
 rc7/mR0Elll2jYy9v1de6jZNItozO3V9B+rToeKNCCUcV/pWd4T1AsRIyWhkh0nHyN
 xc8X0mN/KJSaWjROE4SG3wkyTG1EjWRBtjkA0rGm2fcVwI8oL3bIfiylvmcWR7/o6t
 jXC8K6mwaQ6TP3ilB6BV2pUDDsV5ml+RGHcHabO+e60wtYoodGHLd7gcgd1OquP/lM
 Wm99THYJkroIg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Change SND_SOC_SOF_TOPLEVEL from config to
 menuconfig
Date: Thu, 30 Sep 2021 15:58:52 +0100
Message-Id: <163301248179.43045.12666453505113900679.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930070438.16846-1-peter.ujfalusi@linux.intel.com>
References: <20210930070438.16846-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Mark Brown <broonie@kernel.org>, bard.liao@intel.com
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

On Thu, 30 Sep 2021 10:04:38 +0300, Peter Ujfalusi wrote:
> We have growing number of options under SND_SOC_SOF_TOPLEVEL as SOF
> adaptation is growing (Intel, NXP, AMD and Mediatek) and new features are
> added.
> It will make the menuconfig user experience much cleaner if we move the
> SOF options under a separate page.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Change SND_SOC_SOF_TOPLEVEL from config to menuconfig
      commit: 724cd2e42630120f59d7dee3d0073b1f09d60db2

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
