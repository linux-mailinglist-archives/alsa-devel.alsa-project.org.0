Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9A349FD6C
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 17:00:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 354711711;
	Fri, 28 Jan 2022 16:59:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 354711711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643385627;
	bh=y+ep09zR78q8G5W3BKI9hlMB9ZdPXwl1deXwNREaBjg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRCUAz/SCifYcuRbkJ2b8jSXFewzZidouqryK3WIBqarEJoQlO2QZB4OyufKd8uRJ
	 hcOvJe7d75KjabBIEHsTZLNktX/VVoWyKiVNTDQyBXB6xaSVthoachK3puL2dL28UZ
	 0dZgV72TGxCtK9014MD7CGOMKmnJyVx0NdAD1etQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D94FF80482;
	Fri, 28 Jan 2022 16:58:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 065E8F80482; Fri, 28 Jan 2022 16:58:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B98BF8014B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 16:58:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B98BF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Wu81xjVb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 076BE61EAF;
 Fri, 28 Jan 2022 15:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E8EC340E0;
 Fri, 28 Jan 2022 15:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643385519;
 bh=y+ep09zR78q8G5W3BKI9hlMB9ZdPXwl1deXwNREaBjg=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=Wu81xjVbgl73yv/V4mDC3V3PuR8qQYuzzjylEp38xlv2qrErClVSgwuMz10fVBlXA
 /q4MkSoutyj6IwUtimsTNh6ZKQpDIdnpZrtDuAi87mO3vNNBHML4+Q6/WjGDx+Qkv5
 eI86YDHoaeAwriNILRTvFIXqmbwWVpOR79WTjMv6BIcHIMZ2lhK3PAQeBEkuDkN6Ly
 GdxeRsIIS1EHjwiSdAjxMjA6/hK82bfELnZmHuJLzsK/4RmeNZsWS+abbASI7L7haE
 O7g3lcwr0pNuznJRIDLOX2kzrxWvYbOpPSiVqvoCRTsfDYH1MzUXqnWq0huyHebe+3
 TViyzTt5biheQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org,
 Eric Millbrandt <emillbrandt@dekaresearch.com>,
 Miaoqian Lin <linmq006@gmail.com>, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20220127131336.30214-1-linmq006@gmail.com>
References: <YfFFWSVgnbL6ETxo@sirena.org.uk>
 <20220127131336.30214-1-linmq006@gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl: Add missing error handling in
 pcm030_fabric_probe
Message-Id: <164338551779.1711238.6752613705973183003.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 15:58:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 27 Jan 2022 13:13:34 +0000, Miaoqian Lin wrote:
> Add the missing platform_device_put() and platform_device_del()
> before return from pcm030_fabric_probe in the error handling case.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: fsl: Add missing error handling in pcm030_fabric_probe
      commit: fb25621da5702c104ce0a48de5b174ced09e5b4e

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
