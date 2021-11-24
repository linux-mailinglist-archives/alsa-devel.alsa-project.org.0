Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A794C45CB32
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 18:37:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2700617B5;
	Wed, 24 Nov 2021 18:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2700617B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637775477;
	bh=TMAm6b8loxMSExOSOmxeqBHfwH191qPg5um06p82e84=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n+lvSmhAgIe/nSDP606ytKPlEt8i4uK4FTdBfDOHZyRP7MxhjaOdx+RgT4hIjU7f5
	 yvEW/JypzceYazHszQw6NwO4HwvKSPHNZFPgXOrZClhj7dE0/77T0bnecv9jHxxdhx
	 rcjP4/SqmfmNvrhIPKqvkewXHbvaqyXWZJsuRWqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97B1FF80212;
	Wed, 24 Nov 2021 18:36:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ABB2F80212; Wed, 24 Nov 2021 18:36:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AF11F8011F
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 18:36:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AF11F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LjohZlfe"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6168060F5B;
 Wed, 24 Nov 2021 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637775388;
 bh=TMAm6b8loxMSExOSOmxeqBHfwH191qPg5um06p82e84=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=LjohZlfe1jb/TzsPf/XzWOslETjJZUMsgcuWgqYksdvmdRnnNhBp92Td/xX43sitX
 y/ZG5DsvyCyB9hhEJQpXZ+c0E8oLdqa7uyT1mo7IuB+NleaWSB0BDesge/+3XhN4CC
 LXx04OOC1GJ43TZyb66S/SNvsmU1RHDNoKPhZudsASjWhAD67FswkzW05DCbec77z7
 orV6c75xFxwp3lkT05Jl0ARrH6+1XNVon7sFlNkkA75/OYPXiNZjigdUkz48aSnYLq
 BTy1AX0sBGAcnZk46KDiLgpYaXKjgvUaDmu8BQ4uhVB3zS4lHVoqaaWzBhLqsxA302
 EWpio1u0QDZFw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20211122232356.23505-1-pierre-louis.bossart@linux.intel.com>
References: <20211122232356.23505-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: Intel: soc-acpi: add entry for ESSX8336 on CML
Message-Id: <163777538711.2712035.5582870807573071685.b4-ty@kernel.org>
Date: Wed, 24 Nov 2021 17:36:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Huajun Li <huajun.li@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
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

On Mon, 22 Nov 2021 17:23:56 -0600, Pierre-Louis Bossart wrote:
> We have configurations for this codec on APL, GLK, JSL and TGL, somehow the
> information that some designs rely on CometLake was not shared.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: Intel: soc-acpi: add entry for ESSX8336 on CML
      commit: 8a6cc0ded6d942e4a506c421c4d87a634bda6e75

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
