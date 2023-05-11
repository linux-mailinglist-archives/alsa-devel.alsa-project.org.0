Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4214A6FEB86
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 08:04:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B661AF7D;
	Thu, 11 May 2023 08:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B661AF7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683785077;
	bh=ab8zpCraWRQK2aWKTLGLlDBVYV4HywcNfc6Jb271giY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dlwGpDGQ02AyB4UtTsIGA9JPAtG5piaXDQpQJW8R6OKYzTZbIL/+PDmQRpEIhjAxp
	 /QCcCjIEnoR5RvWq3jrvZwg4winQNJWv+41AKx0CZK5iYf8BN1B5vUun+NnhbS55gs
	 SH/M0UfAKelXnjZ1sbd1/Fk4RWhU+F+Yxy8TMIEs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93206F80534;
	Thu, 11 May 2023 08:03:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA645F8053B; Thu, 11 May 2023 08:02:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE26BF804B1
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 08:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE26BF804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GeJyNjgH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2BD1964AF4;
	Thu, 11 May 2023 06:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A10FC433EF;
	Thu, 11 May 2023 06:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683784974;
	bh=ab8zpCraWRQK2aWKTLGLlDBVYV4HywcNfc6Jb271giY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GeJyNjgHtviLcLtmLCHI1ZuGYJ50p64RnElp4xPJsIjRXpWvTb8ZpwLW3M8sLj7k+
	 fcohTQNgGbJw73U1XwI9qsxKGLk8+Js3Cs1FPaPTwHHCtxn/syMQXkjZfjbfvfzl1Q
	 behZIG/uinSPuftz2U3Si89BEP/NDWyN3O2AW2iSc+Q2flqx165SIp7ap+JzGbDRvF
	 NpLbUaVKfh5hr6OMObnGZJSJwbFw/2QyBBtyI9ZAtCjgpmrPstygqed0OP3Rb+eFMj
	 ZBr8tuUzYfDfabtb7wB/GS+2nWaBCiY6iT8uZ1Q3f+3w7+YPZxGbdaI1Gr6S/aT5uc
	 IARs+mA9tddTQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org
In-Reply-To: <20230509112202.21471-1-srinivas.kandagatla@linaro.org>
References: <20230509112202.21471-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/4] ASoC: qcom: add display port module support.
Message-Id: <168378496820.334814.7836507648668066206.b4-ty@kernel.org>
Date: Thu, 11 May 2023 15:02:48 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: YMHBHWQABL6KZHWBO4LXZGRVVYIHWCC2
X-Message-ID-Hash: YMHBHWQABL6KZHWBO4LXZGRVVYIHWCC2
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMHBHWQABL6KZHWBO4LXZGRVVYIHWCC2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 09 May 2023 12:21:58 +0100, Srinivas Kandagatla wrote:
> This patchset adds support to displayport on AudioReach.
> Patches are tested on X13s with two display ports.
> 
> Srinivas Kandagatla (4):
>   ASoC: qcom: q6dsp-common: move channel allocation to common
>   ASoC: qcom: audioreach: add support for DISPLAY PORT SINK module
>   ASoC: qcom: q6dsp: add support to more display ports
>   ASoC: qcom: q6apm: add support to display ports in lpass dais
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: qcom: q6dsp-common: move channel allocation to common
      commit: 4c2be53f411c25b569c8fe3f91d0acfc4c5b8392
[2/4] ASoC: qcom: audioreach: add support for DISPLAY PORT SINK module
      commit: a8ab65417d92803d15cc9aca461ecd9fdb3f2d81
[3/4] ASoC: qcom: q6dsp: add support to more display ports
      commit: 90848a2557fec0a6f1a35e58031a1f6f5e44e7d6
[4/4] ASoC: qcom: q6apm: add support to display ports in lpass dais
      commit: 2f6860e6133fca937d18b66faa32c460cef7ddad

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

