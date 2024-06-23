Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 422F4913D41
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2024 19:24:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE15C847;
	Sun, 23 Jun 2024 19:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE15C847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719163468;
	bh=FFR/1c1wfsHIvFV5vtSMY0ZRCwh3bSTMRyZbp5Z9kdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EP/G/cu+JC/zMh/dn7rlKgiQb+550/mFSdob94nkkidgelyyQ33MrjhHTEGMq2uTa
	 7NZTOES0U22zq+4yP3Ww9jtAZIHcztdRTRCnXXd8U316Da+Uf5H8RDBGj9fJez1goX
	 ScpRd5/0vcB4bSGQAtI3MuIaRNiuKOdasdDVlSho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 753B3F805E9; Sun, 23 Jun 2024 19:23:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64B16F805C3;
	Sun, 23 Jun 2024 19:23:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75EF2F80588; Sun, 23 Jun 2024 19:23:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C2B5F8049C
	for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2024 19:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C2B5F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KUI9ou/l
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 639766255B;
	Sun, 23 Jun 2024 17:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2DFC2BD10;
	Sun, 23 Jun 2024 17:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719163315;
	bh=FFR/1c1wfsHIvFV5vtSMY0ZRCwh3bSTMRyZbp5Z9kdo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KUI9ou/lCpJs2B8R55lqMzNuyG6my4REWiPS5mSVqgUxoHCMbvRZ59mJ5+srhJ4Rs
	 zEsrjsoQksLBeZUyxiNuPeovhEnmVv4ps8SYMrG9HJYli6cVGecKYnb7df1Kg2PvY9
	 gE5td45ZidxZ0xetz0vEhr9v7yydWNC8+4rufUD77OliPYvHm/EvfJqFpPxVYpXEjA
	 r9JDLO5q6EJdHaNP8kJzPqe1iFKThB2Zte3s/2xvd2t7kBj4LrUoVdumWeL/m7fvng
	 XWCcxqxMrEEk+hu15H5r/XEIPWMWaXBj+KvuNb/vdHw/XKWAefu10+cMRhuhXbmWOQ
	 a9LWiP984ezxg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
Subject: Re: [PATCH 00/23] ASoC: codecs: wcd family: cleanups
Message-Id: <171916331297.350242.2469313252117376450.b4-ty@kernel.org>
Date: Sun, 23 Jun 2024 18:21:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: DU474LESCKS6BN4Z5HDEVOFHAG64TBKA
X-Message-ID-Hash: DU474LESCKS6BN4Z5HDEVOFHAG64TBKA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DU474LESCKS6BN4Z5HDEVOFHAG64TBKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jun 2024 18:15:13 +0200, Krzysztof Kozlowski wrote:
> Set of simple cleanups from similar issues in all Qualcomm WCD93xx
> codecs.
> 
> The first patch "ASoC: codecs: wcd-mbhc: Constify passed MBHC reg
> fields" is a requirement for few others, but except this they are
> independent.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/23] ASoC: codecs: wcd-mbhc: Constify passed MBHC reg fields
        commit: e565ab184946650f19afb9fe74f8be84fcb6d210
[02/23] ASoC: codecs: wcd9335: Drop unused state container fields
        commit: 60ce48f5311103dd7a09e12d0b75d7ec44e291d9
[03/23] ASoC: codecs: wcd9335: Constify static data
        commit: b2ff7c88bf751fa502f5707f0b7b047afcba87dc
[04/23] ASoC: codecs: wcd9335: Handle nicer probe deferral and simplify with dev_err_probe()
        commit: 4a03b5dbad466c902d522f3405daa4e5d80578c5
[05/23] ASoC: codecs: wcd9335: Drop unneeded error message
        commit: 3ed4beba49463997eb9a4afa0d46ece7dc5dbf19
[06/23] ASoC: codecs: wcd9335: Drop unused dmic rate handling
        commit: 1d1cda22da5db03a0c794d139e06519e3a94f815
[07/23] ASoC: codecs: wcd934x: Drop unused interp path enum
        commit: 1bce5c586ba56dfa6acf8d13f0f608f5f5d717bd
[08/23] ASoC: codecs: wcd934x: Constify static data
        commit: 5ad81bf49a18dc22bd7e1c56f67be9b5eb50267c
[09/23] ASoC: codecs: wcd934x: Drop unused mic bias voltage fields
        commit: a252188244aeff72e4331abba2fee6b9093c847b
[10/23] ASoC: codecs: wcd934x: Handle nicer probe deferral and simplify with dev_err_probe()
        commit: 9ea22713227397b56a2b36a68c8bda13f0b43d70
[11/23] ASoC: codecs: wcd937x: Constify static data
        commit: 0ad42c04e9b223d913ad4b1463c0f1cdc00f3cc5
[12/23] ASoC: codecs: wcd937x: Constify wcd937x_sdw_ch_info
        commit: c8ed66cbc3b7ccd9e5ae98b06023c1fe3e834ca8
[13/23] ASoC: codecs: wcd937x: Drop unused enums, defines and types
        commit: d8e746719d705427e69c7f0ac2ca20aaf560a03e
[14/23] ASoC: codecs: wcd937x: Drop unused state container fields
        commit: c2d9fd2e94588eb83f8855e942d77b5f539c5a5f
[15/23] ASoC: codecs: wcd937x: Drop unused chipid member
        commit: 6dc7b8a10419a267cd5eb7ac2bb407f7fc7865e2
[16/23] ASoC: codecs: wcd938x: Constify static data
        commit: 424e6bc4328b39a924cc2acb251868cfd23fe369
[17/23] ASoC: codecs: wcd938x: Constify wcd938x_sdw_ch_info
        commit: af57d5e3b58886ee5efc6ba9d0e25c8d1d3c3c37
[18/23] ASoC: codecs: wcd938x: Drop unused RX/TX direction enum
        commit: 43e7400f6bf51ecedf4ddad942cd812fe351ce74
[19/23] ASoC: codecs: wcd938x: Drop unused num_ports field
        commit: 3f1deca19e68e48bd89a72c4fe648275d9af574b
[20/23] ASoC: codecs: wcd939x: Constify static data
        commit: 8e5d5b2c96fadecdaebff5afcbb7f51580701122
[21/23] ASoC: codecs: wcd939x: Constify wcd939x_sdw_ch_info
        commit: f49100faccb5d2ffb4c9e5e4bba6173f5ac43d22
[22/23] ASoC: codecs: wcd939x: Drop unused RX/TX direction enum
        commit: 2642b6aa9d0f43c52c83461bc7ae4917336e7643
[23/23] ASoC: codecs: wcd939x: Drop unused num_ports field
        commit: 34935cd4721f0492eafbc516dd1fc7f5f687fa76

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

