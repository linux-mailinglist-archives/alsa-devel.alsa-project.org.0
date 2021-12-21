Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 177A447B895
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 03:52:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 324F81765;
	Tue, 21 Dec 2021 03:51:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 324F81765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640055148;
	bh=qQto044tUPVPpnbdUp5FktJtQgOCgBJ1qD3rpkVMAfo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VciUOvuaSRwTSrTTNIhSkrFt3ZRbGEmiJBtKLqganGO1jjwKi7qA08L6AJqqqFXNS
	 pTiifubh13sqZ0LZ6DJIzZrperj5gnOS9lUnk/mvkavbafsxYGUXnmKvttMpGjKEKT
	 Hvj7Nd1RuzbVaU77h9WHCSheM1ecpfK6bKEYQtNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E74EF804FA;
	Tue, 21 Dec 2021 03:50:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B02A7F804F2; Tue, 21 Dec 2021 03:50:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02675F804D9
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 03:50:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02675F804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QvnhPB34"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8AB66134A;
 Tue, 21 Dec 2021 02:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05170C36AEA;
 Tue, 21 Dec 2021 02:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640055046;
 bh=qQto044tUPVPpnbdUp5FktJtQgOCgBJ1qD3rpkVMAfo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QvnhPB34XF3PdY7T6KmcVD2QFgRcE06eIRA6+brQ2RnGG94Tua6cx+4MaE5Eimisk
 NicVdEbvvizSpAhCQBIvOVo1Zimoqzje6vAqCuvmpWiFLUEoB9Q+XwFKR3gI5Gjl41
 64FQJHp/Me/NUxLRM5Fq2mkjiLPXqiOq7nvJ0RRGYwLWtE7+WkWc5rrGDK3TrCKvl5
 b8PkRvS3uyDI3D7GpsFIyI95nEnBLm6EHeQeO9BTttnNqchBMQl0XK9DLE6vDgNP6Y
 Sdyj3DXpfg5PiD2G2GZe1+lfp31mwvbP+w8ctl7VOVQxYwoJjvdyeJoa/aR9d2TZ2s
 ymRGl9TMloXrw==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20211216232422.345164-1-pierre-louis.bossart@linux.intel.com>
References: <20211216232422.345164-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: couple of cleanups
Message-Id: <164005504574.2647792.9498416669327296948.b4-ty@kernel.org>
Date: Tue, 21 Dec 2021 02:50:45 +0000
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

On Thu, 16 Dec 2021 17:24:19 -0600, Pierre-Louis Bossart wrote:
> Guennadi spotted inconsistencies with our 'const' handling, Ajit Kumar
> flagged a missing check for a null pointer and we missed the
> definition of debug zones.
> 
> This should be queued for 5.17.
> 
> Ajit Kumar Pandey (1):
>   ASoC: SOF: ipc: Add null pointer check for substream->runtime
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: avoid casting "const" attribute away
      commit: cb515f105cab124c5740e70dd0e8c78186ae81b7
[2/3] ASoC: SOF: ipc: Add null pointer check for substream->runtime
      commit: 182b682b9ab1348e07ea1bf9d8f2505cc67f9237
[3/3] ipc: debug: Add shared memory heap to memory scan
      commit: 60ded273e4c047aec364f70195aced71a4082f90

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
