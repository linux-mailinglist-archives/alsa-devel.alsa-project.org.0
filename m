Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6779D5676E3
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 20:53:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B1B116D5;
	Tue,  5 Jul 2022 20:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B1B116D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657047205;
	bh=W7RTkFS6YzkGkD3g5OYSBQmH5HUSU27tkgRa/tx7oxQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WqwfAdW7rSkJwBxzcVrBJRF6nZwBdJezXXPISwKNvpRT5+XBDz71m8+O8uuD39Q+N
	 PkM4/6JcEHSdWf/186thuwrXtWkb0JvDRLV7aViIgxHMogf/y4Ud9bB4hClABDQCaV
	 /4SkiGZdmOwtCu8JO9Tht2IF3axBhM7DVwerznf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79B75F80212;
	Tue,  5 Jul 2022 20:52:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3595F8015B; Tue,  5 Jul 2022 20:52:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C315F800CB
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 20:52:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C315F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RYKVH3FE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 352CE61A71;
 Tue,  5 Jul 2022 18:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09986C341C7;
 Tue,  5 Jul 2022 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657047136;
 bh=W7RTkFS6YzkGkD3g5OYSBQmH5HUSU27tkgRa/tx7oxQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RYKVH3FENZs6v0A6Q3yi9Jv7n4j8GGqcq9dXknpgBFC+khxvV8JW7puPVPrBCSjbG
 xSTDbY357Y7IudSfSuO5TjUFyNEB1O1hrEy+nCiKYdwMciwJMtjNM2edBHI1QYOUZT
 OgARrgLzacgA5d1MRfIfUqvFLwBLG2Wdp1Pq3WJ+7m4x7S7NxZrGpHJDyk4mE74HcZ
 Aw7ShyGA5vfzshaaZtex7PYjYs5mzRZrBZy5tWIvtBca1kkRZ5jdBQP1oQLWflqvrg
 r2XhLFoVO4ZAcaWlAU3bzU5tKcuxQfcIlYqovF5S2gloUR/F7zWfjStqp3wjIrsBXh
 mPM1LcKkCvxlA==
From: Mark Brown <broonie@kernel.org>
To: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com
In-Reply-To: <20220603170707.48728-1-andriy.shevchenko@linux.intel.com>
References: <20220603170707.48728-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: madera: Replace kernel.h with the necessary
 inclusions
Message-Id: <165704713474.1050281.11786579808671554712.b4-ty@kernel.org>
Date: Tue, 05 Jul 2022 19:52:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: rf@opensource.cirrus.com, ckeepax@opensource.cirrus.com, tiwai@suse.com
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

On Fri, 3 Jun 2022 20:07:07 +0300, Andy Shevchenko wrote:
> When kernel.h is used in the headers it adds a lot into dependency hell,
> especially when there are circular dependencies are involved.
> 
> Replace kernel.h inclusion with the list of what is really being used.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: madera: Replace kernel.h with the necessary inclusions
      commit: dcc165d6179c3934b93b8c3bffde1ed9710fd7ef

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
