Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5A0607A01
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 16:57:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77435B276;
	Fri, 21 Oct 2022 16:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77435B276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666364241;
	bh=PfCE7F4gIaJKXk+RHMSHpvuvVrLqrVsWDRkE3Np70P0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MOzT//5a9/K2dbiO/Whao2UwmCl1V2Zn23Zjnl1BxZXXoZrWPSJx9nB24Uw5aJNk1
	 7/gFxfOvVGNt8f3QqZVAVJ3WvC5skFg0uqQqEGAATEQ1SzQtXNQ5izeAavHzNKnnaT
	 voPnbVsuBwtYixAZOWATIbqUR9B4f4bT+ImWovb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC107F800B5;
	Fri, 21 Oct 2022 16:56:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23B71F8021D; Fri, 21 Oct 2022 16:55:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB3CFF800B5
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 16:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB3CFF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HfP19iLV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F17BFB82C38;
 Fri, 21 Oct 2022 14:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA7BC433D7;
 Fri, 21 Oct 2022 14:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666364154;
 bh=PfCE7F4gIaJKXk+RHMSHpvuvVrLqrVsWDRkE3Np70P0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HfP19iLVSNVoj8Xm9y3C+QcARpCzI2k0v8ly+malkx3+U/AwtznnBphSIjdtt3r+/
 1D61ZBneMSlrYhZdi7ESE7/9AcSAkZpDKcyj5Kn/5V0vfmYn1w2tV/GGY06jfxpnw2
 br+yJOkQcvowj8CozTERybWQX1lq/WTgnjvxkgKcoyZkZQJwaj43Eysbcp22bYMp8v
 +RMC6DWspGXLMCOguzkqI7KNNwnAIixRTZ9KlUQzCGwIkSCkTCt756CaTaIQHSKmR9
 Q4uVrjXR+6BRy7IU41/uA8VvHihgU0mg4JWaF2jKWNkJx8uwUVk66uUru+nH7lauIx
 /CFi6mfostH/A==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Yang Yingliang <yangyingliang@huawei.com>
In-Reply-To: <20221020110157.1450191-1-yangyingliang@huawei.com>
References: <20221020110157.1450191-1-yangyingliang@huawei.com>
Subject: Re: [PATCH v2] ASOC: SOF: Intel: hda-codec: fix possible memory leak
 in hda_codec_device_init()
Message-Id: <166636415322.251337.7463705190984318156.b4-ty@kernel.org>
Date: Fri, 21 Oct 2022 15:55:53 +0100
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

On Thu, 20 Oct 2022 19:01:57 +0800, Yang Yingliang wrote:
> If snd_hdac_device_register() fails, 'codec' and name allocated in
> dev_set_name() called in snd_hdac_device_init() are leaked. Fix this
> by calling put_device(), so they can be freed in snd_hda_codec_dev_release()
> and kobject_cleanup().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASOC: SOF: Intel: hda-codec: fix possible memory leak in hda_codec_device_init()
      commit: e9441675edc1bb8dbfadacf68aafacca60d65a25

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
