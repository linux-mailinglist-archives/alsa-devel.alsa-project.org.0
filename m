Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A74CC6248C8
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 18:56:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 446681680;
	Thu, 10 Nov 2022 18:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 446681680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668103013;
	bh=FxlrOm3k1oryHGS8jTyN1bWoydexZZtx5/ml5Tk8Jt8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W/4XPUHt2EcjUiTYjvg8ye/AK/qcyRD8yFQlywqhbiE8iKDFDa5wh54e4MKusrcFo
	 PkEgFFeJJOKkfm5Q/Qczwu4NAI1PWxPlREc7gzJ1NNtbjbzuUFxQRFz77tqkzZ6cqY
	 cKcCwasA8e7vFs38fv3j8Z6RKGhWBMMWv2JSHebg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86A37F80163;
	Thu, 10 Nov 2022 18:55:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0517CF80163; Thu, 10 Nov 2022 18:55:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8560F80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 18:55:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8560F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TtjHb72t"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E7CE6B82237;
 Thu, 10 Nov 2022 17:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35F9C433C1;
 Thu, 10 Nov 2022 17:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668102924;
 bh=FxlrOm3k1oryHGS8jTyN1bWoydexZZtx5/ml5Tk8Jt8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TtjHb72tvvGFPq90H3q0waSH9dvEw77XAIcmCKcnUj2jDkVPE84Qx9MFwtKJX3NEN
 oxqrVCkZypwpJkByeVJuf+rqAazMZAEZ6umg3VEsNoqgMVjG9DdbVCCtxaXhVld4cC
 +iXWH9VdIGoxHLdmhAXL5bkaQkMjeCx9BUBZlmimLNoE/Nuo73s26eWa7If3JNo+Lz
 DO6uYHJKYObRMbhZn46MW3lHeFG3pVOvjbVO/EcthTPr7G9VFWFLyrPOsFdUUwL83o
 +aqh5dVe24kwobybD5ZXp58tPB5aj6aVKhMpDIYW0LKV6DgVgm0cUq3AK7IJNSe4Ut
 e4ujx305fK3PA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20221031160227.2352630-1-cezary.rojewski@intel.com>
References: <20221031160227.2352630-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/7] ASoC: codecs: da7219: Do not export
 da7219_aad_jack_det()
Message-Id: <166810292154.959181.16010183842881956888.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 17:55:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: pierre-louis.bossart@linux.intel.com, heiko@sntech.de,
 AjitKumar.Pandey@amd.com, linux-rockchip@lists.infradead.org,
 Vijendar.Mukunda@amd.com, lgirdwood@gmail.com, jiaxin.yu@mediatek.com,
 tiwai@suse.com, hdegoede@redhat.com, trevor.wu@mediatek.com,
 amadeuszx.slawinski@linux.intel.com, Syed.SabaKareem@amd.com
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

On Mon, 31 Oct 2022 17:02:20 +0100, Cezary Rojewski wrote:
> Goal of the series is to drop any usage of the internal function.
> 
> First, update all users to utilize component->set_jack() and then remove
> the relevant EXPORT_SYMBOL_GPL.
> 
> Amadeusz Sławiński (2):
>   ASoC: codecs: da7219: Introduce set_jack() callback
>   ASoC: codecs: da7219: Do not export internal symbols
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: codecs: da7219: Introduce set_jack() callback
      commit: 4366b7ca88f04237ae654846167db993dbe37397
[2/7] ASoC: Intel: Drop da7219_aad_jack_det() usage
      commit: 9a1fe79daddbdc57307bd7dd9a29ef06aa7b5f34
[3/7] ASoC: mediatek: Drop da7219_aad_jack_det() usage
      commit: 922a5e5a6389da46b51075301440d07e53c600ea
[4/7] ASoC: rockchip: Drop da7219_aad_jack_det() usage
      commit: ebe62df7c50e63d11c7fdfbdff701583cd4f1f3a
[5/7] ASoC: amd: Drop da7219_aad_jack_det() usage
      commit: ba54da32ec683692ed69ffbed5b4afb414def7d2
[6/7] ASoC: Intel: avs: Drop da7219_aad_jack_det() usage
      commit: 7af1ca5bb5e3c2e472a040f8b52382ccc57bb01a
[7/7] ASoC: codecs: da7219: Do not export internal symbols
      commit: c05dff38d21556c532032f63330271b96265d448

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
