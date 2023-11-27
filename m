Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E36597FA80E
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 18:34:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A0FFDF6;
	Mon, 27 Nov 2023 18:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A0FFDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701106446;
	bh=FUMVW8TD4/57DaIIlpdt+EDG4bH/7jKa8MeoYWK2tgE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZqNjeitgstNa4Fa15uqkcFoEePZytV1P70SEHQt/pSpELKUOb/WRgj6SjE5Vm+4UL
	 bdujHgFcxEHkNz9+aP7JAb2UTsm6V+aUZw7V42uskz/lBQm7Gr0KyHqboBTyzW8vKt
	 +dK3xb6g41RrKY6lNXwMf2N4nxN+H64kRJXSFyT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D51ADF805C6; Mon, 27 Nov 2023 18:33:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D145F805BE;
	Mon, 27 Nov 2023 18:33:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D66B8F801D5; Mon, 27 Nov 2023 18:33:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39C49F8016E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 18:33:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C49F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PHgbMkfe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7E0E612AB;
	Mon, 27 Nov 2023 17:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B96C433C7;
	Mon, 27 Nov 2023 17:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701106390;
	bh=FUMVW8TD4/57DaIIlpdt+EDG4bH/7jKa8MeoYWK2tgE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PHgbMkfe9VzHcDF/EJfM21uLYf8DEfe/3JpF81xg6Y0+JxTaGaRfgXDPN2Bu+4Z5x
	 pkLsiK1BO5+Be5qxw9smLXSGyYz8rCH9Nf6yWO0l32O+8kiNluihpeL9ki5e3HeM2D
	 vW0mLHfnBlefoKbxyt/7+UugXXvXVhVY0OorhM1aUYTTMOsw/tDM+EokP7Xhe3mxvp
	 YUOZcepNdNE1z+0XrZVNqA7gtibVI7+q2/olexz/JrDJJ/CYhpVpopL4hY8Lnh7Asx
	 ZOagCtQaSsd1M5EuQcPVCfWQWVg1arBQ4Lp+MHnRemzQIr38kl631ULQ3lgW7jTLEH
	 BiuK5Ad5Yr8Wg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yong.zhi@intel.com
In-Reply-To: <20231127105235.30071-1-peter.ujfalusi@linux.intel.com>
References: <20231127105235.30071-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: mtl: call dsp dump when boot retry
 fails
Message-Id: <170110638668.2700573.11679513380788892417.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 17:33:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: W226N57PFR2TMDHJ335RWZHM5Z7HY6FN
X-Message-ID-Hash: W226N57PFR2TMDHJ335RWZHM5Z7HY6FN
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 27 Nov 2023 12:52:35 +0200, Peter Ujfalusi wrote:
> Call snd_sof_dsp_dbg_dump() with the same flags/dump_msg
> as used in function hda_loader.c/cl_dsp_init().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: mtl: call dsp dump when boot retry fails
      commit: d5070d0c10326e09276c34568b9a19fb9a727b6e

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

