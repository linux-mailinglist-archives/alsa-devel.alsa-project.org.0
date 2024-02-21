Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EF585D6D1
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 12:27:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FD7811C;
	Wed, 21 Feb 2024 12:27:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FD7811C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708514841;
	bh=0b8SeCdjbW0gI8qK6TzdaaI5mEtgC9wamMalUHNEG2o=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ucDKfminaqMok+6fFQhEhKfC1tP6Yt+Nf2HqPRvHSZxogoRs7b2rxqpAdLy8R3Osb
	 k2iWd9BFsIm0B9l0khUGNVpS7uo5cIEwEtSbv7hc2aRUPfCVYN7GKl0ruy1xihTByz
	 7cc4d81JBSXf9knVvIo1PhiHfZ5+GO5SJCBhUaeg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10886F80104; Wed, 21 Feb 2024 12:26:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37E09F80578;
	Wed, 21 Feb 2024 12:26:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EB5EF80496; Wed, 21 Feb 2024 12:26:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84E23F80104
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 12:26:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84E23F80104
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckk2-0008Rw-D4; Wed, 21 Feb 2024 12:26:22 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckjz-0021oc-6E; Wed, 21 Feb 2024 12:26:19 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rckjz-0005aF-0M;
	Wed, 21 Feb 2024 12:26:19 +0100
Message-ID: <38fda6619769da7240517982adfe734cb653ff5e.camel@pengutronix.de>
Subject: Re: [PATCH v6 0/6] reset: gpio: ASoC: shared GPIO resets
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>,  "Rafael J. Wysocki" <rafael@kernel.org>, Viresh
 Kumar <viresh.kumar@linaro.org>, Frank Rowand <frowand.list@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Anderson <sean.anderson@seco.com>
Date: Wed, 21 Feb 2024 12:26:19 +0100
In-Reply-To: <7ae0567d-e5d3-4e00-98f7-5139d5879f75@linaro.org>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
	 <7ae0567d-e5d3-4e00-98f7-5139d5879f75@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: Y4NQXIFSLNHZAHL2NGDMTSRWLG2FJGJS
X-Message-ID-Hash: Y4NQXIFSLNHZAHL2NGDMTSRWLG2FJGJS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4NQXIFSLNHZAHL2NGDMTSRWLG2FJGJS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Krzysztof,

On Mi, 2024-02-21 at 10:44 +0100, Krzysztof Kozlowski wrote:
> On 29/01/2024 12:52, Krzysztof Kozlowski wrote:
> > Hi,
> >=20
> > Dependencies / Merging
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > 1. Depends on !GPIOLIB stub:
> >    https://lore.kernel.org/all/20240125081601.118051-3-krzysztof.kozlow=
ski@linaro.org/
> >=20
> > 2. Patch #2 (cpufreq: do not open-code of_phandle_args_equal()) and pat=
ch #4
> >    (reset: Instantiate reset GPIO controller for shared reset-gpios) de=
pend on OF
> >    change (patch #1).
>=20
>=20
> Hi Philipp,
>=20
> I got acks from GPIO folks. The also provided stable tag with dependency:
> https://lore.kernel.org/all/20240213101000.16700-1-brgl@bgdev.pl/
> (which BTW already is in mainline, so you could just merge Linus' tree
> into your next branch)

Thanks.

> Can you take entire patchset?

I've picked up 1-4. Patches 5-6 can go independently via ASoC, right?

regards
Philipp
