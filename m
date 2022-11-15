Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F45629F4E
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 17:43:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 205031640;
	Tue, 15 Nov 2022 17:42:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 205031640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668530591;
	bh=MCL7/zKeDqjuXRH+QYYELKKcFNovM0JNSv98DVO5jac=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BNmD6XLlbmkW8NI1gdt0AwcfTP3oiPNarN/GPZNczRiBxEUT1ip8nYqi/BbG0lhqh
	 FR40dwHC+e3Rio1U/lcgfWZeTU6D/okTPLjOiUqerAZpRfwZT0ryW0PvuJ4nLGgESy
	 GpefzFKQ3UETOh7OO7yEI0CXzSs6icfZgCP0T/Ds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A30CDF8016D;
	Tue, 15 Nov 2022 17:42:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82C4FF80171; Tue, 15 Nov 2022 17:42:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F39EAF800B8
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 17:42:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F39EAF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DV2Ghcs7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E48FFB8199C;
 Tue, 15 Nov 2022 16:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30FD2C4347C;
 Tue, 15 Nov 2022 16:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668530528;
 bh=MCL7/zKeDqjuXRH+QYYELKKcFNovM0JNSv98DVO5jac=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DV2Ghcs76E6oXFu42CBX7XCpUBMhWoVhxILV4qYOjj1N4QET8VdxHHdfvMWeDq/3m
 uTSbC+MqnnUekMj4eSBswx0OXhYTt1ComYcenUTzKGqG3xgUk5jXjaucaE3567r0LN
 F2O+xgqRQ1AoZiNa6cHe0MC88B4dUU7MTndIj143o9MRuqOmIgrkaYXiTlTgJw1v3W
 kIlgGFYUayOjLAF23+isyNGNc9FFfkw6odsdNLloZfnY+hIhLRFat1UABppTN/ZnJy
 n4bihnehB0SVkjD5ycRgrPlqqceyKZtqDS4BuduCQvikia2fbjvV6qmNhASSsFhLYf
 kon0GyF/pPpuw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221115065430.4126-1-srinivas.kandagatla@linaro.org>
References: <20221115065430.4126-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: tx-macro: add dmic support via tx macro
Message-Id: <166853052539.230692.12211909671431172423.b4-ty@kernel.org>
Date: Tue, 15 Nov 2022 16:42:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
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

On Tue, 15 Nov 2022 06:54:30 +0000, Srinivas Kandagatla wrote:
> DMIC Paths into LPASS digital codec can go via tx-macro or va-macro codec, add
> support to tx-macro path as va-macro path is already supported.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: tx-macro: add dmic support via tx macro
      commit: 710ccba0cf0e12c7c29d862fd6192d8fe46c5fe7

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
