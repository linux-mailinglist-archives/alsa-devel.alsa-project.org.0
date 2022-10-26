Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3FC60E846
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 21:06:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 224052EF6;
	Wed, 26 Oct 2022 21:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 224052EF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666811174;
	bh=8+5ptSLlh6IdFZiqXFn6vhjBXZmL3ipi/APD8cDG1ik=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XKYvHy+mY0+blNzatN1bPZ9Au4JHUumA2cpJABKgvr+VgQf7MNWypoBjsPDbWMF4r
	 s4zuSMEfd7QKpONAE2KcvoBDIgq3k+KWM8ytXFIz24SBzS2fKE5XzPZylQlyKU869e
	 T0jVzoQK1c+qEuW3u3UVJuIKrZTpS6KmItxUPj9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BD77F8055C;
	Wed, 26 Oct 2022 21:04:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FAABF804B4; Wed, 26 Oct 2022 21:04:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65584F8016C
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 21:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65584F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k2ntiEdV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F1CCB8238C;
 Wed, 26 Oct 2022 19:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5979C4347C;
 Wed, 26 Oct 2022 19:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666811067;
 bh=8+5ptSLlh6IdFZiqXFn6vhjBXZmL3ipi/APD8cDG1ik=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=k2ntiEdV+2yJ9PEt6Yl1IOselJ/LZJA5zLMtO8U+5lvcQKY2EDF9VZOajJboPCddc
 cUoxKvMMYodXx4jUw060dUYI6TqqQ6Y+cXoARM0INOH3wfQe2RUbilrmXjkmm5MCvZ
 93wvKGNdnrIDVh2ojufJA8jJJvN8+kPKkkaX/0rrBTCGxxOjn+2b6KPLmBRM6yztz2
 KhWWhQC4aO9XR97rLeRoXNX6GsxN3C/sY3aj2GGJoOLZBOe7KwqemAQquSvnG3pUmy
 iJgvSbHi9Xkm9mxMsMdFT8fvhf4bhSQqUzxZFq/VDgXMEFRKmEGPMlx+wKtMxLSxN4
 laAw28fURbmWA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20221024164350.234830-1-pierre-louis.bossart@linux.intel.com>
References: <20221024164350.234830-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: MTL: fix comment error
Message-Id: <166681106566.960840.3705603835937928185.b4-ty@kernel.org>
Date: Wed, 26 Oct 2022 20:04:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: tiwai@suse.de, Péter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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

On Mon, 24 Oct 2022 11:43:50 -0500, Pierre-Louis Bossart wrote:
> From: Yong Zhi <yong.zhi@intel.com>
> 
> Fix small cut-and-paste error in comment.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: MTL: fix comment error
      commit: 514bc59bfcd02a7f241dad91b5534faffb7effd6

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
