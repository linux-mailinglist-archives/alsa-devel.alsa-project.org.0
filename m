Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E637480B5DE
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Dec 2023 19:21:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30A2E868;
	Sat,  9 Dec 2023 19:21:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30A2E868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702146104;
	bh=eKEpdEU63/3uv0Q3IEafkqXJ5axT9S3FiAkdrIZbHZE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K6o3MboXwPKghO3bK92dcRvwBZGxS2iaqcU+9JY+7f6PVbB5/ABa3du7SNwTbmN2l
	 cxXjSMKbWSnnzIX7DvSaxWAMM10fren/eeO9RjIsKs01gOSx4oj8LnqasOLi7GUHFR
	 XGznrYxu2ar8zhv6OShnLXL0LQHLUYoRUPzjqn84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF52CF80578; Sat,  9 Dec 2023 19:21:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08BF3F80570;
	Sat,  9 Dec 2023 19:21:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E77AEF8024E; Sat,  9 Dec 2023 19:21:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 5B0E2F800AC
	for <alsa-devel@alsa-project.org>; Sat,  9 Dec 2023 19:20:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B0E2F800AC
Received: from [192.168.2.4] (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000006FA9A.000000006574B003.0011E711;
 Sat, 09 Dec 2023 19:20:51 +0100
Message-ID: <4fccb5ae252ff8efd8b5e760b4a6852ff76c99b5.camel@irl.hu>
Subject: Re: [PATCH 11/16] ASoC: tas2781: use 0 as default prog/conf index
From: Gergo Koteles <soyer@irl.hu>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
  linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Sat, 09 Dec 2023 19:20:50 +0100
In-Reply-To: <a07270d1-ef63-4558-83aa-223b97b1a93e@sirena.org.uk>
References: <cover.1701906455.git.soyer@irl.hu>
	 <88229933b7aaf0777cbe611979712e4e144b1ca1.1701906455.git.soyer@irl.hu>
	 <a07270d1-ef63-4558-83aa-223b97b1a93e@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: IEL6HSKV4GKUXYH7LRA5Y2VVAAZGS2CJ
X-Message-ID-Hash: IEL6HSKV4GKUXYH7LRA5Y2VVAAZGS2CJ
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

On Thu, 2023-12-07 at 18:28 +0000, Mark Brown wrote:
> On Thu, Dec 07, 2023 at 01:04:27AM +0100, Gergo Koteles wrote:
>=20
> > Invalid indexes are not the best default values.
>=20
> I'm guessing this is just fallout from the previous (not really
> explained patch)?  Is there perhaps some bootstrapping issue here with
> ensuring that the program and configuration get written to the device if
> the user doesn't explicitly select something in a control?

I added the >0 checks because I encountered a NULL pointer dereference.

Because
tasdevice_init sets
tas_priv->cur_prog =3D -1
tas_priv->cur_conf =3D -1

tasdev_fw_ready calls tasdevice_prmg_load(tas_priv, 0) which sets
tasdevice[i]->prg_no =3D 0

Then the playback hook calls
tasdevice_tuning_switch(tas_hda->priv, 0)
tasdevice_select_tuningprm_cfg(tas_priv, cur_prog (-1), cur_conf (-1),
profile_cfg_id (0));

tasdevice_select_tuningprm_cfg checks
if (tas_priv->tasdevice[i].cur_prog (0) !=3D prm_no (-1)
and tries to load the program from
program =3D &(tas_fmw->programs[prm_no (-1)]);
tasdevice_load_data(tas_priv, &(program->dev_data));

I think the intention was to load the first program, first
configuration, first profile. And that's the safe thing to do.
So I expressed that with this commit.

Yes, I need to write much better commit messages.

