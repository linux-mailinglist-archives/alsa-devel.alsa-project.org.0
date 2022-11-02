Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA06961644C
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 15:01:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 354F91685;
	Wed,  2 Nov 2022 15:01:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 354F91685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667397719;
	bh=Spa3gPaTmB3aNC2He4rWPi2auycIIMZVVH3113FcR60=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ghY79WxuAg/EEX0DhZhl7msRJdjpiH/go+vH6qe5JqkWCeTFsaSxegiB23+IpshHA
	 9lEZbJwO+nwmOB3yLtgYxvg6RKbJd/OiAoLEfsa24bXoS0e7oZCh3aB5kwAU0qQIBc
	 TKW+Umr71UJ10CazlMIAOzxKYH/KVKaxRzRHmUU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C627F801D5;
	Wed,  2 Nov 2022 15:01:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FFE5F8026D; Wed,  2 Nov 2022 15:01:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A81CF80155
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 15:00:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A81CF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K66ZmBsQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9D9F861985;
 Wed,  2 Nov 2022 14:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41C4C433D6;
 Wed,  2 Nov 2022 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667397653;
 bh=Spa3gPaTmB3aNC2He4rWPi2auycIIMZVVH3113FcR60=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=K66ZmBsQQSgFBG67uso/hrT5+EeR7fSA70UVKnpDzTmaFEYfholgpjRN+Z3k4TJ23
 +QkO+/P8pioAaeiTztrzKY0Wo2QFvqagfOihHoXwKhp3nJz0WaySkTNLtTvDFuT1gu
 f8CpdeB1kz8sGU/fS+IwPGTdvQ4/O52y0zTqqUSvJv0HQIwQglMVwNMYuaArz67sxj
 VrmnrgghvVtypyhz2HzvmiGMtWYdS9giOfY7OMUJT8LnUgyGhxlJkWxa092h3wcVWQ
 FxVw2JyATQPAxkhGTfbAqMka7b/gPg7uNasga1BVmxSXgmCCAiPv7AtCl1vNfbRhSM
 toYnjE7MWR4SQ==
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>, alsa-devel@alsa-project.org
In-Reply-To: <20221021123849.456857-1-yangyingliang@huawei.com>
References: <20221021123849.456857-1-yangyingliang@huawei.com>
Subject: Re: [PATCH v3 1/2] ASoC: Intel: Skylake: fix possible memory leak in
 skl_codec_device_init()
Message-Id: <166739765157.96602.11670077664480638231.b4-ty@kernel.org>
Date: Wed, 02 Nov 2022 14:00:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: tiwai@suse.de, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
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

On Fri, 21 Oct 2022 20:38:48 +0800, Yang Yingliang wrote:
> If snd_hdac_device_register() fails, 'codec' and name allocated in
> dev_set_name() called in snd_hdac_device_init() are leaked. Fix this
> by calling put_device(), so they can be freed in snd_hda_codec_dev_release()
> and kobject_cleanup().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: Skylake: fix possible memory leak in skl_codec_device_init()
      commit: 0aa60ddc219e7bac967605ecbe46f2f6cd24ee9c
[2/2] ASoC: SOF: Intel: hda-codec: fix possible memory leak in hda_codec_device_init()
      commit: 0d183c27ed30a3b21a8fbd6db4d1d7779faf1503

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
