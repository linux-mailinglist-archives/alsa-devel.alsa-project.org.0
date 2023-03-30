Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6656D06C0
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 15:31:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EAF3F3;
	Thu, 30 Mar 2023 15:30:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EAF3F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680183062;
	bh=pO2NRLzMpHsXJkydUuv3M8Hyce2ubHproAoPpNUOhU8=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zg8veunDzNam5G/2hwQJgSbbVGNCNx0/YGtQAwcJzHoJOCnqdL/hG6z7TNvYKFGDY
	 j5Gk9g7+3gmoNVjSi/2VnnAz8vmPzD4ACamOObFVd4cqOT79VgS1ZjjSR/oofFVtbI
	 OB6rPElMFkpSUrdLdFkunAsADEvNKWd8Dn+oGi4c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06756F8024E;
	Thu, 30 Mar 2023 15:29:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27E28F80423; Thu, 30 Mar 2023 15:28:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6463F8021D
	for <alsa-devel@alsa-project.org>; Thu, 30 Mar 2023 15:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6463F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Hv/NV+At
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 58453B8255A;
	Thu, 30 Mar 2023 13:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A857C433D2;
	Thu, 30 Mar 2023 13:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680182905;
	bh=pO2NRLzMpHsXJkydUuv3M8Hyce2ubHproAoPpNUOhU8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Hv/NV+AtPsPau7X/tNGO04EXc8MsCOSyqYS2PZ1+7ULo3gVMrk79SOzvEzvVbpbnS
	 M++TLkeFuzYSpFrC1rJd6fauqixhLVqbdx0FXRVmS9h6a7R5eLu4yPMczXru2L57uE
	 75E5YMxl92AXWS3BMY027FYvIJjp/UKtBOymEgGGrA/kgy8ndNBNH0VW+Hufv7EVDA
	 Rohur9oshe9vh4O9fejeNA4b8xySsXurCEnZLwhtruCUW2FrC5hNgPBIgLU262EZl3
	 TC5Ikcpxeh9u6bVChUYY9Jl/Ot5RykGDog8TRkUeIJanQr5wAxAo41vKVCoYTeiH5g
	 pMRY4UztfWTYQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
References: <20230324014408.1677505-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 00/13] ASoC: SoundWire codecs: simplify/fix set_stream
Message-Id: <168018290301.3345013.10279767218349232825.b4-ty@kernel.org>
Date: Thu, 30 Mar 2023 14:28:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: 5UVEUWPMBMMQEHSX2GBIMT2U5YYC4EE5
X-Message-ID-Hash: 5UVEUWPMBMMQEHSX2GBIMT2U5YYC4EE5
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5UVEUWPMBMMQEHSX2GBIMT2U5YYC4EE5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 Mar 2023 09:43:55 +0800, Bard Liao wrote:
> Simplify set_stream in SoundWire codecs.
> 
> Pierre-Louis Bossart (13):
>   ASoC: codecs: cs42l42-sdw: clear stream
>   ASoC: codecs: sdw-mockup: simplify set_stream
>   ASoC: codecs: max98373-sdw: simplify set_stream
>   ASoC: codecs: rt1308-sdw: simplify set_stream
>   ASoC: codecs: rt1316-sdw: simplify set_stream
>   ASoC: codecs: rt1318-sdw: simplify set_stream
>   ASoC: codecs: rt700-sdw: simplify set_stream
>   ASoC: codecs: rt711-sdw: simplify set_stream
>   ASoC: codecs: rt711-sdca: simplify set_stream
>   ASoC: codecs: rt712-sdca: simplify set_stream
>   ASoC: codecs: rt715: simplify set_stream
>   ASoC: codecs: rt715-sdca: simplify set_stream
>   ASoC: codecs: rt5682-sdw: simplify set_stream
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[01/13] ASoC: codecs: cs42l42-sdw: clear stream
        commit: 892855d57c47c32f475e9efa36c1a3452cc19918
[02/13] ASoC: codecs: sdw-mockup: simplify set_stream
        commit: f3def177876450df07fab6f28ad24a70397dc94d
[03/13] ASoC: codecs: max98373-sdw: simplify set_stream
        commit: 658d6f7381b1be5a6fec7d90c865fb593b8c78b6
[04/13] ASoC: codecs: rt1308-sdw: simplify set_stream
        commit: ce8ffc1bac7bee5015eb68faf214b39fcbd65d15
[05/13] ASoC: codecs: rt1316-sdw: simplify set_stream
        commit: 1294d7d71f6abad6299a12cf6911f8e5622c7865
[06/13] ASoC: codecs: rt1318-sdw: simplify set_stream
        commit: be8e5a850eb1780bae360b9b48b6d2ab70e5fb03
[07/13] ASoC: codecs: rt700-sdw: simplify set_stream
        commit: 3bcced019eb266e91b7eecc1f8fd3da5f55ca4cd
[08/13] ASoC: codecs: rt711-sdw: simplify set_stream
        commit: fa55b31fb65347ceab617af7541f0a31b53901f1
[09/13] ASoC: codecs: rt711-sdca: simplify set_stream
        commit: b2790eccc0bc755d37ed5cd8d225cec0d72798c8
[10/13] ASoC: codecs: rt712-sdca: simplify set_stream
        commit: 278432084b093f7257cf96c75bb33f155e4a8232
[11/13] ASoC: codecs: rt715: simplify set_stream
        commit: e506b2bd1d2e9daaedd1db2ef9868f7b8c4c86c3
[12/13] ASoC: codecs: rt715-sdca: simplify set_stream
        commit: cf1d6a3ad07c982a09455bf8720dc75754909932
[13/13] ASoC: codecs: rt5682-sdw: simplify set_stream
        commit: b3a2e00e20671091f7175f8f36b7f9c9ea2e77bb

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

