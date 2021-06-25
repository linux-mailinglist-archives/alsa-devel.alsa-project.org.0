Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC03B4470
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Jun 2021 15:27:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20DE51689;
	Fri, 25 Jun 2021 15:26:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20DE51689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624627626;
	bh=tap7YRggbHIdkEpjJ/bP0UQLC1WqPENH/gRQwTG/qbA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pqTcULcEc6rmzqKTflHKNs/NoC0GzjNPdOsSPwqvrsIhkVRsDWz2n+ma7Gs+Dn5Fm
	 VpS0LOsY1viIJze53ftrTZ7wVl0BhVvTM0axOdBuRL+JTfJfkRsjxhKtkP6b55qryL
	 c4RAtoiacgFrllnk+znZ3Yfls8NPBTWP9uUflQ3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F2CEF800E1;
	Fri, 25 Jun 2021 15:25:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56417F801D5; Fri, 25 Jun 2021 15:25:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F20A4F800E1
 for <alsa-devel@alsa-project.org>; Fri, 25 Jun 2021 15:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F20A4F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uOpKh/DM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 62D6661962;
 Fri, 25 Jun 2021 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624627529;
 bh=tap7YRggbHIdkEpjJ/bP0UQLC1WqPENH/gRQwTG/qbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uOpKh/DMAdoOJqUA2DY4RJ3byCu44ZOLlBbc6plAGQssiYWKKWs+MsZB2UGZ1rlP3
 0a4pnrOmT91DqFwnmnuY8rDw4EbOYnraCidGM1hdJReLlUVIILFxOXlEaLMJuWnFZv
 eb/0r1pDLOVvaX37ZBNDkveSCMJKNVNEyBxU8xqiAFZBswTyNVGIbVgeU/AZcwuqry
 Uau1OOvd+OQxMFf3TAjvSZAQmI/7w+6sH295NdLKdlKkjxYdfOp+GZYV0kL/pDYXGr
 qrPvH7D6MYO2AODGXiGvfID5zsUSqpvRh9PRePaRfVFjtZPo7oce3HW3cgddTl40Li
 1tb3Ac2AjwgMQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: lpass-cpu: mark IRQ_CLEAR register as
 volatile and readable
Date: Fri, 25 Jun 2021 14:24:57 +0100
Message-Id: <162462667882.45385.4252603231977049463.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210624092153.5771-1-srinivas.kandagatla@linaro.org>
References: <20210624092153.5771-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
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

On Thu, 24 Jun 2021 10:21:53 +0100, Srinivas Kandagatla wrote:
> Currently IRQ_CLEAR register is marked as write-only, however using
> regmap_update_bits on this register will have some side effects.
> so mark IRQ_CLEAR register appropriately as readable and volatile.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-cpu: mark IRQ_CLEAR register as volatile and readable
      commit: 6a7f5bd6185e1c86256d5e52c3bb7a4d390d6e19

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
