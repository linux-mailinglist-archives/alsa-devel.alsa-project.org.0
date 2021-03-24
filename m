Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAEE348573
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 00:42:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3823B166D;
	Thu, 25 Mar 2021 00:41:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3823B166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616629343;
	bh=7Dqbn5tNlYghfg6R1xMrCmbaJD52kq/Yg4ESmCr+YY4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EPxClRMXOlxP0XzqtocrtrgF+7QCsO7KXLkzIAIQDVtnAfP77HEYOqBMMovrX4tUq
	 iVT66GH5Yo7F3CyZPlRKiAH8C8RcnzG7qKBNTjJVvUPdgAbWpV7f034pUFIXPjM5p4
	 VnXXn9ZoMN+zlFYczKx/kBtM3LGIP6iLBpLyAyUI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5E04F8032B;
	Thu, 25 Mar 2021 00:40:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84E91F8025D; Thu, 25 Mar 2021 00:40:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E2B8F80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 00:40:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E2B8F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bp73gjQ5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BE46619F8;
 Wed, 24 Mar 2021 23:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616629201;
 bh=7Dqbn5tNlYghfg6R1xMrCmbaJD52kq/Yg4ESmCr+YY4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bp73gjQ5BpI+gzci25P9JK2w3XMBaLc26PbX7uRy9lpFvatFjbB6hqSFYibTzN+vq
 rmaxloiPg1Et6x9GLxrGvHaHCFJ6hIQE/tt9iRz5ZI3k3In5EqIeQl/jsndyRedfen
 tJGc4R7ufU5hjW0hVgb6RisnmP9qbTkaGDJEi7Mco8Y57gpg1tD8Q/QAao2T6Z2E81
 sB0SMZZDr2wpn24P3zhfVJoKNQszLgYejObpKNhWrgnZsNa4M++EOgatErn7EEKK/g
 1PKXuV0yvdQIEHbh3b3kwlHLxa2Xfnb2csRvPKew9m7WeNg0vEU3KB2zh05PfllMRe
 mbXjOaHusWx0w==
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>
Subject: Re: [PATCH v2 0/2] ASoC: intel: atom: 2 bug-fixes for the atom SST
 driver
Date: Wed, 24 Mar 2021 23:39:38 +0000
Message-Id: <161662872374.51441.15604273031597405102.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324132711.216152-1-hdegoede@redhat.com>
References: <20210324132711.216152-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

On Wed, 24 Mar 2021 14:27:09 +0100, Hans de Goede wrote:
> Here is v2 of my bugfix series for the ASoC Intel Atom SST driver.
> 
> The patches are unchanged except for adding Pierre-Louis' Acked-By and
> adding a fixed (subject fixed) version of the Fixes: tag which
> Pierre-Louis suggested.
> 
> The first patch fixes a bug which is causing audio to now work with
> pipewire and both Fedora and Arch Linux are moving towards using
> pipewire as the default sound-server.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: intel: atom: Stop advertising non working S24LE support
      commit: aa65bacdb70e549a81de03ec72338e1047842883
[2/2] ASoC: intel: atom: Remove 44100 sample-rate from the media and deep-buffer DAI descriptions
      commit: 632aeebe1b7a3a8b193d71942a10e66919bebfb8

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
