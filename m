Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDD263C072
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 13:56:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E50A16DA;
	Tue, 29 Nov 2022 13:55:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E50A16DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669726561;
	bh=tjFD8CRAWN9uffc4GBtwl8R6QM4DIePk4c8zqSTRcA4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kys77/6ulMMDtiIVTdhxVu/yjAeV8xzn8B9Zyga7fe8gQ1o7ugv57i70iCR8ofFAT
	 wXWH0l9akWrosaR6TdIDWJp3y3RW0EWnq6c49TYF/QReSM9QxlS22qRpMAsx0ZvuhK
	 4bNYRXD4BxodExB7pq6NqXWek5+9MEb4nUb+if1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04E05F80557;
	Tue, 29 Nov 2022 13:54:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 025BDF802DF; Tue, 29 Nov 2022 13:54:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEFD4F801F5
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 13:54:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEFD4F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R757RHT9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E256DB810AD;
 Tue, 29 Nov 2022 12:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2745CC433D7;
 Tue, 29 Nov 2022 12:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669726486;
 bh=tjFD8CRAWN9uffc4GBtwl8R6QM4DIePk4c8zqSTRcA4=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=R757RHT9Ecn7JGMWLr73R1/J9kUryIEg7HHFOwDwwYl9hjzrJttxir7fxXPSlG9Gz
 KN+mCNm4G4IaeZYYwzdGJmSujPazBfiu+jMMUSXvi0VXu/kQoDHsRd/dyGHRnRupet
 fZJwJ81vIiIJltLl4X3Iu0lnEGcq/a7jZRl6VcmlW8aPfVoaFBbk1f0MNjmxxq7HOu
 h5jxBHxSOBY+L4CELaiCbmuOtHcCYJQ4QLixbmNjr4iODWnO1IGZfGB2CykLiOXHHZ
 xtWlwgI5PbYhM+HPBBxbB4s3g8/R1EcfCoy7kYRKoRTbC+yEa4x4xaH3B8DjzqKCEc
 uOmhtv4oTwgSg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 quic_plai@quicinc.com, tiwai@suse.com, 
 andersson@kernel.org, judyhsiao@chromium.org, perex@perex.cz,
 linux-arm-msm@vger.kernel.org, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, robh+dt@kernel.org,
 agross@kernel.org, 
 linux-kernel@vger.kernel.org, swboyd@chromium.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, quic_rohkumar@quicinc.com
In-Reply-To: <1669703784-27589-1-git-send-email-quic_srivasam@quicinc.com>
References: <1669703784-27589-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-sc7280: Add system suspend/resume PM ops
Message-Id: <166972648286.69085.1348792886931183406.b4-ty@kernel.org>
Date: Tue, 29 Nov 2022 12:54:42 +0000
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

On Tue, 29 Nov 2022 12:06:24 +0530, Srinivasa Rao Mandadapu wrote:
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
