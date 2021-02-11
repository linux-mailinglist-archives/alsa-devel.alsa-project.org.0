Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8EF31918D
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 18:54:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 435231720;
	Thu, 11 Feb 2021 18:53:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 435231720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613066071;
	bh=2ckM0Itoe8KHQDayjUMGE113zQzsTAROmq2TaKb3RZ4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L3tEn3bthNq2BwSpy8LpjKzl143TmRtKDtWjz0hJTlsEMgJUjXlh3/MisPTqrsRjT
	 DZj6eTtROkhPdGiWd82nwPQNQ8NFdCdszW6n7QS63EtR7TG16LzHiNqtNl+zgWoNRx
	 P9xGXNiMhKO/xxcJO7dDhVtwEwz4W6KSgR7dKkt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73CC4F801EB;
	Thu, 11 Feb 2021 18:52:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1278CF801D5; Thu, 11 Feb 2021 18:52:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45059F80165
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 18:52:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45059F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="N3WOvXdW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FD0164DEE;
 Thu, 11 Feb 2021 17:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613065971;
 bh=2ckM0Itoe8KHQDayjUMGE113zQzsTAROmq2TaKb3RZ4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=N3WOvXdWJTec/f248/MJlsN5vDROuvvvIHkH/qIuLvyCt20E/DGl8cLqnF8nWoSUr
 WSJWP/gG2+/13PlPinIy/SufQhClbFn6glTdKWkfjkxxTk1WrZHaj0JzbUH/3DQj3J
 y/gAd8X67QUlMKhCWoQyOhfY2TXKPl6+ZkgLULMmwduz3skpd5n2w+VuFM5C1jujJy
 596kX8yIpBUiLSvd05hUvMnmEEbYqt+FCEz8h7tmCSpJb6a1M8kzTQoQYoGg6Sp4hc
 PHn+W9OrLDZLxQQx+9kCAyoXkI16ryMklXklnINj5QNN2Es2NqGXoQL1aIQgIMoydI
 zWBwFNJmnmWXw==
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20210211172106.16258-1-ckeepax@opensource.cirrus.com>
References: <20210211172106.16258-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Remove unused control callback structure
Message-Id: <161306591793.11031.17865587228297741167.b4-ty@kernel.org>
Date: Thu, 11 Feb 2021 17:51:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On Thu, 11 Feb 2021 17:21:06 +0000, Charles Keepax wrote:
> This callback structure has never been used and it is not clear why it
> was added in the first place. Remove it to clear up the code a little.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Remove unused control callback structure
      commit: 6e9586361e145cd688e525880e1f84c0ccf57566

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
