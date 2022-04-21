Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC3450A8E6
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 21:19:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5C4116BE;
	Thu, 21 Apr 2022 21:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5C4116BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650568767;
	bh=Tiaf1YrjHFbQ7idZ8f26mXSY8SNXGAs2qrWKgJcjzFk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tur3JvBFgV1FjElQiMGVzbmY6Qr5v2uvj11t+zQeyjmKFj0OavMbnOkXPVEwqD09n
	 iFLaNU2MAQEeWHxK1uo99Yo3fj261LjOue4/bkVo525OjJ5LgkQvmqmzAV5jbVGMq6
	 sB8SsWwBwuqpFgRGvg6odyMOpEa7krRREyC+lQcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30308F800C1;
	Thu, 21 Apr 2022 21:18:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B03A6F800C1; Thu, 21 Apr 2022 21:18:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F434F800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 21:18:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F434F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="M9AA9Wa1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D100661B86;
 Thu, 21 Apr 2022 19:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10275C385A1;
 Thu, 21 Apr 2022 19:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650568696;
 bh=Tiaf1YrjHFbQ7idZ8f26mXSY8SNXGAs2qrWKgJcjzFk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=M9AA9Wa1Me31A1v5SFcA9HxsX2WvXFU3NKMWqk7TDfuJyC7cPqE/Y67Bdot+WTskU
 M7wEtwyYlKHr83vx555ELy7fdGP4IMtVUc3+jrOLTjl9UnEaLvXU528Gcl1CLpzZuW
 bGX1wgyJeeE68BeyjhdUSCSsw/DuPkajVefVdKst0764pccDkJqHhvNydXBu9wY79V
 AmNZk073N9elOxz5l7BQvoYlwAxnBnVxR9k8ubTDqh2SzRLlhGyfljVImZ9p6ALBYy
 5/y0Twf1TWnMYwClB/iycgu13ptUitGf/u0bneDhVzDHee6gg6bO61Uor/u25lWMtr
 3mlwciihaMKag==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220421162328.302017-1-pierre-louis.bossart@linux.intel.com>
References: <20220421162328.302017-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: soc-ops: fix error handling
Message-Id: <165056869476.409171.4830526217284820143.b4-ty@kernel.org>
Date: Thu, 21 Apr 2022 20:18:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, rander.wang@intel.com
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

On Thu, 21 Apr 2022 11:23:28 -0500, Pierre-Louis Bossart wrote:
> cppcheck throws the following warning:
> 
> sound/soc/soc-ops.c:461:8: style: Variable 'ret' is assigned a value
> that is never used. [unreadVariable]
>    ret = err;
>        ^
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-ops: fix error handling
      commit: eb5773201b1c5d603424bd21f161c8c2d1075b42

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
