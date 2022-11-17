Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 378E862D9CB
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 12:49:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB971886;
	Thu, 17 Nov 2022 12:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB971886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668685765;
	bh=8hqDUOlFccqGwQGl9Wukt97CQepf0GZhn00KESa5/WY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uMkW1viOBbCGG/X++SwFWe+VpdUpoXT/aGq5DU7D7c2l/Mm5SkRIUwzVg5oimJX03
	 vvysx3lSt7DaUCMqZeSPXkYVJOxi+mQ19M6hECp5MQfnp7pLYhQTGmAXyCzSUwLBXb
	 +yh+5spdP1FsXiG7X+aRVZjq96bKN+KK9iU3d30I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BAEBF804BD;
	Thu, 17 Nov 2022 12:48:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17581F8025A; Thu, 17 Nov 2022 12:48:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D98FF800B5
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 12:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D98FF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iCIiLI9F"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C5E3614E6;
 Thu, 17 Nov 2022 11:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 784B4C433D6;
 Thu, 17 Nov 2022 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668685705;
 bh=8hqDUOlFccqGwQGl9Wukt97CQepf0GZhn00KESa5/WY=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=iCIiLI9FN2S8qq2r1+isOvr8QXea1XCuGP0VvNuPT+sFemUvWyXlT2XJ7mb67QjxU
 8gSh2epstObXVC1HTx/seJkdvTpIMSiD6ZLHzInd8AInAvhmx6CJsnguMT12tvSun/
 VHyyoXCJK+HTitXbArprmInoyeRCos8QsV38BJRf5AonHky87FpxCahp8CrPanfNdh
 Z8ZVF0QUDOZ2axzgc0cjxZVLOdwb2x2fP0g2nmYtIb7PpYh1ucWUMWzu+Jkad9JINW
 KryAaTavrgck0iBJxCHdm9rtXLctJWgJAwHpoeyw/m1sFQ2skdRiB0VHZKF+Bg8+2T
 N2nwH51U/zeKQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@quicinc.com>,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20221109163759.1158837-1-krzysztof.kozlowski@linaro.org>
References: <20221109163759.1158837-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa883x: Shutdown on error path
Message-Id: <166868570315.693995.134292755299481172.b4-ty@kernel.org>
Date: Thu, 17 Nov 2022 11:48:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
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

On Wed, 9 Nov 2022 17:37:58 +0100, Krzysztof Kozlowski wrote:
> If probe fails, toggle shutdown via GPIO to save power and reverse
> probe actions.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: wsa883x: Shutdown on error path
      commit: 8e022387444bc5039a271fbf5a778551c4a1926b
[2/2] ASoC: codecs: wsa883x: Simplify with dev_err_probe
      commit: 6b6ab406cedaf70f58961d4ea82e88e65e721d06

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
