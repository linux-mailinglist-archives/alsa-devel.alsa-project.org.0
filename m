Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8131B2F9E
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 20:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EBCE16D2;
	Tue, 21 Apr 2020 20:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EBCE16D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587495358;
	bh=Frj/cz+GQh8ZuQCSfkzEEJVdndMiKBCd4eR3aH2VEz0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rW69ygIRkgjNg9imJ/DeQBpfU9L9tH+4yoSpQFrWhik2IW3Vrwo+7I5ioGiASLhHL
	 L15cSrJCJEe+HEiygflYy+34objKyycqGHGNLSFYJ1RR3KACzdCoEn+hC7zVGhqVJS
	 95oGy6+qj6/KFEX0j3FREEhwsyf9RMen0pea54Z8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F62F80246;
	Tue, 21 Apr 2020 20:53:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38D0FF80246; Tue, 21 Apr 2020 20:53:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37BCAF80143
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 20:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37BCAF80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cbnefvKB"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D812E206F4;
 Tue, 21 Apr 2020 18:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587495204;
 bh=Frj/cz+GQh8ZuQCSfkzEEJVdndMiKBCd4eR3aH2VEz0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=cbnefvKBv2nT1wgdDmXRavQvfKfj/z6zwP4LJGAaC5mWFujOKN22MxIHnysaYYL6a
 E0RfdK0RFqlIvPwdvxYpTWvRzIxwY2FuMt7E2eToBJ8hLkV6mN8+l9j4x/9ckHG0hb
 SDzK5RuM9IwDuO6YV0b5mTK5ffwv0L5R/RfxWedo=
Date: Tue, 21 Apr 2020 19:53:21 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200420205431.13070-1-kai.vehmanen@linux.intel.com>
References: <20200420205431.13070-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: intel/skl/hda - fix oops on systems without i915
 audio codec
Message-Id: <158749519587.29498.18124503080479706658.b4-ty@kernel.org>
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

On Mon, 20 Apr 2020 23:54:31 +0300, Kai Vehmanen wrote:
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
