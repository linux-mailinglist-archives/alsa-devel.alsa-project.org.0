Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7C137A1F1
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7FA2174E;
	Tue, 11 May 2021 10:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7FA2174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620721735;
	bh=yX814QtGmlEUeWuzc2cmSHioA1C9NjdHxkqLmgy5cKU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N64u62YtYI8ztrhWmIHJqVWg2lH9r2V0M0FTRgWynUlyHLf6Z2GqAoMYJc6rWShNB
	 jPov568i+JrcecgZL8TmgOOPRNIb4uEgrPeWKS1WPZxPvmYmaOWbMgF9BYLretYKhZ
	 lwDK/OYz8q66j1PDbwuJUBW4nZK/pvcYlqutyip0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5EDDF80129;
	Tue, 11 May 2021 10:27:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17D8DF80245; Tue, 11 May 2021 10:27:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E112F80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E112F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U5xIm9DM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2C1B613C3;
 Tue, 11 May 2021 08:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721643;
 bh=yX814QtGmlEUeWuzc2cmSHioA1C9NjdHxkqLmgy5cKU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U5xIm9DM+030Fdr83Joy1qxFGvwXpAS2hTP40CQ1fNfYNNJGMxOAtyonkC1a3Iw/v
 eiTD0DIoy+H35+TeCSwENki8WroQChFQxRHnlVsnjZW3SQGbZoQr4+Z5K64LuYyPGM
 ndKgFUA7Pzahh3UJRC8dIcbtE3d2Eu2ZuIEHu26TsAHBgXG12XhvRZrwV9HY+nsVyP
 MlcgjnIlKf72qGar8T2bn9e+OaCEVQxn/Dr7LmaX+j+0HUzzx+VQZhoehfAmHY/gKA
 0PVxt8chNbeds9nGtU4By/c10hv5tSHq9EzwvqDIg5IKByjqyS2y8f4bVNVauXL4lx
 N7yXjfvtlBJAw==
From: Mark Brown <broonie@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	oder_chiou@realtek.com
Subject: Re: [PATCH] ASoC: rt286: Remove redundant assignment to d_len_code
Date: Tue, 11 May 2021 09:25:43 +0100
Message-Id: <162072058170.33157.14418303282464363989.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1620298735-31708-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1620298735-31708-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

On Thu, 6 May 2021 18:58:55 +0800, Jiapeng Chong wrote:
> Variable d_len_code is set to zero, but this value is never read as
> it is overwritten or not used later on, hence it is a redundant
> assignment and can be removed.
> 
> Clean up the following clang-analyzer warning:
> 
> sound/soc/codecs/rt286.c:728:2: warning: Value stored to 'd_len_code' is
> never read [clang-analyzer-deadcode.DeadStores].

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt286: Remove redundant assignment to d_len_code
      commit: 1d122dd3b168f55e2e29982cff80f1c15f66ef26

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
