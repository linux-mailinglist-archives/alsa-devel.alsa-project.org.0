Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E3F698B44
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 04:52:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D0A61D6;
	Thu, 16 Feb 2023 04:51:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D0A61D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676519555;
	bh=6YTrsJzIlq10tpZGmZjdKQXekzoAtu+PAdcVqp4XkZ4=;
	h=From:To:Subject:Date:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=naC+rV7AJNHY78v/7zCWWfKqKjqTNBxZlSghSnTn8HseBV9feGiZu2wgtmklhM7Gp
	 31HZ3cZlIkozXTb7ZCM/+0POE5oHm43Uwrr0omekZKAsC0VztpKEZb41ftt9Vtcuxh
	 ttKZ2DL6vY4j/Jim5zA7G1u8DHwBJ2BLIE/NVZp0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B3E1F800E4;
	Thu, 16 Feb 2023 04:51:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72F46F80171; Thu, 16 Feb 2023 04:51:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::729])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EA1CF800E3
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 04:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EA1CF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=dm.renesas.com header.i=@dm.renesas.com
 header.a=rsa-sha256 header.s=selector1 header.b=PTHLMFVo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6d6sRdiMBAMJaJ6XvjlCn8Vgyg5CH8lxqYgmMwF1Tk0rONvR+U5tIlB2ADqSH07xi+3G2p57Y4rawXGVqJT0INu45iuwFgorEUmgRUqBW4ah4epXjWTib/R6Q0t+WmNmqunC0Yt6ebVarKnPqLgPw6UJ8fEn/wPVe5useRWHuQ3+xKbum4kEpMi96yhnNQpjOu2uAGUCky2agPMEeUG6RhGHw07ShKBShS4lEgwaHqA9R8ZuDkc17wQUYv/zLizkXIQ6yUlU+x0+au3vEO79HgaGOyDUoIIZGRGmSRVx/HlAkAt/RPIiuXDDHLvdmk2pyRNIXunQZrdrPifBoOgPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2SAjeWmP2W1AKB1B27arvSgKVtb+2iZJQz1glKuQhJA=;
 b=kxafqOpYPloL3bM4h8cgyjpbl/WqG7qJLbarvqy7OrXgaeq32RvgnTc/G4I8uKLWERupFa41A2Iqp6aGAjOHYEyTOKiH52e9Rl4lOWM8RV/IPvdnlQ3z3yPe9MClk55EuLY81YTQSwwbv+/G/9UcgO4z8xTL9j6hcIzJqQdd3zVZzHJfZTiyGlk2Wup/j6no6WXrYDC9/KODcmELLdJjNfHWKgkWCcCU1WMxpBSYtrYdXxX6bh/J3hzLSQNqhgiTShZqDqtwtR9jqnPWcTzrYU5449O3dR9yLM0dP0NnP9dTBGx40DaLO+QnWUOCyT9Waojz9pgJ/1WOx10HsOKRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2SAjeWmP2W1AKB1B27arvSgKVtb+2iZJQz1glKuQhJA=;
 b=PTHLMFVoRsuszNVv9lEkmj3isk5HmJPkPkXkHTR4K3ymeGCfdygaNnCqfK6CH+2AYFLAc6Zvn+1cWNcwj/xBZFU1Z4F4CrfZgi4wcRmXK6TRHjY8yRKCy1Ln+fOtWfLdf6lM1RkC4h6PdwVHaq3SOZLRzbO2Uy7/Ti8N3fTkQY4=
Received: from TYCPR01MB6656.jpnprd01.prod.outlook.com (2603:1096:400:9d::5)
 by TYWPR01MB9340.jpnprd01.prod.outlook.com (2603:1096:400:1a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 03:51:11 +0000
Received: from TYCPR01MB6656.jpnprd01.prod.outlook.com
 ([fe80::3e4a:128a:f41b:9d1d]) by TYCPR01MB6656.jpnprd01.prod.outlook.com
 ([fe80::3e4a:128a:f41b:9d1d%6]) with mapi id 15.20.6086.026; Thu, 16 Feb 2023
 03:51:10 +0000
From: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>
To: Mark Brown <broonie@kernel.org>, Guenter Roeck <groeck@google.com>
Subject: RE: [PATCH] ASoC: da7219: Improve the IRQ process to increase the
 stability
Thread-Topic: [PATCH] ASoC: da7219: Improve the IRQ process to increase the
 stability
Thread-Index: AQHZQSXVOXRqlXP2FkqxgcY0i5M+XK7P+24AgAAxOoCAAHPUgIAATFRw
Date: Thu, 16 Feb 2023 03:51:10 +0000
Message-ID: 
 <TYCPR01MB6656C10C30CE63BF293B34D2CDA09@TYCPR01MB6656.jpnprd01.prod.outlook.com>
References: <20230215101045.21456-1-David.Rau.opensource@dm.renesas.com>
 <Y+zZwKFX1gMC5/ac@sirena.org.uk>
 <CABXOdTdv=+n8+UCgWUvyrZ6R0uAu48bODa3TA_2nUuMbUT7MUg@mail.gmail.com>
 <Y+1kNa8KYCUzgAfo@sirena.org.uk>
In-Reply-To: <Y+1kNa8KYCUzgAfo@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB6656:EE_|TYWPR01MB9340:EE_
x-ms-office365-filtering-correlation-id: c4789a9c-1d89-48ec-fd8e-08db0fd10ae2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Vbuo0FWfM1WA/hPGup6efpW6QYc+XUfAed4wO7ndfl+JxauFPyDOFtqKwzhQgU6mEuZPDOzPuIrg4far1dfqAKvuvncYBy9WjqToM1nTF0HPZnP1MuW6Uessda4o7AGKOBi87ttQx35Vh8qapk/BIlCIqSK4hvukopeMEoZz3PZ2aD80QLFjfsIGYjx5m4lavHhDoyhWYrWAEfqVr7guJwbGEu4//OdrHlDKFbem8+ZuVl4pnkwKUmNUIk4e0cuk1uxEXgSQdUmQhfXABVaetvZSdAta+QbIv4ce3ADmuLTE7Gsy0kuybYavMqN35F1/grMHZsNCakYRP79ZPJsBvP98oVks80zeDg/JB8NVGczfrRZFvdm4AMZoUGT8FQl9Mz+wkaJ08vFhuGpR93JwVJZteAqajYDIPrA+jzF886111NSNxCUMXLE9u60hY/TuNqXIWtr4KBsDWZZ82NjtxVcpIyh8i2ZUzOn8SK7a+yomSInk/zBKAJu646MpzEYvqgHPbfHDJXHqD2UJWWMhF/l5m7ijZKf1FMjj+Yq5rcwiUaATERNb87nTY4qAGJbA3w0lw08MC+hnx0gQCeAMcz52OyRsWUUEg8+QtqBUqSvjMEI+Z+wTYQrAqomeDYHYMApQiTgZNy29KcnlaItqLUd7pRB7j9eARe1A1rqV8cXr5CwxrVb14ls6En4vEQVyxPaoBs5iIgeinjWfCCmPAQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6656.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199018)(4326008)(38070700005)(9686003)(122000001)(55236004)(186003)(53546011)(26005)(86362001)(55016003)(83380400001)(76116006)(66476007)(66446008)(66946007)(66556008)(64756008)(7696005)(8676002)(316002)(38100700002)(71200400001)(6506007)(110136005)(33656002)(54906003)(478600001)(41300700001)(2906002)(66899018)(7416002)(8936002)(52536014)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?x5GRCNVny1FAAHu4ablMETOWLbLMpRSo2qWKw0ls9IuBIBKotX/ddlTllzm9?=
 =?us-ascii?Q?jfAaG0Q32nWIxjMZeSRuMXW/+wxwxXTC43D+5spNhXaMzPWOQf/e17faeqhs?=
 =?us-ascii?Q?ecJDyXnfSaolAGa7EtXLCtmij35yWxAAE7HdT30t9oTM4bQ/eofNRMWkqePW?=
 =?us-ascii?Q?k52cvMkMKvcgbf5WAw7zy2Lbs1eBTYZwuSwMJChdZccJrJ2og2MbxRlXLDAX?=
 =?us-ascii?Q?GRu3fl01MWHxdt1WXYxliGiJIbrKxUTTfVwOGG4IlKw0FDg7mA6K7U+bX1NW?=
 =?us-ascii?Q?K70seFYWBRLlIH17J9beLV4HKuNiChQpVgkAKKmJUPJSyFmLTlHMb03nFZXu?=
 =?us-ascii?Q?gwYM4rKPhK635IV1IoJhEgxfYQ5CfJkIkeW6M32880VML4i9TiKDtG17DSnO?=
 =?us-ascii?Q?l0RPS0rvUGiQXiPnk7D8q4OzhtEIjB/QyqLBGxNdfONViu5tFLNzo5dS63gF?=
 =?us-ascii?Q?YtXGDGp7+twYC4cAuYjiJt+Wi3cunfuh9f+8PQvB720Y1fgeVnwztJabjljp?=
 =?us-ascii?Q?NijN6IjiF5ixxrQYzFKZ4Z7xtfW7b9S0S6g1ARvots2wMUCo6COXTmrS3CHj?=
 =?us-ascii?Q?2+OxJuKutyJsJya1mB6kFerE9hfy55CwtnHCjWv7LtA0P/V9bA3jVNxELvd6?=
 =?us-ascii?Q?DI+EJT5whXU/uwKErEl5E4GYaqktGem8UEHrtOEiVqJ+8N8tknCzGGbImXS/?=
 =?us-ascii?Q?t6x9u8ClDZoTyCuM0uoQ9rPERUr7GflWBZHGEiIrVmeA4/TnpxPVGHGeF9q+?=
 =?us-ascii?Q?pnySzS7X+3KIcSVZok7B3Xvsb5d0/b9W1/AGZENcVO7mqSi/uCuI+PKkMe2X?=
 =?us-ascii?Q?4D0rDTYx00646sJOWybYGCL4274IoCaFXxuCig0wCrhRWXTxvelhv173dzeP?=
 =?us-ascii?Q?q1veQ4eUE+rmk5ZkG9sMfQvizpoDe9VssfNXiZipqf78IMcjsfJFySz9gOMB?=
 =?us-ascii?Q?qq5yZdrjEf90RA2cCuAbW+fZKvmt8SyKqdJsNb8eFFFSM51cznn6zRnn5c0S?=
 =?us-ascii?Q?htORXHxYrvWbKExTybMkiBy9bXp83XoZu8ytWyx80pmXh9goRMvtyF5U7KPs?=
 =?us-ascii?Q?59uVoyYW+IYJZEX/kDtljap1IwNwCjZMQ5rbBAR15JiYDGHH7SRdKPO3Ni7N?=
 =?us-ascii?Q?lX7vAp3cYdKuGhsVAckZsAMvlPJ+n0fwTzFUqtFrEjlPK9/aUoASUHwigUPp?=
 =?us-ascii?Q?dBwasUjYlGm5Sn9hq7gtyeNy6BkNlKBJR9gv3vfsIyFdMyA0JG4aP7cHuqpX?=
 =?us-ascii?Q?nuG0CC45cMKwwZHL62ENHxclQu4KdVU1O+K/30zKl3u6toRNsbZUr7m9oeXw?=
 =?us-ascii?Q?/RJ3fjp6Ve6sKaLcw7IPvbU5KcAEeomiKkLQT/6QCeN89k4PDNfZCBuSH7zZ?=
 =?us-ascii?Q?hcvLRVwF0BETgaxQwHv2ODFRjS8mTAq4abBdjt8Jav9azYuFOVz8FwoUKQST?=
 =?us-ascii?Q?m2b0BT79gjJAaNqJtzfkZ3bq3NG0K4t9QVM/s/cA45fWuneiZwi2nPphDmph?=
 =?us-ascii?Q?uI+dZ/bs00QreLArlhFAhY1S5n9c+J98C3XqdxDEmvhlmn41a35Cf0Dj+yxQ?=
 =?us-ascii?Q?ck9egmdwLRV3SFTvXA4lHw/VM9bJ3UjeH2xazK4myYZ9ROJyT3soczV7OAlI?=
 =?us-ascii?Q?qQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6656.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c4789a9c-1d89-48ec-fd8e-08db0fd10ae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 03:51:10.6099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 wihNaKIFZs/7CIOF9FCGltfFYUgFytRwH42/eGbFAltsLwlITvVv+MXYkGDr0BONDPh3+p3hTF+yVs7Bt4aEaKFe0jCAHwLgYF97e962sU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9340
Message-ID-Hash: YEHWIAYRHK4YC4JG3MMAKRLZFZVXRQ3T
X-Message-ID-Hash: YEHWIAYRHK4YC4JG3MMAKRLZFZVXRQ3T
X-MailFrom: David.Rau.opensource@dm.renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "David.Rau.opensource" <David.Rau.opensource@dm.renesas.com>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bailideng@google.com" <bailideng@google.com>,
 Guenter Roeck <groeck@chromium.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZP7XU22W7U3CLUXQMPZH6T4HLTZNKDJY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

-----Original Message-----
From: Mark Brown <broonie@kernel.org>=20
Sent: Thursday, February 16, 2023 07:01
To: Guenter Roeck <groeck@google.com>
Cc: David.Rau.opensource <David.Rau.opensource@dm.renesas.com>; support.ope=
nsource@diasemi.com; lgirdwood@gmail.com; perex@perex.cz; tiwai@suse.com; a=
lsa-devel@alsa-project.org; linux-kernel@vger.kernel.org; bailideng@google.=
com; Guenter Roeck <groeck@chromium.org>
Subject: Re: [PATCH] ASoC: da7219: Improve the IRQ process to increase the =
stability

On Wed, Feb 15, 2023 at 08:06:35AM -0800, Guenter Roeck wrote:
> On Wed, Feb 15, 2023 at 5:10 AM Mark Brown <broonie@kernel.org> wrote:

>> > Copying in Guenter given the issues he raised with this, not=20
>> > deleting context for his benefit.  It looks like this should avoid=20
>> > the issues with the interrupt appearing locked up.

>> It should since it limits the delay to cases where jack_inserted is=20
>> false, but on the other side it hides the delay in an odd way.
>>=20
...

>> Effectively this seems to be quite similar to moving the conditional=20
>> sleep to the place where cancel_work_sync() is called. I would assume=20
>> that will fix the problem (after all, the msleep() is no longer called=20
>> unconditionally), but I don't see the benefit of introducing a worker=20
>> to do that. Also, since there is no guarantee that the worker actually=20
>> started by the time cancel_work_sync() is called, I would suspect that=20
>> it may result in unexpected behavior if the worker has not started by=20
>> that time, which I would assume can happen if the system is heavily=20
>> loaded. It also makes the use of the ground switch (i.e., when to set=20
>> and when to drop it) even more of a mystery than it is right now.
Here is the scenario of this patch.
When receiving the interrupts, da7219_aad_pre_irq_thread will be invoked at=
 first.
If it is a Jack plug-in event, the outer task jack_det_work will be created=
 to enable GND switch with the conditional delay.
And then returns IRQ_WAKE_THREAD to call da7219_aad_irq_thread.

da7219_aad_irq_thread is almost as same as previous one but do cancel_work_=
sync if jack_det_work is triggered previously.

>> Having said that, I don't really know or understand the code, so maybe=20
>> this all makes sense and my feedback should be ignored.
Your feedback and clarification are important to improve this driver togeth=
er.
Thanks.=20
>Yes, I would certainly welcome more clarity especially around the ground s=
witch.  OTOH it does seem like an improvement over the current situation so=
 I think I'll go ahead and apply it for now, >hopefully it can be improved =
upon in future.
Thanks for the kind support always.
