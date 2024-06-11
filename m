Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA609038BC
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 12:20:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5B70E85;
	Tue, 11 Jun 2024 12:20:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5B70E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718101216;
	bh=w/yxPxCvkaDeWtKKMpFlZEVsnhxa4e1/eJvbybjHLrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WIrSXiZNuFQDrLu60wpn5LBTO2TPkpzgPQ2ETrT5KtA2cM1ZklmF9wANfRzyedrLE
	 ZqsSynnHiV+WKnjGBmwbkCdVqK44cnSSurIx5XKn5yjhckfqpn7FuyU9nzgVpJWsxO
	 YAzqhXHEj+DrfMpI0a3dLBukcwFcpsiSt+PKfoUs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0709CF805AE; Tue, 11 Jun 2024 12:19:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46D54F805AB;
	Tue, 11 Jun 2024 12:19:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 887D0F80580; Tue, 11 Jun 2024 12:19:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 300A4F8010C
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 12:19:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 300A4F8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BqBHRojf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AD2DFCE1AA7;
	Tue, 11 Jun 2024 10:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB9BC2BD10;
	Tue, 11 Jun 2024 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718101170;
	bh=w/yxPxCvkaDeWtKKMpFlZEVsnhxa4e1/eJvbybjHLrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BqBHRojfxWBJxHMMY8/swGUpBo8czC2/+DcqD1cxVFPHLamyhEjgOs3lWpEcDw6hT
	 467sC4Tcdemtc9jX9HV8WTGIUxxcouz72HxLi7DpaMP1Q+TgodAGTLT/FH7nEPyRx9
	 n3jC0XkBo5PyfatcDJIsI76TwUiROfk3tG8pa1FrhgTz9yTGSGTySDqc4PdDD4y5Bu
	 qPUgNsBktIyQdkxLB25GWOAwTANPZ35+RMmM1OD0rXJblWnMc0wC05eYWc1LYsQOvv
	 jp/xvRw6WKMLAcFAGK3p4+vMm8mnrcTfOoFxRNUFOGyULalKIC8jxg0ol+JH5R33RY
	 to4VzzHl7zCfw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 quic_pkumpatl@quicinc.com
In-Reply-To: <20240524035535.3119208-1-quic_mohs@quicinc.com>
References: <20240524035535.3119208-1-quic_mohs@quicinc.com>
Subject: Re: [PATCH v5 0/7] ASoC: codecs: wcd937x: add wcd937x audio codec
 support
Message-Id: <171810116692.177725.17513047102055843084.b4-ty@kernel.org>
Date: Tue, 11 Jun 2024 11:19:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-4c370
Message-ID-Hash: IR4O4LOJG6TXUN4BKVKRT6EC5OXO7KZD
X-Message-ID-Hash: IR4O4LOJG6TXUN4BKVKRT6EC5OXO7KZD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IR4O4LOJG6TXUN4BKVKRT6EC5OXO7KZD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 24 May 2024 09:25:28 +0530, Mohammad Rafi Shaik wrote:
> This patchset adds support for Qualcomm WCD9370/WCD9375 codec.
> 
> Qualcomm WCD9370/WCD9375 Codec is a standalone Hi-Fi audio codec IC
> connected over SoundWire. This device has two SoundWire devices, RX and
> TX respectively supporting 3 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
> 6 DMICs and MBHC.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: dt-bindings: document wcd937x Audio Codec
      commit: 27173bb0b64461acf4e00f1bae3b15d8d2348c14
[2/7] ASoC: codecs: wcd937x-sdw: add SoundWire driver
      commit: c99a515ff15380ec5f8827049914145ba908e8da
[3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
      commit: 9be3ec196da41b20b624ae4ed0303df58548644e
[4/7] ASoC: codecs: wcd937x: add basic controls
      commit: 82be8c62a38c6a44e64ecb29d7a9b5cb35c6cad4
[5/7] ASoC: codecs: wcd937x: add playback dapm widgets
      commit: 57fe69db7a015e828ec69d819707c5b8eac6d052
[6/7] ASoC: codecs: wcd937x: add capture dapm widgets
      commit: 8ee78493be89c42d016f941a9b00c203ec08daab
[7/7] ASoC: codecs: wcd937x: add audio routing and Kconfig
      commit: 313e978df7fc38b9e949ac5933d0d9d56d5e8a9c

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

