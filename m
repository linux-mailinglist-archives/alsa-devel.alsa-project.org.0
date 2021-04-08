Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C57358A56
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 18:57:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B83FE1662;
	Thu,  8 Apr 2021 18:56:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B83FE1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617901069;
	bh=UsVHxXwhtxO6C1oI6waKzeTDm3pWIG9eRG5PEkfaJsg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BwkRjDsZf796AVwR9xkDPLRQLnfAOf5zDxzWWqECV9VPROKkenClAyJ8m/xNVRD4j
	 1Eytfdle35aJO56KCQWX1VTuqirhy0wkGHz88/z9seZT7joS7XLe6Xa424gwaxg+AK
	 Xlldc2HaxsgoDs8KiM+DnJYY1Y2D9+/9hkNwFBFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5662FF80482;
	Thu,  8 Apr 2021 18:55:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82999F80425; Thu,  8 Apr 2021 18:55:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FD86F80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 18:55:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FD86F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t3UZCM7J"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DB7C61056;
 Thu,  8 Apr 2021 16:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617900933;
 bh=UsVHxXwhtxO6C1oI6waKzeTDm3pWIG9eRG5PEkfaJsg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t3UZCM7JrYN3ubeZfioQX7f2h42ORE7juF8FqgeklugDqA2ixmes5UKy8d/zUQeO8
 b0GEC9VpdDNtPe0FxTtgNgxbH4AUG08AHJ7Z9keciqiu37FZDgelNnAWHJPDRkKDVD
 QBXMdXxArt6HrXStGx2lTYgXWqsiwfVHrTB6NW3hMFBfDeGmIXSIhjKlVdj+yd+hVn
 e4JDq9aRF5SqPxaxEpChryykf6pnuSuYpbU2AqS+1/5inPFgzlZgYuy/BF4e6OgQU6
 wqYKLr3R0aKlr23m1J3Kckjwl2OuM4EUMbHs5P8AQBmSnpX3p7E3RCh9C+uDV+wpyV
 Z4GLCo2SqAdlw==
From: Mark Brown <broonie@kernel.org>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>,
	kjlu@umn.edu
Subject: Re: [PATCH] [v2] ASoC: codecs: Fix runtime PM imbalance in
 tas2552_probe
Date: Thu,  8 Apr 2021 17:54:39 +0100
Message-Id: <161790012550.16915.9175549460514503586.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408064036.6691-1-dinghao.liu@zju.edu.cn>
References: <20210408064036.6691-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Mark Brown <broonie@kernel.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>
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

On Thu, 8 Apr 2021 14:40:34 +0800, Dinghao Liu wrote:
> There is a rumtime PM imbalance between the error handling path
> after devm_snd_soc_register_component() and all other error
> handling paths. Add a PM runtime increment to balance refcount.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: Fix runtime PM imbalance in tas2552_probe
      commit: 7b3f5b207da5116add56c335c5fb92cee140dc63

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
