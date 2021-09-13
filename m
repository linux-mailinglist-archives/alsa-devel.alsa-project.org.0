Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E51340899B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 12:57:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A3A1167C;
	Mon, 13 Sep 2021 12:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A3A1167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631530633;
	bh=kUrQ92vP9h8EK13GVMQFGAIqVlRq6W60sm75uv3M5D8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rbt4YkZ7L2cgEFrmPVT1b+gzlGJPb4b8fFA6UoaCYvq9PCRnmt7nvNMf0ug1q3PET
	 0+49XDefAeZGnNVPjZG0bf3TB2bTWEhyCa5NAoQBB0md2WIiFKwrkocbq6Xe8PZyiI
	 uvJMboTEd2myfCrdglz8lZfngogLlJnXTQx/VtN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E8ADF804F2;
	Mon, 13 Sep 2021 12:54:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E372F804E6; Mon, 13 Sep 2021 12:54:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ABF3F804AB
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 12:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ABF3F804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mxIkQczK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E014561004;
 Mon, 13 Sep 2021 10:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530479;
 bh=kUrQ92vP9h8EK13GVMQFGAIqVlRq6W60sm75uv3M5D8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mxIkQczKp6wVjKtmuikBd6RWa0brAeO50bXYgqyRaQe8jjF5M6tKl5HeVT0ebBR2d
 cSplQI2glhjjESJ63HDCvxmaHfGUD43bmVCJ9CWl3UQ0gsnh5Tzykkb8Q8QpKCVCf+
 32CUrPVeqpfZdwXqoh3dD7TK7gWs6O5ewr/nkRkFoBT4jw01EHZmjY/AckD2U4UoNa
 Iwb28NV4dWLRUhkJ7WEi3LqPZOLzoWMuiFb0hvU0QqOLhBCGu9DtIJP24+5xs9vpGm
 78sofN+fq8i/xk0a/IO/wsXcEENz1qzEWoR0izSlFzr6dwu1GRBFJhT/2oE1xmGG6h
 IHBqyDKOfsXyQ==
From: Mark Brown <broonie@kernel.org>
To: rander.wang@intel.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 lgirdwood@gmail.com
Subject: Re: [PATCH] ASoC: SOF: control: fix a typo in put operations for
 kcontrol
Date: Mon, 13 Sep 2021 11:53:16 +0100
Message-Id: <163152996583.45703.7024459155619829972.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210902114744.27237-1-peter.ujfalusi@linux.intel.com>
References: <20210902114744.27237-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com
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

On Thu, 2 Sep 2021 14:47:44 +0300, Peter Ujfalusi wrote:
> From: Rander Wang <rander.wang@intel.com>
> 
> SOF_CTRL_TYPE_VALUE_CHAN_SET should be used for put operations
> for consistency. The current use of _GET is obviously incorrect
> but _GET and _SET result in the same action so there is no
> functional change introduced by this patch.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: control: fix a typo in put operations for kcontrol
      commit: 5767271861985887e342fa21c3638c29e8fdfeaf

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
