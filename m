Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 080A151502C
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 18:03:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA5B915DC;
	Fri, 29 Apr 2022 18:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA5B915DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651248181;
	bh=twOOGelUDBE6PZk7xbCYJOavgIVakOZCoPhBsz/Uam0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NY7/nru1Wv4SZOrMChmNNYEmM+/L0A8x27cBqrFVRt5t/weA629aT+C+BeSS4rMtL
	 sk0RUj5ASKFVP9F6G56X5L9sUn3V6dp+KI3k/cUM1xxPXLnYFFivY3guW9qTQ/v3rK
	 9n9q+m1r/9Aiv9OUMAV6j3Y7ZMNGq0gSj46HkoKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39332F8012B;
	Fri, 29 Apr 2022 18:02:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8DF3F8025D; Fri, 29 Apr 2022 18:02:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 033F5F8012B
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 18:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 033F5F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YKZHXpus"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 75ED962261;
 Fri, 29 Apr 2022 16:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373C4C385A7;
 Fri, 29 Apr 2022 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651248116;
 bh=twOOGelUDBE6PZk7xbCYJOavgIVakOZCoPhBsz/Uam0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YKZHXpusHR3iMS4WWsHShkXReUTFMhV81La4xcnxsTK5fCVJ0sAFQltita4H0Bi75
 XA3/xt/fUVyVhF4tpH0jC4HImS3NvUqC9l6am9NoRkt+1FCKcEARge1Cul5lZUAUgo
 6ePeHnAHh/Evt/jeIVjYUMvvSpj3xw0ETNx4eKliYRsyP3KXFVGcN+cRVAlZhFtcdY
 viWzLUi2WqRV/7uW7bMwleeavIyP+7m6eMSf3ds4v8CD4GhGedf7ZHVy6/B7Igy0UU
 3dbr3EjF/STt206GL407v9v7p6MHrY/A4JQhL4oKN2RLRKf9+mtI52QW89KKYkrsG4
 OvORlm5uQ75Cg==
From: Mark Brown <broonie@kernel.org>
To: ranjani.sridharan@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
References: <20220425221129.124615-1-ranjani.sridharan@linux.intel.com>
Subject: Re: [PATCH 00/10] ASoC: SOF: IPC Abstraction for FW loading
Message-Id: <165124811594.194367.3984845475330069812.b4-ty@kernel.org>
Date: Fri, 29 Apr 2022 17:01:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com
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

On Mon, 25 Apr 2022 15:11:19 -0700, Ranjani Sridharan wrote:
> This series introduces IPC abstraction for FW loading in the SOF driver
> in preparation for supporting the new IPC version in the SOF firmware.
> 
> Peter Ujfalusi (10):
>   ASoC: SOF: Introduce IPC dependent ops for firmware handling, loading
>   ASoC: SOF: ipc3-loader: Implement firmware parsing and loading
>   ASoC: SOF: ipc: Add check for fw_loader ops
>   ASoC: SOF: loader: Switch to use the fw_loader ops
>   ASoC: SOF: amd: renoir: Do not set the load_module ops
>   ASoC: SOF: imx: Do not set the load_module ops
>   ASoC: SOF: Intel: bdw/byt/pci-tng: Do not set the load_module ops
>   ASoC: SOF: mediatek: mt8195: Do not set the load_module ops
>   ASoC: SOF: loader: Remove snd_sof_parse_module_memcpy() as it is not
>     used
>   ASoC: SOF: loader: Call optional query_fw_configuration on first boot
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: SOF: Introduce IPC dependent ops for firmware handling, loading
        commit: 61bafd1c4571ceb9cdf1830a257eac873d0b68ee
[02/10] ASoC: SOF: ipc3-loader: Implement firmware parsing and loading
        commit: d2458baa799fff377660d86323dd20a3f4deecb4
[03/10] ASoC: SOF: ipc: Add check for fw_loader ops
        commit: 2a6099a73c943130c6f864c2df9c5607d25f6b6b
[04/10] ASoC: SOF: loader: Switch to use the fw_loader ops
        commit: 143cdcf1780eae05c33184380987d29682ac1ad6
[05/10] ASoC: SOF: amd: renoir: Do not set the load_module ops
        commit: 0da5f110c583551b39471ecedc3fba704c7362a5
[06/10] ASoC: SOF: imx: Do not set the load_module ops
        commit: 499c55fe5f5e5c4d586777e6850f484c1ded3bb8
[07/10] ASoC: SOF: Intel: bdw/byt/pci-tng: Do not set the load_module ops
        commit: a22502fb61b2fdd9ba12e158590a29b6d35ae68a
[08/10] ASoC: SOF: mediatek: mt8195: Do not set the load_module ops
        commit: 77b677d139dbf53fec02e1cfe3cc593f5a5f080a
[09/10] ASoC: SOF: loader: Remove snd_sof_parse_module_memcpy() as it is not used
        commit: 910bd536d3f72d9c39e5ec08e946c11f9bcdc532
[10/10] ASoC: SOF: loader: Call optional query_fw_configuration on first boot
        commit: 1dd4b999dad2d8b8fce257e4c3c3d334a709c933

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
