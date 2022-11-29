Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E455063C3FB
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 16:41:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72659168D;
	Tue, 29 Nov 2022 16:41:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72659168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669736510;
	bh=p/2op5xe90YZqfKCHeiXyi+GWHBoal/ykuWpwuZF5HA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d8vjCEnzkAmBMppYXfTBQFpO1XFOBkY7dZyncN5deVoZMijnQYdiY/HDBCvbizX8u
	 s/2SWl9G0YdqKtvCIWeQi44qPKbXVPQqv6t38A81jJfv28SZBikwqZbWgJ5pYkmMtT
	 8OmaInT2AjOkqdBOuZclVnvXiYl9Q83WQwvFgChA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A488F80212;
	Tue, 29 Nov 2022 16:40:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E30BF801F7; Tue, 29 Nov 2022 16:40:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E533F80166
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 16:40:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E533F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SYKIMHIh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D8B8BCE1376;
 Tue, 29 Nov 2022 15:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31CF4C433C1;
 Tue, 29 Nov 2022 15:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669736440;
 bh=p/2op5xe90YZqfKCHeiXyi+GWHBoal/ykuWpwuZF5HA=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=SYKIMHIh69WWqbGhnSDWnaE4HIN2P25f7edgu3zzDaJhWHikmjmi5ITve+cwQIi36
 dQ5oQ9g4/jT0Er0/VDw8wJh/Vu177KuG0Xvr/+9Tmq5IR7wwMmjh1MLljNJsY4sp7/
 nEqiFAo8whB0HvLrq7F+CDLKeSjgrpLa/1E0YBgk40pVnHc8Ud9tNS1ATkBCojTrW8
 GnkMPV5lSJH7Kxnn6XM2RLuhVxKEdkCi1VUMuaLEDoPU+uE3itul9Nbpq8sT1nIXMY
 FahjiVEEMci+O8XATbBqkuRI8w2ZOSYnLkyWlTgFZUx8uadSpkD9g4H7cbCCQKwyww
 CewGoawitoNhA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, andersson@kernel.org, bgoswami@quicinc.com,
 swboyd@chromium.org, 
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
 quic_plai@quicinc.com, judyhsiao@chromium.org, quic_rohkumar@quicinc.com,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, tiwai@suse.com, 
 robh+dt@kernel.org, perex@perex.cz, srinivas.kandagatla@linaro.org,
 agross@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <1669726428-3140-1-git-send-email-quic_srivasam@quicinc.com>
References: <1669726428-3140-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7180: Add maybe_unused tag for system
 PM ops
Message-Id: <166973643691.238721.1254998116262856593.b4-ty@kernel.org>
Date: Tue, 29 Nov 2022 15:40:36 +0000
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

On Tue, 29 Nov 2022 18:23:48 +0530, Srinivasa Rao Mandadapu wrote:
> Add __maybe_unused tag for system PM ops suspend and resume.
> This is required to fix allmodconfig compilation issue.
> Fixes: c3bf7699747c ("ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-sc7180: Add maybe_unused tag for system PM ops
      commit: e8679db2970f04ee5281c042977fff880a3c045a

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
