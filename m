Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B962347F015
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 17:19:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C804A180F;
	Fri, 24 Dec 2021 17:18:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C804A180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640362758;
	bh=c770Vl0s4K8ne0JvN1d9u+B9NXqvmS0SNJ/Vr5lpXpE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VL9RLPGAcRv2XSQO1kx/qloP5KLIUgGW5KyUwwfmkpHUlfe4W4LEjqXle/7EY46Fd
	 nfSNcSV3YDPKJTtA4arlKjsBkPUAYB6o/Fi+Wf37pw2YEcFWn7EVz8hbaQ0jCKhMtY
	 BQulCRp6jA7Q2OiP99Khzq3z2VKLZTfG0BpDpPGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CAA6F804FB;
	Fri, 24 Dec 2021 17:17:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F369BF8014B; Fri, 24 Dec 2021 17:17:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE6EFF800F2
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 17:17:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE6EFF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZEHguiC6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA16A61E1D;
 Fri, 24 Dec 2021 16:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F5FC36AE8;
 Fri, 24 Dec 2021 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640362649;
 bh=c770Vl0s4K8ne0JvN1d9u+B9NXqvmS0SNJ/Vr5lpXpE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZEHguiC6Sx7jrCAhJzIdc2b9ali2tP+4TU7f9jBubYM0wRTV+5z2WM1d+UdVO+SSM
 4pW7maR7w6UnpSEr5pGdlEcI7kV19acXkdaZ6ur5GPnzaCnsBwQegp5vLvQHOtsezx
 50d8BGJHorLbpnq3Y7QfTbaJBh6een0e4Lf7RQSTZpsb1uBYsf9bJTCGeQ9dqLsVra
 1w+6qTu+nP1SNiNTASOCEP4dyg6JnKwZngEGpDLtacCxpviuFrOk2Ko0k3GpuC8Vxk
 0RkZrccFISvkZh6J+83wizRMFkcpGi0UV4X+FbWDVzSBpeuGIXmQn3BjLB8alJbv6q
 6wjAsYfRYVHhg==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com, lgirdwood@gmail.com
In-Reply-To: <20211209015707.409870-1-chi.minghao@zte.com.cn>
References: <20211209015707.409870-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] sound:soc:remove unneeded variable
Message-Id: <164036264573.3720027.488082222157598597.b4-ty@kernel.org>
Date: Fri, 24 Dec 2021 16:17:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 srivasam@codeaurora.org, lkp@intel.com, kuninori.morimoto.gx@renesas.com,
 Zeal Robot <zealci@zte.com.cm>, tiwai@suse.com, linux-kernel@vger.kernel.org,
 chi.minghao@zte.com.cn, srinivas.kandagatla@linaro.org, pulehui@huawei.com,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

On Thu, 9 Dec 2021 01:57:07 +0000, cgel.zte@gmail.com wrote:
> From: chiminghao <chi.minghao@zte.com.cn>
> 
> return value form directly instead of
> taking this in another redundant variable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] sound:soc:remove unneeded variable
      commit: b2fde4deff854ca7d49ec735a8252d944418b64d

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
