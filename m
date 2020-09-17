Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D7026E4D9
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 21:00:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10EAA1699;
	Thu, 17 Sep 2020 20:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10EAA1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600369220;
	bh=u9mh+AijHpIErfNJNMJUrUaC6C9FZk2VizltieCw06o=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RTPVPNoCQUS86SowWJcEcIIj+S1vh0GOHXipY9ruldOdRcmUT3gDcU/yvoYGlEDKp
	 kDJqn80T2js5R65TW28U5Li35gdtQXzTsQbjc6RhmwpYhl35GGXRixh2h2Q4Tfd0Rj
	 3LexrgVo1LH6c/rgFi5PMdArZ0Rtt+aiBQxonTWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D5B7F802C4;
	Thu, 17 Sep 2020 20:57:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74ADEF802C3; Thu, 17 Sep 2020 20:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C257DF8027C
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 20:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C257DF8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="18GS+sSR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA57C2072E;
 Thu, 17 Sep 2020 18:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600369069;
 bh=u9mh+AijHpIErfNJNMJUrUaC6C9FZk2VizltieCw06o=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=18GS+sSRmXkfQPQoq0QI1aSD0JTO4Nn8ExBaxdDJWZEbO+AKnxDHV/GgRGLQ1zVqf
 iiprAp+e9ZUc6oHr0OTbwarnFysovMP+n8njdmlL5HAC5mj4PFHrMPNpdHKP0PqIm4
 jdLl+WcLQ8kCDw+efrXm5NUbdQZGpFYsynBRMbKU=
Date: Thu, 17 Sep 2020 19:56:59 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200917103609.2559916-1-kai.vehmanen@linux.intel.com>
References: <20200917103609.2559916-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Add support for tgl-h
Message-Id: <160036900934.20113.13931109991929748377.b4-ty@kernel.org>
Cc: pierre-louis.bossart@linux.intel.com, Rander Wang <rander.wang@intel.com>,
 daniel.baluta@nxp.com, lgirdwood@gmail.com, ranjani.sridharan@linux.intel.com
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

On Thu, 17 Sep 2020 13:36:09 +0300, Kai Vehmanen wrote:
> SOF will support tgl-h and tgl-lp in different FW binaries due to
> hardware difference, so create another dev_desc entry with FW name
> of sof-tgl-h.ri and dsp_desc named tglh_chip_info for tgl-h.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Add support for tgl-h
      commit: 30ee3738f849b3f4af623c20adec73cdc4573a2e

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
