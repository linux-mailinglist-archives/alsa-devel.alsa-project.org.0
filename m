Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA8C45632D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 20:08:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18FCC1877;
	Thu, 18 Nov 2021 20:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18FCC1877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637262506;
	bh=lrQXLGoucITfjQn5uVEsfBONwOxznfVVuvtAaJyD/90=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M9yM7SyHvcz5SgXIB96OtVhT4t5qNQ5UtUe8PhdXeFwaXSHtDxL8iFOtkmM4cNXs4
	 z2JzGRDd9CBSmwfbBZ64MyNtNwv5F+e2GSf2La+15kCEzPZ1p24Bd7BSv/i0G3b/ic
	 axP4pgoe1cgqSS5wcY66hga0Ww6G+2DKdmDuaIyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23FC3F804EB;
	Thu, 18 Nov 2021 20:06:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A516EF804C1; Thu, 18 Nov 2021 20:06:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28033F800FA
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 20:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28033F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P1ePkJJC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3EC161B04;
 Thu, 18 Nov 2021 19:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637262377;
 bh=lrQXLGoucITfjQn5uVEsfBONwOxznfVVuvtAaJyD/90=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=P1ePkJJCikKeYrGJ/a8zd/euNU1R/RZLpiajZIAyjotJoWtkIoEdFyqz3rt43uffd
 Q94vWeDzVpGL5xCu6Ky5XjPgP25JVVOWVRl6PoXr++vTyogK6zdIhACbwnDU24e+pP
 VXrobUniflyQIx3ZFqiWrmEU5KrETj/5QkpgPRvO93+JoNCB2DSb4scGTqE/l0XPwS
 nfsKCZ5W3QMyUGWB+31MFpzwgCQ/hhBA+RVMM4ZIptWBJRhiAfDQIQZx1zaNV9cqUh
 hBEMejqNHtDnRuh9FnySLY4J5PMRyj+WhtIc1Xa0Y6kR9pAP6txJGVq+Xa+m3kgw/u
 NqUcbYf+bCGLg==
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, lgirdwood@gmail.com,
 linux-arm-msm@vger.kernel.org, rohitkr@codeaurora.org,
 alsa-devel@alsa-project.org, perex@perex.cz, agross@kernel.org,
 srinivas.kandagatla@linaro.org, swboyd@chromium.org, plai@codeaurora.org,
 judyhsiao@chromium.org, robh+dt@kernel.org, bgoswami@codeaurora.org,
 bjorn.andersson@linaro.org, tiwai@suse.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
In-Reply-To: <1637234411-554-1-git-send-email-srivasam@codeaurora.org>
References: <1637234411-554-1-git-send-email-srivasam@codeaurora.org>
Subject: Re: [PATCH] ASoC: codecs: MBHC: Remove useless condition check
Message-Id: <163726237329.96213.5010626132541741636.b4-ty@kernel.org>
Date: Thu, 18 Nov 2021 19:06:13 +0000
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

On Thu, 18 Nov 2021 16:50:11 +0530, Srinivasa Rao Mandadapu wrote:
> Remove redundant conditional check and clean code in special
> headset support functions.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: MBHC: Remove useless condition check
      commit: b38892b5b85ae54b7b867313996f967122ede42e

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
