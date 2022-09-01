Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EC25A9604
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 13:50:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6CA31632;
	Thu,  1 Sep 2022 13:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6CA31632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662033026;
	bh=oQcRcueyeZGLd5NpjwzZcahqf+ZvA/FTegc8Z5bzuu4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nxFY3me+kJ1BeZ+MX1ibHiA8IMwpZm7H3HDuOl5WebRS1aXUK6eLmPyXwCUagKEQa
	 ojAB5A5GxFfUYxyVdwOsYUTQM2rmlDWqJzWte3JNHByi5JTZyAuJI9J8YnBJq5mQEc
	 vwVxDpj/4sbFT8aPJPpignpSqMrraqaHjd5jsisY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15DE7F804A9;
	Thu,  1 Sep 2022 13:49:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F2C7F8026D; Thu,  1 Sep 2022 13:49:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB77AF80163
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 13:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB77AF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UasUgYzl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6986161DE7;
 Thu,  1 Sep 2022 11:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A99C4347C;
 Thu,  1 Sep 2022 11:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662032956;
 bh=oQcRcueyeZGLd5NpjwzZcahqf+ZvA/FTegc8Z5bzuu4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UasUgYzlJUCsMJUVfP4vW6me6slI0D+PxO1y/0Ze2IqeSPEvUS+w6RW+loPT4Li8t
 NVZBJXqkUWcMKTxqVPL4MQ6WqXOlXE7visxBosES2VstcaoW4dc6R4PKco/P8c+NKb
 T58g3LdhKp4VKIJSXWehQ2e9xw2j3cUp/8mul1Wwn4bGPiLtm0sMOQOFC35Asjae8v
 0chGz/4Y7lQj9w/l4vgUtL2YOetrewcoB/hevdaMlbGZdeGzN/oV4XUut4kXT5XCJ7
 u5VZmxVc7OzWNQAiKkH1GWOMZ+0XXAgOTnx+N6gs0Ub7mSAmoivPYJwDxSkhnNK6HG
 mmfgzWeirOK8w==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901101458.365354-1-krzysztof.kozlowski@linaro.org>
References: <20220901101458.365354-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: wcd934x: add Slimbus dependency
Message-Id: <166203295512.40681.12809849481799379505.b4-ty@kernel.org>
Date: Thu, 01 Sep 2022 12:49:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: kernel test robot <lkp@intel.com>
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

On Thu, 1 Sep 2022 13:14:57 +0300, Krzysztof Kozlowski wrote:
> The WCD934X codec is a Slimbus driver, so it must depend on SLIMBUS,
> also for compile tests:
> 
>   ERROR: modpost: "slim_stream_prepare" [sound/soc/codecs/snd-soc-wcd934x.ko] undefined!
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: wcd934x: add Slimbus dependency
      commit: 9815746c48ebbd38d32a7a1dade7fa1e3948c54d
[2/2] ASoC: codecs: rk817: drop I2C dependencies
      commit: 69e3e537ec8a2e345f72f65ff24d3486d4764d83

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
