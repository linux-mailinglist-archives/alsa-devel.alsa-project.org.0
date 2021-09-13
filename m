Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BC74089CB
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 13:02:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12E3F16A5;
	Mon, 13 Sep 2021 13:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12E3F16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631530961;
	bh=kGs+OZXsbrIogk6381WUNP6EKwqGTAnYr3RIhU3WhAc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cU858NzwXt1sWY0QmgY6cO1otl3JBkzs0M4JHSOKJj7R2alzyVNRprogoVgm7mqxp
	 hGhgtrYycgwtqWCyer9HFkTqZsKAY6PBqeecjfFsGURNrb5YR5Lxmqq104oNB5qMfm
	 gGRS3eLeMw2WSDisrG3e/qQrKSB8y3n4V9beNm5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFBF4F8057A;
	Mon, 13 Sep 2021 12:55:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D071F80579; Mon, 13 Sep 2021 12:55:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98CD4F8055B
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 12:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98CD4F8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hDXyV3lI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B1C961051;
 Mon, 13 Sep 2021 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530529;
 bh=kGs+OZXsbrIogk6381WUNP6EKwqGTAnYr3RIhU3WhAc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hDXyV3lIQc9EqHpNl20CDXwNBLMZImqhYXbqEmGkZMps+z+IpwxuijXlIyIk89VRN
 EV+dmoyy1eFCrNoZIWXNsDmdmT7jUYrA/klAUrM0aqA6CSGNiMF/XkXRxGqDqdsLyc
 xyXF1JIHbq+hcSd8z9FHrl9bH9KiSiWPS3YHVsJELy7EO1cns2uTeHT3CqADZgB0x4
 XMEar/d/bThNBNx39gGXiMXaE61TzyWoGaT+zN08ziyJyWS00PLjc1ja1dVIHnAKEw
 NNgj5uJjcYsEjE4ntf5tH4toXhq1yHs2nvxG/JS7/74FUUVo5LUZD6NgLDzEXMP3G7
 kGnMVkmoweHgA==
From: Mark Brown <broonie@kernel.org>
To: gearhead <ys3al35l@gmail.com>
Subject: Re: [PATCH] ASoC: pcm5102a: increase rate from 192k to 384k
Date: Mon, 13 Sep 2021 11:53:34 +0100
Message-Id: <163152996585.45703.8666875215162171211.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210907210130.116769-1-ys3al35l@gmail.com>
References: <20210907210130.116769-1-ys3al35l@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>
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

On Tue, 7 Sep 2021 16:01:25 -0500, gearhead wrote:
> the pcm5102a is capable of 384k, but the current code limits it to 192k.
> This commit extends to 384k
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pcm5102a: increase rate from 192k to 384k
      commit: 0beeb330300f082e8b6849a9f83d34efa2578edd

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
