Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1A4604E4A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 19:14:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19058899D;
	Wed, 19 Oct 2022 19:13:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19058899D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666199683;
	bh=NyNZ+inQk271m+JIba1TXYMkNOx6yVUC2InlpmkUhuw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OJyV5KTtNWcaTGeYlS9xjDmzxwJe72+/Uk3Fm4Rupd3YW1RkChqvBOBg5Bx8MuYcT
	 nbVdq24YV7suJjSc7JTKTmARhhGpfM330vwkWthRWznOMB7KBe4y/PGQDF9eZsLYjZ
	 8jk5HUN4Y0kw/FsnBQ1Q4pJHOH4ksBdjeAVAH8os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89FC5F80137;
	Wed, 19 Oct 2022 19:13:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA851F804CC; Wed, 19 Oct 2022 19:13:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB88EF80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 19:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB88EF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rytKq5vv"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 38C71B82570;
 Wed, 19 Oct 2022 17:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6B1C433C1;
 Wed, 19 Oct 2022 17:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666199622;
 bh=NyNZ+inQk271m+JIba1TXYMkNOx6yVUC2InlpmkUhuw=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=rytKq5vvUUyE8N8WZpL8iJdwJIevzOag8iHOLHERt4UdcmgEFyf+H/s9hkM7k2QUr
 3r79IG9Brh31vXxj+jupWhf3dDZTZMWzryGltHKNAH+8NZXlI1V4vqKw6QWsftLfVp
 +iLqUmHDnOP86FGJH1JcITGZDqwhtYtsoQTD99U4QG+cOxa1r7eJiDGWmp78wJiYjL
 mjYPeY154KNQVchRPInrM1TKq27rKr/WeaxPoe9lovc4WU+lN9D1D6gBnCxCbcGQXg
 R3YOOEGLQhlzSHgjUxkF7AZbveFF5vRuPEDvtbhHuiwCBVjHext3ryNzQNw3GO0eWN
 TFf4Sy7F+dCyQ==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com, 
 linux-arm-msm@vger.kernel.org, bgoswami@quicinc.com, judyhsiao@chromium.org,
 alsa-devel@alsa-project.org, 
 andersson@kernel.org, srinivas.kandagatla@linaro.org, lgirdwood@gmail.com,
 quic_plai@quicinc.com, agross@kernel.org, 
 tiwai@suse.com, robh+dt@kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, perex@perex.cz
In-Reply-To: <1665825530-7593-1-git-send-email-quic_srivasam@quicinc.com>
References: <1665825530-7593-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [RESEND] Asoc: qcom: lpass-cpu: Mark HDMI TX parity register as
 volatile
Message-Id: <166619961841.1416660.6646939908532904224.b4-ty@kernel.org>
Date: Wed, 19 Oct 2022 18:13:38 +0100
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

On Sat, 15 Oct 2022 14:48:50 +0530, Srinivasa Rao Mandadapu wrote:
> Update LPASS_HDMI_TX_PARITY_ADDR register as volatile, to fix
> dp audio failures observed with some of external monitors.
> 
> Fixes: 7cb37b7bd0d3 ("ASoC: qcom: Add support for lpass hdmi driver")
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Asoc: qcom: lpass-cpu: Mark HDMI TX parity register as volatile
      commit: 1dd5166102e7ca91e8c5d833110333835e147ddb

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
