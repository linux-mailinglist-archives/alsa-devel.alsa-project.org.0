Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C0175FDCA
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 19:32:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6DF3203;
	Mon, 24 Jul 2023 19:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6DF3203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690219963;
	bh=jTpn8Fz2iciYuoEBgv60/TBE76Imy8ifUR5muq9g77U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k0redpBMIgXES/P+PFt9CXBwl6Ar6ke74M7c+m642I7N8H1yq9hJOdP9padeWWAZ6
	 NMhqNGJd/br+Nw8RkyVJv3xq2X3fkT6O4Rdc5a1JG/Jh9hZ93R24Dg6rkkIocKCDXp
	 W49OqdwmX8MhhyWBcJ0egncIc6Z0b3g+kFgHgdO8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32328F800C7; Mon, 24 Jul 2023 19:31:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3DDEF80163;
	Mon, 24 Jul 2023 19:31:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A16B6F8019B; Mon, 24 Jul 2023 19:31:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85695F800D2
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 19:31:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85695F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DMIvyyac
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B53561124;
	Mon, 24 Jul 2023 17:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2B93C433C8;
	Mon, 24 Jul 2023 17:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690219896;
	bh=jTpn8Fz2iciYuoEBgv60/TBE76Imy8ifUR5muq9g77U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DMIvyyacP3iu4kLw90X2uogRzVAHkIJMHwX4GVA5ibPczcXDmaK13BggXaKR/OMiy
	 eaj+YcGHkD+BTrWUqdazj3khEVqz3iu00jrN6TfQkwurf8RsAt/czhwmVOFGa2ozkr
	 W3cToLVAibt9Hlb+OuOumIoxQ5gS4Jn5CgxApEXNjeOyIBOesPjqlAvMOv5BcBG1TO
	 QkV8+EXAu4MA/sw2QHj5bQt0dZtkXpy2+CDbQjFQdL/rzuEhdE1PsV3ESghT1WfyQ7
	 DuW8jtmYfb72Lbi0Rl2qwERvsRMzw/JA6XHG/4p683EhYVX+WTBYS+Zd4FwHnLje0+
	 0Co7SDvTN9mDA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20230721165027.2155528-1-quic_bjorande@quicinc.com>
References: <20230721165027.2155528-1-quic_bjorande@quicinc.com>
Subject: Re: [PATCH] ASoC: codecs: lpass: Log clk_get() failures
Message-Id: <169021989456.995610.9873876267138125933.b4-ty@kernel.org>
Date: Mon, 24 Jul 2023 18:31:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: 43ALMG6QKFMX6YUFLFFCYQ5SZZ3WSVNN
X-Message-ID-Hash: 43ALMG6QKFMX6YUFLFFCYQ5SZZ3WSVNN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/43ALMG6QKFMX6YUFLFFCYQ5SZZ3WSVNN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 21 Jul 2023 09:50:27 -0700, Bjorn Andersson wrote:
> The LPASS macro drivers all acquire a number of clocks, but give no
> indication when clk_get() fails, making it hard to identify and debug
> system configuration issues.  Make these drivers provide useful debug
> information when this happens.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass: Log clk_get() failures
      commit: f54e3474507427bf272bcc79c7c248c7f55d45b4

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

