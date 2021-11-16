Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9F34538D1
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 18:50:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36B751898;
	Tue, 16 Nov 2021 18:49:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36B751898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637085021;
	bh=oHVUnmKqtUJ2idIe0wC+rujhKnApVnF0GkfvoERh4/E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BeB+rXtPekq/opZEXFEtUTvFUH713av8B3/YfuKo2Dbm6aV0Lc0/OTTQ50IX/MzRQ
	 x1rsDs5VsrVQ/IsMUQpt/ZRXKLNMr3RgxiCiZp+SEPZ0iEUOKzzsMMMJEYT3dh1Kop
	 R8am9ZsZpQi6U0CmN54GxQZEdbgPJWBnE4nhsJdI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FCDFF804EC;
	Tue, 16 Nov 2021 18:48:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3575AF80272; Tue, 16 Nov 2021 18:48:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CFDBF8026D
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 18:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CFDBF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="brSUvgan"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C730C61BD4;
 Tue, 16 Nov 2021 17:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637084892;
 bh=oHVUnmKqtUJ2idIe0wC+rujhKnApVnF0GkfvoERh4/E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=brSUvganuGB5+w6GsN5VLg5wKkcdaqU7h5e8Gk9ijauHYXAxaK+M7EzjhiLTzx91p
 C1N0aO0ADKp8Pi51+aWXxCruFNjNrB0iT7DhX0xsqRg55e42zytGqhUou+MXrxvAbI
 XBSTrWAjCVkqH0a60RncnwvyeShrFKPQHVFL1DfI5KKoW4Q/fiLorexWtuaKTK6SUl
 UGme7o/al8vEbuJrjZXF77hOtLKF/JEisTruZnIp0aoJfBHg4bqo0ZditbpsRDMLNu
 9dmCOcSIlo/OCiro8a7QFhUZd6f5Oh7cAv2Oy16gfHBDmoKvDf1hL8W0WrGOpqA0PK
 v31f90kBUmcmA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20211116114623.11891-1-srinivas.kandagatla@linaro.org>
References: <20211116114623.11891-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/3] ASoC: codecs: Qualcomm codecs fixes
Message-Id: <163708489055.808719.15130642292756226191.b4-ty@kernel.org>
Date: Tue, 16 Nov 2021 17:48:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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

On Tue, 16 Nov 2021 11:46:20 +0000, Srinivas Kandagatla wrote:
> We found few issues during runtime pm testing on this codecs.
> These 3 patches for wcd938x, wcd934x and lpass-rx-macro should address them.
> 
> Thanks,
> srini
> 
> Srinivas Kandagatla (3):
>   ASoC: codecs: wcd938x: fix volatile register range
>   ASoC: codecs: wcd934x: return error code correctly from hw_params
>   ASoC: codecs: lpass-rx-macro: fix HPHR setting CLSH mask
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/3] ASoC: codecs: wcd938x: fix volatile register range
      commit: ea157c2ba821dab789a544cd9fbe44dc07036ff8
[2/3] ASoC: codecs: wcd934x: return error code correctly from hw_params
      commit: 006ea27c4e7037369085755c7b5389effa508c04
[3/3] ASoC: codecs: lpass-rx-macro: fix HPHR setting CLSH mask
      commit: cb04d8cd0bb0b82acc34cc73cb33ae77cbfb020d

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
