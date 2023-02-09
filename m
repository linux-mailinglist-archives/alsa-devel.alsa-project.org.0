Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B43690DF2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 17:07:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1264E85;
	Thu,  9 Feb 2023 17:06:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1264E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675958853;
	bh=Hd5wMGWSXhYUc7Fz/5I9lG7OSwU+bPyOWklhykUOozs=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i+S+J1laTzQ6XNo8BDcQ8r+Jnm4/keSEgzzVmHSHH5sFN7H7JOc+3D+tB35CVAuqZ
	 or2lMRWQrApw6aCiIqdOYBaOBP654hf79NKxyIrPnVfWIMUWjxk1Ldl7abuqupjbS2
	 dWk90l53hSSQhupiD+2Enhxcj1aVxi3mLCl78KBY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA163F800B8;
	Thu,  9 Feb 2023 17:06:42 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BC02F804F2; Thu,  9 Feb 2023 17:06:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83B56F80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 17:06:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83B56F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=X38YgFZB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4835861B11;
	Thu,  9 Feb 2023 16:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B1EC433D2;
	Thu,  9 Feb 2023 16:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675958793;
	bh=Hd5wMGWSXhYUc7Fz/5I9lG7OSwU+bPyOWklhykUOozs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X38YgFZBgZCyg9wfqfHaDcwVGVtRcVoMsHYGnPAMrSo75YCtPhqUGo+ioqhggWsJh
	 1Q793+GsjtSu8uBKspHrHg1tct28JGfPTcui/uC/SyYA0y1eExWYA86OYCWvnpMDXT
	 1MQ3iteZyJZRIsJPwnnBvtGj1N6up63ZJUIhRBUdlBdjhP0TiQttFNQla9WtDZtzEY
	 gyaUzJqJx2HhZHfGyx4wt+apoNyLKNAuID8SnsuSEZNNrCLUprdz0a+koiWyRbLka6
	 ctR/eSEiLVmcBHbr4pBQdBrHf4U7z8CFFfvuhpAR8iShK4URDnbUK+ICKUrtCzg1b2
	 csNvh6Y3rWYUA==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kiseok Jo <kiseok.jo@irondevice.com>
In-Reply-To: <20230209084903.13000-2-kiseok.jo@irondevice.com>
References: <20230209084903.13000-2-kiseok.jo@irondevice.com>
Subject: Re: [PATCH v3] ASoC: SMA1303: Remove the sysclk setting in
 devicetree
Message-Id: <167595879198.443322.14924870138902391536.b4-ty@kernel.org>
Date: Thu, 09 Feb 2023 16:06:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: 3S24WAPUNZ7JRZFFGYAZLPVSG47C4WNX
X-Message-ID-Hash: 3S24WAPUNZ7JRZFFGYAZLPVSG47C4WNX
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3S24WAPUNZ7JRZFFGYAZLPVSG47C4WNX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 09 Feb 2023 08:49:03 +0000, Kiseok Jo wrote:
> In SMA1303, this device does not support MCLK.
> So it need to remove sysclk setting in devicetree.
> v2: Modify the sysclk setting - using devm_clk_get for mclk.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SMA1303: Remove the sysclk setting in devicetree
      commit: 2512839dd648ffa2c2a752e1403aaeb928cff71a

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

