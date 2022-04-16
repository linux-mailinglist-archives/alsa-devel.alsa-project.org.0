Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3332506B7A
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:53:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E3DE17ED;
	Tue, 19 Apr 2022 13:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E3DE17ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369202;
	bh=FcBo7z+xTubfawNtuF5MSqeAA6GgSCJVkLic0CQVjIw=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aXOna2fM7zhrArko5iPVDnV00hRBUSxYIjgzGTyqbalASUUXbhKUYCORbJFt0T/9r
	 p2P3Z2MDj35QJmws6PSy8S3XJy5AIhI/nNsBxdIO2jmsNfC//UshTBfRXmowsBq9Gl
	 UhUbUMr0VRSbWnZvHDTqxJ4oOE2zOW/S073Sv/wY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 185F3F80116;
	Tue, 19 Apr 2022 13:52:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43A5AF80161; Sat, 16 Apr 2022 21:25:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE4B3F80095
 for <alsa-devel@alsa-project.org>; Sat, 16 Apr 2022 21:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE4B3F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=dialogsemiconductor.onmicrosoft.com
 header.i=@dialogsemiconductor.onmicrosoft.com header.b="Yx0bawEg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrkpmEdrGMBgf50nLQlZ0WfQ9umaCfoPzfum1XqCjWPKMaSsOzMYT1HOx81xZ5jPvij4fZdohds3fCu3OLYIHqrhh2FGbjjaDHP2Sl0Lay9Og8euAIXVWETR4zRUqkGIk0UwpJhAXh4OOHCgD4FlTNNKoDxT3Izjw2DSBMiJrdWJtKNemJ1XDYPbChE51Jdw70/oTfuxWu2AySqCvl7j6i5/sH5d4VGubqgIWBsOX52gSCoVq6p9VIvWTIAkfeaqF7WbFPN7diegQrnHHFCIfDf81nB8KzzX8jafePNJMFLm9xCZ5nvd5PJnGwQ3duIBpoCDpqnGZvdcPWR01Dda9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcHpDGe12xMQNmHrZbW91VEZr91yAmA+G/YoSTi5P5Y=;
 b=m65FL6kDLgeDo5bRRKLdSii1fyi5yreScZjgTIgX0FusRd+nVLY3sSNAcn/PdF+6LRNQlSC2rUF/8uDSa4Co1/KR0mr1qRzGrVNnX5kB2mJSsw4W42rZcF+UVMjQiCZ4ZKvWKlMMhSlNZrdBJl3WirzRSQOEVkMByCDCLU47BypkBgSQKaDjIbWiOsEY3EM8rw8bvWN143Ngk9MPMY9AAz7J7pahzFCva5xFHcPZHwC0x/pfEZtOB2Nz4O76m3noDMxRNHH30YPNtUwQqkNQPTf0bFhCv35G4OLoQYO9luX++Y8g+HoMB6OsvKDct8z+reT7Ik1CHQndM5bxXlAPYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcHpDGe12xMQNmHrZbW91VEZr91yAmA+G/YoSTi5P5Y=;
 b=Yx0bawEgYiOfxR31kduqwgb9loUsb+SnEMSNh4xPirrkXSaYcSqFEzB7Q/RX9LzlMGXvAMZdgSmnDCQr3HNlrDTmYi2ga3V1QgfYOuLJf1LIZgATV7VE2Q8ReFtfa6LEdDboUmX8r4tsOb3n+S6NoI4fSUnEI07lL/H/RxxO72w=
Received: from VI1PR10MB3167.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:12d::15)
 by PAXPR10MB4703.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:152::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Sat, 16 Apr
 2022 19:25:21 +0000
Received: from VI1PR10MB3167.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a93d:d07b:d790:d485]) by VI1PR10MB3167.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a93d:d07b:d790:d485%8]) with mapi id 15.20.5164.025; Sat, 16 Apr 2022
 19:25:20 +0000
From: Adam Ward <Adam.Ward.opensource@diasemi.com>
To: Mark Brown <broonie@kernel.org>, Support Opensource
 <Support.Opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>
Subject: RE: [PATCH] ASoC: da7219: Fix change notifications for tone generator
 frequency
Thread-Topic: [PATCH] ASoC: da7219: Fix change notifications for tone
 generator frequency
Thread-Index: AQHYUZDqMlPtR+AMP0GbgPBcQycY36zy6e1w
Date: Sat, 16 Apr 2022 19:25:20 +0000
Message-ID: <VI1PR10MB316749E7B1C0F429EA486E56ECF19@VI1PR10MB3167.EURPRD10.PROD.OUTLOOK.COM>
References: <20220416125257.197348-1-broonie@kernel.org>
In-Reply-To: <20220416125257.197348-1-broonie@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4aae39b7-4d3a-4ca0-3fad-08da1fded8f3
x-ms-traffictypediagnostic: PAXPR10MB4703:EE_
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <PAXPR10MB470324ED8FFCE0CC4E987826CBF19@PAXPR10MB4703.EURPRD10.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 836gSZv9GnQkzo+nQh6jwGu7yxawTgA+LLDDscksXAvxuY00LW0zosLddEl7GhiJR2oS+fB2QU3hvjb4mXj1PdKkY6zBMSrPFqVOscoIOLIeA5ikLnPbdGB05SGQTtBNeAY3BBvPnqIH/ai1UFBU6WYMPSQ+0nO7BMIipR5KF8Fe2gdnxPoyRottS3rHhswbePP3QfiLgcmieAkWPod0FllQ/Un2/S7kWcwy+FOb3ugn4J53sSjN9BajqSNtUjuQp4qZtzN/Acyk7oYW4XbG7tUSSHg0/q/u0udzss2nTn6oi4063Ce+wQUy43LHJsFjxQuzaK+IIJs1Mtz0mR63j+zyFBpv4f9XV0az7fW6+nB4yVoAyR0/q/NRRF9+LfF8nXjBUtbFhffe+iECMqOjFQeEjDdmDFvvISwPRipqXeaM3G7Jhl/HtSh5k3pmFUg/J4WeA5kZLII8opwlnQ2do0XhCd3tlbqik8Ioj/rfA1qybHsiYjj6oJrKeprxTkIL7DU/PTCN/AsqHc0xds/OZYq4azxdcg5PCS9kmiDFLWzQvMHYtLwicqwkIp7XHgph9jz/vZlFqVjvPYKpTBcuTC14FhdXDC0YqIwxs6TmZcwwJk80WtLhY3YI1KImhAVOKeeTbwi4JdgOv9ZcOQfcRC8CV5sfkURflqeAiUZ+aMt7eRzd5K6ZF5A1md7O7k+GhNpg3PSPkSNleKWBsRSDeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR10MB3167.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(9686003)(52536014)(110136005)(8936002)(38100700002)(316002)(71200400001)(122000001)(38070700005)(7696005)(6506007)(55016003)(83380400001)(4326008)(186003)(66476007)(66556008)(76116006)(66946007)(4744005)(53546011)(66446008)(8676002)(86362001)(64756008)(26005)(33656002)(508600001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OgPgwcqc9JMnZn4hCak7UcmXYJyJNS48kaq6oedUNg19El93SKN1pNfX+YK/?=
 =?us-ascii?Q?45svtNg+4CfEl+l7cR0Q86g8tcU1ZyrmkEEiriXJFzdkXKRcfsG1Sotwx7vJ?=
 =?us-ascii?Q?Dsbylh98wIsd7nALuychHB+4WyWB4S0l4mzXvj8wBxnm72LYtZ61JlVCXvi3?=
 =?us-ascii?Q?II93I1WFhZ2n09i5mQOqdJIWhqv72CdBMfgdiC0Kj3eLRHLB9IvoT2FhNj3d?=
 =?us-ascii?Q?SxgbVA/C/jxBY/nzAqoqDpwQgzYU90f2jcYvX/eNxX6Yb/KyYfyXc6/uLQD2?=
 =?us-ascii?Q?36pRxjJRHyS+pRheaBy6tVmCFD1f3ynJFLZKRd/7RCR6vDygiWHRKyCHs5yG?=
 =?us-ascii?Q?IS1TUVSwPvgFbsUm4RuAPueCJD/0GonIIrHDpoCwQb+32cxIqVbnTVVXnPiZ?=
 =?us-ascii?Q?V2N9mOxZt0xfVWxq9VqwLn8vqbXwB9W3VCUrouZdR6jm+2FDj6QE0WU1h/C1?=
 =?us-ascii?Q?2IhZ19pfEsyUYHlAz6cJFz7P67SClYHu1HTfj7elEDHKNkd0wZoHndPjQ208?=
 =?us-ascii?Q?p5rMo9u/5L4FkY43+VH5x4vbsDGnxUwrS1ijmrCp/4DPgabRJLYj0yJ5Tb4L?=
 =?us-ascii?Q?opzSUTH8+J5wUg1SeVDHgREHSqwgVDXZM8L637GmlrDZssaLeWipEmywKBaj?=
 =?us-ascii?Q?drGeQND7T0mawOcrmqWMtU8cSpE324QllSvT9tyOfvBAQ0p9w1/ayplb6yFu?=
 =?us-ascii?Q?LJJykDGHXnAiB7xmz9XlqRbwJrTYjYrqXv/AhP3YRS+ul1vzBSE5oiAP6lBV?=
 =?us-ascii?Q?Cek/2Nvai4gvPUI+3sLrEk4Z6dSBtDHf1TLg0rJDnuKObNF9zjpaOWp/t5b4?=
 =?us-ascii?Q?g9APBTucuVZtZPtW6N4w54vWoDqsrwLHM89XsTMsqKsps9Rr+h54umBvohNU?=
 =?us-ascii?Q?lXWYLbcQ5fkSz5nrUsN+nhyUlz8JRsENT6tfkrN15SFPIf0mbeL1uNCSoywS?=
 =?us-ascii?Q?OT4YxZx6mKHqDyzzTk6Q+xuvUySOGz+iM26O8Bb/IYzu+0KZXK8XR3A5MaaO?=
 =?us-ascii?Q?WaLihyMIRh8UiCDhA0qQIv3x3+WXW7k5P6JK9ZfObhda2bwt8Sv5U2X2Csfg?=
 =?us-ascii?Q?LJlzO6j6j9PzQppbsjIYhklouhNxueNNAqNJSl4B7maSKPDg2g8FxYUMZbfW?=
 =?us-ascii?Q?mAEYdmgdexlIhhZfLeSg7Nhhfa2KjVnoHqJRJaJzb6ThihzXEMgWEUCCn4Rs?=
 =?us-ascii?Q?gkt343Ul4TQbcMkqdv81SK64UVGNFl85JaQqmtt+bzksyVMzTV2QkZO5QS6s?=
 =?us-ascii?Q?sAZXiPS2Mw/knZE3mSzQXj4ySsbtPKTsJAJDoppWJ9G9TF/tN5E9uO581pYF?=
 =?us-ascii?Q?JI2yTboUpzR1j2jkzdwNMAc9GX5g1jg8lTEQMneaAApT7bRE6pJvZb9/7uK8?=
 =?us-ascii?Q?FseyzwXcS27o+YDSA7RX/jiddLJjJgycGrvralZ4fGG1UwfkMqn+Vnvdb3VV?=
 =?us-ascii?Q?WTWmGtw8g94Gh58AlStGqoYbYlJ3wrjYcdblgjkId5DzAA85yVssfv528lQZ?=
 =?us-ascii?Q?Ek9cq5ZhLjg6iQrt2F8PJoY8Xdg/eOolG5BekVVnZlPu2DszYReQWqGWo6Ih?=
 =?us-ascii?Q?19KK5EZGeFT/eAGKHCs9jF9Xqihz05JfbrrKg8FClA5XKvsI123gIJA8bH1v?=
 =?us-ascii?Q?pywAdj+jp72QsIf1oYpARPmbeCWoGKuEC2zDc84qPwoyO6FftnkLqLfb4Tb8?=
 =?us-ascii?Q?nvrC1tP1inYZBGhpxeCf35TVhFQFw/eG7QomxFRZXmgbfYDw9RYPPSZb207H?=
 =?us-ascii?Q?+CDkyUynjvA7SMkLHamstdDXEozHhJo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3167.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aae39b7-4d3a-4ca0-3fad-08da1fded8f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2022 19:25:20.7180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cQ2oczkRBEKTPW3zb6MosdhTpGQ+D1hJn5ILS2GG5wkIHN9vvbSD9E6NqOCToaPCPus9spJfB3xOOhds4xhckw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB4703
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:22 +0200
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 16 April 2022 13:53, Mark Brown wrote:
>  	mutex_lock(&da7219->ctrl_lock);
> -	ret =3D regmap_raw_write(da7219->regmap, reg, &val, sizeof(val));
> +	ret =3D regmap_raw_read(da7219->regmap, reg, &val_old,
> sizeof(val_old));
> +	if (ret !=3D 0)
I think you may have intended to confirm success here

> +		ret =3D regmap_raw_write(da7219->regmap, reg,
> +				&val_new, sizeof(val_new));
>  	mutex_unlock(&da7219->ctrl_lock);

