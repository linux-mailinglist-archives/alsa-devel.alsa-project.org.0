Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD09520161
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 17:47:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39D9B1913;
	Mon,  9 May 2022 17:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39D9B1913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652111251;
	bh=oQ1ml70LJT9el9PON/9R0g3f3UYsMYuYJEQBReN2NJk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s6OXFYL2+f4seTjRXZkKQSmzGCUZGarWpCVF8iMClLrhifIiwmBYCm6fNFc9OyjQH
	 WNf77icyvRZJ8CbmtQxf9HUN3KogberMbGNNXapJ3h77s1a6Djwd685zoXKOR0Uikb
	 JAfa40mh+0F1pfLSBZgda/9xjhqBg/gz2jOUHnhI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE353F80511;
	Mon,  9 May 2022 17:45:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B740F80237; Mon,  9 May 2022 17:45:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 225B0F80237
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 17:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 225B0F80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ihzsCnFs"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81BE760C7A;
 Mon,  9 May 2022 15:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B1AC385B1;
 Mon,  9 May 2022 15:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652111142;
 bh=oQ1ml70LJT9el9PON/9R0g3f3UYsMYuYJEQBReN2NJk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ihzsCnFsMew8Zj98kEHx7dWpMilARnYHeUqvNasxqsg1MJFC400RZj/wU3X2Czhmr
 wKwiU4flOJ3YgCO3/d5B/i+1qkDa6RSO0IznNeilX8gDn+zwkRFf1hlGoaOvpAONsl
 34wAX3hus9nMOhj2OV6P4nX+G/Xt0dEaJxgSouDoFv+shqKBJw4Sbl6nm/B1I6/t53
 /AIirOEMR5RYoYBnlSmaSlYtOedkm7nKAfuaGFsH2YSsmrGoBRimxhDz2EJxyI//AD
 BHRU01krpiUsjyGpY/I/XuoP2Yk6Y+ZgocwstIOw8vfGx2ujxHpDQ+ePYYC7Gwj/q9
 rWP1Kk27k6ACg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, cgel.zte@gmail.com
In-Reply-To: <20220505022102.54650-1-chi.minghao@zte.com.cn>
References: <20220505022102.54650-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] ASoC: pcm186x: simplify the return expression of
 pcm186x_power_off()
Message-Id: <165211114145.774487.8579724629086117424.b4-ty@kernel.org>
Date: Mon, 09 May 2022 16:45:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, zealci@zte.com.cn,
 linux-kernel@vger.kernel.org, chi.minghao@zte.com.cn
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

On Thu, 5 May 2022 02:21:02 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Simplify the return expression.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pcm186x: simplify the return expression of pcm186x_power_off()
      commit: 5cb3bdd6bdcda6293aafe2a5adaaa44d011fbdf2

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
