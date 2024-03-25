Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEBE88B515
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 00:14:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 272E62369;
	Tue, 26 Mar 2024 00:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 272E62369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711408469;
	bh=Mrh9SPT/w9jyav9m5OpYx1ZRCZOxPVd30OC7EfnHLQ4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tM3cD4IDJEjGuI9q1zC+YuTumKooz2ThJUO4zBdGKaWi686LsUcpxGqtpmNS7imDV
	 +mK3hhm7QV+dq9JpjFPCG28sty1zGiw1HuR2uk4zjIuKQUBr+m1RTZO66uEWXZM3y2
	 uN+jevHT9QCDJUcbRCMWO8dSBWEALzbxV/zdfxGU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 342E2F8059F; Tue, 26 Mar 2024 00:13:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70DF4F8059F;
	Tue, 26 Mar 2024 00:13:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB8B5F80236; Tue, 26 Mar 2024 00:13:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 3585AF801D5
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 00:13:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3585AF801D5
Received: from [192.168.2.4] (51b68717.dsl.pool.telekom.hu
 [::ffff:81.182.135.23])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000077165.0000000066020525.0023AE94;
 Tue, 26 Mar 2024 00:13:41 +0100
Message-ID: <e5a06991c5540219366db84ce4e820e22a939929.camel@irl.hu>
Subject: Re: [PATCH 3/3] ALSA: hda/tas2781: add debug statements to kcontrols
From: Gergo Koteles <soyer@irl.hu>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
  Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>,
  Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org
Date: Tue, 26 Mar 2024 00:13:40 +0100
In-Reply-To: <377e0f33-697c-4baf-ac48-baff6199dd53@linux.intel.com>
References: <cover.1711401621.git.soyer@irl.hu>
	 <cbdc337b911bee0f80f805b936041fd59c1db54a.1711401621.git.soyer@irl.hu>
	 <377e0f33-697c-4baf-ac48-baff6199dd53@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
Message-ID-Hash: RNNCVZURX3QDZH4GIEF3AD2MLSJ45CNX
X-Message-ID-Hash: RNNCVZURX3QDZH4GIEF3AD2MLSJ45CNX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RNNCVZURX3QDZH4GIEF3AD2MLSJ45CNX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Pierre-Louis,

On Mon, 2024-03-25 at 17:01 -0500, Pierre-Louis Bossart wrote:
>=20
>=20
> > +++ b/sound/pci/hda/tas2781_hda_i2c.c
> > @@ -189,6 +189,9 @@ static int tasdevice_get_profile_id(struct snd_kcon=
trol *kcontrol,
> > =20
> >  	ucontrol->value.integer.value[0] =3D tas_priv->rcabin.profile_cfg_id;
> > =20
> > +	dev_dbg(tas_priv->dev, "%s: %d\n", __func__,
>=20
> Nit-pick: you don't need to add __func__ to dev_dbg logs, the user can
> add the information with the dyndbg parameter, e.g.
>=20
> options snd_intel_dspcfg dyndbg=3D+pmf
>=20
> dev_err/warn don't have this functionality though so in those cases
> there's no replacement for __func__
>=20

Thanks. I just put a #define DEBUG into the first line and rebuilt the
module. It will be faster this way :)

I will send a v2.


Regards,
Gergo

