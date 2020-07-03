Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2CC213E36
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 19:09:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2820D16A6;
	Fri,  3 Jul 2020 19:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2820D16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593796173;
	bh=u9uVrDTqK0wRptdS3zOB8pENulWvXRF3AfIsNI9ad8k=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EiHLYcBuIdNqZ6hRf7s9xn1S75InfAC0jmgTOiFld2OL51dORwoZyc85rX54gOdsS
	 HIJnJe5M30M9rK061utNlRTkj6UJX+BRkcWY/B1vxt+k1YpEQiKyC3q6C+9vnn6vTa
	 Y/GCQ2oIgbRFK8r8K1vzfg3yC4pCX51DkHYg2MgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F294FF802FF;
	Fri,  3 Jul 2020 19:04:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89BB4F802FE; Fri,  3 Jul 2020 19:04:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56A62F802F9
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 19:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A62F802F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sDxfGx+a"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 804FF2100A;
 Fri,  3 Jul 2020 17:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593795857;
 bh=u9uVrDTqK0wRptdS3zOB8pENulWvXRF3AfIsNI9ad8k=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=sDxfGx+a/PCUNOVR7IqKMtl2Z+/lNrzf0n/dPUk/5Kait88CCJI6/C3a0+0qic7T9
 NuDNRpB9TXciNxnfpqBaSg4VTW6whAi+QYsQgp2TuQLBQvjkFfaSfLXunVIF2qxblV
 uPw5CyqpDwAqa6xHB9pOG0RAu0/oK0Lbbsda8wlk=
Date: Fri, 03 Jul 2020 18:04:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Oder Chiou <oder_chiou@realtek.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200703100823.258033-1-hdegoede@redhat.com>
References: <20200703100823.258033-1-hdegoede@redhat.com>
Subject: Re: [PATCH v2 0/2] ASoC: rt5670: 2 small cleanups
Message-Id: <159379581381.55795.17943057797770768500.b4-ty@kernel.org>
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

On Fri, 3 Jul 2020 12:08:21 +0200, Hans de Goede wrote:
> Here is in essence a resend of my 2 cleanup patches for the rt5670 ASoC
> codec code, rebased on top of broonie/sound/for-5.9 with
> broonie/sound/for-5.8 merged in.
> 
> Regards,
> 
> Hans
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5670: Remove struct rt5670_platform_data
      commit: c14f61a89c1335f95d9b37624ee157fb1fd424ee
[2/2] ASoC: rt5670: Rename dev_gpio to gpio1_is_irq
      commit: 883330c11fa6dca55e30f8612398b3e0abc51dc5

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
