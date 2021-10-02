Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC3841F939
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 03:38:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06E9516C2;
	Sat,  2 Oct 2021 03:37:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06E9516C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633138725;
	bh=/PFYrRgQzQNC5+UvQ6oBrSSD6JkFm8iZPBKSwCs6r7A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gBNweAO9A2jPhzPnlto6gEZkXnUAQXL9BqFxAaPbT4rJv3kEJbBlE4MMBODQ/Bxz+
	 TM/bXOC8YCCh2qZwpeYqmQz0azJGmuRG3XH7JUD5DnARnGctdiqjKz0WXcTd7XtwEa
	 Biv33A9TiLQJ1lf2/rZiCAQtSaiEN1tdYonUao6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DBA9F800D8;
	Sat,  2 Oct 2021 03:37:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6AEFF804BC; Sat,  2 Oct 2021 03:37:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E733F800F3
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 03:37:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E733F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="onynCkVU"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 415ED619F7;
 Sat,  2 Oct 2021 01:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633138634;
 bh=/PFYrRgQzQNC5+UvQ6oBrSSD6JkFm8iZPBKSwCs6r7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=onynCkVUn5KC8VWX8EBPOkUQiasgtccgZmdCx862Qsv1njdxv6bn+9wszDk2j9S2Q
 RzlVfWgX6eok2MLf5vE25mAV2OtKx3cmmrqTlLrSERSurVeqLraqcsiIa3eDFD/rJ3
 O9M52WLGwd81tS7ECugTW0Nin6a6ZpxP06cTweMSbfdBMc+3Kl0MDKV/Vq6S/pcYcj
 vpn4NJIPLVLMMyLEDZwSpqsBYxsTc3HYvGmOTruL+cWN+c+i0STQq5Ik+qu/Qo62Hw
 alUGqWe80WbS20wlk9zfxGFek7a6jRSIO6fJSBtDDxq7g1RA4kADalvcib/5ILre3Z
 svgYjFXnyKfLA==
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8821: new driver
Date: Sat,  2 Oct 2021 02:37:07 +0100
Message-Id: <163313828655.2275577.8876974502079799331.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001103108.3297848-1-wtli@nuvoton.com>
References: <20211001103108.3297848-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com,
 Mark Brown <broonie@kernel.org>, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, michelle.chen@amd.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com, supercraig0719@gmail.com
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

On Fri, 1 Oct 2021 18:31:08 +0800, Seven Lee wrote:
> The driver is for codec NAU88L21 of Nuvoton Technology Corporation.
> The NAU88L21 is an ultra-low power high performance audio codec that
> supports both analog and digital audio functions.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: nau8821: new driver
      commit: aab1ad11d69fa7f35cb88105614ea7911598e1d6

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
