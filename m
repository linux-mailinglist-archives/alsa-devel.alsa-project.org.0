Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D31168C046
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 15:38:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84BE41EB;
	Mon,  6 Feb 2023 15:37:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84BE41EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675694297;
	bh=yHYu+XzXlkG74Rowq5WgT+fYwuPOyt6C56eAXo8PVUg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=U8fp93y5zwrWlfk7fA62KLYJS7/uLUQjSWgspi8PUgtTdLadZhxHM7w70ip93iOy7
	 dXnxn3lveirHw6E7S2Q06AU5Y3sDzMvFlHVB/6RXqceJfBOjpEC+6EINGB9v/VsovW
	 LmVEZGzHMUxvJJHWjC8Nais59SWGxSJ1aW5H0DNE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4989BF80534;
	Mon,  6 Feb 2023 15:36:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B2D3F804F1; Mon,  6 Feb 2023 15:36:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72AA5F800E3
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 15:36:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72AA5F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Nmb59Yip
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 136D2B8118A;
 Mon,  6 Feb 2023 14:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1CFC4339B;
 Mon,  6 Feb 2023 14:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675694198;
 bh=yHYu+XzXlkG74Rowq5WgT+fYwuPOyt6C56eAXo8PVUg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Nmb59Yipa2fzBmHojOzcZen7S/Co8Mop20HmPhtR73KjYoiorQJHzu3bfutBqp7c9
 mbY5KqUw8sklTjix2HnauJJcFfbXa9GAK+7TNRbo70Kd+4YMnohq3duFf0ox0/LDmG
 PhcKX6Mx8/vawf4txzUiQL5YaOQVNAFCcxnfEBGSu19sQ3KzVnDnTkymIk8FcbJ3am
 yi6IxucxGlO5w/v/UlwE1K9ZCXw/JNTf23k5VVkfNtBlH0iZYRMYzVN15PeRkH+/Jk
 1WiaFeIsDSD80Y0Ay2EmiaWbUYzDfhLDsRKCYBY2XkVid0vEa8pOXqPKQ4vfwbEJyl
 cLP11lzFcg8vw==
From: Mark Brown <broonie@kernel.org>
To: herve.codina@bootlin.com, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230206075518.84169-1-jiapeng.chong@linux.alibaba.com>
References: <20230206075518.84169-1-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: codecs: Fix unsigned comparison with less than zero
Message-Id: <167569419690.112200.18153004460501588598.b4-ty@kernel.org>
Date: Mon, 06 Feb 2023 14:36:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 tiwai@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 06 Feb 2023 15:55:18 +0800, Jiapeng Chong wrote:
> The val is defined as unsigned int type, if(val<0) is redundant, so
> delete it.
> 
> sound/soc/codecs/idt821034.c:449 idt821034_kctrl_gain_put() warn: unsigned 'val' is never less than zero.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Fix unsigned comparison with less than zero
      commit: 05f5504b161054bdce74eef5d9ff602bbebaeca8

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

