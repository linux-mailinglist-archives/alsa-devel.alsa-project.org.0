Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CBF50E737
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 19:26:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D21CE1825;
	Mon, 25 Apr 2022 19:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D21CE1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650907612;
	bh=ZkbN3DzlqOxrOBbGH0dbaZi13IG8v/ZLFQCNjbMKA/s=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BqOfxa4BA7zhbaCs7Z8Wq+1tMNkFAAgZnst4JhkbRe/xqOakcVYCLpBMn/qVwyUQl
	 Pj2CYhny52M1Dw37R/OwLegTkMEw8DUy6fDTEDwnuwQz+IbsdaQbqn43avqJfF4nux
	 MC4IjJyXGIKKuSefbMbwVlrWzt88PfQbzVSDMu8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9993FF80527;
	Mon, 25 Apr 2022 19:24:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2FFCF80506; Mon, 25 Apr 2022 19:24:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80E41F8016B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 19:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E41F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Im8LNR1F"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D5F061589;
 Mon, 25 Apr 2022 17:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B32C385A7;
 Mon, 25 Apr 2022 17:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650907456;
 bh=ZkbN3DzlqOxrOBbGH0dbaZi13IG8v/ZLFQCNjbMKA/s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Im8LNR1FR73F86Ri3qldYBCSxMU7TmNO7ovTLt9g8H6Qvh1oIdtGjD43Rdgq5UY3E
 n2ryGs+XZdzLgHlLtWuJuBqpSP7fbwabTpxQ98xwT7/Toxmz+21jhK95SAgvYV//IL
 SnX9X4v0iwNHW5SEGmvNjbF2TYi9MRVY3OuG17aUonTJmWEN1TeaNGAKyNslKNB0pE
 J79D6R1P5kknMbVh2V1pmhXLnHk/wzg4aL6njOLs+EzuEc/IN1JP7FQCHL5catje4X
 MbmdkOjYxophO8FYIYQ2wg+qWK5GHboX4jmY5oHJaCr+WpE7V8Q956lK/98bpenOaC
 OVOtuSDdjRNkg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, cgel.zte@gmail.com
In-Reply-To: <20220420030439.2575817-1-chi.minghao@zte.com.cn>
References: <20220420030439.2575817-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] ASoC: img-spdif-out: using pm_runtime_resume_and_get to
 simplify the code
Message-Id: <165090745525.583823.16752213604992639909.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:24:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, zealci@zte.com.cn, chi.minghao@zte.com.cn,
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

On Wed, 20 Apr 2022 03:04:39 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. This change is just to simplify the code, no
> actual functional changes.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: img-spdif-out: using pm_runtime_resume_and_get to simplify the code
      commit: b1d1b02594d4599f0d3d5558ba9606a69df6381b

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
