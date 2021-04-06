Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82319355A91
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 19:41:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC3061614;
	Tue,  6 Apr 2021 19:40:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC3061614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617730898;
	bh=CJtEtoK6Usq5ZVb5Hps4tfMcaFeKs2V1/aok3sqZF6M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b/C1KlcJiImGHxjE884Y9uQqcWT2JkUoOJFv5uyszWzDiWuPKWzTjojEGgWzNi+1R
	 v7D8xl11Ro2cOezEIfNNFZ8HzhCC0RAdqRapkNC/zskoNjjmVM7oT1GRzpKpbPZ6kw
	 hXutpkZDvX9BxdO6AXQNjztVyS7RYTZvE378cK+g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DC77F80124;
	Tue,  6 Apr 2021 19:40:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0881F80249; Tue,  6 Apr 2021 19:40:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95019F80124
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 19:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95019F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Sely41ji"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A730613C4;
 Tue,  6 Apr 2021 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617730797;
 bh=CJtEtoK6Usq5ZVb5Hps4tfMcaFeKs2V1/aok3sqZF6M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sely41ji6TP0/R3c6YoHBD1oVxObFry/ghjfuP4g46aSa2lM+7GL3y8VppwzXUa6P
 M1AVKiu73EBR03gcSKD7+tJMcxV+PMbMcMp278v7umomzuzZ4xvhfnxoKHW7Yz3Cwx
 wfiQQo6HiAcPyDe/giuH7f/Uqv5yHLSEaK/51zO8OAPgHIjfTPQGW8gcfYjU2PYMwo
 jft0sTlwPXhhrsdH6QlfU/vymG4VJYXLpe0noR2tEP31G2MufrLMS0gvLyYizgau75
 jkd2ZPLV8oPiHIiAASzrzjyxzHtgNqun4VjkkXhgpJ2pPeqYxMPG3QiSEN3TO+eQjQ
 FG1dQCMzr2AXQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, ckeepax@opensource.cirrus.com, krzk@kernel.org,
 geert@linux-m68k.org, srinivas.kandagatla@linaro.org,
 linux-kernel@vger.kernel.org, perex@perex.cz,
 rf@opensource.wolfsonmicro.com, lgirdwood@gmail.com, nuno.sa@analog.com,
 alsa-devel@alsa-project.org, jack.yu@realtek.com, shumingf@realtek.com,
 Steve Lee <steves.lee@maximintegrated.com>
Subject: Re: [PATCH] ASoC: max98390: Add support for tx slot configuration.
Date: Tue,  6 Apr 2021 18:39:37 +0100
Message-Id: <161773049108.51713.10192288839186913998.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143801.29770-1-steves.lee@maximintegrated.com>
References: <20210405143801.29770-1-steves.lee@maximintegrated.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, steves.lee.maxim@gmail.com,
 ryan.lee.maxim@gmail.com
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

On Mon, 5 Apr 2021 23:38:01 +0900, Steve Lee wrote:
>  Update voltage/current tx slot configuration support.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98390: Add support for tx slot configuration.
      commit: e5870bd0e40c749fd96a4e565497c789bee456bf

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
