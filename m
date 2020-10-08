Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EB3287E7A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 00:04:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FC5C1690;
	Fri,  9 Oct 2020 00:03:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FC5C1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602194645;
	bh=1Trx4y8lWFXd32x7Lp/9FsQLAB6JWNO65LqIwTr929A=;
	h=Date:From:To:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e1fJUQsnR3NBpYlxjpPg83XmguSgg3rRJa6EDxXDPTmSShRP7pYRmM6oaLRmvOFtj
	 CI23ngU6SGoicmo8oaWOcTBpvs0uK9rTOcfcAcCQ/KJAMcEchAl1AZBOm8e1yD8bP2
	 ITba5vpZI5U8RAPp3+ehknuRttqgtopvN3nrxCl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C8EDF80168;
	Fri,  9 Oct 2020 00:01:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64C76F80216; Fri,  9 Oct 2020 00:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F177CF80168
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 00:01:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F177CF80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="znBIJHMF"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 78C6822241;
 Thu,  8 Oct 2020 22:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602194497;
 bh=1Trx4y8lWFXd32x7Lp/9FsQLAB6JWNO65LqIwTr929A=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=znBIJHMFMH53R7iQ6Ha+M+ULw6+xqcfRiE6fFTHeWloGEp7X4jnciw9VOXHWMMPIO
 w9kMFSCrU5MuyMD9oRKnkErO1wR3Se/eQkg9WfPt1qyl91Limd7PdgZKytwsmYAdiO
 zkVzW/+zW+a9L+rGdjinCof4Ap6bFPmXUqtJv36E=
Date: Thu, 08 Oct 2020 23:01:34 +0100
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, bgoswami@codeaurora.org, rohitkr@codeaurora.org,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 lgirdwood@gmail.com, bjorn.andersson@linaro.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, robh+dt@kernel.org,
 agross@kernel.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, alsa-devel@alsa-project.org, perex@perex.cz
In-Reply-To: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
References: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v11 0/7] Qualcomm's lpass-hdmi ASoC driver to support
 audio over dp port
Message-Id: <160219448332.29664.6810740521715495883.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 8 Oct 2020 10:46:56 +0530, Srinivasa Rao Mandadapu wrote:
> These patches are to support audio over DP port on Qualcomm's SC7180 LPASS
> Asoc. It includes machine driver, cpu driver, platform driver updates for
> HDMI path support, device tree documention, lpass variant structure
> optimization and configuration changes.
> These patches depends on the DP patch series
> https://patchwork.kernel.org/project/dri-devel/list/?series=332029
> https://lore.kernel.org/patchwork/project/lkml/list/?series=464856
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: Add sc7180-lpass binding header hdmi define
      commit: 12fbfc4cabec65950bb0cc10eab0fc5c4c4d039f
[2/7] ASoC: dt-bindings: Add dt binding for lpass hdmi
      commit: 8e3fdc52ccc64c64912b4785a39f525db9db1fbc
[3/7] Asoc:qcom:lpass-cpu:Update dts property read API
      commit: 4049a3b87847fec754632d233bffbd608364917f
[4/7] Asoc: qcom: lpass:Update lpaif_dmactl members order
      commit: d9e8e61243958409645c18c9267b6dbaaaf22364
[5/7] ASoC: qcom: Add support for lpass hdmi driver
      commit: 7cb37b7bd0d3c93e381ae7abf30971819966bd9d
[6/7] Asoc: qcom: lpass-platform : Increase buffer size
      commit: 03f20e209d07968c410fc404b3d636dc446d3ef2
[7/7] ASoC: qcom: sc7180: Add support for audio over DP
      commit: 2ad63dc8df6b6108aee82dc77c820e3918bc0a65

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
