Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03903805A9B
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 18:00:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D89782B;
	Tue,  5 Dec 2023 18:00:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D89782B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701795638;
	bh=RMbrascy7qFb8ahGeX/qqY/DHiuHp986+6NoGJLPpx0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ARlNrKgbvLXUINhucRhUyVRS5TR4gazkHG/jyOldvGyRWgoBnRDAPKzsHQqV0BFe7
	 uRMjx5/iY5PwMuLHXf614XXkWcxyG52ZcvQnRSCm/szKmmSmNPSwcZAojSAIBP+axc
	 2RcL7ttq0Y6rBZmEUkyTtDwc6FNRGcW0rfbK2KEI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F65DF80571; Tue,  5 Dec 2023 18:00:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02AA6F8028D;
	Tue,  5 Dec 2023 18:00:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93D9CF8024E; Tue,  5 Dec 2023 18:00:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 63957F800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 17:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63957F800AC
Received: from [192.168.2.4] (51b68398.dsl.pool.telekom.hu
 [::ffff:81.182.131.152])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000071509.00000000656F5709.00116505;
 Tue, 05 Dec 2023 17:59:52 +0100
Message-ID: <9c3846ae0da417c0fe5d4fa2d9d4134143184dda.camel@irl.hu>
Subject: Re: [PATCH 2/2] ALSA: hda/tas2563: Add tas2563 HDA driver
From: Gergo Koteles <soyer@irl.hu>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
  Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Tue, 05 Dec 2023 17:59:52 +0100
In-Reply-To: <a530e70a-2491-4270-b582-cd493d1512b1@linux.intel.com>
References: <cover.1701733441.git.soyer@irl.hu>
	 <4a2f31d4eb8479789ceb1daf2e93ec0e25c23171.1701733441.git.soyer@irl.hu>
	 <90765ee0-a814-4852-9b2a-020cda98d930@linux.intel.com>
	 <974d41f6c703d9b65ebcd75a2c659cecf13bd877.camel@irl.hu>
	 <a530e70a-2491-4270-b582-cd493d1512b1@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: I6C35LDK2ZKMZ37G7CEPLLD4WXHOCQDI
X-Message-ID-Hash: I6C35LDK2ZKMZ37G7CEPLLD4WXHOCQDI
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 2023-12-05 at 10:01 -0600, Pierre-Louis Bossart wrote:
> > > > +
> > > > +static void tas2563_fixup_i2c(struct hda_codec *cdc,
> > > > +	const struct hda_fixup *fix, int action)
> > > > +{
> > > > +	 tas2xxx_generic_fixup(cdc, action, "i2c", "INT8866");
> > >=20
> > > Any specific reason to use an Intel ACPI identifier? Why not use
> > > "TIAS2563" ?
> > >=20
> > INT8866 is in the ACPI.
> > I don't know why Lenovo uses this name.
> > I think it's more internal than intel.
> >=20
> > =C2=A0=C2=A0=C2=A0Scope (_SB.I2CD)
> > =C2=A0=C2=A0=C2=A0=C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Device (TAS)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Name (_HID, "INT8866")  // _HID: Hardware ID
>=20
> Ouch, I hope they checked with Intel that this isn't an HID already in
> use...
>=20
It looks the INT prefix is not reserved. (yet)
https://uefi.org/ACPI_ID_List?acpi_search=3DINT

> >=20
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static const struct dev_pm_ops tas2563_hda_pm_ops =3D {
> > > > +	SYSTEM_SLEEP_PM_OPS(tas2563_system_suspend, tas2563_system_resume=
)
> > >=20
> > > where's the pm_runtime stuff?
> > >=20
> >=20
> > The amp stores its state in software shutdown mode.
> > The tas2563_hda_playback_hook wakes/shutdowns the amp, not the
> > pm_runtime.
>=20
> My point was that you have all these pm_runtime_ calls in the code, but
> nothing that provides pm_runtime suspend-resume functions so not sure
> what exactly the result is?
>=20
>=20
I think nothing. I haven't experienced anything unusual recently.



