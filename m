Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E600755976D
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 12:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 848761890;
	Fri, 24 Jun 2022 12:13:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 848761890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656065656;
	bh=nDPgGxn42jdfOMQlqbQ2PsShqAGnclAr2BqSaIQLgos=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s4w1oXYvnSAMXAJDla2cKy4WI9VxSJUqGhANO+D11zBTCoUqDE9Yt3zUJjXqqwnsT
	 m9AjSYPl2g1AH72QvNSFjQSTyPtZAekfqSE5FMS0FKtLPVm0EVHzpVH4XmlUBsr8PV
	 zBpZFCnBIg0dKaIhyRZB2pHLlUmSfBONdAntxuPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28986F80107;
	Fri, 24 Jun 2022 12:13:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D029EF80139; Fri, 24 Jun 2022 12:13:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from de-smtp-delivery-113.mimecast.com
 (de-smtp-delivery-113.mimecast.com [194.104.109.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8B40F80109
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 12:13:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8B40F80109
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01lp2046.outbound.protection.outlook.com [104.47.22.46]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-1TEmWMIcMkW_IT2oaLkkvQ-2; Fri, 24 Jun 2022 12:13:05 +0200
X-MC-Unique: 1TEmWMIcMkW_IT2oaLkkvQ-2
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZRAP278MB0061.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:14::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.16; Fri, 24 Jun 2022 10:13:03 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f0b6:54ca:c3ff:48c1]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f0b6:54ca:c3ff:48c1%5]) with mapi id 15.20.5373.016; Fri, 24 Jun 2022
 10:13:03 +0000
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1] ASoC: sgtl5000: Fix noise on shutdown/remove
Date: Fri, 24 Jun 2022 12:13:01 +0200
Message-ID: <20220624101301.441314-1-francesco.dolcini@toradex.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: MRXP264CA0013.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::25) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c377d9e5-5c71-4492-1fa8-08da55ca1fe3
X-MS-TrafficTypeDiagnostic: ZRAP278MB0061:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 79tBDaWgogUFU8uNOvoCCon3ZF1+1KzFgNglfs3wrTZV319jdeajCx37d8HKrpteGjbO+DwMhhkra4bWL8QQv5zqgDw3377Dywmo+728Yo0heOHD/SjpOYT+j3BlaZx+WPJ3W4g8Xtfb2/FueIEzxK4tl+MwfUkSMnp57UfYMt37y16qn1d7unFzGmx9RdYfuhtwoUljyNpmm4/4pRBs+OtHnXEeaaKaXCY0zvd5tWhArzEIi47Q4mlc8IOx1po8CmD+w829mJpJmy99lmwe89/rdT0fB3bSwAIvCnYy+JwsBBJc86nCMLJgSaEdfS2g4u5iia9CRHb4Mwv6H1R6mut8JGv9L0EsQgGTVRLdnMKoyzSMKDH9Z5A7SJgWzg61n1xYNpeUMhiSsIB/KEr235RHTO8S5jDePDZhleeKCc6moHhJyYPPVVLQRvzwJpYLwiI7nNdvmf7dxxcOFoNv+6GmMoFv78Acv9G5DLBOFvugBSmtI97Mth/yFSULY+44dHMlYuxL7pAWON0VHAGFLD3EJA6XfJfdTIZRHjw6+AmoeCuoZDovQFafDNLLhMbzz0Zz72/M8D+6/VcaQwRB6hBLEtUxLDTqkY6/lvsbFWtYnQHVbif3Xb+0KZxPNgh9I2iqZb874fP21T5WNZXOz3jOhnr/wXlsbwDHSsbfqqv+eyo0dLvqxk3zcSPXWrzMGLtC+CV6HAXVY3tDoatLbIllEfjUcUbKhNgJFkqHt2UQPS6yNCPOtwOpOcIZEXzzgYd7UTsFQ3Lf8RfIoDFdDSpru9QtngXNApjKywqJnbI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(39850400004)(366004)(2906002)(66556008)(66476007)(5660300002)(4326008)(66946007)(2616005)(6506007)(8936002)(8676002)(52116002)(186003)(478600001)(6486002)(1076003)(83380400001)(316002)(86362001)(36756003)(38350700002)(54906003)(26005)(6512007)(41300700001)(38100700002)(44832011)(110136005);
 DIR:OUT; SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D6pdFOFgWp3XkdiDxZDC8J5412HB6R3oDDnleKkFIv7SfFAohxRkvWkhPtgd?=
 =?us-ascii?Q?MYrwv1TspvfTRQqxJegEhM6XNLFnDvkaK3tJTqJn0xi4UY20MIOGgFpg09UO?=
 =?us-ascii?Q?BYFaE9szTxqZz9Zx9LJP4/QYpsr6UMkqhXEil7XdwsxR6r8a21WEv9HJiE1P?=
 =?us-ascii?Q?4meb/85vQdXVcFk38jnvfG2lgK3cIALif5u4hUhNyqzs498hXbpblktpMjTT?=
 =?us-ascii?Q?l+VPMKxAvXgXFUYy5zuILkHX48+vRpzx/WsEpIAkVqqownaWCZyaBMOzgp3p?=
 =?us-ascii?Q?GPXA0oeZfFn85IGdHmRHtkzMqykkIK+LPOdK2Rnx8OoRPUV7n15qn+Q7pBZi?=
 =?us-ascii?Q?4UVjqPcGSbBbYB2u7OAJcP/qtCMd3sJgi6uXafJc0fPpP6pA3OJ07PTex5Do?=
 =?us-ascii?Q?SHe4EYFWG6yXpefqj46HDQg9LqYjm8YaAJCF+vd726Zu8cpQxWaJL2WbndLM?=
 =?us-ascii?Q?05O27agrPQjspcngz+tbS8Fbxk7Zk8KLvg9/xiBNoiYonTc9+dOYPY0KmKUf?=
 =?us-ascii?Q?+SnJzUN7WkqtromCMWyH6hOpIKGaOmm67HSXqv+FBkNYypjsP/rCj7yBAP0H?=
 =?us-ascii?Q?O+rv5I/VQ3MV9HIjKiI28QKIWTyGYydI1gHr5t+/jKDQ3E0IwDmyJGPGnR2P?=
 =?us-ascii?Q?0lS4nOdMCSM729LCzLu6JuWsKtUgqGT+9iZkzirp67dBXEM2qo1Od8lB0A0x?=
 =?us-ascii?Q?7n1RcnS9p9nhhfPlT1OLLjnudCEkUbHJgQOXScgZlg9Wcjo5S9doW9KqjXio?=
 =?us-ascii?Q?r9PM7sGh9/7cgvKxaR8Mr6OHP8ExVeZdT7Jn9zkifLFuZjm+H1MFT/4oWL23?=
 =?us-ascii?Q?FGBCiG8sNLb9wwfEW52UtYcDFCYUsuPUOISgVY4zMNU1Au8BgKmfZCTqKLcB?=
 =?us-ascii?Q?RcffZ4mCV0kFoxtSDDCck3pVrSaY03YMOAJw8uRSBrzDPu0v1UuU/Ht7OYNC?=
 =?us-ascii?Q?FGPeUHRlgi2yldUZu5r6tCoHSynR2NuA7UWgWVRwfhi/0T6b6ZKOQZ2dmr7E?=
 =?us-ascii?Q?IyP+zNTmb5BvAKCovz/Tgd2GqiuVXo7f8ZHzyXPxzViXG9I8oE3hj+qUr8EZ?=
 =?us-ascii?Q?R+2/gsvDeBtOfpnMyUohxdLKcndSGrsokrl4BsmY6Rw4yUsZVKwI8sugVcIk?=
 =?us-ascii?Q?YCCImHcQl2zVbiV5ih7AAtG56wM3dspHBD+bmkFO8R+0KH2G7y0vpXegqyWR?=
 =?us-ascii?Q?o5AQTZYVa3QSvuiccCRNDBg4ygnrYQUM0ecLRhvB52NYu0dCWIHKEkwA4YdZ?=
 =?us-ascii?Q?JBLroTZDXkEmzfHKDtI0RD4tH6KQCS4ciyRkNzxfvEcXp6dEa9n2yYph8l3u?=
 =?us-ascii?Q?VHur9VQ6dPgsAckx22Gpc2W1Rd0hr9WkcWnvdQy75/xdn9DqJ9qBZrJbv+KM?=
 =?us-ascii?Q?pxijANzwQoDlXfPdRqWj+0HN+Cw40y68yACMhiXw+C7Jxx1t05rLPL+iTu/H?=
 =?us-ascii?Q?PJmmhZqGspFTvVitoxGbA2MeVEimC+UO1aJgDZ7TohyoGVrSZeanSb4GVieC?=
 =?us-ascii?Q?CyoaLtsaicQ0btDpjXWedEr9mhytR4oI5Eiw1ojN3bEFdCeE18b6/SGfn8qL?=
 =?us-ascii?Q?UjBRprokTqJqtU1LMmqDVFoR3eGFclAQgKupeKv2dRwmebuXTcbe5hUr/f4w?=
 =?us-ascii?Q?YA=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c377d9e5-5c71-4492-1fa8-08da55ca1fe3
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 10:13:03.3703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kRqIr63hdWlGqW3IWR1+OOH12mdIGp6Jkgywy388EOhw/KPD6BlGjemhjoZeTogs5ZHAyEDP/hw5j5cWfgLQjq8/xOER004EdpdtdlJGdwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZRAP278MB0061
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Zeng Zhaoming <zhaoming.zeng@freescale.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
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

Put the SGTL5000 in a silent/safe state on shutdown/remove, this is
required since the SGTL5000 produces a constant noise on its output
after it is configured and its clock is removed. Without this change
this is happening every time the module is unbound/removed or from
reboot till the clock is enabled again.

The issue was experienced on both a Toradex Colibri/Apalis iMX6, but can
be easily reproduced everywhere just playing something on the codec and
after that removing/unbinding the driver.

Fixes: 9b34e6cc3bc2 ("ASoC: Add Freescale SGTL5000 codec support")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 sound/soc/codecs/sgtl5000.c | 9 +++++++++
 sound/soc/codecs/sgtl5000.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 2aa48aef6a97..3363d1696ad7 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1795,6 +1795,9 @@ static int sgtl5000_i2c_remove(struct i2c_client *cli=
ent)
 {
 =09struct sgtl5000_priv *sgtl5000 =3D i2c_get_clientdata(client);
=20
+=09regmap_write(sgtl5000->regmap, SGTL5000_CHIP_DIG_POWER, SGTL5000_DIG_PO=
WER_DEFAULT);
+=09regmap_write(sgtl5000->regmap, SGTL5000_CHIP_ANA_POWER, SGTL5000_ANA_PO=
WER_DEFAULT);
+
 =09clk_disable_unprepare(sgtl5000->mclk);
 =09regulator_bulk_disable(sgtl5000->num_supplies, sgtl5000->supplies);
 =09regulator_bulk_free(sgtl5000->num_supplies, sgtl5000->supplies);
@@ -1802,6 +1805,11 @@ static int sgtl5000_i2c_remove(struct i2c_client *cl=
ient)
 =09return 0;
 }
=20
+static void sgtl5000_i2c_shutdown(struct i2c_client *client)
+{
+=09sgtl5000_i2c_remove(client);
+}
+
 static const struct i2c_device_id sgtl5000_id[] =3D {
 =09{"sgtl5000", 0},
 =09{},
@@ -1822,6 +1830,7 @@ static struct i2c_driver sgtl5000_i2c_driver =3D {
 =09},
 =09.probe_new =3D sgtl5000_i2c_probe,
 =09.remove =3D sgtl5000_i2c_remove,
+=09.shutdown =3D sgtl5000_i2c_shutdown,
 =09.id_table =3D sgtl5000_id,
 };
=20
diff --git a/sound/soc/codecs/sgtl5000.h b/sound/soc/codecs/sgtl5000.h
index 56ec5863f250..3a808c762299 100644
--- a/sound/soc/codecs/sgtl5000.h
+++ b/sound/soc/codecs/sgtl5000.h
@@ -80,6 +80,7 @@
 /*
  * SGTL5000_CHIP_DIG_POWER
  */
+#define SGTL5000_DIG_POWER_DEFAULT=09=090x0000
 #define SGTL5000_ADC_EN=09=09=09=090x0040
 #define SGTL5000_DAC_EN=09=09=09=090x0020
 #define SGTL5000_DAP_POWERUP=09=09=090x0010
--=20
2.25.1

