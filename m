Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E343A4D0897
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 21:40:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 682B9176E;
	Mon,  7 Mar 2022 21:39:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 682B9176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646685610;
	bh=KA27SdryLbPnkh3rfZAdOozWzNDVVpE2KeuHZzwvVVw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vbaKXbCr9eVEvlFFAOn+tN+t4+JpdjmExzodXyj0R2wBQHDD4F3olmvkNO5BRFJLD
	 ueA/tOG5/4qe3WP5th3TLBEuk0iUW6Pw8rPXcvIO8bajIxdXpUGJendkieZd8OCqr1
	 gCN8sQQyQmpM+X7rBvYE8KjTccs9VeeEB+zY6DrU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D35EFF8020D;
	Mon,  7 Mar 2022 21:39:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6877AF8013F; Mon,  7 Mar 2022 21:39:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9168BF80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 21:38:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9168BF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="szA9oA7W"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56A91B8170A;
 Mon,  7 Mar 2022 20:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41E4CC340E9;
 Mon,  7 Mar 2022 20:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685533;
 bh=KA27SdryLbPnkh3rfZAdOozWzNDVVpE2KeuHZzwvVVw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=szA9oA7W47vE/7bENsFKNQzaXoniTyADLF6/Uga+raJym/KdYMs2ya+fEmIV2SsN+
 WaBQYa5xlyV5I6uNXazuBH0D9YPKc9SH8HnkS032P+t0Ht+P5kOHTlXO+bnKeEDJaY
 dsUNQv7Cc7DUyGtGxDIZlaC65BKMZ6d+WFcKJBC45n1lVMMydolNkygGhqHuh5W2t2
 VcHHeY6dyBO4TTbq3urCIAKsV+sQcvDCsdZs9lLnkpkYEFeGxOMuRKwdN0RlzZOAlW
 2HzXFa73G/SeC2RYvMoDwu4HZr9TcZ0mKtS32VvT1TUdOgm+dC99mmeXhZhdcc3k2M
 m6wbQWN2V2uLQ==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
References: <20220303173059.269657-1-tanureal@opensource.cirrus.com>
Subject: Re: (subset) [PATCH 00/20] Support external boost at CS35l41 ASoC
 driver
Message-Id: <164668553095.3137292.5295823555240044073.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:38:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
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

On Thu, 3 Mar 2022 17:30:39 +0000, Lucas Tanure wrote:
> Move the support for CS35L41 external boost to its shared library
> for ASoC use.
> This move resulted in cs35l41_hda_reg_sequence being removed,
> and its steps were broken down into regmap writes or functions
> from the library. And hardware configuration struct was unified
> for its use in the shared lib.
> While at it, some minor bugs were found and fixed it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[01/20] ASoC: cs35l41: Fix GPIO2 configuration
        commit: 03a7895ee701e873c88c06bdb830ff40adb2be73

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
