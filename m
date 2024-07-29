Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C1B93FC61
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 19:22:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CF7E207;
	Mon, 29 Jul 2024 19:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CF7E207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722273777;
	bh=A6vdhVEPOCt1GZLSIT08jaj2sy7xUIqD8bI7n3yYE7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HFu/K7/nRqkAmZFdifCn/PIH2mE/Xr8sSYkm+7BN2Dh84WYkiNU5afNH14Zmtzh0V
	 E5rKkF/eTTV5Eg5cOIS1QxWUbeRoqgVokVz9xPAQdFzbUeNVop5SusOOE89CyM1SUj
	 wq+jD8m1KjfI4VprDdjlGnWSW0+1VF++WctEX4Z8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B20D8F805AC; Mon, 29 Jul 2024 19:22:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 037E8F805B0;
	Mon, 29 Jul 2024 19:22:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87280F80448; Mon, 29 Jul 2024 19:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 055FEF8007E
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 19:17:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 055FEF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fNCMJvnB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 922B461BB8;
	Mon, 29 Jul 2024 17:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6CCC32786;
	Mon, 29 Jul 2024 17:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722273432;
	bh=A6vdhVEPOCt1GZLSIT08jaj2sy7xUIqD8bI7n3yYE7g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fNCMJvnBHpaNAn4wwtS+XoW6xc/iHu92p5xl+5QFoGiDhJtcoo5JsWCBXk7uBfuAY
	 pAGIYfIW+E5Q2+DQ13EBF9qV6W4+QNXIuaBNFIsE3vNw+mzprOxejCJYJsyOLiEBaS
	 1hAWvZ3FA5BVsLQ/Z9XDs/CgAe/67ouCuPlbn39P30E96UtG5G9Tyn5yG/CVS5Ba3x
	 3cpDP23sjcEC0litdniCvOqOTCQXZsBGof2JMtjZLrTjIYYDgnGKA7z5q8rzBgyXvp
	 RDNDwVhYrunqqkILDHE4MgXBB1KhZxWXVWnGC0tipRyG5t73Cvg1Ap50G8Q+pNsgHQ
	 qymL7GnlC13gQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
References: <20240710-asoc-wsa88xx-version-v1-0-f1c54966ccde@linaro.org>
Subject: Re: [PATCH 0/4] ASoC: codecs: wsa88xx: Few cleanups
Message-Id: <172227343010.109775.12144627736852943571.b4-ty@kernel.org>
Date: Mon, 29 Jul 2024 18:17:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: DCHFRQH5QXQE5GWAHSEKOJM4JAUS3357
X-Message-ID-Hash: DCHFRQH5QXQE5GWAHSEKOJM4JAUS3357
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DCHFRQH5QXQE5GWAHSEKOJM4JAUS3357/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 10 Jul 2024 15:52:29 +0200, Krzysztof Kozlowski wrote:
> Few cleanups around wsa88xx codecs.
> 
> Best regards,
> Krzysztof
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: codecs: wsa881x: Drop unused version readout
      commit: 3d2a69eb503d15171a7ba51cf0b562728ac396b7
[2/4] ASoC: codecs: wsa883x: Handle reading version failure
      commit: 2fbf16992e5aa14acf0441320033a01a32309ded
[3/4] ASoC: codecs: wsa883x: Simplify handling variant/version
      commit: cd15fded0e1090bf713647a5bcfd83e372152844
[4/4] ASoC: codecs: wsa884x: Simplify handling variant
      commit: 7eb62acd43c9299630f0e859f56981072401c5b6

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

