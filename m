Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2D297A04
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Oct 2020 02:31:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4088F17FF;
	Sat, 24 Oct 2020 02:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4088F17FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603499519;
	bh=RsXFfkOEFfdLWi9HJazwWeceFHXhYczHHadtZ1Qy+3A=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aa6iyinkFbSU9Ho4uIDpP2hFGHdt10W4d14vxVdQkt5YIrXMSxGjgB4WrfiCGbWA6
	 IFHXWIXohgC7EHK5rTzLVbcoT+D0cMqAp+phDv+NZPQgf3ZMCfmy9ov79MX0TpCgnS
	 8MEQFnDgT3XW/mZcZWaCg3t5iGjNA3uQyUG8QXaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA560F804C1;
	Sat, 24 Oct 2020 02:29:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF6C1F804B2; Sat, 24 Oct 2020 02:29:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB9C8F80253
 for <alsa-devel@alsa-project.org>; Sat, 24 Oct 2020 02:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB9C8F80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QjVBdlp2"
Received: from localhost (cpc102338-sgyl38-2-0-cust404.18-2.cable.virginm.net
 [77.102.33.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B3EE22274;
 Sat, 24 Oct 2020 00:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603499339;
 bh=RsXFfkOEFfdLWi9HJazwWeceFHXhYczHHadtZ1Qy+3A=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=QjVBdlp2SyGhfe6Ci+sFakCTZaTWI7WVxrl9JX2o2xtjut1/DhdpmxZnUTvDX4sTn
 z9Dzc+V+jTU3Q337WvHvI4oUjB51IeSoo6l7dIIkYN2Z90W63SrjiRFYP4ajqxKEze
 nZKw2Rhkbb44KPzVIxm28uts35sWdi+HUOZ1oZ30=
Date: Sat, 24 Oct 2020 01:28:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20201022130518.31723-1-srinivas.kandagatla@linaro.org>
References: <20201022130518.31723-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: wsa881x: add missing stream rates and format
Message-Id: <160349931942.28438.14450797150315079803.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
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

On Thu, 22 Oct 2020 14:05:18 +0100, Srinivas Kandagatla wrote:
> Add missing supported rates and formats for the stream, without
> which attempt to do playback will fail to find any matching rates/format.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wsa881x: add missing stream rates and format
      commit: f47d0742515748162d3fc35f04331c5b81c0ed47

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
