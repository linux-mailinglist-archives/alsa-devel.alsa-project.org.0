Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E5F56198C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 13:47:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0AFF16C1;
	Thu, 30 Jun 2022 13:46:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0AFF16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656589667;
	bh=KZbwbKY8OlqEXl4fG8750X4KhP+vZADjW8qGjUTlxNQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OkHjtfuqIV0TBWuJCdQFWxAL+ac6fyEMVCnu1CNq9NP5BpR/rZeIAen6amSTuu/GQ
	 YEHSvayxapK5Be/b6tw6Fgkw7Ml+LWwn6hPgBRknsg9qW9pbK2xGqsG+YJRmLViB/D
	 hF8Zf0hB3+FzkSjuf2VuHwClu4aX/BZSnmE2pkBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7753FF804DA;
	Thu, 30 Jun 2022 13:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B10CDF804D8; Thu, 30 Jun 2022 13:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 521A6F804D2
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 13:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 521A6F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sXP+op3T"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35E966152F;
 Thu, 30 Jun 2022 11:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB23C3411E;
 Thu, 30 Jun 2022 11:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656589569;
 bh=KZbwbKY8OlqEXl4fG8750X4KhP+vZADjW8qGjUTlxNQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sXP+op3TTdzeum6xf7A0Mw75HgNt1ocO0cyfnr8m79CLzc6pr/5l0cThAnbkE1xNO
 iM8llkQrRpeAJpwTUGojkhXXskFCVKZoFhXUCPLi1aKlGgsDyh2iuRdqfOeye+ekXM
 BjODwm459vvnpwP1UgtUfiG6RL4CgLn7Tck+Rx1e8pIMXUvUI0vB/u00XyiyE5NgKO
 QgTNw9EDDL/2brLXDR3Pyb2qj5Iig2HHLnsBFLcStez0fDJl6g6vEhsmrtk1IR+4TU
 TcczZfxwrHkIuz+xHOxjYYpyfWAUy/UheOO48KN0pMNhNReUdN1JjgU7b1UbFNvjFw
 9HzBrIHiBjr+Q==
From: Mark Brown <broonie@kernel.org>
To: yassine.oudjana@gmail.com, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, lgirdwood@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, perex@perex.cz,
 bgoswami@quicinc.com, tiwai@suse.com, agross@kernel.org
In-Reply-To: <20220622161322.168017-1-y.oudjana@protonmail.com>
References: <20220622161322.168017-1-y.oudjana@protonmail.com>
Subject: Re: (subset) [PATCH v2 0/3] ASoC: dt-bindings: Add bindings for
 WCD9335 DAIs
Message-Id: <165658956629.346792.3984245362995741043.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 12:46:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 y.oudjana@protonmail.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
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

On Wed, 22 Jun 2022 20:13:19 +0400, Yassine Oudjana wrote:
> Add DT bindings for WCD9335 DAIs and use them in the driver as well
> as all device trees currently using WCD9335.
> 
> Changes since v1:
>  - Make header guard match path
>  - Maintain the alphabetical order in msm8996-xiaomi-gemini includes
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: Add bindings for WCD9335 DAIs
      commit: 53447365ccb442bbd3dfffc2d7fd96203770dfb6
[2/3] ASoC: wcd9335: Use DT bindings instead of local DAI definitions
      commit: 66348f178d5a842c8afe52c3b743fb4af24cdb2a

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
