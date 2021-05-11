Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1199E37A231
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:33:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 900FD177A;
	Tue, 11 May 2021 10:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 900FD177A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620722016;
	bh=plCtlHCNIpWfe9eWJChLXDfOcpe8n0jaIChsmOCFPr8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cYjc7n/0sLA5avnrucFeA4JpXDdV/G0VsIaM8+KrfFc+/m1V7VR2LmZw1WWeCf321
	 iUVLuxFsYGV/1T7xvHBQpAXVtw2rctPL4zsW+dqR/W9I/yPV3pwAzcv0gJHAAVvRFC
	 iXyGtZt4J3f8IeDU5JRSn1ZxzVo2OIyHkJoPS2a0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 533F0F804FE;
	Tue, 11 May 2021 10:28:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 298C4F804D8; Tue, 11 May 2021 10:28:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE03EF8013A
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:28:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE03EF8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="svusHPzi"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E74AC616E8;
 Tue, 11 May 2021 08:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721685;
 bh=plCtlHCNIpWfe9eWJChLXDfOcpe8n0jaIChsmOCFPr8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=svusHPziplt7rimI6RlxLuA17HZhb4QM6tlmQM4Y00uOwNA+HMzglt8+jySCjUUi0
 jMQs39+xUOFthkam2OtVEeso/qNtT/XAmQWbxRzHR7NsoT24MTXq56KH2rUdVIHs9R
 7TRK9/tDjVyno3b9V35Ca4komeoizrOCvc9f1CEOdd8l7jdYdQ1EyO6psWcf7AKhj2
 EkIWI4wCbacnztnFShH6rsFjJPH76jBmdrBHOmiNpHGM+d6VEBBHqK4xOn8yqQUoJW
 sS7GYE3dfQL4A9K4MFqe5QANtkSkzZS47Kf60G5oKeoDxUMRf5UziKhgiSjugXj+LS
 n2/ASFw8jtg7g==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH] ASoC: q6dsp: q6afe: remove unneeded dead-store
 initialization
Date: Tue, 11 May 2021 09:25:57 +0100
Message-Id: <162072058167.33157.15111322550243125545.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1619345553-29781-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1619345553-29781-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, tiwai@suse.com,
 ndesaulniers@google.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 nathan@kernel.org, clang-built-linux@googlegroups.com,
 Mark Brown <broonie@kernel.org>
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

On Sun, 25 Apr 2021 18:12:33 +0800, Yang Li wrote:
> Variables 'wait' and 'port_id' are being initialized, however the
> values are never read and updated later on, hence the redundant
> initializations can be removed.
> 
> Cleans up clang warnings:
> sound/soc/qcom/qdsp6/q6afe.c:933:21: warning: Value stored to 'wait'
> during its initialization is never read
> sound/soc/qcom/qdsp6/q6afe.c:1186:6: warning: Value stored to 'port_id'
> during its initialization is never read

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: q6dsp: q6afe: remove unneeded dead-store initialization
      commit: 5f1b95d08de712327e452d082a50fded435ec884

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
