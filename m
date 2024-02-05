Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5190284A020
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Feb 2024 17:59:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97CD3DEC;
	Mon,  5 Feb 2024 17:59:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97CD3DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707152398;
	bh=VRTN3Dv3YqaGLWiQ45v40VoTuQnxlGeffm0Q415W9do=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ADiYNRUvpsdrgnac5Nw5oxXipH+QaWLn7lAnTpHt5n8bn8Ogb1NQv9d0tT/+H1XH6
	 CmLT6kLyBnIhUEBslSHdkJZxB3iP/ZF5xc+PC/AnlnWAYsbrA6Rd0AUMdhWYhtEMzv
	 OeKn2e6dSSzHFD80qsrGYwFcm/jmucGAXMk9tMR0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB09BF805F5; Mon,  5 Feb 2024 17:58:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 202FBF805EC;
	Mon,  5 Feb 2024 17:58:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70746F801EB; Mon,  5 Feb 2024 17:58:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D594CF80153
	for <alsa-devel@alsa-project.org>; Mon,  5 Feb 2024 17:58:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D594CF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sMQfKs7b
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ABE23CE09E9;
	Mon,  5 Feb 2024 16:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04722C43399;
	Mon,  5 Feb 2024 16:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707152326;
	bh=VRTN3Dv3YqaGLWiQ45v40VoTuQnxlGeffm0Q415W9do=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sMQfKs7bfBQW8WnJ0FfpCcai0NlmCFM8t7X6YmNoatsPD3MywYRbT44Ju8TBU2BGM
	 7yxmmvUBxY57qK9QAJ1hIZwvg9TEmLJf5nX18N3w3D3SwXKerD/r7HJyyw7r+dMHEo
	 bqQIdlok+mZTcJJHIKgRXhMTSdRoz4WlP7PPqV2xfFSVYccMgUxy05zyLue7cURGZE
	 eoh5mE0m/6eQK4AF4nWMnVWwCi0S4KOOoJNE7AQ9Xi/2XhsMfHa+1c05obkReNZLV9
	 yLXjACvOEd7SLJ8ZJun8VBhjc4JQEsSZLgpu6X++CFvaQUMlK/u0aiUkokT8etZSe1
	 tSID3QpVwESzg==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Gergo Koteles <soyer@irl.hu>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, stable@vger.kernel.org
In-Reply-To: 
 <118dad922cef50525e5aab09badef2fa0eb796e5.1707076603.git.soyer@irl.hu>
References: 
 <118dad922cef50525e5aab09badef2fa0eb796e5.1707076603.git.soyer@irl.hu>
Subject: Re: [PATCH] ASoC: tas2781: add module parameter to tascodec_init()
Message-Id: <170715232269.801804.9210971697925067313.b4-ty@kernel.org>
Date: Mon, 05 Feb 2024 16:58:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: JKG4LX6KJXFN4BNPRIUV4GBSTV6TJ2KT
X-Message-ID-Hash: JKG4LX6KJXFN4BNPRIUV4GBSTV6TJ2KT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JKG4LX6KJXFN4BNPRIUV4GBSTV6TJ2KT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 04 Feb 2024 21:01:17 +0100, Gergo Koteles wrote:
> The tascodec_init() of the snd-soc-tas2781-comlib module is called from
> snd-soc-tas2781-i2c and snd-hda-scodec-tas2781-i2c modules. It calls
> request_firmware_nowait() with parameter THIS_MODULE and a cont/callback
> from the latter modules.
> 
> The latter modules can be removed while their callbacks are running,
> resulting in a general protection failure.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tas2781: add module parameter to tascodec_init()
      commit: 34a1066981a967eab619938e7b35a9be6b4c34e1

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

