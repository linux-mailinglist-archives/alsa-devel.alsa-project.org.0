Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D47D3913D35
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2024 19:22:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D54A82B;
	Sun, 23 Jun 2024 19:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D54A82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719163371;
	bh=lCnpI6MGZ7tqlfHmo6/4lQWWdf2FV5VM4Utg4pbRtes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N4j3WxxKdulsYWrtziHfDRmc+WY2K+CvWVw60YSkIPwnApbnGEYdOA8j5Fe3NyX5L
	 0wJLI6KxUVEpp6i1cZoAzv3Eb2Sr/v8htRhT390Tb6kLWLfxm2T5BYoERe64Ahs5ET
	 2I+10vJk+YH9EubXebwmOthFxiuu5Qi0B7OnsmUU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 504AEF805D6; Sun, 23 Jun 2024 19:22:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AD9FF805DA;
	Sun, 23 Jun 2024 19:22:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9219F804F2; Sun, 23 Jun 2024 19:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC884F800E4
	for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2024 19:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC884F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Oq29rr7T
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1C19CE0F9B;
	Sun, 23 Jun 2024 17:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0B4C2BD10;
	Sun, 23 Jun 2024 17:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719163304;
	bh=lCnpI6MGZ7tqlfHmo6/4lQWWdf2FV5VM4Utg4pbRtes=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Oq29rr7TfplWGhY9I1T+8UTDsjBlfbhLmKJ7zUn3d0nl0sFWwQ9rm1i32rXS88P50
	 pDH5bAODX1/zGOYQrfMwGHNqB4PMZWM1iUciFte8Lr1rYB9Nr9AwcyzWHDtzg8o3aF
	 oD5CSz1kOWjWXCA/kODq3SNggZYLkHpEafY3EnU+QoxsJmp2n8LV+kMzPwefc7KULw
	 WCX8+Mh2E0AnpmTMkrHtY8e07kUvbjrWtbpviTfXD4hCjFQbKBIIPHqWYT6Fj4z3ZA
	 KUGjfSv4qOiHVchYVQJH+LSPo9t9AaSPetUaj2qZLA4HgABFyYx8qbR6yTBsvPDXcW
	 HZAixc2ES1KLg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
In-Reply-To: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
References: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
Subject: Re: (subset) [PATCH 0/6] ASoC: Few constifications (mostly
 arguments)
Message-Id: <171916330129.350242.13312693360705760410.b4-ty@kernel.org>
Date: Sun, 23 Jun 2024 18:21:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: C3VP32MZZI6LTRRFFI5GRK72K2DEMVIP
X-Message-ID-Hash: C3VP32MZZI6LTRRFFI5GRK72K2DEMVIP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C3VP32MZZI6LTRRFFI5GRK72K2DEMVIP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 17 Jun 2024 15:03:18 +0200, Krzysztof Kozlowski wrote:
> Make few pointers in ASoC functions as pointers to const, so the code is
> clearer to read, a bit safer and allows further constifications (e.g.
> placing some data as rodata).
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: Constify of_phandle_args in snd_soc_dai_driver
      commit: 2fbafecb0f05818e25f6c926c6f9ad9ef597429c
[2/6] ASoC: Constify of_phandle_args in snd_soc_dai_link_component
      commit: 020b37d06f97de289940805bc821190d5858eda0
[3/6] ASoC: Constify passed data to core function
      commit: f3ac3da7e4d0957b3402fb31a4ca480e739e086f
[4/6] ASoC: Constify DAI passed to get_channel_map
      commit: 785d64c4941221044940ab199e6625af17296470
[5/6] ASoC: Constify return of snd_soc_dai_get_pcm_stream()
      commit: de267e7a6ea8e6fa29af2287adfc9fc9d87e6dc9

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

