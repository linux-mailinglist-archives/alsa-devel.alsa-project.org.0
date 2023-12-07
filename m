Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7538F80932C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 22:13:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 023F9204;
	Thu,  7 Dec 2023 22:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 023F9204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701983584;
	bh=q6Ykbq3nWoNBPSh83megVHyqJWoRgU6FmX/1DLBp2s4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KcYdWXF+6+Ah6I6zy1XF3Nq3QPWJCwFYd82ENMDOImETJGQP4AiUdjRLa8NgZNKHb
	 vJt3G8S6KaQ3seoZUeOzAdi0sNofUO8896voAU2qbgcelTQ//yHvqB4Dz0Z8SYYd7Z
	 9iwayOe7+fdEHAXaVM1QvJkt7xQpxpBVNU+Z09kU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E241F80580; Thu,  7 Dec 2023 22:12:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 43BADF8055A;
	Thu,  7 Dec 2023 22:12:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA02CF80166; Thu,  7 Dec 2023 22:12:24 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 63423F800AC
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 22:12:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63423F800AC
Received: from [192.168.2.4] (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000718A4.000000006572352F.0011AF64;
 Thu, 07 Dec 2023 22:12:15 +0100
Message-ID: <b0ab21657f2e4f0825579de97ca012e294d1e743.camel@irl.hu>
Subject: Re: [PATCH 03/16] ASoC: tas2781: disable regmap regcache
From: Gergo Koteles <soyer@irl.hu>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Thu, 07 Dec 2023 22:12:13 +0100
In-Reply-To: <5f3f0306-799f-4f3b-9e05-fbd300c59d5d@sirena.org.uk>
References: <cover.1701906455.git.soyer@irl.hu>
	 <21a183b5a08cb23b193af78d4b1114cc59419272.1701906455.git.soyer@irl.hu>
	 <0b836c10-b21b-4275-8dd0-254dd5467497@sirena.org.uk>
	 <47097f19398808b64f4cc87c2a3c7cc462fb2416.camel@irl.hu>
	 <5f3f0306-799f-4f3b-9e05-fbd300c59d5d@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: S3JYTKYGMX4EHRDTUR36IRVDNOFVH2TM
X-Message-ID-Hash: S3JYTKYGMX4EHRDTUR36IRVDNOFVH2TM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S3JYTKYGMX4EHRDTUR36IRVDNOFVH2TM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 2023-12-07 at 20:36 +0000, Mark Brown wrote:
> On Thu, Dec 07, 2023 at 09:19:34PM +0100, Gergo Koteles wrote:
> > On Thu, 2023-12-07 at 18:20 +0000, Mark Brown wrote:
> > > On Thu, Dec 07, 2023 at 12:59:44AM +0100, Gergo Koteles wrote:
>=20
> > > > The amp has 3 level addressing (BOOK, PAGE, REG).
> > > > The regcache couldn't handle it.
>=20
> > > So the books aren't currently used so the driver actually works?
>=20
> > It writes to the book 0 and 8c. The initialization works with regcache,
> > because it writes also the i2c devices.
>=20
> I can't see any references to 0x8c in the driver?

The firmware has different programs. The programs have blocks, that the
driver writes to the amplifier. The address comes from the blocks.

>=20
> > > >  static int tas2781_system_suspend(struct device *dev)
> > > > @@ -770,10 +758,7 @@ static int tas2781_system_suspend(struct devic=
e *dev)
> > > >  		return ret;
> > > > =20
> > > >  	/* Shutdown chip before system suspend */
> > > > -	regcache_cache_only(tas_priv->regmap, false);
> > > >  	tasdevice_tuning_switch(tas_priv, 1);
> > > > -	regcache_cache_only(tas_priv->regmap, true);
> > > > -	regcache_mark_dirty(tas_priv->regmap);
>=20
> > > How can this work over system suspend?  This just removes the cache w=
ith
> > > no replacement so if the device looses power over suspend (which seem=
s
> > > likely) then all the register state will be lost.  A similar issue ma=
y
> > > potentially exist over runtime suspend on an ACPI system with
> > > sufficiently heavily optimised power management.
>=20
> > In runtime_resume, only one of the two amplifiers goes back.
> > The runtime_suspend sets the current book/prog/conf to -1 on all
> > devices, and tas2781_hda_playback_hook will restore the
> > program/configuration/profile with tasdevice_tuning_switch.
>=20
> What does "go back" mean? =20

Sorry for imprecise wording. The speaker is silent, I didn't checked
why, maybe the amp is in error state or something.

>=20
> > And only one, because tasdevice_change_chn_book directly changes the
> > address of i2c_client, so the unlucky one gets invalid values in its
> > actual book from regcache_sync.
>=20
> The code creates the impression that writing to one tas2781 writes to
> all of them, is that not the case?
>=20
Yes, the tasdevice_* functions, but the regcache_sync doesn't know
this.

> > system_restore doesn't work at all, because regcache_cache_only stays
> > true since system_suspend.
>=20
> Presumably the next runtime resume would make the device writable again?
>=20
Yes, then one of the speakers works.

> > It works without the regcache functions.
>=20
> How would the devices get their configuration restored?
>=20
tasdevice_tuning_switch calls tasdevice_select_tuningprm_cfg which
checks whether the devices needs a new program or configuration.

the runtime_suspend and system resume set the devices cur_prog,
cur_conf to -1.

for (i =3D 0; i < tas_hda->priv->ndev; i++) {
	tas_hda->priv->tasdevice[i].cur_book =3D -1;
	tas_hda->priv->tasdevice[i].cur_prog =3D -1;
	tas_hda->priv->tasdevice[i].cur_conf =3D -1;
}

And the tasdevice_select_tuningprm_cfg checks with=20
if (tas_priv->tasdevice[i].cur_prog !=3D prm_no ...

If needed, it writes the new program/configuration to the device.

The tas2781_hda_playback_hook calls the tasdevice_tuning_switch


> This sounds very much like a case of something working for your specific
> system in your specific test through some external factor rather than
> working by design, whatever problems might exist it seems fairly obvious
> to inspection that this patch would make things worse for other systems.
>=20
> At a minimum this patch needs a much clearer changelog (all the patches
> I looked at could use clearer changelogs) which explains what's going on
> here, I would really expect to see something that replaces the use of
> the cache sync to restore the device state for example.

