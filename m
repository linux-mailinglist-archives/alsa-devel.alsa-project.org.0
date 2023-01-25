Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A619C67C54C
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 09:00:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09E2282E;
	Thu, 26 Jan 2023 08:59:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09E2282E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674720018;
	bh=mHEpv0px31ERj2OPBlx9fadOzZ3nqEHbDJpCiBMUsv0=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bMO/zxyAv2jBAARX8tgAlY8x7xxpVgpxVdl4CYx80ZZX4hvODE/laaCCWt3AW7CqH
	 yxjC1u7BICgBGeTr8m/i6G1f3rYxheg7ITZlB8AzqDnZzm72rgIb/+NVEa3Zeb0e69
	 cSdOa8K89lZpysnrEqXcNJmiYEtUfREQ/fJKsQ9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13F9DF805C2;
	Thu, 26 Jan 2023 08:55:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36ABFF802E8; Wed, 25 Jan 2023 18:00:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12olkn2038.outbound.protection.outlook.com [40.92.23.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97554F800AE
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 18:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97554F800AE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256
 header.s=selector1 header.b=BoVDlV5e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAzsJIQoJ7TbllUeF5ny6knSjgKPRNKkHqjjjQif3xig+NkRi3U+PkDafuqT/X9DYyoTXzwYbyS4aK5X83CCVbxgKgoV5v2O8qFdrvkVlF99aXTa56PDqBGU1Se3riOYq9NaG10ukGbFjOcOtMaEcyaaclxlZZSV6DCLyPgtx65/6WMVF35iOYrr5jEYRFS07Iv4FnPONWLwyIjuC7X1b3dh+P1u+cTlBiBIqoMC/yptpNITmIxGY2NJoajEU2J/+xQu4yK43hdaZU+QzaZ9yOARbqiuFu3xYODP9duzW7r/e//w1K4D1IyibrEOcKrZ9Dnv+mvlG6QjTHx9oA9GHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxqAzGmkjSAk7Lfz7vp/xqTWJZG/Mi/Quf47p/edwaE=;
 b=LFprY1QVGip/PVaicjcFQyXBLQ0TYGhHo3/hr+1fVtzt4pBl2pnqt8jY1jsiMxsvzNppLszDxhjIH2+fq/hksCMncwmWTgTpR12vpU1X3ALnaGfyPDW0rsoBCctWU34UpgM1O27GI5umsQh39IWRHfxaLEX1o1TFn0MsxGrvasZz9Hk/5ApsTLDyur37qCUhhiJ2GZFWVmYVmVwyAYvNz3PSb1ANhZovOcrJtkbdtkyVNY36mgi6rtccMA9m8xvb0aIlsCaDmsAlfVxwPDmGtd0pma/3oHXnEU6oaDpUOONP0UnxUuyqFBGrGKoz3ptLbrSXTwj8XKRLX2lafSFYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vxqAzGmkjSAk7Lfz7vp/xqTWJZG/Mi/Quf47p/edwaE=;
 b=BoVDlV5e/ozhKZlq1jmx7lU9YpXU/BUz0a5tUsM8RpgV91JcuP6s9hIkaPCfcuH/3uxl0tf2t0mi+YNtsOt04D8RSQvRx4q34V/78x+NoAPBO//tVA6T2YZaIASecutxgAwc+N0d2K/RZ3haj0JFgBSoVFdTObcwankwrQUyebKn91UKUoWmaBatMgTSFCal93qqFLU4fzEySbdHKv2i/yRlUUq433NhhWmeaDGBMzzO70PWAJt7edueGrx3KHNAzGeT0CssBJzAMo0hOnSeXSZjkjl3H8fz69R5l1jm0k1cAz++A1CZ//l/7JvUfwzuZMHCtej+2ssHXTXJkz6+/A==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by MW4PR17MB4604.namprd17.prod.outlook.com (2603:10b6:303:101::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 17:00:08 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::b0f7:cd05:5f4f:5b4]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::b0f7:cd05:5f4f:5b4%5]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 17:00:08 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Thread-Topic: [PATCH] dt-bindings: Add missing
 (unevaluated|additional)Properties on child node schemas
Thread-Index: AQHZMEgIrioCItITZU2shGV9idtdpq6vGdaAgABCgXk=
Date: Wed, 25 Jan 2023 17:00:08 +0000
Message-ID: <MN2PR17MB3375499A91290982CA0B8DD8B8CE9@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <20230124230048.371144-1-robh@kernel.org>
 <CAMRc=MfdDv5teeQx802Qi3otwfXtZ1jAX_bzvH4DQMvdas9YtQ@mail.gmail.com>
In-Reply-To: <CAMRc=MfdDv5teeQx802Qi3otwfXtZ1jAX_bzvH4DQMvdas9YtQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [BjZhtJ5ZmsUIU2NGMv1qv49M8+1w/v29]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR17MB3375:EE_|MW4PR17MB4604:EE_
x-ms-office365-filtering-correlation-id: ae0d2c06-6cf6-4b93-b1a0-08dafef59d4b
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h7IibWKCTFR0fIdlOXoxnPr9cQIpltMqk16V9MQnX51kHYL/DkxaSiD1JI+xKWu4/dSQG+7wUnTOsWazRAthjukd5sHy4n+VUer8Id4rVaGyT3mTapIyaC+o6/qx5rLA/qtXgCFM2/jSUNbT5nSLQbjoSWVoCzSHEzaRyay+JsVRdzAtSvnVnoaUXTRHPgnupk0prgQExdsTZGpsqaq/bdjVsAbgrfdedw8p+eVs1KB6aqsNKPVQ/brj/G40R/35bY9/5pKFI7BO40Be+8boyRTTlNnyitwnBgTiYgylnSfTTvawLdy6SjDRaDAKtRMoRrSkm3YRV7HakjsYmvEqbr/SN2eQJayRaRjVK0sGrbAla8KBylQgOPYUVIBkTJJHRrBYJzosBdccB+AoOqdL/iDffd70BgmadURfCkzcxvVg8SyJw2jfFZrHFZ+g9Hh5A1G1H7u0GlutW7TvYLZuiI/o6T7NsQ2pbcM7bxRqGbiwgcv8U31+J84XRKqnL7ECzeDX20Dd7x0vVfyzM2vL8ekMIGHkhYieRu4ekCMZCrKSF4uTNYE9mxISFrLznAZi9hlFrfrsaH7Gzu5Qs+kW7GCF9gPsT8UMYHOFJfq0t2EzOVF4sepqAll8o/z+1aMqL1nxICzqqRXHkj7p1gP+vdwzWZl2LDpJraFPSHBhyJg=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?rSUozahbdSHEvKJ3tvnBpE5esMqOgHnBm2+VH7LITFx9EsN/eYeDDAIR?=
 =?Windows-1252?Q?VRIpcqiS76+sJSXufC+S98SeJ7Esrl0dX4eRtDfFgV2/qeek1MbmtnqL?=
 =?Windows-1252?Q?cZjIq6hPgc7YnOm6xG93w8VK7x2KwTquT/FmJ3/xg7+KJ5Djlo/6ORtI?=
 =?Windows-1252?Q?PhNJNbGwlGJjOFz2PvrYcIiAOdoE9cMHvAufoTOt7Q4QzjVSQnC1ygZz?=
 =?Windows-1252?Q?Tld09wuvkgZLD+IqKfzv/e0/Umy60aRnlu/CPh+Zo5KqGbBVb1O7EnnV?=
 =?Windows-1252?Q?7Cchs7TplLN0sYmauD/IqtoDJ4qDD6OPYQ3RpXsy1xBVz3LKi+m8FFL4?=
 =?Windows-1252?Q?MMQydto0ZycQZ9QQNgSp17QIeyHIm3enYugmYFS0CdbGwU1VZZAlYCiW?=
 =?Windows-1252?Q?9qMSIs5hbUh8m0/bTKKQ3OhxCTfVDKtmDqqOyCxDA5zGsgT07XZ6F1qf?=
 =?Windows-1252?Q?xhfkCwjMaG7wNqSY0hoWqv729YteEwjDlfA0MelCBOIwK8XXelTZRWwF?=
 =?Windows-1252?Q?B5AvvxZ4qjC6oTp5tPV4s3SRQLojpAC9vt6z3r1ATAdStQiPkTg/+TDs?=
 =?Windows-1252?Q?36gctmJwGF+A5gA7OghTO7Vymneg17mb8+AekrFRNV5YsHfj6S3uGr/k?=
 =?Windows-1252?Q?baFoyjGH30QTRvYVEGpINpANPidE6W0PacvFnKJyM77ZM/tb8Z9w25Mf?=
 =?Windows-1252?Q?hMwJsDcq8ti9Gd5lBN4oIig6AgTqf9DWtORKZJWeS9dMaQHYw//1gCRr?=
 =?Windows-1252?Q?5LOGSDSmZmzUlmfOzLyxDBlSvSgBMxmFXFlAgF7gZQWrk6y458kkuGvI?=
 =?Windows-1252?Q?UwZ0AsI+s1BuXcdEjOJogTSMIEISWRRMi59W21u+8jl9kmZ1N4/dLBCF?=
 =?Windows-1252?Q?RSs45miUxg6GB6IeCUWDNVmIUtPA03BhtoQY1AW0GvIiLAoLeLVsoG9o?=
 =?Windows-1252?Q?UYEC6oYBNbu6H7qpMJbbfC2WBYHUvPVfRMG6xd6pqZr9pCKYsFWBoEPx?=
 =?Windows-1252?Q?HFJbBzbtFUB//4xERbOBQop8DMOeSwyrs9vyzxqS/7gjSOTc34VkkNbf?=
 =?Windows-1252?Q?7LsUgmhKgteIW3Z/akml+IRTQ3MDjEu6YXYuAy2c+uDAALBxnfBE+DdC?=
 =?Windows-1252?Q?aHdZoUEqmJHmNI0nvNhgF777b5un+dNtfZqd0HopIvg52fU23KTd5U+l?=
 =?Windows-1252?Q?IrTA734WtBzvxUUkrm3plO0oXl14JyCocZZpw0MwH0ogO9j7okUgrRu3?=
 =?Windows-1252?Q?nfnLatBBt37RMqORyibiH19u35g4QuPIOJLupEHEbqI33FwusuqWBTGr?=
 =?Windows-1252?Q?iLaJbA2q4wr9OegaCIQu33Z/xUtv+8QUhgeJyHbtUNE9o/q7?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0d2c06-6cf6-4b93-b1a0-08dafef59d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 17:00:08.5616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR17MB4604
X-Mailman-Approved-At: Thu, 26 Jan 2023 08:55:01 +0100
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Marc Zyngier <maz@kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

You are a disgusting disgraceful piece of shit as human being you deserve t=
o eat yeah and literal human feces until you DIE motherfucker. You dumb fuc=
k. Have nothing better to do. KEEP talking motherfucker KEEP FUCKING talkin=
g. YOUR DELUSIONAL. It=92s sad

________________________________
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> on behalf of Bartos=
z Golaszewski <brgl@bgdev.pl>
Sent: Wednesday, January 25, 2023 8:01 AM
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; David Airlie <=
airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>; Jean Delvare <jdelvare=
@suse.com>; Guenter Roeck <linux@roeck-us.net>; Thomas Gleixner <tglx@linut=
ronix.de>; Marc Zyngier <maz@kernel.org>; Jassi Brar <jassisinghbrar@gmail.=
com>; Mauro Carvalho Chehab <mchehab@kernel.org>; Lee Jones <lee@kernel.org=
>; Ulf Hansson <ulf.hansson@linaro.org>; Richard Weinberger <richard@nod.at=
>; Vignesh Raghavendra <vigneshr@ti.com>; Sebastian Reichel <sre@kernel.org=
>; Mark Brown <broonie@kernel.org>; Rafael J. Wysocki <rafael@kernel.org>; =
Daniel Lezcano <daniel.lezcano@linaro.org>; Greg Kroah-Hartman <gregkh@linu=
xfoundation.org>; linux-arm-kernel@lists.infradead.org <linux-arm-kernel@li=
sts.infradead.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freede=
sktop.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; linux-=
hwmon@vger.kernel.org <linux-hwmon@vger.kernel.org>; linux-media@vger.kerne=
l.org <linux-media@vger.kernel.org>; openbmc@lists.ozlabs.org <openbmc@list=
s.ozlabs.org>; linux-mmc@vger.kernel.org <linux-mmc@vger.kernel.org>; linux=
-mtd@lists.infradead.org <linux-mtd@lists.infradead.org>; linux-pm@vger.ker=
nel.org <linux-pm@vger.kernel.org>; alsa-devel@alsa-project.org <alsa-devel=
@alsa-project.org>; linux-spi@vger.kernel.org <linux-spi@vger.kernel.org>; =
linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing (unevaluated|additional)Prope=
rties on child node schemas

On Wed, Jan 25, 2023 at 12:00 AM Rob Herring <robh@kernel.org> wrote:
>
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present.
>
> Add unevaluatedProperties or additionalProperties as appropriate, and
> then add any missing properties flagged by the addition.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

[...]

>  .../devicetree/bindings/gpio/x-powers,axp209-gpio.yaml |  1 +

[...]

> diff --git a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.=
yaml b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> index 7f26f6b1eea1..31906c253940 100644
> --- a/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> @@ -35,6 +35,7 @@ properties:
>  patternProperties:
>    "^.*-pins?$":
>      $ref: /schemas/pinctrl/pinmux-node.yaml#
> +    additionalProperties: false
>
>      properties:
>        pins:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
