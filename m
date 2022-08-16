Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA43595DAC
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 15:49:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B434164D;
	Tue, 16 Aug 2022 15:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B434164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660657760;
	bh=VqW5rsrdYdwTT0k7E37ysrJSvlmvley2MOwxln3gKdI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BnWn7RGxUHmzCFxY/5nEqlcm3b2aukxQVm9y/iaHMaDpDrb9JzPQe7VLHxT2wBvib
	 0ba4vsTRjNIbBjuWvSUqDWUjssfJr7Lq9xRS99hjGfYKoRNUUcUO/e0c3q/7iqQHJV
	 1SrK462+4EQ4BQkOCKn1mSWoqAMi8wAYQbP773Ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A98CAF80082;
	Tue, 16 Aug 2022 15:48:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F09B8F80424; Tue, 16 Aug 2022 15:48:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D03BF80095
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 15:48:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D03BF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cQvp6SbN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2E2CB81A58;
 Tue, 16 Aug 2022 13:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F5BC433C1;
 Tue, 16 Aug 2022 13:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660657691;
 bh=VqW5rsrdYdwTT0k7E37ysrJSvlmvley2MOwxln3gKdI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cQvp6SbNd74Y82Is4uZBQiK6udaGbS+bmr8vSlR23zstLx/tKADKNxa6Vmdmo1bOH
 +4lXafbw/qfWRdN1IvalcY0uHit7qXMkvCVKGboNV5TI7WDBDg/5jcdZB1JofZ9xND
 Mo0+clZnEBmXBsyKpQzY+7JY5PES2MOxpRMg/1hG1HSdtn/SY5tkLuR9FM5j5jZVL7
 pyAT2JHUHs0p6477tYIlXbdHct7e+znN1We2uKRBLOQRfkBhbyjR5tu2lQzPJZDPHU
 gkMYZGxx4zWLFTS1YzGyKcwBQsE4LgZzguMFfSu3XXHuIXcVRF7CsCOse4/iaFbds4
 mUGHpVyOc7pdw==
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org
In-Reply-To: <20220804091800.744316-1-zhuning0077@gmail.com>
References: <20220804091800.744316-1-zhuning0077@gmail.com>
Subject: Re: [PATCH v5 1/2] ASoC: dt-bindings: Add Everest ES8326 audio CODEC
Message-Id: <166065768874.1387305.6708346550854638085.b4-ty@kernel.org>
Date: Tue, 16 Aug 2022 14:48:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: devicetree@vger.kernel.org, robh@kernel.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 Zhu Ning <zhuning@everest-semi.com>, David Yang <yangxiaohua@everest-semi.com>
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

On Thu, 4 Aug 2022 17:17:59 +0800, Zhu Ning wrote:
> Add device tree binding documentation for Everest ES8326
> 
> ----
> v5 tested by dtschema
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: Add Everest ES8326 audio CODEC
      commit: 8c6789f4e2d4ee7d6c8c60daa88ea7a4c4cf6779
[2/2] ASoC: codecs: add support for ES8326
      commit: 5c439937775d77a334696a98fb2a25dee72ffa2d

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
