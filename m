Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B56325474
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 18:17:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ADE9850;
	Thu, 25 Feb 2021 18:16:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ADE9850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614273426;
	bh=HFKV54VLWXiyNVHnjl/Yd24PVjZZ/kS9qgzBkloeKtc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LOwnQVeZlo7Khab+kaTE7rENem4HqDabzGEzKMnOvlU64qvTl6oIIEWkUvNOH49Yw
	 /wwW9B+6UB/6lGyepykGsFSjxQ2MJ9F3nmK/ZUiw3wrVAuYGD+gQv5U81PnmoLIX6F
	 ABbR1dOs/iFQPH9T3ZrqjToQzW/nlL/zZqdSCYag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D89FAF8016D;
	Thu, 25 Feb 2021 18:15:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B903F8016D; Thu, 25 Feb 2021 18:15:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9A11F80159
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 18:15:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9A11F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EEbk0tps"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0061E64ECE;
 Thu, 25 Feb 2021 17:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614273326;
 bh=HFKV54VLWXiyNVHnjl/Yd24PVjZZ/kS9qgzBkloeKtc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EEbk0tpsQBLgjkbDk/oVbZGpufROG9ArHdkkLtvkzqiXkIxiejAsnbKFYTYnb2V0E
 32jbRdmJDCofsIswAKjts2NtbhM7gjKE42n3VrdU4ITJFpU5cJTTYTgtVnYjIj1Ri3
 mFjGcEYMwOcUS8tBqCCc7KZZFyTaS8xlsRrrCkrvJUDNV7WWPpOuJJeRP7euhTstwh
 ebL/UcLEBiUma3c6CrgxQyipts0UKTnUPL3R6EHX0kUINKaYfKbp9jbzd6wvBd6wfG
 6IhMxeshuBPldV+QyI+86eegFILG1eTKKru8hvXZ1mUfEUygkgtmjKrjWREO+LQJRe
 iCVHHcFe2CBrA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>
In-Reply-To: <20210224105052.42116-1-hdegoede@redhat.com>
References: <20210224105052.42116-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Fix HP Pavilion x2 10-p0XX
 OVCD current threshold
Message-Id: <161427326308.47478.15671491740875437527.b4-ty@kernel.org>
Date: Thu, 25 Feb 2021 17:14:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Wed, 24 Feb 2021 11:50:52 +0100, Hans de Goede wrote:
> When I added the quirk for the "HP Pavilion x2 10-p0XX" I copied the
> byt_rt5640_quirk_table[] entry for the HP Pavilion x2 10-k0XX / 10-n0XX
> models since these use almost the same settings.
> 
> While doing this I accidentally also copied and kept the non-standard
> OVCD_TH_1500UA setting used on those models. This too low threshold is
> causing headsets to often be seen as headphones (without a headset-mic)
> and when correctly identified it is causing ghost play/pause
> button-presses to get detected.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bytcr_rt5640: Fix HP Pavilion x2 10-p0XX OVCD current threshold
      commit: 1045a5c04e16716870cc953872e703258e7896de

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
