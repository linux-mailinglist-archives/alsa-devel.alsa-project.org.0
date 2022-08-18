Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D89235986FB
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 17:12:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A3F91671;
	Thu, 18 Aug 2022 17:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A3F91671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660835536;
	bh=jEaSi3//ZcjcSJYCTtWKOStKXxh0VlQ4sbaPnZZ6OwI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LMCCdWRvBzgtN1crXxiczZtr5hjMHF/1l2KjGf31j71IRjLc9lQQ3lsahjZaXRraV
	 5NVwP8/DV9iRtb0d+qd1wGb0tPAH8Anu5mm6B0BGPDFL0dKUBnPL2LJNff8E9/Gb6U
	 dWw+B4FCXMMnp3xVqm0OJsvIDxgp2lFEn3LWhvLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1723F80495;
	Thu, 18 Aug 2022 17:11:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B253F80430; Thu, 18 Aug 2022 17:11:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99005F800E9;
 Thu, 18 Aug 2022 17:11:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99005F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jo4OYGwk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3A404B821E3;
 Thu, 18 Aug 2022 15:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C6EC433D7;
 Thu, 18 Aug 2022 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660835466;
 bh=jEaSi3//ZcjcSJYCTtWKOStKXxh0VlQ4sbaPnZZ6OwI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jo4OYGwk/jSlf28wKYzzhjOGpVpdyfENoT6QGXc4wMosFOAEQh3hPqERuX88JYG+/
 jG6Vb4m5uebWNPmTrLnU7IiQxykWAv7Gn7Y/DuOtEllEoHgWap4vLPxCEtg8JmfxM8
 ciOIPOjk3r824OoSssFKeGA/Dfu3pDcB63UScGcGXV/2IxpJN249hkWsGtx2TYHdRc
 FmuYEIq15iDFuGBnaIvNCzVo0L1SSVywNPmZt+OJ/DrEnJIXMy2I9sd9kwtibrI9pn
 kkscqt/2s4sJpTFBRosK1GjdHaYAOGS/JFYZ97U40KolHvOt435U8zAKxi1gjbRE52
 2z1tk55KOi1wg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org,
 Yang Yingliang <yangyingliang@huawei.com>, alsa-devel@alsa-project.org
In-Reply-To: <20220818081751.2407066-1-yangyingliang@huawei.com>
References: <20220818081751.2407066-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: SOF: ipc4-topology: fix wrong use of sizeof
 in sof_ipc4_widget_setup_comp_src()
Message-Id: <166083546318.130965.12497020446854226805.b4-ty@kernel.org>
Date: Thu, 18 Aug 2022 16:11:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: ranjani.sridharan@linux.intel.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com
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

On Thu, 18 Aug 2022 16:17:51 +0800, Yang Yingliang wrote:
> It should be size of the struct sof_ipc4_src, not data pointer pass to
> sof_update_ipc_object().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-topology: fix wrong use of sizeof in sof_ipc4_widget_setup_comp_src()
      commit: ecdb10df7e0d83bfd12fb8f71e28ea4753e3716a

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
