Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F063C074
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 13:56:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1370C16E2;
	Tue, 29 Nov 2022 13:55:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1370C16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669726569;
	bh=z8Q1QJRm2KKkxLQHH/2XVuF74pYD7S/glQUMAD+4R7s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ur1FG0YBl83akABCrWMFUJTmGisTciV8uUh36Ub7xvPSDPxSzDnBAG511yu/INFBR
	 2OL+CGIIs6WSHjv8ViQvPOHMs17cUXfjpNz+IF1KdO+VHxW4hbFLJFFeX64GSpzB4G
	 0S1IdMS3iHQ6o3zSMZVrUG185sShMHbsn0jFV0dI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE3CF8055B;
	Tue, 29 Nov 2022 13:54:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C82EF8055A; Tue, 29 Nov 2022 13:54:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05D03F80495
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 13:54:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05D03F80495
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CPd0UDwh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74609B81632;
 Tue, 29 Nov 2022 12:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3A0C433D6;
 Tue, 29 Nov 2022 12:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669726490;
 bh=z8Q1QJRm2KKkxLQHH/2XVuF74pYD7S/glQUMAD+4R7s=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=CPd0UDwhiuI9KEPa3X2HUiZIyj1IQuycQb8SLzJjL78b2+bQ2uQw7wC9tRw9qTQlj
 icdA4Nt+a2xJ3qJz5/c2kCk4/DymXF7sPJpQWI0uTpjtbaTHPtZ+2aW6mdKFPmeoJ0
 7Un7ul2vsm41QCvo6M2dbAB5z7Fj+qDfzcLzgavapX7KMHYc4xjq7PRToo6P79Lbut
 /K9f0ZvZBfkUvfJGllo/uYqlSnDYSN+LxfULdlv/LuZsTfL1NtbtS/10U5E7pNpPXL
 EpFG9uuM+ndporCtHHBRgdR8oq/HeSA4/O+ee9i6cViJgNmx6aU+xO78Dyll30lmQi
 GGHhXSGS8OsUQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com, bgoswami@quicinc.com,
 quic_plai@quicinc.com, srinivas.kandagatla@linaro.org, 
 perex@perex.cz, andersson@kernel.org, judyhsiao@chromium.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, robh+dt@kernel.org,
 agross@kernel.org, 
 linux-kernel@vger.kernel.org, swboyd@chromium.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org
In-Reply-To: <1669724411-14840-1-git-send-email-quic_srivasam@quicinc.com>
References: <1669724411-14840-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH v2] ASoC: qcom: lpass-sc7280: Add system suspend/resume PM
 ops
Message-Id: <166972648662.69085.11100963944342452925.b4-ty@kernel.org>
Date: Tue, 29 Nov 2022 12:54:46 +0000
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

On Tue, 29 Nov 2022 17:50:11 +0530, Srinivasa Rao Mandadapu wrote:
> Update lpass sc7280 platform driver with PM ops, such as
> system supend and resume callbacks.
> This update is required to disable clocks during supend and
> avoid XO shutdown issue.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops
      commit: a3a96e93cc888c652e47e4d7346abe99b1b44c53

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
