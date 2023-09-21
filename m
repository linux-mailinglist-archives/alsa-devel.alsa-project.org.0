Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCA77A94BC
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:25:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79136E86;
	Thu, 21 Sep 2023 15:25:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79136E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302757;
	bh=k+VkgCyYluhse4witHXmjVNtCCL59oR5Q2xpPkznbkI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o1UWW1XCu8Yqie4u+SFEMnWqkrMEsuQAKmr6h+768+i8fsZIulhwL1MYsgMuxOwS8
	 FAGDrKZgmQJD7yCLcVDFnVAQwiveLCQRGahUd9Mo+lAIfW2MI3Uc3E72m+gkirXL7u
	 YvxcsOtfl74qW9/rBH0NkV6glzzq3RF4gkqp8620=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FADBF805F8; Thu, 21 Sep 2023 15:23:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 587E3F80563;
	Thu, 21 Sep 2023 15:23:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83215F8025A; Wed, 20 Sep 2023 16:52:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.andi.de1.cc (mail.andi.de1.cc
 [IPv6:2a02:c205:3004:2154::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 536DFF800AA
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 16:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 536DFF800AA
Received: from pd9e2f2b6.dip0.t-ipconnect.de ([217.226.242.182] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1qiyYh-0040UG-5J; Wed, 20 Sep 2023 16:52:06 +0200
Date: Wed, 20 Sep 2023 16:52:04 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
Cc: =?UTF-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>,
 bcousson@baylibre.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 jarkko.nikula@bitmer.com, dmitry.torokhov@gmail.com,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] ASoC: ti: omap-mcbsp: Ignore errors for getting
 fck_src
Message-ID: <20230920165204.0fbc0ff3@aktux>
In-Reply-To: <20230920063353.GQ5285@atomide.com>
References: <20230705190324.355282-1-andreas@kemnade.info>
	<20230705190324.355282-2-andreas@kemnade.info>
	<7d58d52d-2087-45af-b29e-2515b63ead13@gmail.com>
	<20230920063353.GQ5285@atomide.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: andreas@kemnade.info
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7ZRKNLW2B4SLBYBKNEAZ5X4YBQO65RG4
X-Message-ID-Hash: 7ZRKNLW2B4SLBYBKNEAZ5X4YBQO65RG4
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:22:53 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ZRKNLW2B4SLBYBKNEAZ5X4YBQO65RG4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Wed, 20 Sep 2023 09:33:53 +0300
Tony Lindgren <tony@atomide.com> wrote:

> Hi,
>=20
> * P=C3=A9ter Ujfalusi <peter.ujfalusi@gmail.com> [230919 18:25]:
> >=20
> >=20
> > On 7/5/23 22:03, Andreas Kemnade wrote: =20
> > > Commit 349355ce3a05 ("ARM: OMAP2+: Drop legacy platform data for omap=
4 mcbsp")
> > > dropped prcm_fck for omap4, =20
>=20
> The prcm_fck should be there in the dts for each mcbsp interconnect targe
> module as "fck" alias and get's enabled/disabled when the mcbsp driver
> calls runtime PM.
>=20
> So maybe the description should explain that things broke as the aliases
> for prcm_fck and pad_ck no longer get added.
>=20
> > it also dropped the pad_fck for that matter. =20
>=20
> OK so an alias is needed for that too.
>=20
> That's the MCPDM_CLKCTRL pad_clks_ck alias, right? Seems like the
> pad_clks_ck should be claimed by the mcpdm and mcbsp drivers if they are
> used? I guess it would be for some external device use case?
>=20
> > > so the clk_src might not be >available making the
> > > clk_get(src) fail. =20
> >=20
> > Wow, so OMAP4 audio is pretty broken if would ever need to select FCLK?
> > By default we don't on OMAP4, but this is astonishing. =20
>=20
> So sounds like we just got lucky because of -ENOSUCHUSERS? The mcbsp works
> for me, not sure how come I'm not seeing this issue, does it now only work
> for the default clock source?
>=20
Well, I did not run into any problems (besides of no sound output)
as long as I tried to use the codec side as bitclock/frameclock-master and
that is what droid4 does...

Regards,
Andreas
