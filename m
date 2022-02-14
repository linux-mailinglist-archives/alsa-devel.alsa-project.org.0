Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E574B53DA
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 15:57:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 781EA17E8;
	Mon, 14 Feb 2022 15:56:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 781EA17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644850660;
	bh=gwcVXSFrQqoddbyPtV8ZiviYsA3eI+Tq3EsDwGCM+sM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l9evZzDqpoIqlwQy1hb0tHodsLpNEX6x/E6NQ7BKMmpvfZ4YR8WF58l8Zbfpa42qB
	 Fe9psyBoOguGQO/Y/ZTsWZr6e0haO923wksPVuZazWajq50mP1YTmNAmAwap0FqYsh
	 ldOf6kwIokR7Qxh4vEJ/ht0XacFHViEazvrgdIyg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B9EBF80515;
	Mon, 14 Feb 2022 15:56:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3184DF804FE; Mon, 14 Feb 2022 15:56:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4C28F800D8
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 15:56:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4C28F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EhhYz1Kv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3DEA2B810E8;
 Mon, 14 Feb 2022 14:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D9CCC340E9;
 Mon, 14 Feb 2022 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644850562;
 bh=gwcVXSFrQqoddbyPtV8ZiviYsA3eI+Tq3EsDwGCM+sM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EhhYz1KvmYXbeyKKBs14WgwIerUSyaxNEZVOUKpE/ZfeDdLVhzj6Def8MJjaTkV+2
 lZ4UIM0heGC6ODQC+9e29XIBzF7vwt/kNmiplEBpvogr0ndrJLc0C9LIV9fH4WtfG6
 LxhdMK8BIZjA45gJRbFzDs1A7gntgqFfNynLn8D7aXCUmvdJCIRS8InXBjODl9vq9w
 3qk2KNE3cpLqyjbS0Y3JnpA3GZ5qHrtqYSAOvuOX9/sKG1pUB5qMqvnS3aSmoTGqJJ
 gNfZfwLA+IzXg+AeB26YL30GdIR/g/6wpOTZ8I+z6HvYIzNkPbCBFgRaXMhdiK0myr
 KNPocogtl1/cg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
In-Reply-To: <20220211165811.1176005-1-broonie@kernel.org>
References: <20220211165811.1176005-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: wm8731: Delete empty remove() function
Message-Id: <164485056109.397940.15009909214528816031.b4-ty@kernel.org>
Date: Mon, 14 Feb 2022 14:56:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
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

On Fri, 11 Feb 2022 16:58:11 +0000, Mark Brown wrote:
> The I2C remove function is empty for the wm8731 driver, it can just be
> deleted.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8731: Delete empty remove() function
      commit: 0b88a659002151e354272a13ae29d8b795ef1b46

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
