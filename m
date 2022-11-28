Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B516563AE02
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 17:41:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0B0C171F;
	Mon, 28 Nov 2022 17:40:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0B0C171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669653701;
	bh=YgLMfdUQGT5lCNVStZjrAhw/JJQl8Py7iBEVi6NQUWU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+7g1YLv9Tenwy5hQ0t6Ug8Gkwzadg/XoH18/1tglFXqrtxoAJgm2KS59Z8qe6ibZ
	 rukMTRHZw/Tnmq+jhM9YcUMYJ2neJdSuqbNHNk3TtJMDJscEBbvXoK/xYtGxhGHgoD
	 JHAKYIwNiNpksY607rAHgvKUAp3HwdmpH3cTbzFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56B38F8057A;
	Mon, 28 Nov 2022 17:39:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00BC4F80570; Mon, 28 Nov 2022 17:39:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4535EF80567
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 17:39:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4535EF80567
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GCaiCE/R"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 54908B80E1D;
 Mon, 28 Nov 2022 16:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E98AC433C1;
 Mon, 28 Nov 2022 16:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669653562;
 bh=YgLMfdUQGT5lCNVStZjrAhw/JJQl8Py7iBEVi6NQUWU=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=GCaiCE/RId707JCrW1iO/GbCIZHMIChWSU4fpgaV+8FwWX0amz55f/k8hXTgLO0rX
 P4q+VYSVHZhIetlY+5IbKJGA5hAyL1znsNzSdylfaRZ14lGexG8SMgrOhlXxEnglct
 fUIIzm+EpSPAlpXet+h+M3HDMASkisxqc72gXdL1DVZLe9hp3M/RAKhKEQrLa1rgc5
 G4Y2rA5XRqHW5d9rZSnw0kDgt8iTdaeQonLwUIP8rlNWcgZbEUD6nYfm8dyKMVigd3
 VhC1ow+9y03ee2P++zJCeud/fPBNvEevmcndgTy3b+nDVc/pMVa+2lqdPt43BfEGyg
 6JwgyPhgERAgQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, quic_rohkumar@quicinc.com,
 linux-arm-msm@vger.kernel.org, judyhsiao@chromium.org, 
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, quic_plai@quicinc.com, 
 perex@perex.cz, agross@kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 srinivas.kandagatla@linaro.org, 
 swboyd@chromium.org, tiwai@suse.com, bgoswami@quicinc.com, robh+dt@kernel.org,
 andersson@kernel.org
In-Reply-To: <1669621742-28524-1-git-send-email-quic_srivasam@quicinc.com>
References: <1669621742-28524-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add system suspend/resume PM ops
Message-Id: <166965355923.629583.3946711311315912094.b4-ty@kernel.org>
Date: Mon, 28 Nov 2022 16:39:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Mon, 28 Nov 2022 13:19:02 +0530, Srinivasa Rao Mandadapu wrote:
> Update lpass sc7180 platform driver with PM ops, such as
> system supend and resume callbacks.
> This update is required to disable clocks during supend and
> avoid XO shutdown issue.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-sc7180: Add system suspend/resume PM ops
      commit: 2d68148f8f85ca5a4bf5e80c821b56167cfc0f8b

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
