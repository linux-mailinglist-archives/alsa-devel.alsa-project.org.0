Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B435040899D
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 12:57:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58476165D;
	Mon, 13 Sep 2021 12:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58476165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631530658;
	bh=7l+vYectJVc2pcNJ1xmipSlZuJEZCOZ/t0TzVWfHOpQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VK+TCiYekr61hGRKV7HeoCIidX0EXXh763jfGQdsYrRJF0Sow6Ez7zbVJK90u7/Z+
	 Vb2vVZ71hmd3mvEmvlzPfa7/V+b6FXPBf1LS3EHWpAQ6dee7VhCn2ircjRUuOcuwwi
	 5ziI9oBlxkM9ttXgfAdjXZno7W4JeTHeOzJCtyUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D39A8F804E7;
	Mon, 13 Sep 2021 12:54:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21510F804E7; Mon, 13 Sep 2021 12:54:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 386C0F804D9
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 12:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 386C0F804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kNOWPfSd"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86CD861004;
 Mon, 13 Sep 2021 10:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530486;
 bh=7l+vYectJVc2pcNJ1xmipSlZuJEZCOZ/t0TzVWfHOpQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kNOWPfSdeU4ol4rp4iIs1sStfO5f1aba6ThiI63sJDvw8W6/7tKCot+ftABjHK4H4
 jxD+gIqQYBRvf2Pto3xU5Uv71cPnjg4F7RRUpaMjBHzeye8rKjtr0mXXQsLv8KwOhY
 LhaAIdpg7Wsp4eZJobeR8gOAQs5UkrYkAoOnDoY0Va7oBPWYVq2nMiLuxKO8Q+JKpj
 xaB0Cc5/caUQOLLelK523pe+pxzD+QEpoycUagWpPN6jAxB1VKWGWN7TJlshE8CmF2
 ACulhOe9EiLjp7DAEbkCOnuX9bfGK3LbB+1ZeAHwTCpDb20vIlZsJwz64VUl+kF8Jg
 yYnMtMIV9GgGw==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com,
 Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 0/3] Convert name-prefix doc to json-schema
Date: Mon, 13 Sep 2021 11:53:18 +0100
Message-Id: <163152996585.45703.9035282827838850495.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
References: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
 jbrunet@baylibre.com
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

On Fri, 3 Sep 2021 22:05:16 +0530, Sameer Pujar wrote:
> Following are the changes:
>   - Add json-schema for 'sound-name-prefix' documentation under
>     'name-perfix.yaml'
>   - Use schema references wherever needed.
>   - Remove txt based doc
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Add json-schema documentation for sound-name-prefix
      commit: 7f826da8e924bae7dd56b99e3760514017ca51a3
[2/3] ASoC: Use schema reference for sound-name-prefix
      commit: 82d3ec1d89fa2750fdc74e2f29c6c7ff673a2768
[3/3] ASoC: Remove name-prefix.txt
      commit: 955cc3488e6d407bac3883be630cabbead0892f4

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
