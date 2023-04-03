Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8AF6D4B7A
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 17:09:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FEBB204;
	Mon,  3 Apr 2023 17:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FEBB204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680534586;
	bh=BSS3Ft8JQ9etJOn1zN0oTwzUaes1AtJBsgymC/v4kdc=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V6OzdS9EG74W+Hasp3Y9kHqoANd0HrG9Irv0DG1Yeic6AHj/kpkQ1yGkrPRkmGBr2
	 CEnJ4Rsah+ksa69tqt2d9yPPImCcAu3YYKRwDr2wL0Zp02WX0H1adXKciIofjvSEks
	 fjdoii0nvegwAiXremHzqc4a38QhPdKHIZy6ENz8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27BFEF8028B;
	Mon,  3 Apr 2023 17:08:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 855AAF8028B; Mon,  3 Apr 2023 17:08:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9874BF8015B
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 17:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9874BF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LH6/UPc2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4038A61FC7;
	Mon,  3 Apr 2023 15:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72277C433EF;
	Mon,  3 Apr 2023 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680534473;
	bh=BSS3Ft8JQ9etJOn1zN0oTwzUaes1AtJBsgymC/v4kdc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LH6/UPc2zLS065s2+tZPcVdZUiadCX0D0+ucwbowf+9GAdMeVXzEUGVjxqu6zBBlu
	 PxGDkfaLD4x0nPXajNRS7WcMTdKpyQ74urU0X29Xc4DeJTHLLpP/8o4ch58oA4nZtI
	 3HCO81N1V9Ko9cJMH4tH3EAPvUPRGEkdB295IcU1lfq9sKwoBmhMSlCTNMpEGgJZHX
	 VIBB9CXQyFAXAjisMPGJDoLg2PLMITWOfOh/tNThpFHBiiJrO1tUc6EXj/GqEbXvht
	 YpXJ/9kftMUe9VMfRs7aK4bHQuJ1e54oQsnT6oR4q/KhNJTh6mg+dbNlmQbiCkVHZG
	 AQe0G0fPoHYUw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
In-Reply-To: <20230329080418.1100-1-allen-kh.cheng@mediatek.com>
References: <20230329080418.1100-1-allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: Move some prints to debug
 level
Message-Id: <168053447118.47553.13821701231639468315.b4-ty@kernel.org>
Date: Mon, 03 Apr 2023 16:07:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: 2J7FRFJRHT575RBXGR7F2FTPPP3BT547
X-Message-ID-Hash: 2J7FRFJRHT575RBXGR7F2FTPPP3BT547
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2J7FRFJRHT575RBXGR7F2FTPPP3BT547/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 29 Mar 2023 16:04:18 +0800, Allen-KH Cheng wrote:
> There are many log messages scattered throughout the mt8186 sound
> drivers, and they are frequently triggered.
> 
> To avoid spamming the console, move these messages to the debug level.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: Move some prints to debug level
      commit: 3af24372964a8f999d62427c0585d9a4693ae4e4

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

