Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9748358A65
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 18:59:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D5531684;
	Thu,  8 Apr 2021 18:58:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D5531684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617901175;
	bh=GWpb/4CWrW5dOgeUJNjVwnPmhCH3Tqxz6l+xlJjGsZs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mJX70yLX1Q8+LiPxUrgmqtxEJYn2YzWSjAT/cc2UVt0OgF9L7ZEMNEx+hsFkC7Gl1
	 xm+kuNxJiViTgKpyQUfif69RkXlZF6nf8AgT2ZOUpLjSndnM9hdSg7nn1QsmUJ3xKh
	 ynSLyygbZeM+bZ+vGalouiXz7Rlyq+1/1ak53B74=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58297F804E3;
	Thu,  8 Apr 2021 18:55:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4091EF804B0; Thu,  8 Apr 2021 18:55:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18E63F802C9
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 18:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18E63F802C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o6+NQEY1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5AAD36115B;
 Thu,  8 Apr 2021 16:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617900944;
 bh=GWpb/4CWrW5dOgeUJNjVwnPmhCH3Tqxz6l+xlJjGsZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o6+NQEY10TfULYi/XtxUE45DQd7LGoHX/+xCtDoIam/6qWkrXbsxqumFwCoNt8bwe
 tQyL3mq7+Mp+0i4gjH9ZuoZz9fIhZUs7K0GflIVOmKjTS68Lh6QUNXgQ92QrnZ3NUz
 swg92H8hYpLl7hzxgqYyFHHauARAcljBzSeLgj+Wrlgyr58Qn1RKsTS5hrtALWIqB6
 LBls/auxgyXtr+I9gcmByIyYdOOOi71eok8Mk/fD4YBheay1Yvl/quoiZRAwXSUSVG
 p7AR3On/otsnP4YNOFIZaA3pxGoTGP1nzc0xroUh/byr9K97xvCXjXBowWYx9dpME3
 sAG9D5C+Mrxcw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Muhammad Usama Anjum <musamaanjum@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, linux-sunxi@lists.linux.dev,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Timur Tabi <timur@kernel.org>
Subject: Re: [PATCH] ASoC: fsl: sunxi: remove redundant dev_err call
Date: Thu,  8 Apr 2021 17:54:43 +0100
Message-Id: <161790012549.16915.4440454202344762892.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407095634.GA1379642@LEGION>
References: <20210407095634.GA1379642@LEGION>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linqiheng@huawei.com, Mark Brown <broonie@kernel.org>,
 kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com
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

On Wed, 7 Apr 2021 14:56:34 +0500, Muhammad Usama Anjum wrote:
> devm_ioremap_resource() prints error message in itself. Remove the
> dev_err call to avoid redundant error message.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: sunxi: remove redundant dev_err call
      commit: a93799d55fd479f540ed97066e69114aa7709787

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
