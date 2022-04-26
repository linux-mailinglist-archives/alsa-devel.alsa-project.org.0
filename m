Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B71805104E8
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:08:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 424441852;
	Tue, 26 Apr 2022 19:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 424441852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650992936;
	bh=dgLR3TJhT/EC15yAj4pcZSpH0ev/CMEBayE7jUH2n2k=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BXnbPNDMaf3X25Db8VtMFKm/CLVaUOY90ujut5AeQK659k6BpqhoiWHeQ5F3fWLJm
	 HVOHfUc2dIClb6FXp2cczN4fW8tCunJet84fmCNwSEoPKgtDfSk6mx2jkju8oU6Vqq
	 QPiJDo/FxN99YurgjAr2babgwmnWdQBqQ+5rqFek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65284F801D5;
	Tue, 26 Apr 2022 19:07:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB280F80105; Tue, 26 Apr 2022 19:07:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AFE3F80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AFE3F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R6yCjZh9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32DE161372;
 Tue, 26 Apr 2022 17:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EE08C385A0;
 Tue, 26 Apr 2022 17:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650992869;
 bh=dgLR3TJhT/EC15yAj4pcZSpH0ev/CMEBayE7jUH2n2k=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=R6yCjZh9Pd5a1cJfpZbK4GvKX+nR4A/muitN3gB2kT+ln6pKlwWs4cb+jM4qax83X
 ItwRgJI57HCHD5rhEVHZymhSUa6z36Q5RVNNAoBDb5nAZo9aWwz8xm4fM2ftT/HkWu
 yxhMqsrvwFA/G6VqWKp6MPs8k+9n70C3ANdRJrJT6PAkUbAQmYKDcHzBjLdK5JTjfV
 xllp1hAQvdKGXQGAjJljA+UylV3BxUHY+rQiZOmFfZ5izY2QQQu7kCRmgYLA4doyRh
 j0/1zc7QdVTdTPeB8gh1qmoOh2wqX0emkCbWyzbc0qnK3+yrTi4ZzgT5AH5JNnNtjs
 tCO95OsDKH+rw==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org,
 quic_rohkumar@quicinc.com, robh+dt@kernel.org, judyhsiao@chromium.org,
 agross@kernel.org, quic_srivasam@quicinc.com, bjorn.andersson@linaro.org,
 bgoswami@quicinc.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 perex@perex.cz, linux-kernel@vger.kernel.org, quic_plai@quicinc.com,
 swboyd@chromium.org, lgirdwood@gmail.com
In-Reply-To: <1650374329-7279-1-git-send-email-quic_srivasam@quicinc.com>
References: <1650374329-7279-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH v2] ASoC: qcom: SC7280: Update machine driver startup,
 shutdown callbacks
Message-Id: <165099286607.2323572.4725275320203551447.b4-ty@kernel.org>
Date: Tue, 26 Apr 2022 18:07:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: quic_potturu@quicinc.com
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

On Tue, 19 Apr 2022 18:48:49 +0530, Srinivasa Rao Mandadapu wrote:
> Update machine driver startup, shutdown callback functions to avoid
> sound card registration failure on other platforms.
> Without this change, platforms with WCD codec is failing to register
> sound card.
> 
> Fixes: c5198db82d4c ("ASoC: qcom: Add driver support for ALC5682I-VS")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: SC7280: Update machine driver startup, shutdown callbacks
      commit: c85f533d51ca42a461a61303322b0cf74fb75a6b

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
