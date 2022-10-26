Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE2F60E850
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 21:06:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B75E3397A;
	Wed, 26 Oct 2022 21:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B75E3397A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666811204;
	bh=FQzzc9G6SIlKau0IHt8zmNyaxJduuqD5bA0IfrjBxoc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p4o2ybu5kaFlYmeyQg9W78i2WTZMbhjJGX8opTXl03WdlzpS8xWjeFohhRowEkjg/
	 t/9ed2gUOCCYnl7J9afqApW+CGJ0cS8x/OvP6aZAcHzlBi76grEnMMvHRmJm3y9oho
	 6FsNTg6LpMZqFLtTZfr38TdQtWd0iAIlCMkJEm00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D083F80570;
	Wed, 26 Oct 2022 21:04:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7F81F80563; Wed, 26 Oct 2022 21:04:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40CAAF80271
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 21:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40CAAF80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jGhAHpPM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8E1062033;
 Wed, 26 Oct 2022 19:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF036C433D6;
 Wed, 26 Oct 2022 19:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666811070;
 bh=FQzzc9G6SIlKau0IHt8zmNyaxJduuqD5bA0IfrjBxoc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jGhAHpPMsdOIK5gvKq7IuOOOEbLPtRc8hRuapyZqs7xakphFAwc7D4ffg2C0VdABG
 NhkcfjEjtPGTO7ZCUYoNYjrpsAWxw4dZEcjlMH2kZouxVQGAzBj/MSduoDX9AFXDJJ
 ONybpQcLXzN5hG5x0jUl/i1zY+RfpQS9zkO1u5LAWA21cvXTqvQi7G7mu7XN5Mbf2b
 nb2e8bvPdRmXYSZnkyUZ0Z+WHznU8RLFDYjWJvhhYgG8BOYZZPR40D1gZB41C/z49h
 n9VK3EW2+icgxdaa/NeRNWhwguTLdqt4HBod7h626/Cws1zxzN3YZVGwH+sTKUYj/M
 O9qN3GCS6v5Fw==
From: Mark Brown <broonie@kernel.org>
To: dan.carpenter@oracle.com, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20221025132706.30356-1-peter.ujfalusi@linux.intel.com>
References: <20221025132706.30356-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: ipc4-loader: Return ssize_t from
 sof_ipc4_fw_parse_ext_man()
Message-Id: <166681106844.960840.17789715962001189177.b4-ty@kernel.org>
Date: Wed, 26 Oct 2022 20:04:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Tue, 25 Oct 2022 16:27:06 +0300, Peter Ujfalusi wrote:
> sof_ipc4_fw_parse_ext_man() can return negative error numbers which is not
> correct for the used size_t type.
> 
> Change the return value to ssize_t and use the same type where the function
> is called.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: ipc4-loader: Return ssize_t from sof_ipc4_fw_parse_ext_man()
      commit: 5cab0d6c2bd1272287068943471102dc6a0c4bcc

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
