Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A61B2F9D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 20:55:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCC1E16CB;
	Tue, 21 Apr 2020 20:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCC1E16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587495311;
	bh=zL91bQLozjyvNdYRpNFYZUjL+HYvZDuMjOLRropM4QE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GYRRyy/Jt4r7EXr7YcjrSXqOQzNBz9KgUJUxYRnZ1ohdxNMEuY08nD6dBhaDbImvZ
	 wpRzS+lHvtA+hsNaaWsD6Xqi1EyTq5Bj7yQehsqqrYXy5+XVdY6rjYxP7Y0yk1AX7F
	 87qOMSc+dzI9TdhnBg+9RNofcp5O16AoENCuE/+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC428F800E7;
	Tue, 21 Apr 2020 20:53:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BC69F801ED; Tue, 21 Apr 2020 20:53:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56D6AF8012F
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 20:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56D6AF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ayy34cIQ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 06B4E2068F;
 Tue, 21 Apr 2020 18:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587495198;
 bh=zL91bQLozjyvNdYRpNFYZUjL+HYvZDuMjOLRropM4QE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Ayy34cIQe/oe1ZC+/tDUcaruKkkfGJGELY2FzETid71cGbZZG0IW1+4AviJMQyHI6
 LUppst0ahQRypQNwXEvsBfnUqd9K9xcdCYCjYg8f31XfWS2T7zLp3CkR0X+bBpw3ad
 hDgEtfaCBRvAiA22ob4FhwtePn3UCJgaJgNLUd6k=
Date: Tue, 21 Apr 2020 19:53:15 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200417075957.24811-1-kai.vehmanen@linux.intel.com>
References: <20200417075957.24811-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: intel/skl/hda - fix oops on systems without i915
 audio codec
Message-Id: <158749519587.29498.12545439964374857405.b4-ty@kernel.org>
Cc: hui.wang@canonical.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 jaska.uimonen@linux.intel.com
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

On Fri, 17 Apr 2020 10:59:57 +0300, Kai Vehmanen wrote:
> Recent fix for jack detection caused a regression on systems with HDA
> audio codec but no HDMI/DP audio via i915 graphics, leading to a kernel
> oops at device probe. On these systems, HDA bus instance lookup fails,
> as the first ASoC runtime of the card is connected to a dummy codec
> (as no HDMI codec is present).
> 
> Fixes: 3a24f135e6cc ("ASoC: intel/skl/hda - set autosuspend timeout for hda codecs")
> Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: intel/skl/hda - fix oops on systems without i915 audio codec
      commit: 5bf73b1b1deca46c7459cb4d732ba8bad6da93c5

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
