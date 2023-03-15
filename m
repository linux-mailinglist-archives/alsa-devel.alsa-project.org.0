Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E086BB9F8
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 17:38:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 340FD1377;
	Wed, 15 Mar 2023 17:38:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 340FD1377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678898332;
	bh=WOnw9hwRxezQgwRqhh/+C/uSJgsDJOWotbDuYc7M2hQ=;
	h=Subject:From:To:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WJm1x7Jm3G8Bv7cxFAoRkfq91GsAIqUYYhNYphQYtLYggjEdjW9fEJCq5SVN3Sr+z
	 j3vtxBrbmIOFKrPp6FP/Vp2Tv7WPlObeFTBmpphb2oH1GNQGVqnSbhMFkr5sqEg9Nl
	 MpBUjTbODlDrKcvznAyohDyxW41SHmfK/Sm+FE9s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47CEFF8032D;
	Wed, 15 Mar 2023 17:38:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76D38F80423; Wed, 15 Mar 2023 17:37:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C73CF80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 17:37:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C73CF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qkmBc83Q
Received: by mail-ed1-x52b.google.com with SMTP id eg48so18672733edb.13
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 09:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678898269;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WOnw9hwRxezQgwRqhh/+C/uSJgsDJOWotbDuYc7M2hQ=;
        b=qkmBc83QSakMEuIrxnRx7Pfjy4BfeMQEVRCiWG4G9GPVMG3AMUP2f2O9KIZlfECKIJ
         e5uDf7fcZY2xaSzAb9sAFPgCj6CfrOpV9fyqPcmFRoMsctA4PQiMDlIXcYhTIzc3Lfn4
         BjyWpQl2mQ0i1u+rtz53ZPQAxHVL6AChA+Cx3JCVp1xpjspmbQH5AJ34xQ4KrIIJu1uc
         fWbZUfYJJghPOGj4JoZl+I1vc5Yg8Ia726cm9mEWLq2IeTmHbnik3saIl3BF4A9oU+vC
         S/44QR32HGoF/Jqn4V2s8WtvKUqQrpESZgr1RJnmHtAh7eojGTr8rdbpJrvauKAXybzE
         126Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678898269;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WOnw9hwRxezQgwRqhh/+C/uSJgsDJOWotbDuYc7M2hQ=;
        b=BYBvouyI6KF4qZ8w5z2mod4TXweVA1q1vAlh0gcAH0OGvpdEgBt48f/lpFvBLyWgy3
         jr1LWT2NPLrh+QJTs2fd+BoZW2kMHZtwKuRbYp1r66qdQ12mW5sIihjzipUb7SBxJCKv
         9zSGOKJQkfq9uDnKCl1mbBSYV52mCdDIshA56YDgYYFF6QGziYeSOwCS32GyYICnNKL0
         i5GGjk+sLQEdECwGw01aL+xg2Cd6PTjghOk3G7AV70i+3xaV3idVstKCYxpQWbKpOuya
         GXWpnlsXy5llYreAD9IZ/effhNR/VL2sIm916dw8+ivJEK5+ClrzcohlZNxvmHEz8qkM
         gtNQ==
X-Gm-Message-State: AO0yUKXc3V71aP+OS9BuyUTiT/197thTg1yvVXd2Ok6gY4U55KJC6HSo
	kpOvkdohagL3D1M8cDaI21I=
X-Google-Smtp-Source: 
 AK7set8SyzUrwbHAizwhtmEn8txvr1M2ztb8exEoL775BqZVDoByDSbHytil1JKh00nDEm9CmVuKzA==
X-Received: by 2002:aa7:db98:0:b0:4ac:d2b4:ec2c with SMTP id
 u24-20020aa7db98000000b004acd2b4ec2cmr3400379edt.29.1678898269162;
        Wed, 15 Mar 2023 09:37:49 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id
 ss10-20020a170907038a00b008e36f9b2308sm2798706ejb.43.2023.03.15.09.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 09:37:48 -0700 (PDT)
Message-ID: <e317e0fdd94bdefa76cdc75d23c80062a955d3b7.camel@gmail.com>
Subject: Re: [PATCH 041/173] ASoC: cirrus: ep93xx-i2s: Convert to platform
 remove callback returning void
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>, Charles
 Keepax <ckeepax@opensource.cirrus.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>
Date: Wed, 15 Mar 2023 17:37:48 +0100
In-Reply-To: <20230315150745.67084-42-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
	 <20230315150745.67084-42-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
Message-ID-Hash: MEQJBDP2FJRXT4KKJK4HYIXXOXHLDTWN
X-Message-ID-Hash: MEQJBDP2FJRXT4KKJK4HYIXXOXHLDTWN
X-MailFrom: alexander.sverdlin@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MEQJBDP2FJRXT4KKJK4HYIXXOXHLDTWN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Uwe,

On Wed, 2023-03-15 at 16:05 +0100, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de

LGTM,
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> >
> ---
> =C2=A0sound/soc/cirrus/ep93xx-i2s.c | 5 ++---
> =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.=
c
> index 70840f27d4a7..9760453d9d79 100644
> --- a/sound/soc/cirrus/ep93xx-i2s.c
> +++ b/sound/soc/cirrus/ep93xx-i2s.c
> @@ -495,19 +495,18 @@ static int ep93xx_i2s_probe(struct platform_device =
*pdev)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return err;
> =C2=A0}
> =C2=A0
> -static int ep93xx_i2s_remove(struct platform_device *pdev)
> +static void ep93xx_i2s_remove(struct platform_device *pdev)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct ep93xx_i2s_info *i=
nfo =3D dev_get_drvdata(&pdev->dev);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_put(info->lrclk);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_put(info->sclk);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0clk_put(info->mclk);
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static struct platform_driver ep93xx_i2s_driver =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.probe=C2=A0=C2=A0=3D ep9=
3xx_i2s_probe,
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove=C2=A0=3D ep93xx_i2s_re=
move,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.remove_new =3D ep93xx_i2s_rem=
ove,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0.driver=C2=A0=3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0.name=C2=A0=C2=A0=C2=A0=3D "ep93xx-i2s",
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0},

--=20
Alexander Sverdlin.

