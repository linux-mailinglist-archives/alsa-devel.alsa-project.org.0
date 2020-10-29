Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB67329F16D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 17:28:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BA5815E5;
	Thu, 29 Oct 2020 17:27:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BA5815E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603988920;
	bh=t+PBJ0NHId5QAZDzuBrDGNlV6g1PCH9iZXJKI+sMxMw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mgfGDWWjhFlV4PLM/5lmw/wpmc2M3mBJhS7snEvzXIF4piuTjBTEKQt6/Ji+4lbjc
	 XGqFkgOitFzMlzTHE2y15TOS/Q+Js85qVIKvWui6ZXStM1q6igT9+cI8umQjvpYLMx
	 dS19QDfMHPGhVHmeRRLtJIlmu8esGjAUOE37CtZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADA88F801D8;
	Thu, 29 Oct 2020 17:27:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEF42F8020D; Thu, 29 Oct 2020 17:27:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C66BF800D8
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 17:27:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C66BF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AVQf49Um"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 611922076E;
 Thu, 29 Oct 2020 16:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603988817;
 bh=t+PBJ0NHId5QAZDzuBrDGNlV6g1PCH9iZXJKI+sMxMw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=AVQf49UmZSCKirXj8VEFT7AM5GxmOOW2d1zUOMzZL+fF9cKQfQPy+RA/vxrnvAdIl
 YNViTwonflNW7tToWEuTx/vKAURkz4BULmyNJGUGG++LI65Lizy/glAXE1wFc93ssu
 8XBUL51CsE7vfoA3hxd4g6Tgv/G9qmhgdf5E2m4I=
Date: Thu, 29 Oct 2020 16:26:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20201029101550.31695-1-srinivas.kandagatla@linaro.org>
References: <20201029101550.31695-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: qcom: dt-bindings: sm8250: update compatibles
Message-Id: <160398881039.39922.12061096532284319098.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 robh+dt@kernel.org
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

On Thu, 29 Oct 2020 10:15:49 +0000, Srinivas Kandagatla wrote:
> Update compatible string as board compatible and device compatible
> should not be same!. New compatible is now suffixed with -sndcard
> to be inline with other Qualcomm Sound cards.
> 
> This also fixes the warnings/error reported by dt_binding_check.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: dt-bindings: sm8250: update compatibles
      commit: a889583a19206636082c44625141b26392e46a62
[2/2] ASoC: qcom: sm8250: update compatible with new bindings
      commit: bbc4e1bb5fd6577ed668e7c2ba0705dff1783bce

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
