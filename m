Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F76626085
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 18:35:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02BDE168E;
	Fri, 11 Nov 2022 18:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02BDE168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668188152;
	bh=jYqvc4WZF2KKKlUH6NAcF4EXpjN8klTXDKeZlY8Otow=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qqjl5l1lX2RpaPGuvC5BcO3HcRiB8RST2P1TkOeSQUKZcd6SCQPqzXM5FX7p0wULh
	 ujRHr2GDmJ7XYdkjSClWchESezMp/cjjkiWdU+bJ1tS/9N1h5nwmraeyoX6mIh92JN
	 P4m/TiTGmbZS3HqTq7zYrxenGd5ws9UN4SLb7XSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB0B4F80549;
	Fri, 11 Nov 2022 18:34:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1F0BF8028D; Fri, 11 Nov 2022 18:34:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CDF6F800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 18:34:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CDF6F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QZ1UPMX/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0AD762059;
 Fri, 11 Nov 2022 17:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47F1C433B5;
 Fri, 11 Nov 2022 17:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668188064;
 bh=jYqvc4WZF2KKKlUH6NAcF4EXpjN8klTXDKeZlY8Otow=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=QZ1UPMX/ria1/J65MPLUQqYQokPOpFzcAo2i8BmnXzhxk8TjPUG0AHxR4EHC4aZmX
 8SOFFTyG6AwOVRUoTUQC4N1mnXVoEXrBIBxYXXCPVgVTf+KF7ULMO6nu9aljMrJvcJ
 rYjM43jC9oEIVph/YkUALeta7WtlICvtsESJxU8Tite+VhoquLHUtouIi5+lCq7IEa
 mnpol2yMSda6PUgVLWhTF/r6b4w9zuDS4T6ASd54Uq8Ismcc3RjOn5xNysvg7OM27S
 fVmU6mvQQbYkuMbKWCzaM+EfCwG8SxIQ0lFWiHUw5ueELQwA9eH2crvx4pbGWb9HwR
 hciy8e2Rjw0qg==
From: Mark Brown <broonie@kernel.org>
To: Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221111091328.31549-1-krzysztof.kozlowski@linaro.org>
References: <20221111091328.31549-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: q6prm: Correct module description
Message-Id: <166818806245.535544.12168721706069566351.b4-ty@kernel.org>
Date: Fri, 11 Nov 2022 17:34:22 +0000
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

On Fri, 11 Nov 2022 10:13:28 +0100, Krzysztof Kozlowski wrote:
> The description was copied from APM driver.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: q6prm: Correct module description
      commit: e045595be3c1548e1164f3d402cef990425b6195

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
