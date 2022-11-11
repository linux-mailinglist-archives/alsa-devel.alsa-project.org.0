Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF56626298
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 21:10:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C75F71697;
	Fri, 11 Nov 2022 21:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C75F71697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668197448;
	bh=PzS0md/R98teTQLOBivBEycYuxdpDjm/Kz1yZeYFP0w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ta+3iftf+MJVq6xf8DqHkSUduPs33c768eZw2ntUyteqA1P6NdaixdVbkL2JD9gLd
	 y1JKtrGZaHP8nKu6xg6DEGSYkil9kGT3bB3H4Z7FsCzn6nRTKEp0jj92pfRuhiic1K
	 +8F3UPtMSzFqt2PXxQsi39ImQjvJnRgHvvs934l0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64A9EF804AB;
	Fri, 11 Nov 2022 21:09:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AF85F804AB; Fri, 11 Nov 2022 21:09:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFDF5F800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 21:09:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFDF5F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K7mRA65G"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC8F2620BA;
 Fri, 11 Nov 2022 20:09:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB719C433D6;
 Fri, 11 Nov 2022 20:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668197383;
 bh=PzS0md/R98teTQLOBivBEycYuxdpDjm/Kz1yZeYFP0w=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=K7mRA65GuShqGApRUfNyO8lLj7vIUm1koqrsswCYzunKzBv4G/Xd9JscPC7nBekHg
 HGVCYXuxkPilExhHSueartS805yFmWZo/bZkw7N0cHWHCzh0JCJDrWbahiiH2ht26o
 SqcDC2PouciYEyI4wypEuihkci4f/Z4J82SVQbSGEePLHtDpxyXFg8OKcNgYNo5Bnx
 16OUSZhkdjcmpvIPU5vDYxGHysV6ppYMZfO8W4MnqC6ZkyG+pYO5ho4B8z7rs/oDYQ
 uKQd0NtYR0G+cli5T07r9y+nzr766Rsqwb4Y0OGav+i2nEWhGNmpQBPqaq9j1piNbE
 bTIATgHzkfuvQ==
From: Mark Brown <broonie@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, devicetree@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20221110133512.478831-1-krzysztof.kozlowski@linaro.org>
References: <20221110133512.478831-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: qcom,
 wsa883x: Use correct SD_N polarity
Message-Id: <166819737928.635730.17163192130637526976.b4-ty@kernel.org>
Date: Fri, 11 Nov 2022 20:09:39 +0000
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

On Thu, 10 Nov 2022 14:35:11 +0100, Krzysztof Kozlowski wrote:
> Use correct polarity in example and powerdown-gpios description.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,wsa883x: Use correct SD_N polarity
      commit: 817e981736d27731adb9d7ca11eb8069d1ee569d
[2/2] ASoC: codecs: wsa883x: Use proper shutdown GPIO polarity
      commit: ec5dba73f7ba10797904cf18092d2e6975a22147

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
