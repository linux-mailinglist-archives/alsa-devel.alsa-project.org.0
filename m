Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2A7451A8D
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 00:37:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6F0F1699;
	Tue, 16 Nov 2021 00:36:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6F0F1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637019427;
	bh=pPWGsdSRc3ah+Za5nl35yZ+jRecYwDbqdAFCvmivTqQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UD0FdVpKOYDKNqbXcqSvQqn4COy7uqozd+WgL9zeBwP7BdJs8pSPjzaB9451v5Te0
	 OtA6SugPWkPRiUs3sNtPnQzUEPACdt1oiyREpEL5BRdzf8TgyRaH977l879sN1b2/S
	 qEhZxaRRrNHGCzCrpVe2C8T/xoX44kvxr+vAOOHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB57F804E7;
	Tue, 16 Nov 2021 00:35:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E088F8049C; Tue, 16 Nov 2021 00:35:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA8E9F8049C
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 00:35:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA8E9F8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YLfrj8o2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AA5C63257;
 Mon, 15 Nov 2021 23:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637019305;
 bh=pPWGsdSRc3ah+Za5nl35yZ+jRecYwDbqdAFCvmivTqQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YLfrj8o20Wo/XsGDGyxXCbPKBjuMweX+vvptZPnj8vt7RC9yL9b6x/Wbsf5Bsh0Uz
 1J0WKO2v9qBsglUnc9qzoaATUhWOJclaFGE8EfGFdFHaqXeMwzOcDAkS7VHEsVqEP/
 T0X2+1TWd00UQM5tzzwr/ov/HRnMtmCHTNpE+k73jc6x5kKnAnCDCc46SjbvcLvNxa
 JQHxTyrrJJTXZD9sMpfMsMMV6uqYUKxgCeC/+QuJfdXZ7RW/o526saQA80/xORbHcS
 NjTPiWdewyfaAJw+wTxVb0soDVZFXmpvlDg+Fqa2yP6InumhzndQz9zrFSY9EsbT5u
 rAyTkKLQIP7Ag==
From: Mark Brown <broonie@kernel.org>
To: swboyd@chromium.org, devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
 linux-arm-msm@vger.kernel.org, perex@perex.cz, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, plai@codeaurora.org, robh+dt@kernel.org,
 rohitkr@codeaurora.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, tiwai@suse.com,
 bgoswami@codeaurora.org, agross@kernel.org, srinivas.kandagatla@linaro.org
In-Reply-To: <1635938324-17763-1-git-send-email-srivasam@codeaurora.org>
References: <1635938324-17763-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: codecs: MBHC: Add support for special headset
Message-Id: <163701930197.675370.7604536221667945815.b4-ty@kernel.org>
Date: Mon, 15 Nov 2021 23:35:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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

On Wed, 3 Nov 2021 16:48:44 +0530, Srinivasa Rao Mandadapu wrote:
> Update MBHC driver to support special headset such as apple
> and huwawei headsets.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: MBHC: Add support for special headset
      commit: 3c8a3ad4019126f06016ab0128dde11817502f52

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
