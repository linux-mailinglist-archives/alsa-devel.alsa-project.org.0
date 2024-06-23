Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA647913D3C
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2024 19:23:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E800EAB;
	Sun, 23 Jun 2024 19:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E800EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719163392;
	bh=Forj5XhRH3uV4vJJQYS/LVUyREwgZsaM1YGmaz5sfQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WCl4dmOZDzHGL0rNRz/cKp5bfEx2//uNJRhakla39m0a1+l0ZN5da6r+k70Vjucpw
	 KbCPoYi2m19C7bB9wUx3ozqcPIXV2KumtCOmtrHs8KKn6mKAv8E6oQ4kOj0iyeXvkC
	 0LTBXqTHoD6l67aJSgxLT5Z/AsWUJkm+Orfn5CL8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A642F805FF; Sun, 23 Jun 2024 19:22:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FFA8F805E9;
	Sun, 23 Jun 2024 19:22:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA7F7F8058C; Sun, 23 Jun 2024 19:22:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6508F80495
	for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2024 19:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6508F80495
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p3SjiZTY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3404362557;
	Sun, 23 Jun 2024 17:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D533C2BD10;
	Sun, 23 Jun 2024 17:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719163310;
	bh=Forj5XhRH3uV4vJJQYS/LVUyREwgZsaM1YGmaz5sfQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p3SjiZTY9vSSQhiRynn+3++nSIt9JrU5+9sbXsi5hbOH9iQ/P33zsCa5XXQy4D9NQ
	 remTyo5SzzDimPpXgp0GdgDfYrWhfGf66ChjPI4IZoWf363cNtgpy/VPG1jFBTQYB+
	 zszRnG0e8vxs1FI3oq0Sr2+yWU4UDWyubH1ODmfFOmmlLZl+jX/nvSoiT5fTFzIn5D
	 kYngjln+Kh09QTyl1D8qcSufi/i9op8+lXAIH/7BktrQ+lwloo4TGL9cwaihcCIEiA
	 ieIl6TMVjg7xK0t6AuQSdLZ/4taaGLxGqt9GGqZEdmHvyVKLViMQTzB0a08IZHtS8w
	 gRdadcJiuUGDw==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org
Cc: perex@perex.cz, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 krzk+dt@kernel.org
In-Reply-To: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v3 0/4] ASoC: qcom: display port changes
Message-Id: <171916330923.350242.338813871607705802.b4-ty@kernel.org>
Date: Sun, 23 Jun 2024 18:21:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: BD6Q7JNXFKB2YTYGJTIH4ZN7BYFB5GDG
X-Message-ID-Hash: BD6Q7JNXFKB2YTYGJTIH4ZN7BYFB5GDG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BD6Q7JNXFKB2YTYGJTIH4ZN7BYFB5GDG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 06 Jun 2024 11:49:18 +0100, srinivas.kandagatla@linaro.org wrote:
> This patchset adds support for.
> 	1. parse Display Port module tokens from ASoC topology
> 	2. add support to DP/HDMI Jack events.
> 	3. fixes a typo in function name in sm8250
> 
> Verified these patches on X13s along with changes to tplg in
> https://git.codelinaro.org/linaro/qcomlt/audioreach-topology/-/tree/topic/x13s-dp?ref_type=heads
> and ucm changes from https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/topic/x13s-dp
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: qcom: q6dsp: parse Display port tokens
      commit: 6d620e50bb055e072c8c50cf95cd397fc24378c2
[2/4] ASoC: qcom: common: add Display port Jack function
      commit: 735db4ea16caaebf8e4884ec0c2e419c96391ac8
[3/4] ASoC: qcom: sc8280xp: add Display port Jack
      commit: 7e815bb9abd16f99c987987242a9fe13dfa0f052
[4/4] ASoC: qcom: x1e80100: Add USB DisplayPort plug support
      commit: 24790a3cd1bdc083f9989f2fdb223f6494ebc99c

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

