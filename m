Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D413273716
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 02:09:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 993EC16C1;
	Tue, 22 Sep 2020 02:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 993EC16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600733389;
	bh=0tGXdFhUT2bztqMJs5r7gYtolrWbX0nSGoWJKCBx/eU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YJZCtvGwT8ySsNz0dZkbri5FecqEXh72uz93i/vdQOaZqqdoSKBXL7yCSTLkrjMhU
	 Gpcri6b+L/U2LA74oHdRF/ehhDcEMFcTmurUY+rP/NAAIyvmpP6bDz1b5TjbiAB1mE
	 6z/rt8ro2gXAbbvvq5qNA+6qkDZclIq/fwhDT7z8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4206F802DD;
	Tue, 22 Sep 2020 02:06:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13315F802DC; Tue, 22 Sep 2020 02:06:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E57FF802D2
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 02:06:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E57FF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qYJI4ght"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A1138207C4;
 Tue, 22 Sep 2020 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600733196;
 bh=0tGXdFhUT2bztqMJs5r7gYtolrWbX0nSGoWJKCBx/eU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=qYJI4ghtCwwIse2FU6UpxqUZVjjnoJsDwmk0iOhOUAgFGj+Mm03+TR4qEs1qPxR0c
 J34WcxiL8e7rG8MRZdDlLtK1ma0zykn2BtGmlDUK/vhzB7poqqmwfgoeP7WSJfqMUb
 T8WBh+kTUUMF6wk/f80GDyKEMl+mgnfxuzv13hIQ=
Date: Tue, 22 Sep 2020 01:05:43 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200921100841.2882662-1-kai.vehmanen@linux.intel.com>
References: <20200921100841.2882662-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: hdac: make SOF HDA codec driver probe deterministic
Message-Id: <160073312817.6173.3360579751248713110.b4-ty@kernel.org>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 cezary.rojewski@intel.com, lgirdwood@gmail.com, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 philipp.leskovitz@secunet.com
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

On Mon, 21 Sep 2020 13:08:41 +0300, Kai Vehmanen wrote:
> To provide backward compatibility to older systems, the SOF HDA driver
> allows user to specify which HDMI codec driver to use at runtime via
> kernel parameter. This mechanism has a subtle flaw in that it assumes
> the codec drivers not to be loaded when the SOF PCI driver is loaded.
> 
> The problem is rooted in use of the hdev->type field.
> snd_hdac_ext_bus_device_init() initializes this field to HDA_DEV_ASOC.
> This signals the HDA core that ASoC drivers should be considered in
> driver matching (hda_bus_match()). The SOF and SST drivers continue by
> overriding this field to HDA_DEV_LEGACY and proceeding to load driver
> modules with request_module(). Correct drivers will get loaded and
> attached.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac: make SOF HDA codec driver probe deterministic
      commit: 163cd1059a85d225b811ddb4192fabd1553f77f1

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
