Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FE7544DEC
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 15:42:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E51C81B09;
	Thu,  9 Jun 2022 15:41:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E51C81B09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654782167;
	bh=YfwemhhRNfHkDcE7hmvHDoWfd3apl8aK4u9+a87TYAU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZlQ4SIpr/xvNXg1UeXPJIr5dJvpdtZ44loSUTchyTno3C8VnPU+d2SGyflOWlBoR4
	 t986sRIMKL6cyTkvdvL30ZTbNVLRH2Sta3QsHa9cnPKooJ0KvEfi6J2Si8CsKt6gQV
	 UVfPCr4tt53J/nqrLcdxSdgLZEI8CKgvDJqbu/VA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F82BF800E9;
	Thu,  9 Jun 2022 15:41:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2337FF8019D; Thu,  9 Jun 2022 15:41:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F3DAF800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 15:41:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F3DAF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j6NCY82a"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 642A0B82DE6;
 Thu,  9 Jun 2022 13:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8304C34114;
 Thu,  9 Jun 2022 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654782099;
 bh=YfwemhhRNfHkDcE7hmvHDoWfd3apl8aK4u9+a87TYAU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=j6NCY82atJdRW+KDfnW10DrMSfLqY+EmOIQyNSG4Tfr3eoio+yE9T2rPOp1IeO1E+
 PGqCi7NT+bUklMuWQinSASg0FxPEAW31dDfB6AErks7p6O43T12oUgPkfCzuP53h2p
 O4bporKziDJnDVZ/9Z5AUn2PCu6JNev8RDpud/cbmgpyRDlN7MdIU/OToaqCtFiknN
 +xMaYj7UO9+y+X6z4JVWNAbNmH36Sar2yz5w5oRbcAv8Hy5MNAhVHEkuP6TcfApGsd
 Yj5N3r9FLXNbmjD+IcFuVY7X/St6Us9AvlKDNAlD97hMtGVXaX4H91wL22A67T0UMb
 gNdr6wJFeQGjQ==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com, shengjiu.wang@gmail.com
In-Reply-To: <20220606033705.291048-1-chi.minghao@zte.com.cn>
References: <20220606033705.291048-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH V2] ASoC: imx-audmux: remove unnecessary check of
 clk_disable_unprepare/clk_prepare_enable
Message-Id: <165478209647.1066808.13320829803906102569.b4-ty@kernel.org>
Date: Thu, 09 Jun 2022 14:41:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, zealci@zte.com.cn, lgirdwood@gmail.com,
 chi.minghao@zte.com.cn, nicoleotsuka@gmail.com,
 linux-arm-kernel@lists.infradead.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
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

On Mon, 6 Jun 2022 03:37:05 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Because clk_disable_unprepare/clk_prepare_enable already checked NULL clock
> parameter, so the additional checks are unnecessary, just remove them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-audmux: remove unnecessary check of clk_disable_unprepare/clk_prepare_enable
      commit: 142d456204cf4dabe18be59e043d806440f609d4

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
