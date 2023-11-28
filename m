Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AC07FC082
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 18:48:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AFA1950;
	Tue, 28 Nov 2023 18:48:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AFA1950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701193703;
	bh=rddJhLNEIIZOQFOBhkKYJ+5PMVxsXyTgdAp5Eo+i4EA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K+V10Tf+PIo+500iTpbPFG7o6qZ7pE6M22AogCB5OqqJXjvTfCSA1X0m7J/SQy0OD
	 meBTBr6oc0Lckedm3UU5UBO0YqHCiVRsT9nxRy1syFzHYQfXudL9Vi3GGijVQeVCcI
	 IBBMZjuJknq7XSNTvwjz6HDHIS0qSkiJ8nDojAD0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D511F805C4; Tue, 28 Nov 2023 18:47:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42A7EF805BB;
	Tue, 28 Nov 2023 18:47:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39CB4F801D5; Tue, 28 Nov 2023 18:47:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF694F80166
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 18:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF694F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E3iQ5CIn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 472986184D;
	Tue, 28 Nov 2023 17:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EF3C433C9;
	Tue, 28 Nov 2023 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701193649;
	bh=rddJhLNEIIZOQFOBhkKYJ+5PMVxsXyTgdAp5Eo+i4EA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=E3iQ5CInzI7mYgsNA86+/zU/A7fV/18N93F57smUXGyXVm/Qdqpij025YZ0Pcpjfd
	 CCIUxxfkHanJUfNLZRjmQXlrw3QkgWaYbsjq9bzmF0LysLToVChvXwKYE1d+vFo1Bl
	 LUTigpSDBz/Qi4nWIiEAK+FLoqJUIFCK4sA6TD8AHpyDodQ2p3uHE/rFvaphBZDHnP
	 kOImGJNshUuojnZvetomfbwfdH+bhsTBWl++4vxT0Y90oVcefuSdTN4eOQnqwRUj9B
	 aLiTB6Cnooo2Cf4OR8OgH+ZEdcqar2Z381eQVhfooUdxXbjDFHP42h/2Oec6meZNbU
	 rT2O7YTaIS+KQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
In-Reply-To: <20231128123914.3986-1-peter.ujfalusi@linux.intel.com>
References: <20231128123914.3986-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: hdac_hda: Conditionally register dais for
 HDMI and Analog
Message-Id: <170119364797.61148.15087647751921476519.b4-ty@kernel.org>
Date: Tue, 28 Nov 2023 17:47:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: A2LP33LBAZZWITMRYK5ICONK5OENCWA5
X-Message-ID-Hash: A2LP33LBAZZWITMRYK5ICONK5OENCWA5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A2LP33LBAZZWITMRYK5ICONK5OENCWA5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 Nov 2023 14:39:14 +0200, Peter Ujfalusi wrote:
> The current driver is registering the same dais for each hdev found in the
> system which results duplicated widgets to be registered and the kernel
> log contains similar prints:
> snd_hda_codec_realtek ehdaudio0D0: ASoC: sink widget AIF1TX overwritten
> snd_hda_codec_realtek ehdaudio0D0: ASoC: source widget AIF1RX overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi3 overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi2 overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget hifi1 overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Codec Output Pin1 overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Codec Input Pin1 overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Analog Codec Playback overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Digital Codec Playback overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: sink widget Alt Analog Codec Playback overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Analog Codec Capture overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Digital Codec Capture overwritten
> skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: source widget Alt Analog Codec Capture overwritten
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdac_hda: Conditionally register dais for HDMI and Analog
      commit: 3acc58f55edf786971898fdb6bc180bc77acb2a6

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

