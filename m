Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF24C50923D
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 23:41:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 609221B3C;
	Wed, 20 Apr 2022 23:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 609221B3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650490914;
	bh=cN5C6kBnA9q3AVkoDZmadgbTxwLugiJnY3aMJJPNdhc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GA7oifcVQgc0hWYY7GNsn/cW7Iw/gIyONvr3SBTeop0Nh5qCLQy/Rnog2ioO7cauv
	 LwErMX4yFf3OBx7Nr85qLjcWvhhy+Sqn/k1ogoRHGteyf4V/IpVGVcDPH2ApGIrhCT
	 1OKaywir16FeK1xL9/bRk6rdztWO0/cnjvDMHXuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3C4EF80217;
	Wed, 20 Apr 2022 23:40:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7374F80128; Wed, 20 Apr 2022 23:40:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1EA0F800C1
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 23:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1EA0F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QlHNU0GR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 52208B821A0;
 Wed, 20 Apr 2022 21:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50495C385A1;
 Wed, 20 Apr 2022 21:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650490848;
 bh=cN5C6kBnA9q3AVkoDZmadgbTxwLugiJnY3aMJJPNdhc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QlHNU0GRSrjYRtFMwScZrCK4Fd7uTbh1wg3SBXNUch2vlAXL4729P4iyKI5sm+KeH
 jgbFCrJKoTORPpvJwdtveSMf4OxgFzL7yM3M97sSMs63xOk8sQ3uOA3ivdeuUKsMkH
 22+F/YeJH1FpJ5f68lcmERIQn05W9qfcHlHlylf7HmtFyxqor7rkQuhOW92Ik2LLSU
 upV2FNLXlquWe5P+bm1hE3jbwtaxmaiMIElW3QggdZCRCPNMuvgIhudHEU0QpsYWx/
 c81GOSUKUDLYGEyBmxLmLo8O6SAGdZySWPXAe3L6/Roh/b7yoRVI5IbZzFCmse0lEo
 GFKV9SOl8fuww==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
References: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 00/15] ASoC: SOF: add INTEL_IPC4 plumbing
Message-Id: <165049084704.138067.12438562399515265141.b4-ty@kernel.org>
Date: Wed, 20 Apr 2022 22:40:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Thu, 14 Apr 2022 13:48:02 -0500, Pierre-Louis Bossart wrote:
> The INTEL_IPC4 protocol and firmware architecture will rely on
> different sets of firmware binary and topology files. Some platforms
> will only support INTEL_IPC4, some will support both INTEL_IPC4 and
> SOF_IPC for development, and some will stay with the existing SOF_IPC.
> 
> This patchset adds new IPC definitions, and search paths for firmware
> and topology files, along with means to override the default IPC type
> and search paths for development. The firmware binary names are
> aligned with those used by the Intel AVS driver to avoid duplicate
> firmware installs, but the topology will have to differ due to driver
> architecture differences.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/15] ASoC: SOF: add definitions for different IPC types
        commit: 15527fee767f592d894d954d78cf8af3685cda6d
[02/15] ASoC: SOF: add path indirection to each IPC type
        commit: a375791512254c154fd0d3e4091c78f4b92a5c66
[03/15] ASoC: SOF: add default IPC capability and file paths
        commit: 0cf8ff05e5d2b94b3ccf8a1fbfc633ecb0be56b0
[04/15] ASoC: SOF: add IPC-dependent file names
        commit: a97abb3cae31b4e2420da96b95e54756333f2cc3
[05/15] ASoC: SOF: sof-pci-dev: add parameter to override firmware filename
        commit: 58c520e2dad7c0abc52ce6b41b0793236398dc94
[06/15] ASoC: SOF: sof-pci-dev: add parameter to override topology filename
        commit: 772627acfeb0e670ede534b7d5502dae9668d3ee
[07/15] ASoC: SOF: sof-audio: preserve topology filename override in nocodec mode
        commit: 53fe24c2c76383712bedee6a9e4ebe2ec595345b
[08/15] ASoC: SOF: remove const qualifier for 'struct snd_sof_dsp_ops'
        commit: 856601e5a7ebe69b1c07adef7be80f9a03884329
[09/15] ASoC: SOF: Intel: hda: use common ops across platforms
        commit: 37e809d5f8a7bfbf0abbd4666d0b8ad499f12b7f
[10/15] ASoC: SOF: Intel: move HDA_CL_STREAM_FORMAT definition to header
        commit: 406fed8092d96e3cd565d6041dc381d630039fe0
[11/15] ASoC: SOF: Intel: hda: use BIT() macros for consistency
        commit: 9d201b69d04b89369240c1a7e279fda85cc94720
[12/15] ASoC: SOF: Intel: hda: define check_ipc_irq op
        commit: 3dee239e02747a5d1447249ffb4a3c4425b9e302
[13/15] ASoC: SOF: Intel: hda: Define rom_status_reg in sof_intel_dsp_desc
        commit: 71778f7940f0b496aa1ca1134f3b70b425a59bab
[14/15] ASoC: SOF: Intel: hda: expose some codeloader functions
        commit: b4e4c0b963c85072326222d7ea89078060aa824c
[15/15] ASoC: SOF: Intel: add IP identifier
        commit: 03cf7262076f08601108cc896416fc1d66671994

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
