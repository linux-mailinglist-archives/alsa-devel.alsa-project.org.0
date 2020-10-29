Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EF029EC15
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 13:42:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC57F9F6;
	Thu, 29 Oct 2020 13:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC57F9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603975369;
	bh=uDEi8l3tLwU6LdqHUgog52VUPP3I1HsdRFofzCw0ukY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KfcZw4RQt9zt9PZZQWneZ8UA1Am14F4LOHuW5OBXghlln/s5TMBpIcEIxTFCcnWjz
	 X2TGQ/H9iLVkjBHpeNTpIFifret9p8r4T8+lFPE9sgXAoc0VKF2anP5U+SQz6qiTc/
	 eU7D+Ejhs4Eir1CEQAKWBoRqvqRk7LQ4U2693tBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD62DF80227;
	Thu, 29 Oct 2020 13:40:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74614F8027C; Thu, 29 Oct 2020 13:40:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F748F801D8
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 13:40:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F748F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j3yDLKE8"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CFB492075E;
 Thu, 29 Oct 2020 12:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603975227;
 bh=uDEi8l3tLwU6LdqHUgog52VUPP3I1HsdRFofzCw0ukY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=j3yDLKE8Wp8Q1jPOTKmVjhE3oBiG+HZWB6zJftxnxe4d/5KVCxSeRi6G4rtckRCI0
 jolHYITB5hlAs94rx72pDbftxSOn8E0/+zfodwJTaFAMr1V/F8c1XXqh+ltDP2DgJl
 3QDO43EUXr3lMO2OjrJlE+MM8m1kHIM0Z8hsHybw=
Date: Thu, 29 Oct 2020 12:40:21 +0000
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, perex@perex.cz, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 srinivas.kandagatla@linaro.org, agross@kernel.org, plai@codeaurora.org,
 linux-arm-msm@vger.kernel.org, lgirdwood@gmail.com, bgoswami@codeaurora.org,
 tiwai@suse.com, bjorn.andersson@linaro.org, alsa-devel@alsa-project.org
In-Reply-To: <1603798474-4897-1-git-send-email-srivasam@codeaurora.org>
References: <1603798474-4897-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH v2] Asoc: qcom: lpass-sc7180: Fix MI2S bitwidth field bit
 positions
Message-Id: <160397520896.55401.5296685926917915952.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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

On Tue, 27 Oct 2020 17:04:34 +0530, Srinivasa Rao Mandadapu wrote:
> Update SC7180 lpass_variant structure with proper I2S bitwidth
> field bit positions, as bitwidth denotes 0 to 1 bits,
> but previously used only 0 bit.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: lpass-sc7180: Fix MI2S bitwidth field bit positions
      commit: cf9d21984da2c8e852320d12c03ddb7d11760a32

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
