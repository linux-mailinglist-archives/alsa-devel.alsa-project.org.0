Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7DC53A532
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 14:40:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 422401707;
	Wed,  1 Jun 2022 14:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 422401707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654087206;
	bh=oz8sdc7YaS+FFTgKgy6l95sNhmT8mhsukKDSp5YTO+E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VoJ7IyP8bDfaZHnoyQ/zq/JjhG9CiofOoI0tz2F5+ryjrqr0PlTTNstLmn8cGmh69
	 NNRRLG65JzBnAUGc2W6zAIRoh3WmEfZdDw2axbdM0VSJaPYpSan5PXQqcWlpu18axK
	 ftvbHkfWa1P91MtGCHCbDbaaeLGfGc1aFeMi5Fvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7716F8025A;
	Wed,  1 Jun 2022 14:39:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E8D3F80238; Wed,  1 Jun 2022 14:39:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13990F800BD
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 14:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13990F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Q6V8+TDa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00007B8172A;
 Wed,  1 Jun 2022 12:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 014C5C385A5;
 Wed,  1 Jun 2022 12:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654087141;
 bh=oz8sdc7YaS+FFTgKgy6l95sNhmT8mhsukKDSp5YTO+E=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=Q6V8+TDacXi+hfE0nCA8Pfr3DoocD4CpoV6wnc7O9MAix/RSZ/py2Sq0HpzbEv+aa
 sd3CTq1nwwGllq5NRbvYKNY3pxTBFmSoA6UZn/kBqRmdRCpA6fs69SqFCHxKZyzYui
 F1OdZr6/u3xQAr/aLuaIFgXnlPJ3OAnF2bwJMWFP77R//Pc1aRz2aal9VPPhcrScwt
 uHSYS8Dd3DFpsAmprYO17DihetBLvzmyVL653vDqdlqYibs98OW5WLWIrf1iYqggaX
 VcQIS1voPUapva66DDJPDncoHoN+XwKEh2l6Z5wts7JD5w5yPsSKX6anh2OlWfDKax
 xkXscJTSDJwMA==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, quic_srivasam@quicinc.com, srinivas.kandagatla@linaro.org,
 robh+dt@kernel.org, judyhsiao@chromium.org, bjorn.andersson@linaro.org,
 swboyd@chromium.org, perex@perex.cz, linux-kernel@vger.kernel.org,
 bgoswami@quicinc.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 quic_plai@quicinc.com, lgirdwood@gmail.com, quic_rohkumar@quicinc.com,
 linux-arm-msm@vger.kernel.org, agross@kernel.org
In-Reply-To: <1653660608-27245-1-git-send-email-quic_srivasam@quicinc.com>
References: <1653660608-27245-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-platform: Update VMA access permissions
 in mmap callback
Message-Id: <165408713769.3032499.9376939250680150345.b4-ty@kernel.org>
Date: Wed, 01 Jun 2022 14:38:57 +0200
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

On Fri, 27 May 2022 19:40:08 +0530, Srinivasa Rao Mandadapu wrote:
> Replace page protection permissions from noncashed to writecombine,
> in lpass codec DMA path mmp callabck, to support 64 bit chromeOS.
> Avoid SIGBUS error in userspace caused by noncached permissions in
> 64 bit chromeOS.
> 
> 

Applied to

   broonie/sound.git for-linus

Thanks!

[1/1] ASoC: qcom: lpass-platform: Update VMA access permissions in mmap callback
      commit: ef8d89b83bf453ea9cc3c4873a84b50ff334f797

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
