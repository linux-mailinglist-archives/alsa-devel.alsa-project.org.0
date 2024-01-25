Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8078083BDAF
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 10:45:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D91CB3E8;
	Thu, 25 Jan 2024 10:45:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D91CB3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706175920;
	bh=NO+cYd0QNeHPKrWW+ljDppiytbZEHXhjbmaRFrtMguc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tZDPfSveeQVnuktWFNKtZ6AsFzBG3blyLYY8YrRJfb/D50iUTb/hG1kMVnE5tTTi1
	 rxhsUJ3O39Sd/d5U1pxsmHOPFEBL01L686+WhIAwPpKvUHO4igQD7h11CA3Eq090Jl
	 clTjcO1lc9fQNYcUxYSj/ajUxpryZPtdYnb3SGsg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A7E0F805AD; Thu, 25 Jan 2024 10:44:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23C3CF80564;
	Thu, 25 Jan 2024 10:44:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36179F8028D; Thu, 25 Jan 2024 10:43:32 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BF7EDF80149
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 10:43:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF7EDF80149
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSwGI-0002Fp-20; Thu, 25 Jan 2024 10:43:06 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSwGF-002Fm4-V4; Thu, 25 Jan 2024 10:43:03 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSwGF-0003hB-2q;
	Thu, 25 Jan 2024 10:43:03 +0100
Message-ID: <88b75ffea33078d092ffa15e3be235358f576c8d.camel@pengutronix.de>
Subject: Re: [PATCH v5 1/6] of: Add of_phandle_args_equal() helper
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami
 <bgoswami@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org,  linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-pm@vger.kernel.org
Date: Thu, 25 Jan 2024 10:43:03 +0100
In-Reply-To: <20240124220716.GA2454626-robh@kernel.org>
References: <20240124074527.48869-1-krzysztof.kozlowski@linaro.org>
	 <20240124074527.48869-2-krzysztof.kozlowski@linaro.org>
	 <20240124220716.GA2454626-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: ZKUMOJ3G4UEP75KDGU3UAGYYZIYRTVYJ
X-Message-ID-Hash: ZKUMOJ3G4UEP75KDGU3UAGYYZIYRTVYJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZKUMOJ3G4UEP75KDGU3UAGYYZIYRTVYJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mi, 2024-01-24 at 16:07 -0600, Rob Herring wrote:
> On Wed, Jan 24, 2024 at 08:45:22AM +0100, Krzysztof Kozlowski wrote:
> > Add a helper comparing two "struct of_phandle_args" to avoid
> > reinventing the wheel.
> >=20
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >=20
> > Dependency of cpufreq and reset change.
> > ---
> >  include/linux/of.h | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
>=20
> Acked-by: Rob Herring <robh@kernel.org>
>=20
> I've wanted to write this series for some time. Great work.

How would you prefer this to be merged? Stable tag from the devicetree
tree? Go through the reset tree as part of this series?

regards
Philipp
