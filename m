Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7861B917293
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 22:39:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EB18A4D;
	Tue, 25 Jun 2024 22:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EB18A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719347946;
	bh=OHuNuVjqW1MgOu0CHLh31MnZvZNSL0S5UJ+5Ixi7jJ0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=G+y3Rt7PaYaej5W6kJES67g3dgv4bPj3WD5L0YIBNf08Xk2WKs9zBuTSivvSRB3El
	 aSWlmJI+oh4uoIGqqCp4deyAugK7imR9L4vVYUNl4A1PtdgElyJRNoE7LKYdsjYEHY
	 XycT56yr6IKwRki7x3TGlbhcML27pHe8kSdEkeQs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B089CF805AB; Tue, 25 Jun 2024 22:38:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4D2BF805AF;
	Tue, 25 Jun 2024 22:38:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC3C2F80495; Tue, 25 Jun 2024 22:11:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42FCDF800ED
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 22:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42FCDF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Hs/cDHdG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 465C9CE1EFA;
	Tue, 25 Jun 2024 20:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8C3C32789;
	Tue, 25 Jun 2024 20:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719346244;
	bh=OHuNuVjqW1MgOu0CHLh31MnZvZNSL0S5UJ+5Ixi7jJ0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Hs/cDHdGc7kqPDr8+uP3zhY2h8JsF1CfeuuxaPJXfz1xhUpibbHvXAm7+pdNv0ggS
	 kZp0E26jtQZBefXEEs1a5+C6avaXFnh6sPqZOG5DPdR2lC0XPqisSYxgAnExconRMX
	 XaE6AsIGHEqs7Is3hyWXoHiRor2dgWzzY6lM7f3cz2f33egWZ4v04P7JOPDl34eUsG
	 WUpEqX1DHCk8bntHjzmDIAtNQfdZrKyWEfES4z3J/zQAImFXjIb7Pypl3f5A4zyJZW
	 QV+KAMCC38ksp1lInfFCMo/hPfTfvdsapqU7D67EVxhWnVTLOc4LJaoe8H11C27ERn
	 FE7Dglv5j25CQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>
References: <20240625160614.450506-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: lpass-rx-macro: add missing handling of
 v2.1 codec
Message-Id: <171934624243.1243504.8133552176483235259.b4-ty@kernel.org>
Date: Tue, 25 Jun 2024 21:10:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 7Z3VK2RYA3QZBK4H2SJL3MSCBI3TOFAO
X-Message-ID-Hash: 7Z3VK2RYA3QZBK4H2SJL3MSCBI3TOFAO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7Z3VK2RYA3QZBK4H2SJL3MSCBI3TOFAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jun 2024 18:06:14 +0200, Krzysztof Kozlowski wrote:
> We have also v2.1 version of the codec (see 'enum lpass_codec_version'),
> so handle it as well in all switch cases.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-rx-macro: add missing handling of v2.1 codec
      commit: 903e85093670c3e1107980b5e5a718682458f316

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

