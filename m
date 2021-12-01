Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB44465597
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 19:35:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C30126A3;
	Wed,  1 Dec 2021 19:34:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C30126A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638383733;
	bh=lBaPOUZJmUtbZKlgrSKtTk0qMpZA6cIcxSaxVjlcZyQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gqAiC8nywT0tPQgekqRVhZfupc+VkKCt1l75yv3KrSOBMnHmkmZcqAzwgfG0Fs05T
	 SXyHJFCKxusQmIpUUZN1dtTEelAxwb5iIcwvKi5ZcAOlnh6Une1aTt3X4NJRZwu91a
	 LyV2jKNPbkMlw80Yjo9mIokDp9WMeRs1QGItVN30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 331C5F8051A;
	Wed,  1 Dec 2021 19:32:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F308FF8050F; Wed,  1 Dec 2021 19:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94D68F804FE
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 19:32:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94D68F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hG+8g64f"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86B59B82100;
 Wed,  1 Dec 2021 18:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C42C53FCC;
 Wed,  1 Dec 2021 18:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383536;
 bh=lBaPOUZJmUtbZKlgrSKtTk0qMpZA6cIcxSaxVjlcZyQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hG+8g64fYX1CCPqLktdc/KeUe5tTBQhDYMZTSeHWsJtNLBoYztor8Vt9Fb3Tl/auE
 1DNSsWwVj80q9QhNo7ZkT/C701j8mMQJXDoYBVMulierpEv5r2YJZMEOdSvuk0TaL7
 Bl1wCxS7oEC+eKAg5MjZ5nRam7qcjPpIoVVDYzeA/f3reC1jSdgHW9EEYKdih+RzI1
 g4GSHPbQqKXZ03QHrStgE37gFaf99DmWq9/i0bq30KezFTboZ1qxrkuRa0cx+TKl11
 Ei1TJslKP1e4HNadXFp/T4ofIdaZblSEWDTrNalwApMDzFXS1PjYyX6m5y/6P27mSo
 /zCjyEt1W9TMQ==
From: Mark Brown <broonie@kernel.org>
To: Chris Down <chris@chrisdown.name>, alsa-devel@alsa-project.org
In-Reply-To: <YaOS0sBueAfApwOx@chrisdown.name>
References: <YaOS0sBueAfApwOx@chrisdown.name>
Subject: Re: [PATCH] ASoC: Intel: hda_dsp_common: don't multiline PCM topology
 warning
Message-Id: <163838353472.2179787.17911571217332274520.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:32:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On Sun, 28 Nov 2021 14:31:46 +0000, Chris Down wrote:
> On my T14s Gen2 I saw the following:
> 
>     [   16.057258] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
> 
>     [   16.057261] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 4
> 
>     [   16.057263] skl_hda_dsp_generic skl_hda_dsp_generic: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 5
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: hda_dsp_common: don't multiline PCM topology warning
      commit: 11918cdcffb127b6b35fe5c438e2ca8aa78249d0

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
