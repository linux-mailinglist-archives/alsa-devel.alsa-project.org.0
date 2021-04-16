Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDEB3624F6
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 18:04:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A73C16AD;
	Fri, 16 Apr 2021 18:03:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A73C16AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618589044;
	bh=q4kPNWGjHCevb/ygPjzMGTBbhWSbFDh1WRbjYpeW124=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xj4NR83nlLimCfHa/Fb43mSVcVVTX2g+qo60xVA4a6om/t2bWql/9IQjaNraKYAck
	 GmWRupABWd/1AXBP2WT2jvCjATcrrHSWNMyU8t6ZD4PowuYsPRoGa/l67mxL/z2+eC
	 nam8MvWtlpEkUvYKVdoAPglfKg4UwCO3w98AsnrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C519DF8025B;
	Fri, 16 Apr 2021 18:02:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31E4FF8025B; Fri, 16 Apr 2021 18:02:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A12E4F800FF
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 18:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A12E4F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TtyiQr1b"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E304611C2;
 Fri, 16 Apr 2021 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618588947;
 bh=q4kPNWGjHCevb/ygPjzMGTBbhWSbFDh1WRbjYpeW124=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TtyiQr1bDYOghs5OG6PVl85zQsOUIXKnZ9ERTtTuDS9Y22iKbjjuZyyqYUMtgD1si
 FQNKEtmULjmEMqtnlEYbve+/94BDTwb3fmd65bRvSryislh7f+YXzXXnS3i4vosRQt
 fxBYn+BtZlhfMu8IcoO4cbGBesxbOeRrs2nu4s7aDUvnDs8sMWToKQSQdzLuqky1u+
 LnwneSSaYYRrJD+QauVRKsPp9kpPhvrUGgsgrBbV4sUExY7+iQQ9/4yt2XgoOScl39
 16Qmc/V0sc8ZnXTBA7nhOYiSH9KVmsyuI/LSnpjhbuwpvxuYEEL5IG/btLYnc5nnrZ
 HJ1rztQPNqNeA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
	Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [RESEND PATCH v2] ASoC: core: Don't set platform name when
 of_node is set
Date: Fri, 16 Apr 2021 17:01:47 +0100
Message-Id: <161858869853.28833.2706372682626143806.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210414101212.65573-1-daniel.baluta@oss.nxp.com>
References: <20210414101212.65573-1-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, shengjiu.wang@nxp.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 Mark Brown <broonie@kernel.org>, linux-imx@nxp.com, daniel.baluta@nxp.com
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

On Wed, 14 Apr 2021 13:12:12 +0300, Daniel Baluta wrote:
> A DAI link has 3 components:
> 	* CPU
> 	* platform
> 	* codec(s)
> 
> A component is specified via:
> 	* name
> 	* of_node
> 	* dai_name
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: core: Don't set platform name when of_node is set
      commit: d97140033948363ffdf5ed71dd2366f717e120e7

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
