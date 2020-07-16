Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5800E222F7B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 01:59:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 084E71661;
	Fri, 17 Jul 2020 01:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 084E71661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594943971;
	bh=Y7YbYdRW8LuVo4MQyf5O2z9SNu58bMqNl9y5bmX9evY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bAdwKT1q0GnBxv2xVL8h1MkOGE82OSC3MsmVg7F7Zaze3gV4ESCW+PiUTA09QyAl7
	 JI8FflDFNEa8bek8XP0RTpY4AQsRh5dlLbN9YcqyyJMEj5TYRwt0U7pzr+ovRnum0C
	 lvITiDPwEumxSpy+sj+kzuNA/wtqvAaxpx/kXPyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D85FF80276;
	Fri, 17 Jul 2020 01:57:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40FD2F8014C; Fri, 17 Jul 2020 01:57:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94AA7F801EC
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 01:57:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94AA7F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ppygDrys"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2226207BC;
 Thu, 16 Jul 2020 23:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594943820;
 bh=Y7YbYdRW8LuVo4MQyf5O2z9SNu58bMqNl9y5bmX9evY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ppygDrys7CZnZC4xycnhMNo2yXLLy48Un80UKZz/YbBf8UfKU0BkHpYanUujFgaJe
 bmRWn0VKWQsZMeQke70aYi7vgAyPVLDcwHQ8jkChuKmx7LiJT5+EscD/WbmluXY4nO
 MzPMyfkXHZ9YeOrWmlDEVqmh0RWoWwFFCUMgzRf4=
Date: Fri, 17 Jul 2020 00:56:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <87y2nk2tfd.wl-kuninori.morimoto.gx@renesas.com>
References: <87y2nk2tfd.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: ak4613: switch to yaml base
 Documentation
Message-Id: <159494380522.42174.16007156277692941427.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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

On 16 Jul 2020 09:31:01 +0900, Kuninori Morimoto wrote:
> This patch switches from .txt base to .yaml base Document.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: ak4613: switch to yaml base Documentation
      commit: 5b235b5522bf38f65cc76a9a008f179c37e0eb81

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
