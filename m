Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BC885D69C
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 12:16:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54FF9846;
	Wed, 21 Feb 2024 12:16:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54FF9846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708514172;
	bh=irQ6ebiQiyGpcMm37AjfJenPghYMGL62W6zUcLWPX+E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m5VGGeLQLV3VfkWtbTxfD9REbBBScgwv/Y5WiibNVdOMJpo5AYaYSNPi//WRkyNg0
	 vMSGioIQEa1DXs65lJ5YeAgxpLcK+6ffuBWbiSxdiy/EcpwunRc1lmVj0dPV/LCj4i
	 64ANm/6g/gNTWOIQVdQXxZ3klLzPM5Nz4BKA2Y4c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05B4FF80570; Wed, 21 Feb 2024 12:15:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6B53F8059F;
	Wed, 21 Feb 2024 12:15:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0480AF80496; Wed, 21 Feb 2024 12:15:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6514F8047D
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 12:15:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6514F8047D
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckYx-0006aF-9K; Wed, 21 Feb 2024 12:14:55 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckYt-0021lT-Mj; Wed, 21 Feb 2024 12:14:51 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckYt-0005LY-1x;
	Wed, 21 Feb 2024 12:14:51 +0100
Message-ID: <6cc0774c0093086aa2504d6124ee6b9af4615677.camel@pengutronix.de>
Subject: Re: [PATCH v6 0/6] reset: gpio: ASoC: shared GPIO resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>,  Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley
 <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Viresh
 Kumar <viresh.kumar@linaro.org>, Frank Rowand <frowand.list@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,  linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-pm@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, Bartosz Golaszewski
	 <brgl@bgdev.pl>, Sean Anderson <sean.anderson@seco.com>
Date: Wed, 21 Feb 2024 12:14:51 +0100
In-Reply-To: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: R6UVJE5YHLNUDVZJFFX5IX4KVORWZCYD
X-Message-ID-Hash: R6UVJE5YHLNUDVZJFFX5IX4KVORWZCYD
X-MailFrom: p.zabel@pengutronix.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6UVJE5YHLNUDVZJFFX5IX4KVORWZCYD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Jan 2024 12:52:10 +0100, Krzysztof Kozlowski wrote:
> Dependencies / Merging
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. Depends on !GPIOLIB stub:
>    https://lore.kernel.org/all/20240125081601.118051-3-krzysztof.kozlowsk=
i@linaro.org/
>=20
> 2. Patch #2 (cpufreq: do not open-code of_phandle_args_equal()) and patch=
 #4
>    (reset: Instantiate reset GPIO controller for shared reset-gpios) depe=
nd on OF
>    change (patch #1).
>=20
> [...]

Applied patches 1-4 to reset/next, thanks!

[1/6] of: Add of_phandle_args_equal() helper
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D26ea8511c849
[2/6] cpufreq: do not open-code of_phandle_args_equal()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D0f28982835c2
[3/6] reset: gpio: Add GPIO-based reset controller
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dcee544a40e44
[4/6] reset: Instantiate reset GPIO controller for shared reset-gpios
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3Dc721f189e89c

regards
Philipp


