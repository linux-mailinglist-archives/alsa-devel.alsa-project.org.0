Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A85E8FB182
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 13:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04EEA844;
	Tue,  4 Jun 2024 13:56:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04EEA844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717502190;
	bh=LdzwRA2zt1sdxlgICbUNcoNJjJj5QNDuiBm+ykHeT2I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZrrWvtsnoLByTRzIA6gQ2Nl50j6/YaaaTnasKpjhdUeBpYphfzYIJ1TkpwHJULw5D
	 lBv+iTSE5SF/71j2txYLtDqpiPpA/6LkvwFVxf/inoJ9HsHkAWKr1uW5rW5z/P1tyy
	 akPiDx+hZ/RpDWAHCYnJuRo2L+zdYGbUIUaqHe3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 624F5F805B1; Tue,  4 Jun 2024 13:55:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 784DBF804FF;
	Tue,  4 Jun 2024 13:55:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 460B3F805B1; Tue,  4 Jun 2024 13:54:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06FEFF8051E
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 13:54:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06FEFF8051E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZoUP+ECi
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3953CCE111F;
	Tue,  4 Jun 2024 11:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14409C4AF09;
	Tue,  4 Jun 2024 11:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717502070;
	bh=LdzwRA2zt1sdxlgICbUNcoNJjJj5QNDuiBm+ykHeT2I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZoUP+ECieXEgVV4klAEPccmVfu/HbxNZIrdDj4ZZDQ06BPnGiroGpm4+IFjRXrdo/
	 4lQIOxSWgu4aoQLJzlVQXJzvroX20LSCcAYeXdBU4qZYCBlNaZJWaccC+aoQhoxLKi
	 rAXl7YCg7ajSZvHLWa9p52jqb9EhThle/Em+lvHkbKgWtuHR3N5qvw5sitQUEgOzAp
	 Bdcxd9jMNlUFIj+Yp0b1mrr/03S232UWuKmRUhEo7c/BmzVblWkRO4dutKD56HMcq4
	 EAOA6EuMQY5cixULdX+8Ia/iyViCJzyG8tK18nlymV0jJflJTa1N4DpluTugJb8tlG
	 PjTc6ZndHOWRw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>,
 bard.liao@intel.com
In-Reply-To: <c66a6bd6d220426793096b42baf85437@realtek.com>
References: <c66a6bd6d220426793096b42baf85437@realtek.com>
Subject: Re: [PATCH] ASoC: rt722-sdca-sdw: add silence detection register
 as volatile
Message-Id: <171750206879.24919.2074757265447693223.b4-ty@kernel.org>
Date: Tue, 04 Jun 2024 12:54:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: RUTAQGCLIGFHIHFHHCDSGRBM6WR3CLY6
X-Message-ID-Hash: RUTAQGCLIGFHIHFHHCDSGRBM6WR3CLY6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUTAQGCLIGFHIHFHHCDSGRBM6WR3CLY6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Jun 2024 10:47:16 +0000, Jack Yu wrote:
> Including silence detection register as volatile.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt722-sdca-sdw: add silence detection register as volatile
      commit: 968c974c08106fcf911d8d390d0f049af855d348

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

