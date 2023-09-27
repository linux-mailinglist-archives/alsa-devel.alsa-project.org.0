Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B4E7B3EFA
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:07:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6FD2E85;
	Sat, 30 Sep 2023 10:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6FD2E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061262;
	bh=0pyXd+1V2iixb30l5ew99GePMh/gPQrqvX8vtezE+XY=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dwvxe202D+jcCHQe86gnAnDiRFgRbEcFnitOsIMHHIMFbLvgiKQwb1cOESadPER//
	 /Y0v1iSh/d79HJ2C3vvGG4ai4jUusqQhLLBuX0T9YmAaHEn3rS4GaODAM6FkSP2Ts9
	 rtTycq7Gk40PYIKtCoBmYaaJ3NkbTKSy0BmoZkXQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E1E3F805B2; Sat, 30 Sep 2023 10:06:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7273FF805C6;
	Sat, 30 Sep 2023 10:06:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 274A3F8016A; Wed, 27 Sep 2023 09:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::721])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0864F800AA
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 09:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0864F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=thp4.onmicrosoft.com header.i=@thp4.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-thp4-onmicrosoft-com header.b=CW2RZoqq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8tnG+ooNytfkZ8Y5Jp+gbVGhUMXqh1qdkgK0Ss41dPdQucrArzmtKcbOjYoH8DYvZQdNXODANzOWskWG7Axs+UKhPIneoLoNoRKODg/lajAwm7TgT60h/vS/LZnCiJi14jpvQTihUNHgQq1gkASQB0wev7reiMNfWbkVAY4/aOoGOv3m8oVFBou/lqfrsOCQAU+ABBzXJipCvkEfRVmrEyIKpUvFzJ4yDDdOi4gq5Gxzzs/E8xnNkWluYoGGaNAf0AnL39+Gkd02qNtOcvckbfZbZYbtRNkmHncIiVdOF2qB1ADwWykPQtlhu36sH6BO7J7l02cdcKUqsBw9Z9NWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kz3XYqTtB5rKjaXHlJYz8iXfTu8NRYY75Rmdz7lhSbc=;
 b=XrCUNao3BaLzo21PxWZCsJEyHQzCCEd4IxB1QHavgs9wkmxHK7jlr9U+f3U61I4Emaa55H3sR97i2ZKWjml98NDcoeLIc5Ng8iWFrBlEUtdp5rKKgN5DpRScr7RbWXoslmivVkEZzqMO+pZ8qUgZFIMWqbUdk+J5/CKtPR9MZbzS6vJwUKWGLaKpzDZllrlBbrwyh9rwJE/zUN6ZoygSFTiR8StQxFA1fS+T/FxaxohPq/bF7IIvVK2AJDM+8QQqa27PsqjNWwyJamueM8gA78LzM2vsXpvzRGeJ5ZAwQUdj4t4ZNBsyLaa8GhmjNQuCdTJ4jyhhcR9/OG+M4acXlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thp.io; dmarc=pass action=none header.from=thp.io; dkim=pass
 header.d=thp.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thp4.onmicrosoft.com;
 s=selector2-thp4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kz3XYqTtB5rKjaXHlJYz8iXfTu8NRYY75Rmdz7lhSbc=;
 b=CW2RZoqqzTmgvnbeBLrt9qItPaxBHjmoEOxg+fe6OfN727i7ZTrRINo99MokSxzRaecitb1zkHF6q4GxJumEyA7GGPWJBawq8icIDwI4eiRfafCS3FlRRu2pL1cwe2/eUCht8YQp3UR2BK4p4ejS1DydztHQqooj0ZkVKucQJ1c=
Received: from VE1P194MB0781.EURP194.PROD.OUTLOOK.COM (2603:10a6:800:162::9)
 by AM9P194MB1410.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:3a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 07:17:32 +0000
Received: from VE1P194MB0781.EURP194.PROD.OUTLOOK.COM
 ([fe80::cb1e:b98e:d4c9:5b66]) by VE1P194MB0781.EURP194.PROD.OUTLOOK.COM
 ([fe80::cb1e:b98e:d4c9:5b66%3]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 07:17:32 +0000
From: Thomas Perl <m@thp.io>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"trivial@kernel.org" <trivial@kernel.org>
Subject: [PATCH] sound: fix name of SIS7013 sound chip in comment
Thread-Topic: [PATCH] sound: fix name of SIS7013 sound chip in comment
Thread-Index: AQHZ8RKuxe0zyijipE66NieRcGAh1g==
Date: Wed, 27 Sep 2023 07:17:32 +0000
Message-ID: <5E4B5CA1-1109-4C82-A581-838ACF19A15D@thp.io>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=thp.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1P194MB0781:EE_|AM9P194MB1410:EE_
x-ms-office365-filtering-correlation-id: 68803cf8-e7d2-4e4f-160c-08dbbf29d0de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gbUf5kfrbgN6SB3BONiUOMa4DAJopMcVNsKSUxUtqx6A/b2YBLUUZngXqVojHsRmAFruKqOtUvmK3N74mtP5hR8ostKN59gT2UihRTVbBBuj2cwD9eC+k2Jk2qsO5NxpJSrLcyOv622D53Tg6p6Ov4lGp5f0Ct+u1pZn4RSXeCnGWLW72RF9LqiK6Y4vdDjTp1hf+juzV4F/jdiP21gkHFtOjTiTujTwVOZ4ph5nqOhO3J+2ByHleaBLHL6mlUmNf9IWsGROCBzzzhnROKHRVH2+sjxZq+ncpE5xWPFlDH/Zr66FSc1+jjh2YiyCNwGfHcAMfEvvzcdi8by6Mcq9oFzbiufcWIeXHa0++5+bw0fun1rPnhi/dPrHawe9yrEgfFnqtkXV8FamFeHyCXPkEYhJIi7AYXMMSjBC9IqX5APGbiQMpEssVGDbottTfyqRwuAuJup68KnsKMYvbI6i9b6ql1ACBdABXDjXIKJYL9tgGZaCLoOSccOIhsTzTL0mQ322WP6bJUR1zCfbIXX42izxJP4wS41oBSkKOBNKSo/9dfRZqTwmaD67Lnhk9DsNaE4GI/3iCp9wVRJONNXpJkYopXL8X5jnc3Nv4BeQ1sovLSL4tawRK0ddXTOZORjujelLpI81Pzn+FG7VZWjhQtxiSpue2kCCppxfalZLKECIH2WSXmxLx/59HyVyh3Vkm8vc6wgs5MQth09TSyHmng==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1P194MB0781.EURP194.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39830400003)(396003)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(66946007)(2616005)(6486002)(6506007)(6512007)(38100700002)(38070700005)(36756003)(86362001)(33656002)(122000001)(83380400001)(41300700001)(316002)(8676002)(8936002)(66556008)(66446008)(66476007)(5660300002)(110136005)(76116006)(2906002)(4744005)(64756008)(71200400001)(478600001)(341764005)(49092004)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NHJkrjEKenMLGJ+/iea4DzC2IjH6MDgynsdFxQ5DUHlryzBg2Usg0LWiBgkU?=
 =?us-ascii?Q?r391TYsc3nh0l+7zq7fMdUue9CgjeASVjeTpyYPS7aMs+oFOpFEMx3P2M7rh?=
 =?us-ascii?Q?V3Gv3Nt8r+sUT3VsCYE50GDIvRDqGlLQBjjVNqGBlZi//jD/rJ418Ad0n3xO?=
 =?us-ascii?Q?XY4Qp9s+kk7QGnQm5cVgadkjs5Tv8v/I7lIP9fzGMcqxh3Dt8lRmfhDRTyQN?=
 =?us-ascii?Q?Ff9G+WCY2RlRqMWL0fcfjrHINiVFwfcWtuiz4JtAuTBC8bZE5KO/XqNB2t83?=
 =?us-ascii?Q?wz6fcA7Eud/edPYHJaQusIi/tvUjivhG3AY6i5Hw0B7ivLQ7BKMqTVguDL7K?=
 =?us-ascii?Q?3oOmelgUPbHcEfQuocTmIh4BtiawKvbm3TLA6duFMS6SRiIAXwxxTOv/g9AL?=
 =?us-ascii?Q?8u6IDwDnQeo1AZf77iw1o4yjjl7Lvk7UyF5GU7xNa+dV822yPVWuG7BX5kQT?=
 =?us-ascii?Q?mF5RMpIpaS6rv//f85mdzlS3EA6okL6rXiIkxLAM4duBIHpz8bb+LdZQUWMg?=
 =?us-ascii?Q?fn4Rb92YEfLUoMiyLuJSddPHaB8tIzLNm5Z48GgX/BxdAN4xnC5LwtQx74JQ?=
 =?us-ascii?Q?Jmjo75WhZLBjbtZqx9nNHzoRF3Z0USiGiP7Fcw4Y5jYGUiTOIUNWrAfVcbhB?=
 =?us-ascii?Q?bg/zBP8Jos0S3IeBYLaZKKJ2DAWbXxw5E8N/zJ1Leci9S212Qin9shuUe9Ko?=
 =?us-ascii?Q?PmvILF2xbUowSdMotlJ3au3pqNq4SXlb8pFRTByel7Uev6u9HxIcy4hpkLuX?=
 =?us-ascii?Q?c9ZHsjEZahHIhjtF0/ZSIA/cyagf0+kjrg8mDp8gqEy1sQPs7TkH9LShwzN9?=
 =?us-ascii?Q?hwvyjlVRGFzQVgkZhWLWYwgupbRqIhHalVC8me9dAupvtp4Qm+pXc/pbJyUB?=
 =?us-ascii?Q?TBP5sQCxLG2+ewB7cZTUcUeSmrIf6cRq7P4vmzfmqpQEz6wX2UrWFeHKYVp9?=
 =?us-ascii?Q?syqIipIu2BXRaAJZVmAYdkKjLP0Yk16EjgFR0xrZJja5xqz/FBHdDjhxmZRh?=
 =?us-ascii?Q?bA/sS0yNF2xemcuWCd3nixAnFb3gTJxX71hM0umgi1OQqBrkPIcXsszJuALL?=
 =?us-ascii?Q?g9pasQyKWp20aFWu9QlLeRuPEe7OU1+e9iXAAhBo0b1S5l/4fYwoCbcPyeg4?=
 =?us-ascii?Q?kdNi0Q95iv4zVEzfTN6VZJJkyBrIE+2Fr8BtOpMK+Dz68pKd/97TMYT47oWl?=
 =?us-ascii?Q?OZYoVzbOYdu6OwqumCqlmgwXsqz9Hu41wZjzKn6DGNWxOtj45KrXOrk6K9ce?=
 =?us-ascii?Q?WI7OAmjye05rScbB3rDEYCk9ZVssOJzDTta8q6qU98GgY0dthQQzTSJegYNV?=
 =?us-ascii?Q?cY0fkdcn5BSlhzhRpRfSPZxGb0tyk7BDhJ1IvyK/2nJPwhmJpJCos2cGKlVG?=
 =?us-ascii?Q?i0IaTEwx5DNRERlflHfv5E1rpqlqJFNx5VrnW92BJA6I0aXevx1fOpOJgoKH?=
 =?us-ascii?Q?fdCR4XaiK7GdgbMWlw1wyYMoWAIqUJlE7h/GAtx57Clr/D72rulojnxYspPd?=
 =?us-ascii?Q?1hmc23UVAPWUJVIUue89MMcj2sY7DUsFdm5z4FLpODo0iyXqJp/vnXkqPVFz?=
 =?us-ascii?Q?pOV04KtSR54musKKbcATDU2uf9h+Pc4Dr8UKrsUDsbPPtWWqwXu3to0Yokpx?=
 =?us-ascii?Q?cJtJ6nfXYrVwM3feZ0dBYvIjhWimrW2B8rwvVtH3EVkKuC1lnADeab3pU8bM?=
 =?us-ascii?Q?SInKnA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9461B13B7C74EC4EA2A12A45932EF67B@EURP194.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: thp.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1P194MB0781.EURP194.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 68803cf8-e7d2-4e4f-160c-08dbbf29d0de
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 07:17:32.1542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9b407b73-c466-49a2-b0d8-a8ff83188813
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Pp6KA7hhbHe5GLe/z0rWvYvMBy1mtbMI1hSpU0s7zTndq6P96KDA6feo8xhCk1H2LG9IJrN96j6LTc1FWdYgGUxC+71RWi+QtXFu7XC2bQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P194MB1410
X-MailFrom: m@thp.io
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7DGFJMI6QH6F4Z6KJOGYAFSSUO4DG4IS
X-Message-ID-Hash: 7DGFJMI6QH6F4Z6KJOGYAFSSUO4DG4IS
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:06:32 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DGFJMI6QH6F4Z6KJOGYAFSSUO4DG4IS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

While grep'ing for SIS7012, I noticed that there is
only one reference to it in sound/pci/intel8x0m.c,
while most of its code lives in sound/pci/intel8x0.c.

This probably was a simple copy'n'paste mistake, as
the sound/pci/intel8x0m.c driver implements support
for SIS7013 (see DEVICE_SIS), and the two devices
seem to share the same behavior / registers.

Signed-off-by: Thomas Perl <m@thp.io>
---
 sound/pci/intel8x0m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index 2845cc006d0c..653ecca78238 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -918,7 +918,7 @@ static int snd_intel8x0m_ich_chip_init(struct intel8x0m=
 *chip, int probing)
  }
    if (chip->device_type =3D=3D DEVICE_SIS) {
- /* unmute the output on SIS7012 */
+ /* unmute the output on SIS7013 */
  iputword(chip, 0x4c, igetword(chip, 0x4c) | 1);
  }
  --  2.39.2

