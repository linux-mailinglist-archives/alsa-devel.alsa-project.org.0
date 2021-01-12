Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF4F2F3607
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 17:45:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B5931698;
	Tue, 12 Jan 2021 17:44:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B5931698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610469904;
	bh=kbj8SXKFJXdKJgbNJa1FfNWHui3bdjeRBJevUjZJQfQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ThUok1U9Yv5PNzh+LJDJMIRk5bMScT2ugawh+Bvl2xps/mTvtKIoBn5VFZTJ36SwP
	 qfAvFfiu74xBnd0U8TH91+WtdXpn8J81cEc74oaNz1QXbEuCaL7bVmPyvku0aSzedh
	 k1IKPxHb170cdX3DtgYPYMn1ab3jCct+7nJRM2Sg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E911F804D8;
	Tue, 12 Jan 2021 17:42:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F2C4F80279; Tue, 12 Jan 2021 17:42:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 147E3F80279
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 17:42:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 147E3F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IuV1pjPP"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD52B2310E;
 Tue, 12 Jan 2021 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610469771;
 bh=kbj8SXKFJXdKJgbNJa1FfNWHui3bdjeRBJevUjZJQfQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IuV1pjPP9SMAdVIqzcPGTTlwL8cp8PYivTfkPvcX7bhef/7vcRSvEHojddwujiHyZ
 rxHnOneAyQrrdMlMBVDg5pi1tOo1x7vDv7XtAxpgXGZTmY5eMZIou8DACHACrD79Cp
 fzop9rGRbJxQKB0NXkLAbJki8QEjqX3w1lwcNqYBX2Wad7W/J5yoELyfml+AFRGz5c
 0D76mehR+o4FHaVKmjie72gcEJWJQw2UfNze5ytxDV1tV0mOURu3309MmLtNpQKM9c
 bAJcfaLAmCBKc078SQApCMtL72x3Lvl2SSZkYARlm4kkDynHeEgKQfxsP8oBc0DAmq
 vHLpbQc07KFLA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20210112101725.44200-1-hdegoede@redhat.com>
References: <20210112101725.44200-1-hdegoede@redhat.com>
Subject: Re: [PATCH] ASoC: es8316: Fix possible NULL pointer deref in
 es8316_disable_jack_detect()
Message-Id: <161046972101.805.13555047176109999801.b4-ty@kernel.org>
Date: Tue, 12 Jan 2021 16:42:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: russianneuromancer <russianneuromancer@ya.ru>, alsa-devel@alsa-project.org
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

On Tue, 12 Jan 2021 11:17:25 +0100, Hans de Goede wrote:
> sound/soc/soc-core.c: soc_remove_component() unconditionally calls
> snd_soc_component_set_jack(component, NULL, NULL); on any components
> being removed.
> 
> This means that on machines where the machine-driver does not provide
> a jack through snd_soc_component_set_jack() es8316_disable_jack_detect()
> will still get called and at this time es8316->jack will be NULL and
> the es8316->jack->status check in es8316_disable_jack_detect() will
> lead to a NULL pointer deref.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: es8316: Fix possible NULL pointer deref in es8316_disable_jack_detect()
      commit: f2973a1de9d9890b6ac712fb1825d3449ee9cc93

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
