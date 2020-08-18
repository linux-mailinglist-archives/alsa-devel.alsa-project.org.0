Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E50248C76
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 19:06:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7795D17BE;
	Tue, 18 Aug 2020 19:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7795D17BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597770401;
	bh=y9TN4phkhhBQNDbGO5H7B6xYCnyktqs5nD/Kw+nJ+Ag=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BvSJtQTijR26a0X6Z8khwCJBcdJF2wC7LY1cr8OsoE0fENgfqI7YYv2CSHBqMWAFx
	 JjouHQ7YxliL6btPBk4kRE9+UtmYef9Gd7yjICIhVUBu8I6543O0KKbWnLVC06wT54
	 zIR8ofXXXhw5UuyvaOhS67BAtqKP7At7+ia9BFrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B6A4F80367;
	Tue, 18 Aug 2020 18:55:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E87DAF80368; Tue, 18 Aug 2020 18:55:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AF9FF80363
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AF9FF80363
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hlOqCKdw"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C9AF207D3;
 Tue, 18 Aug 2020 16:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769741;
 bh=y9TN4phkhhBQNDbGO5H7B6xYCnyktqs5nD/Kw+nJ+Ag=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=hlOqCKdwFIEnOtvUgBLIn+Adg8waBmlgIxJ942mX0fZm9SXs0lqLpTjG/0GdeOygX
 EPn4Mh1BeW2hKQ/4k+YxbR7zz7kNnWh1nrtOMv7jbE1OfYDXFBoS/UbLihYGrx+ezB
 awKza57J8Uz4CaWGcXhk9oFb3QvabXovQILEh6Kk=
Date: Tue, 18 Aug 2020 17:55:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200812094631.4698-1-michael.wei.hong.sit@intel.com>
References: <20200812094631.4698-1-michael.wei.hong.sit@intel.com>
Subject: Re: [PATCH v2 0/3] Codec workaround
Message-Id: <159776961933.56094.23327150386662621.b4-ty@kernel.org>
Cc: cezary.rojewski@intel.com, a-estrada@ti.com, andriy.shevchenko@intel.com,
 zakkaye@ti.com, pierre-louis.bossart@linux.intel.com, jee.heng.sia@intel.com,
 tiwai@suse.com, liam.r.girdwood@linux.intel.com, dmurphy@ti.com
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

On Wed, 12 Aug 2020 17:46:28 +0800, Michael Sit Wei Hong wrote:
> This patch series enables some features on the tlv3204 codec and also fixes some issues faced while testing
> 
> v2: Fixed the build error from snd_soc_component_read32
> v1: initial ASoC: codec: tlv3204: Codec workaround series
> 
> 
> Michael Sit Wei Hong (3):
>   ASoC: codec: tlv3204: Enable 24 bit audio support
>   ASoC: codec: tlv3204: Increased maximum supported channels
>   ASoC: codec: tlv3204: Moving GPIO reset and add ADC reset
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: codec: tlv3204: Enable 24 bit audio support
      commit: dcd79364bff36ce1341a59be8142ded5b7da7d19
[2/3] ASoC: codec: tlv3204: Increased maximum supported channels
      commit: d1c859d314d87c6f4dc09c3d7cf6f3ec9f44bcc5
[3/3] ASoC: codec: tlv3204: Moving GPIO reset and add ADC reset
      commit: 9d4befff5a959e5f2f94357b3554a6929f596e15

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
