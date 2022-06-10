Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03711546A03
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 18:00:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 940821934;
	Fri, 10 Jun 2022 17:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 940821934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654876833;
	bh=qro+azxz71OSpfe9WsMA07IXY5sueDBA6p6LU16CgHQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GBNLXFabmlQdvnNOMepvhTX1E3LTZsV6bk8VGLTkFWVLf+hkNv/0ommYkmMVMgScf
	 WpMZrhE6bv6a6c1uu9fNxmXICwFBvKUizLE1K/IPCE9aVDz43h0N0wDro5sbfJ7Qgr
	 iOCfcl4uNEUj8JpjDpkwd5y9LYeJMfRM9TRfl+7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5804F80529;
	Fri, 10 Jun 2022 17:59:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC920F804E7; Fri, 10 Jun 2022 17:59:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFBD7F804CF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 17:58:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFBD7F804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UTUgBiAz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D64DAB83630;
 Fri, 10 Jun 2022 15:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40ED9C3411F;
 Fri, 10 Jun 2022 15:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654876729;
 bh=qro+azxz71OSpfe9WsMA07IXY5sueDBA6p6LU16CgHQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UTUgBiAzqmv8+i0D5xYIId2kHyOCf6WUyy1wvybzc0wkeyMtPX/QawTCO+PNYzXrI
 WQjH3TfBrxNq5h26sXwVz0kB1i5TH1kZRqmeSktCfrt1fNEWbaR31pzxmdkjBZJG2x
 zb9N+/5aeXR+RgRGopL+hWWJA3xJggFkRJjShcDH1FGB5A8nSOPv/PFTV0A5mPTWCp
 YhEzFruAiSd/G/oHA2u1ZdBC9pvOYJHYvHcFd/bhgykYybLVNV+2QSQRpsoEkAiH1Y
 203dNoimT/f+7u4dG8NXgYqLqwIm7Nf9tb8zKkMQq25JEaw4CkD0db4Hb5ShScFn5+
 e85yDaAazWqsQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com
In-Reply-To: <20220610071245.26576-1-peter.ujfalusi@linux.intel.com>
References: <20220610071245.26576-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc3-dtrace: use pm_runtime_resume_and_get()
Message-Id: <165487672798.1755957.2157041785473558160.b4-ty@kernel.org>
Date: Fri, 10 Jun 2022 16:58:47 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

On Fri, 10 Jun 2022 10:12:45 +0300, Peter Ujfalusi wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Use pm_runtime_resume_and_get() to replace the pm_runtime_get_sync() and
> pm_runtime_put_noidle() pattern.
> 
> No functional changes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc3-dtrace: use pm_runtime_resume_and_get()
      commit: c7b6c95c3ef37d7a0b28e62391bccfefdabd7a18

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
