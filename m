Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D336474224F
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 10:40:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 529D583E;
	Thu, 29 Jun 2023 10:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 529D583E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688028007;
	bh=tD4X4fiN51QEIcu5hPm3ges/MElqJQOTKg3N7NGEXg0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sIY+5KXJR93tozULUnX0qMg91t7b45dEHL8BQJbVtuxaQyN/8kLJm86r1LxXU3T9+
	 cwW/4504d5AbGr1U89GI5CFdxE9dPZF002Wy0eBFBOsT2W09C98k24duOzdNhrnY8e
	 vhpS4NuZ9tACa/9KNooukBjOGlTdXpFn3x/jKxr8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43B4EF80551; Thu, 29 Jun 2023 10:38:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69681F8053B;
	Thu, 29 Jun 2023 10:38:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C761F80169; Thu, 29 Jun 2023 10:38:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69362F800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 10:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69362F800E3
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-86-mCyGUWdvOzqOD0rili5ykg-1; Thu, 29 Jun 2023 09:38:10 +0100
X-MC-Unique: mCyGUWdvOzqOD0rili5ykg-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 29 Jun
 2023 09:38:09 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 29 Jun 2023 09:38:09 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Sameer Pujar' <spujar@nvidia.com>, "broonie@kernel.org"
	<broonie@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>
CC: "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "mkumard@nvidia.com"
	<mkumard@nvidia.com>, "sheetal@nvidia.com" <sheetal@nvidia.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>, Oder Chiou
	<oder_chiou@realtek.com>
Subject: RE: [PATCH v2 3/5] ASoC: rt5640: Fix sleep in atomic context
Thread-Topic: [PATCH v2 3/5] ASoC: rt5640: Fix sleep in atomic context
Thread-Index: AQHZqkh8hA8hSCOxA0KruUap8XcLma+hdFow
Date: Thu, 29 Jun 2023 08:38:09 +0000
Message-ID: <bae9f041867e4625ad293d284566bb4f@AcuMS.aculab.com>
References: <1688015537-31682-1-git-send-email-spujar@nvidia.com>
 <1688015537-31682-4-git-send-email-spujar@nvidia.com>
In-Reply-To: <1688015537-31682-4-git-send-email-spujar@nvidia.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ETW63MSKT5YF352EJML2YD6O465TD6AW
X-Message-ID-Hash: ETW63MSKT5YF352EJML2YD6O465TD6AW
X-MailFrom: david.laight@aculab.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETW63MSKT5YF352EJML2YD6O465TD6AW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Sameer Pujar
> Sent: 29 June 2023 06:12
>=20
> Following prints are observed while testing audio on Jetson AGX Orin whic=
h
> has onboard RT5640 audio codec:
>=20
>   BUG: sleeping function called from invalid context at kernel/workqueue.=
c:3027
>   in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapp=
er/0
>   preempt_count: 10001, expected: 0
>   RCU nest depth: 0, expected: 0
>   ------------[ cut here ]------------
>   WARNING: CPU: 0 PID: 0 at kernel/irq/handle.c:159 __handle_irq_event_pe=
rcpu+0x1e0/0x270
>   ---[ end trace ad1c64905aac14a6 ]-
>=20
> The IRQ handler rt5640_irq() runs in interrupt context and can sleep
> during cancel_delayed_work_sync().
>=20
> Fix this by running IRQ handler, rt5640_irq(), in thread context.
> Hence replace request_irq() calls with devm_request_threaded_irq().

My 'gut feel' is that this will just move the problem elsewhere.

If the ISR is responsible for adding audio buffers (etc) then it is
also not unlikely that the scheduling delays in running a threaded ISR
will cause audio glitches if the system is busy.

>=20
> Fixes: 051dade34695 ("ASoC: rt5640: Fix the wrong state of JD1 and JD2")
> Cc: stable@vger.kernel.org
> Cc: Oder Chiou <oder_chiou@realtek.com>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  sound/soc/codecs/rt5640.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
> index 0ed4fa2..e24ed75 100644
> --- a/sound/soc/codecs/rt5640.c
> +++ b/sound/soc/codecs/rt5640.c
> @@ -2567,9 +2567,10 @@ static void rt5640_enable_jack_detect(struct snd_s=
oc_component *component,
>  =09if (jack_data && jack_data->use_platform_clock)
>  =09=09rt5640->use_platform_clock =3D jack_data->use_platform_clock;
>=20
> -=09ret =3D request_irq(rt5640->irq, rt5640_irq,
> -=09=09=09  IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> -=09=09=09  "rt5640", rt5640);
> +=09ret =3D devm_request_threaded_irq(component->dev, rt5640->irq,
> +=09=09=09=09=09NULL, rt5640_irq,
> +=09=09=09=09=09IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT=
,
> +=09=09=09=09=09"rt5640", rt5640);

You need a comment saying this must be a threaded IRQ because the ISR
calls cancel_delayed_work_sync().

=09David

>  =09if (ret) {
>  =09=09dev_warn(component->dev, "Failed to reguest IRQ %d: %d\n", rt5640-=
>irq, ret);
>  =09=09rt5640_disable_jack_detect(component);
> @@ -2622,8 +2623,9 @@ static void rt5640_enable_hda_jack_detect(
>=20
>  =09rt5640->jack =3D jack;
>=20
> -=09ret =3D request_irq(rt5640->irq, rt5640_irq,
> -=09=09=09  IRQF_TRIGGER_RISING | IRQF_ONESHOT, "rt5640", rt5640);
> +=09ret =3D devm_request_threaded_irq(component->dev, rt5640->irq,
> +=09=09=09=09=09NULL, rt5640_irq, IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +=09=09=09=09=09"rt5640", rt5640);
>  =09if (ret) {
>  =09=09dev_warn(component->dev, "Failed to reguest IRQ %d: %d\n", rt5640-=
>irq, ret);
>  =09=09rt5640->irq =3D -ENXIO;
> --
> 2.7.4

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

