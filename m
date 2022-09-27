Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 370E75EC6D8
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 16:50:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDAE1886;
	Tue, 27 Sep 2022 16:49:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDAE1886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664290211;
	bh=oW2GlI27eoYpEACDh9WXB1kbVwlV6tTbo8tfVLYs1tg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H2JcIaFiku+9OH05xCkb2USWrLywW0UOJY63TotYpqq+cQwgDX9iJsEZxbxVqIVmK
	 4x1GmboYr2eoeoenOEgK3q/P5WUZ3nwr8yLBmDRku+gnjFjj0Epv3RK0EJak96vsRp
	 c8Zz3QyBv60CWN6luCHQ/P5Qb7yeHSc3NPtPjomQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51BEAF80515;
	Tue, 27 Sep 2022 16:48:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22326F8025E; Tue, 27 Sep 2022 16:48:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC1BEF8024C
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 16:48:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC1BEF8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ljSsMs6y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED485619F6;
 Tue, 27 Sep 2022 14:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7BAC433D6;
 Tue, 27 Sep 2022 14:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664290122;
 bh=oW2GlI27eoYpEACDh9WXB1kbVwlV6tTbo8tfVLYs1tg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ljSsMs6yGMFG8QDrdU9Ff24nYRnOwWJ8toPTJ+sG610laF9brbINOA4nSxaRlKt6T
 QCQqgdq2xJEF4yO+dFwbVaupusWDikmxrpShQgjRNdDMZxZg3neejvIjKuNNTXoByV
 7Te1C8f6zXuXbW6972psmWh/YFCsz4OboD8byKyQq7472UOxlpxlwHaAh7dctxnt8+
 9h43dRBMFtzyCpEBeFBiXqlUZT45xGAy9jED7WHRkgeL8zL6RqBokQOqExtZEbwn9A
 O2FXgD8O7rZsi4zDFHvNj59Bqp81IoUkaeM0swehBGZOJ3IVovaOcJfINYcI/n80Wj
 pi9qJY+M5s3kg==
From: Mark Brown <broonie@kernel.org>
To: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <20220927121440.2506632-1-sbinding@opensource.cirrus.com>
References: <20220927121440.2506632-1-sbinding@opensource.cirrus.com>
Subject: Re: [PATCH v1] ASoC: cs42l42: Fallback to headphones for type detect
Message-Id: <166429012122.444806.6143435073545852825.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 15:48:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Tue, 27 Sep 2022 13:14:40 +0100, Stefan Binding wrote:
> After tip sense detects a jack insertion, if automatic
> type detection, and manual type detection fails, then
> fall back to assume the jack connected belongs to
> headphones.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l42: Fallback to headphones for type detect
      commit: 45560891506fae31be66f2a73693c5c8bd7dbedb

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
