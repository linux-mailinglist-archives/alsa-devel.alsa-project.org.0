Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E750E739
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 19:27:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F06C317E2;
	Mon, 25 Apr 2022 19:26:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F06C317E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650907647;
	bh=tJnkeRG9BIqZLpOKq/h7T9aOg9jlOc0o6WxzFD5dKrc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c7xcHNVlZE4Pl3HA8Zf70Z+kWtunQlKh316WLVUxc69cXKCUzrm0sgYbSRKr7/IhV
	 yvmmqvm2J542J2PHfbeU74BmIjcE+GyjpltBTp9o0D17KsHykH1tWXlbx/SwpfjBRL
	 uwyltyYTkyT35rJTSG5TC9WEyHmXdjbraD2Izbyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09261F80537;
	Mon, 25 Apr 2022 19:24:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4456EF80519; Mon, 25 Apr 2022 19:24:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89BB4F8016B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 19:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89BB4F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gCPqIbvb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5248561501;
 Mon, 25 Apr 2022 17:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CA7C385A4;
 Mon, 25 Apr 2022 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650907464;
 bh=tJnkeRG9BIqZLpOKq/h7T9aOg9jlOc0o6WxzFD5dKrc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gCPqIbvbWYsMjXDO3Jxj9fu+yo9WsrIYr+rDqr6m3ZH4J/33ONKiTFrhd8Y/81qpT
 b4HRnfwEvC/I7CnztsnbeYU7PmyH8aCmfrkBTDN8Fn+STF3ajXwxZkt2zGsq3IfJOy
 ZtJ77/AFvq4SV6Tk/pHAuXh3bCcVnasZAiBTf62I/1UsouQE+HEms66BGheeFOk3UZ
 rQPIMET9t57/vZZTceLfAvfm8DT+WB2HnsR+5wN1LTf8YKeoIgf7hmGegzzJb8aAqc
 eOGqRPNQC3IzCUN5vk729AjhQqSFRaco6jZmJUJp/YbVrSsnP1BGH9jvORg5SLb0yl
 pmRtyv6bQF2uQ==
From: Mark Brown <broonie@kernel.org>
To: rf@opensource.cirrus.com
In-Reply-To: <20220425095159.3044527-1-rf@opensource.cirrus.com>
References: <20220425095159.3044527-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] firmware: cirrus: cs_dsp: Avoid padding bytes in
 cs_dsp_coeff_ctl
Message-Id: <165090746356.583823.11843544325300863784.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:24:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Mon, 25 Apr 2022 10:51:59 +0100, Richard Fitzgerald wrote:
> Change the order of members in struct cs_dsp_coeff_ctl to avoid
> the compiler having to insert alignment padding bytes. On a x86_64
> build this saves 16 bytes per control.
> 
> - Pointers are collected to the top of the struct (with the exception of
>   priv, as noted below), so that they are inherently aligned.
> - The set and enable bitflags are placed together so they can be merged.
> - priv is placed at the end of the struct - it is for use by the
>   client so it is helpful to make it stand out, and since the compiler
>   will always pad the struct size to an alignment multiple putting a
>   pointer last won't introduce any more padding.
> - struct cs_dsp_alg_region is placed at the end, right before priv, for
>   the same reasoning as priv.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] firmware: cirrus: cs_dsp: Avoid padding bytes in cs_dsp_coeff_ctl
      commit: 430c3500995484962bdbccf358201afef8055535

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
