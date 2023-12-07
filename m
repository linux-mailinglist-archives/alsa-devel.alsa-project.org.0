Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE84480922D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 21:20:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01FE785D;
	Thu,  7 Dec 2023 21:20:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01FE785D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701980440;
	bh=bDTHypQCUWMPwBjq9lbU9JKAAouoTOHpo5bspOQwi4M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J0H4Kfid8UhBg4tPbp1G6PSznFdoQNr1IPx+f2LVfCoSfckUrsydYtqhzyX3HHLz5
	 V73ssAYH+KnHQOAF5EO25lQoEcoOEnBoypwdRzHRZHBR68ov//Ex3fRKBcuILBcGgI
	 7HL3AuLTcPLPbrPs3mSSykF8gmxDRyx18RHJO60c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA6FCF80567; Thu,  7 Dec 2023 21:20:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97D3BF80578;
	Thu,  7 Dec 2023 21:20:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A754F8024E; Thu,  7 Dec 2023 21:19:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id A9968F800D2
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 21:19:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9968F800D2
Received: from [192.168.2.4] (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000070A5A.00000000657228D7.0011AE34;
 Thu, 07 Dec 2023 21:19:35 +0100
Message-ID: <47097f19398808b64f4cc87c2a3c7cc462fb2416.camel@irl.hu>
Subject: Re: [PATCH 03/16] ASoC: tas2781: disable regmap regcache
From: Gergo Koteles <soyer@irl.hu>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Thu, 07 Dec 2023 21:19:34 +0100
In-Reply-To: <0b836c10-b21b-4275-8dd0-254dd5467497@sirena.org.uk>
References: <cover.1701906455.git.soyer@irl.hu>
	 <21a183b5a08cb23b193af78d4b1114cc59419272.1701906455.git.soyer@irl.hu>
	 <0b836c10-b21b-4275-8dd0-254dd5467497@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: I4NLKPKVOQEBOII4C6OT2I7WL4RMUELG
X-Message-ID-Hash: I4NLKPKVOQEBOII4C6OT2I7WL4RMUELG
X-MailFrom: soyer@irl.hu
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I4NLKPKVOQEBOII4C6OT2I7WL4RMUELG/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 2023-12-07 at 18:20 +0000, Mark Brown wrote:
> On Thu, Dec 07, 2023 at 12:59:44AM +0100, Gergo Koteles wrote:
>=20
> > The amp has 3 level addressing (BOOK, PAGE, REG).
> > The regcache couldn't handle it.
>=20
> So the books aren't currently used so the driver actually works?
>=20
It writes to the book 0 and 8c. The initialization works with regcache,
because it writes also the i2c devices.

> >  static int tas2781_system_suspend(struct device *dev)
> > @@ -770,10 +758,7 @@ static int tas2781_system_suspend(struct device *d=
ev)
> >  		return ret;
> > =20
> >  	/* Shutdown chip before system suspend */
> > -	regcache_cache_only(tas_priv->regmap, false);
> >  	tasdevice_tuning_switch(tas_priv, 1);
> > -	regcache_cache_only(tas_priv->regmap, true);
> > -	regcache_mark_dirty(tas_priv->regmap);
> > =20
> >  	/*
> >  	 * Reset GPIO may be shared, so cannot reset here.
>=20
> How can this work over system suspend?  This just removes the cache with
> no replacement so if the device looses power over suspend (which seems
> likely) then all the register state will be lost.  A similar issue may
> potentially exist over runtime suspend on an ACPI system with
> sufficiently heavily optimised power management.

In runtime_resume, only one of the two amplifiers goes back.
The runtime_suspend sets the current book/prog/conf to -1 on all
devices, and tas2781_hda_playback_hook will restore the
program/configuration/profile with tasdevice_tuning_switch.

And only one, because tasdevice_change_chn_book directly changes the
address of i2c_client, so the unlucky one gets invalid values in its
actual book from regcache_sync.

system_restore doesn't work at all, because regcache_cache_only stays
true since system_suspend.

It works without the regcache functions.


