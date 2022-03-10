Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B144D45E2
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 12:38:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F16218DB;
	Thu, 10 Mar 2022 12:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F16218DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646912323;
	bh=aGZ0CMXsVBIM/0KL3TL4dpY/yYIlIky2aqZ+bvhwt7I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DjtGOtYnWtvFXQcbZgRcQEYeaF0H9VX2OjmvYRYyziN/0+Cxmbl/q31xfUbdeR4lf
	 gtDr4jjMtqYYB7VW1AyfT5vwj214UfhTlU0a2Sxy2ls7D+FtFHJAG04J0/Dy/7ryWH
	 tDXQL2IRlOTAHWVBlpKbXORF1xytI0b76GHNkhUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C433F80529;
	Thu, 10 Mar 2022 12:35:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1566F80538; Thu, 10 Mar 2022 12:35:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD564F80533
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 12:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD564F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fmBtcbhi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F082A61648;
 Thu, 10 Mar 2022 11:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A35C340E8;
 Thu, 10 Mar 2022 11:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646912127;
 bh=aGZ0CMXsVBIM/0KL3TL4dpY/yYIlIky2aqZ+bvhwt7I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fmBtcbhiaZkUB8c75J5+p3R9Po9Zd+z5qntSsabHhNhTrUmXmihCkI2eTSIxB6r1b
 jsmX52TdRslAmEgKt0F5FEDMHr0DLQYZn+daMEu6c5X4yY8/3lTvqUAtr7VwyQSrin
 rOJFMdCcs5jQVrcW0PE1Et5mvfBB/MwJ9qTw/qW/8E4hW2EQy1GNZqjpuFnRcPZWRB
 U9rXXamojCBEMBwx0sNHEtfSbmBZqsMnyBF4JVl/graaDa2j3wswd7LaTF+p7/3h84
 l30ZqaXeDkHto6Ym16FpvJLoDMCre5xl4g2QiXDzt7ip6fQHqe7Qkqeeo/M7RCuJHL
 0RFd2nmaqF5xg==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/20] ALSA/ASoC/SOF/Intel: improve support for
 ES8336-based platforms
Message-Id: <164691212563.13798.12526555126073803499.b4-ty@kernel.org>
Date: Thu, 10 Mar 2022 11:35:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Nikolai Kostrigin <nickel@altlinux.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Huajun Li <huajun.li@intel.com>
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

On Tue, 8 Mar 2022 13:25:50 -0600, Pierre-Louis Bossart wrote:
> This patchset adds a number of improvements for ES8336-based Intel
> platforms, which are not well supported at all in Linux. Since
> Christmas 2021, we've seen dozens of reports of broken audio [1].
> 
> The fundamental problem is that those platforms were built for Windows
> but using an I2S codec - instead of the HDaudio traditional
> solution. As a result, we are missing all the usual information needed
> to configure the audio card (which I2S, what configuration, DMICs or
> not, etc). The situation is similar to Baytrail with all possible
> permutations enabled.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/20] ASoC: soc-acpi: fix kernel-doc descriptor
        commit: 1174442b82b6cf13328a5f9574fac3655c58ae06
[02/20] ASoC: soc-acpi: add information on I2S/TDM link mask
        commit: 679aa83a0fb70dcbf9e97cbdfd573e6fc8bf9b1a
[03/20] ASoC: SOF: Intel: hda: retrieve DMIC number for I2S boards
        commit: 92c1b7c0f780f0084f7b114be316ae4e182676e5
[04/20] ALSA: intel-nhlt: add helper to detect SSP link mask
        commit: 0c470db0399e17310ed2ba54dd1c25cfa16ce0d3
[05/20] ASoC: SOF: Intel: hda: report SSP link mask to machine driver
        commit: bd015f633b05a3d4f88a3d7099746b2819a523f5
[06/20] ASoC: Intel: soc-acpi: quirk topology filename dynamically
        commit: 4694b8382d6b79bcf95995757419d279a3ab375b
[07/20] ALSA: intel-dsp-config: add more ACPI HIDs for ES83x6 devices
        commit: de24d97fb845ffd2229811ee256438e42b5a8d12
[08/20] ASoC: Intel: soc-acpi: add more ACPI HIDs for ES83x6 devices
        commit: 1cedb6eabf0f2dd8285d3bb0ce1abd2369529084
[09/20] ALSA: intel-dspconfig: add ES8336 support for CNL
        commit: cded07a2dccd5493696a3adce175f01e413423c6
[10/20] ASoC: Intel: soc-acpi: add ESSX8336 support on Cannon Lake machines
        commit: b3d6a07236ebf6e0111adb957d69bebccf4f0a19
[11/20] ASoC: Intel: sof_es8336: make gpio optional
        commit: 5a6cfba5553b4f315b3d12b423e56a7fb9e8e0be
[12/20] ASoC: Intel: sof_es8336: get codec device with ACPI instead of bus search
        commit: 42302b205f03c74c0226bbc79dca48448dd11d48
[13/20] ASoC: Intel: Revert "ASoC: Intel: sof_es8336: add quirk for Huawei D15 2021"
        commit: 1b5283483a782f6560999d8d5965b1874d104812
[14/20] ASoC: Intel: sof_es8336: use NHLT information to set dmic and SSP
        commit: 651c304df7f6e3fbb4779527efa3eb128ef91329
[15/20] ASoC: Intel: sof_es8336: log all quirks
        commit: 9c818d849192491a8799b1cb14ca0f7aead4fb09
[16/20] ASoC: Intel: sof_es8336: move comment to the right place
        commit: d94c11a9b0e8620d7cf0e6d8e60d685cdb24c475
[17/20] ASoC: Intel: sof_es8336: add support for JD inverted quirk
        commit: 8e5db49182415b8bfce3b5843fc87e49c83c02aa
[18/20] ASoC: Intel: sof_es8336: extend machine driver to support ES8326 codec
        commit: 70b519e5cade92bddf837bd3941f905b44232b05
[19/20] ASoC: Intel: sof_es8336: add cfg-dmics component for UCM support
        commit: 6e13567d2fdf54ce00212cac7ecd5418648da749
[20/20] ASoC: Intel: bytcht_es8316: move comment to the right place
        commit: fe0596a006081bc963874d4f3d38cd0b1b5e46d4

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
