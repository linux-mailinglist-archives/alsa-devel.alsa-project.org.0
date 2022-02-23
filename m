Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C69434C0AD2
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 05:09:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F6871A28;
	Wed, 23 Feb 2022 05:09:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F6871A28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645589394;
	bh=zbRIkwsmMgR93F4yyphb0tidO53L1BRrMen0pEo5/iY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cHPriGSQv45UNq5F1xO0HAiSmcioVvDpPSYlnBiI2F9snLkuq0892mVHOodNz/kYk
	 jJQq2V0Qbpllhjrs+BUz8a/HAglK/RPK7gxD0HijZhKAlzOJzW6weSU2ZjGM47G2/s
	 hgHkcR++cAqfkbdoUB2IL4Ue5pkZLtIMZ+1aexeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06178F80515;
	Wed, 23 Feb 2022 05:08:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BFD1F80118; Wed, 23 Feb 2022 05:08:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BD6BF80118
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 05:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BD6BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Sw4LffWV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CFDE5B81DA6;
 Wed, 23 Feb 2022 04:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A41C340E7;
 Wed, 23 Feb 2022 04:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645589289;
 bh=zbRIkwsmMgR93F4yyphb0tidO53L1BRrMen0pEo5/iY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Sw4LffWVPkM56WH+IEMM86nsCvbUlmmQA4xbuLOTZUQcqfDDKHdKNjCtVpkqgJWfc
 dSBcsM8oiUuDFO1bkjsKFHpB1MPjNKJv9F1sDe4t0J/epOfuCHRYGNG1F8JucxCR+l
 dEg/3jdCJWbp3yKK3CgeS4POy0OXScKYgl0kDvuavtorNMhvvu1llf/jLBlBuXv0Iu
 OlHQ59nhf/0bd/jVYpTbjxerEjZqv06UyzufSHuQ0iPe+cBRjx+ihRAmDL1+caRSrv
 30mYaz6dD+OkgBhzIVi4AwJY89WG+XQeF9APVk6HdnGoWo3xTIycpqJpc9wb8vrVQt
 /QOZoIFPeLTXA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
References: <20220222115933.9114-1-srinivas.kandagatla@linaro.org>
Subject: Re: (subset) [PATCH 00/16] ASoC: codecs: qcom fix validation failures
Message-Id: <164558928763.1665019.3142653636654338905.b4-ty@kernel.org>
Date: Wed, 23 Feb 2022 04:08:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com,
 quic_srivasam@quicinc.com
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

On Tue, 22 Feb 2022 11:59:17 +0000, Srinivas Kandagatla wrote:
> Thanks for pointing out to mixer kselftest and VALIDATION Kconfig.
> 
> This patchset addresses some of the issues in Qualcomm codecs that are
> discovered with recent mixer kselftest and validations added to ASoC.
> 
> Mostly these are under
> 1. accessing integer value type for enum controls, which is clearly an array out of bounds access.
> 2. Fix incorrect ranges.
> 3. Fix incorrect min max for tlv controls. (I can see that other codecs also suffer same issue)
> 4. Fix return values for put functions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[01/16] ASoC: codecs: rx-macro: fix accessing compander for aux
        commit: 42c709c4e1ce4c136891530646c9abd5dff3524f
[02/16] ASoC: codecs: rx-macro: fix accessing array out of bounds for enum type
        commit: bcfe5f76cc4051ea3f9eb5d2c8ea621641f290a5
[04/16] ASoC: codecs: va-macro: fix accessing array out of bounds for enum type
        commit: 0ea5eff7c6063a8f124188424f8e4c6727f35051
[06/16] ASoC: codecs: wc938x: fix accessing array out of bounds for enum type
        commit: cc587b7c8fbbe128f6bd0dad025a0caea5e6d164
[07/16] ASoC: codecs: wcd938x: fix kcontrol max values
        commit: b0217519236924f77a8382b4004e43ef8fd0dcbb
[08/16] ASoC: codecs: wcd934x: fix kcontrol max values
        commit: 61163c3e7480106804269182e24db05244866493

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
