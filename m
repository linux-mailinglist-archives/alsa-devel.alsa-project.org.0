Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E2A4C78BA
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:22:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B45E1917;
	Mon, 28 Feb 2022 20:21:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B45E1917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646076153;
	bh=rKHN0tABQaAaxZGmbVUu6SNde2wmYhf2Ll+XbGWr9NE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z76bnM68hlWe2S4Zi2LOFQpu/DSowiWYCIU4KCGuC3z8lMECi2rZObAuu6GvsV8HA
	 CYGdOClv2w8gEXzpfboIdpRXMsv2zfrQe4abjHIsDtSsBxsvfbLkOofvrUtxjpRVfF
	 n82mWvPbnm6cfF3S8UFrTGeEfTIlEBxeafKrXid8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29FFFF805BB;
	Mon, 28 Feb 2022 20:16:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E379F805A8; Mon, 28 Feb 2022 20:15:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFA11F8057D
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFA11F8057D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="shfwThSZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D1768B8162C;
 Mon, 28 Feb 2022 19:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5070DC340F2;
 Mon, 28 Feb 2022 19:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075742;
 bh=rKHN0tABQaAaxZGmbVUu6SNde2wmYhf2Ll+XbGWr9NE=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=shfwThSZNZuNKWBahhXUVqLxgnTEBvDCLAQzOUP7VoE3++J+qzsfTO3zIGbZ2gOqw
 XVj73sMm7GIyEsO2+UniOaqzJawRCvIe9W8hKY4Gy30j6oBTFsMTSkc0ejSyuGp1nH
 kzriIYWpT43tEQU2/bMWYKURtvz96CfwCPmdiiv99AexI2jL8KRHhB4W4eXh0uuyrw
 g1HT35Q5KapaUD0LNz8by0H2QxxY/7NW5qmBwx9EDdZ2L3A1paO+f8L4pupnVAeI34
 l3jC7dEDQGlrSqGxBVI9tIREPPTI7X4cKh30iwYcqhPbmiHJUP9snNnM5y3HmlnkaV
 YYWvwb9aZWpwQ==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-msm@vger.kernel.org, perex@perex.cz, linux-kernel@vger.kernel.org,
 bgoswami@codeaurora.org, tiwai@suse.com, lgirdwood@gmail.com,
 swboyd@chromium.org, agross@kernel.org, judyhsiao@chromium.org,
 alsa-devel@alsa-project.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, rohitkr@codeaurora.org,
 quic_plai@quicinc.com
In-Reply-To: <1645786624-12311-1-git-send-email-quic_srivasam@quicinc.com>
References: <1645786624-12311-1-git-send-email-quic_srivasam@quicinc.com>
Subject: Re: [PATCH v4 0/2] Add power domains support for digital macro codecs
Message-Id: <164607573904.3538791.16540077443386812939.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:39 +0000
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

On Fri, 25 Feb 2022 16:27:02 +0530, Srinivasa Rao Mandadapu wrote:
> This patch set is to add power domains support for RX, TX and VA macros.
> 
> Changes since v3:
>     -- Add dt-bindings support.
> Changes since v2:
>     -- Remove redundant local variable.
>     -- Update pds error handling sequence.
>     -- Update module description.
>     -- Clean up pds init function.
>     -- Remove redundant arguments.
> Changes since v1:
>     -- Add missing macros in Kconfig.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: Add power domains support in digital macro codecs
      commit: 9e3d83c52844f955aa2975f78cee48bf9f72f5e1
[2/2] ASoC: qcom: dt-bindings: Add bindings for power domains in lpass digital codecs
      commit: 6619c7d4379aca716a90f7581be2853071c086f6

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
