Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 786E27C8C0B
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 19:10:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17FA3828;
	Fri, 13 Oct 2023 19:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17FA3828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697217025;
	bh=3wWndav4ZOCHssO3po2sHt5o1oR+9DzcNiui7hMgrFo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ONdktiXA+8wTxm4hq7Ifwt2Jb0ea08/5y88e6M4nCovytn3JB01g5JlNFFQ+Uuiyy
	 GNEPFWjcPSUoKCLivsDsRjuAd6Y/gQ64IYa1KTYD/q0sGpqgcYzdW0FfkqOiToXwTk
	 5i/yajHb77rmAwLa6Wz8ft2oJ+uNMWQj1XB6LPYw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39A10F80166; Fri, 13 Oct 2023 19:09:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F930F8027B;
	Fri, 13 Oct 2023 19:09:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A690AF8019B; Fri, 13 Oct 2023 19:08:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08368F8019B
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 19:07:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08368F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QEd18nDG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A6EE620EE;
	Fri, 13 Oct 2023 17:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8DD3C433C9;
	Fri, 13 Oct 2023 17:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697216873;
	bh=3wWndav4ZOCHssO3po2sHt5o1oR+9DzcNiui7hMgrFo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QEd18nDGg3PlWg/kExXRgCEwLslpwFpdnyVZOc91kgGIh4CI0nEqOgd9fVytb4RBt
	 SLGVp8U5Hql9fdkKQykXAK/Me5wxc3QRfJOHY5b6EFpaH4UiTtKV/BvmbA2wPaTPTE
	 y2+uqcWLegrdb5DLjRjENyxSQEp1OZ+BjcGrPxTIkTMQEtnNEIevg9mYD9GxxHXLGM
	 kNDmmHjynx0rK6t7eiUeyZVDY90vILXeMZin+SOJHY4Parmumf42pX2dqDsNx3cD1Y
	 gUIwORhH7RdEBsNCQi+6KGpAvSlLuYgV7PRWjahEZU2U138anAH/8x0O8IYxeLMonj
	 ntcaEjRu4TWEw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20231013094525.715518-1-shumingf@realtek.com>
References: <20231013094525.715518-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt5650: fix the wrong result of key button
Message-Id: <169721687276.2968842.6312386154323823475.b4-ty@kernel.org>
Date: Fri, 13 Oct 2023 18:07:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 255TO2JXEGIVOHJAMW634UVPYMYP7MNP
X-Message-ID-Hash: 255TO2JXEGIVOHJAMW634UVPYMYP7MNP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/255TO2JXEGIVOHJAMW634UVPYMYP7MNP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 13 Oct 2023 17:45:25 +0800, shumingf@realtek.com wrote:
> The RT5650 should enable a power setting for button detection to avoid the wrong result.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5650: fix the wrong result of key button
      commit: f88dfbf333b3661faff996bb03af2024d907b76a

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

