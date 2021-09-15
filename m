Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF0240C83E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 17:24:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AC621832;
	Wed, 15 Sep 2021 17:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AC621832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631719465;
	bh=Iq2sTH/qaofQ6nEZPTBwlq8y5cvB7EpizEHayA1L/JY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jKW8U/7M4F1LfeH3LlyLHh1yIcHdRYFfS0AZaP32LVFwMh9QNajEg+5K4NBAJ8wmy
	 YyFADFyWmtXIWD1UJlAHcccJIW/r7AwJDIxuFzD6sApMpoRDK0PgSYE7rZweoDJRz0
	 6nUZIrQ0F+dqs7ax3IPAXcAWvVrJX6MTRPJgHCkw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75447F804BD;
	Wed, 15 Sep 2021 17:22:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7826F804BD; Wed, 15 Sep 2021 17:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C144DF80227
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 17:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C144DF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PTwW6egG"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E12F660698;
 Wed, 15 Sep 2021 15:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631719359;
 bh=Iq2sTH/qaofQ6nEZPTBwlq8y5cvB7EpizEHayA1L/JY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PTwW6egGz/krolNSjeCL+AgsNjdoBFmMRI+WQ8GmJtH74J72fj1fmYOo6mSD627UR
 nyYIL7CdMwRnym8fr22qINBSlyUA+KkJPZT2mJU3WygeFvyDRx/g2ZNwRloJNXA9cW
 G1eBZ/TwOKEyLxFuAFF+SUr76xEZ3+cg7BmTchohgbh7c3guN7dlQKrkuQnYVQeuTm
 KmxKbdfWX4ytnwS1ewyGXBeRG0mTNqOKlYwt/A0fCvguNpNXH04PnddbO+pjUKEITQ
 spSYwmlxzc9JwzPpOEGqBuKrOe7pR9nhK7NN2Wrtcf0I8vW91NswKocU25+fvRWtaX
 vz35CvADgDDVw==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bixuan Cui <cuibixuan@huawei.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH -next] ASoC: mediatek: mt8195: Add missing of_node_put()
Date: Wed, 15 Sep 2021 16:21:44 +0100
Message-Id: <163171901942.9674.2137516879503383986.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210911081246.33867-1-cuibixuan@huawei.com>
References: <20210911081246.33867-1-cuibixuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 Mark Brown <broonie@kernel.org>, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com
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

On Sat, 11 Sep 2021 16:12:46 +0800, Bixuan Cui wrote:
> The platform_node is returned by of_parse_phandle() should have
> of_node_put() before return.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Add missing of_node_put()
      commit: b2fc2c92d2fd34d93268f677e514936f50dd6b5c

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
