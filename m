Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 874C9689427
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 10:44:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D351FA4A;
	Fri,  3 Feb 2023 10:43:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D351FA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675417481;
	bh=JNbO8EMHWPLt7TnO90qvUYUN6VZbLMZF/dxgH6+m3iw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=P8u+U2K/rbRnUPx+TKs/06ss//kYv4pE+FfEJc3as9yFxUY+RX5Hv3eXovqMG5Mb3
	 weXixw0LtKIk+QFWsnH5Yvv7zSazI2BlawuKKNSoPDVdGzUXfgNJOx37VtR0+hX9mL
	 lMU7JUwRL1uVkQODV9vVKEzAgZIa/5P6Xolf8qmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CFFCF8053D;
	Fri,  3 Feb 2023 10:43:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7AFEF80548; Fri,  3 Feb 2023 10:43:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20621.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::621])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D356F80254
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 10:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D356F80254
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtAL7iUcnpet4XG/AdJxXM69emHULLc0dpSJ60eGz/pdNP1JQewrAXiiAVVNK4GGEiSVeJ9AsxQ0QdrktSHM0X5k1DYdLdLc0f/OzuEsd0bl+9pPIu4ZVqr5b90WxJ04ufA2MnrWBhcGoWbz3V6QHSTiypHqVsBoRIWrudxZmFRUjgzChQnBhgGvs8mc6mtSBe6EXjLXjCmRwbGNpZqDgYxm9+kiEDIa3rI7QSw6bu7FDZZHmZzojmw8AynUUXtSbaWEZ9ca1+Po7KsK5TzYeYWyirfzRE6FJxYL/zpzkf72lte3ONmjoBFk/vlkdr8qbDyeUalIGRtrJhvfI1Tjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zy/r5DnZbk1p+14qRf3nue/WftNM2s08YyXCbnm93+g=;
 b=W7j66Bc4+4jafEyYE3EOSuvgsklUusd0tunlMLx8M1+/PrDFERTSRpxkKGVYCZ9VqKNxNgyZjJ4KvWaBg7ouTJUQi5GxyGs8I7xVQVPQvc7KDe5H5vKkWJIBb6EShk6i26F60EDcL8WHRNY9GwCcMGDXufprLL1cBOrIKqkJuWHo/KtXOlouZMp+zKMHcfHYbldVB24zLR5rvTgZVhZBaeDqfcDBvpZQMPn8jJQUgXgpsa5OEkYizSFCTrcb/Bi/eUNBn4W/GJXHjoWEJelASaXjURaOCFCRtl+xt4A8tVyPnxi/Gc71JQZaX6K7Mg0HdjiUzaAoztz9XczrPdvThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PU4P216MB1485.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cc::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.28; Fri, 3 Feb 2023 09:43:02 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6064.028; Fri, 3 Feb 2023
 09:43:02 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Kiseok Jo <kiseok.jo@irondevice.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 2/3] ASoC: SMA1303: Remove the I2C Retry property in devicetree
Date: Fri,  3 Feb 2023 09:42:38 +0000
Message-Id: <20230203094239.25700-2-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230203094239.25700-1-kiseok.jo@irondevice.com>
References: <20230203094239.25700-1-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0226.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::13) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PU4P216MB1485:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c9ec92e-6c00-42a5-1bf4-08db05cb0ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HZUfXdG6sjWfV8Ob5lftVez5Mg4qxBnYl0tWBbn/ykfaFQDB9JBAPjUPvopocgazQD1gRVBjTS2PgSDipiiM6ytWEAE502RulsLywDHHdRJSWfFomh++RZfMYPk2Qs6WjICek9iclq0F89Grp8poo6bL/AtUAn2AMeqEZUUx1iNivDyIZo4EVEbsYCguy5YmcjK8nWSXFuRkcJoIMoHmnR47ThpsOY25LU+gGO/4P7pHycQozq1gh0phzd5+r4rwKDlEbSmjv1UuE2Oydtjjsf+DrOJqsj75CpbQRaEngVCK6ADwPduFADQRxQmCygNAgUe7tUN57iDM8coTkIUvW+YLlsTlSou8SSz+cFC04h3UkPPY8Yh4eXO8jTJq1OAq0IBWyOJkth2StKI4gScY5v62a1Z/05QoaOsjcFkIbIfm5CRJkwHm/OfBgDdW1qB+vZ/2LLGxNc9lOSuMxp9609MMdY6MIBQ9qgHSojfleB+TYu/lp55g49CCGbRaMdvpuwQAjUnTiDwXdp2YyM4AStbqtfBJn/eELfmaE/tFE2CcdGL71scOCOdR2Op+YhIviB6u9an0N8g4INdrbZF1GVEo9Fa9Xd53IeGHCHxd3gOMUxQkqnZz52rB9Isnn7hKnezvBze9w7ICsjgerJqKwymIzWLHIdsetAZ+kNTCxhN/JQIVNG6Liz8MWYc1zwKV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(396003)(366004)(39830400003)(376002)(136003)(451199018)(44832011)(26005)(186003)(8936002)(6506007)(6512007)(1076003)(36756003)(38100700002)(6666004)(38350700002)(83380400001)(2616005)(66946007)(66476007)(66556008)(4326008)(8676002)(52116002)(5660300002)(41300700001)(6486002)(478600001)(110136005)(316002)(86362001)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QaNm4GImufGu3/ck+sAMYVvghfZXGiy54Xe12LhbUtINA9Rq6INo+rOj6oop?=
 =?us-ascii?Q?VDVEhn2LRhpTtBlBq00vrPBF8lK8GaExugHEhesnDeLe9rvE7FJ5jHzwkqQs?=
 =?us-ascii?Q?7VNStJ0gR2BCOiWB+PfHqPI26R3CZz+8YKb+CWHLEjWaRElXrmPtwgugPUdT?=
 =?us-ascii?Q?wjw6anDdI/5LHnnl7rLW5/DzO96uIfzrE7dbjzwtrQeB/17WPkYZtb9biSj3?=
 =?us-ascii?Q?KAuDUS3wpxdTXFnVimSqm7T5Nk7L/iVcXAOME0Mdw+1ZQ4e+LR4mcmYjHZPd?=
 =?us-ascii?Q?xCrvwjT2T175VB1h+gjQ0nDOBT6vPBKMfvWL3qsKK/L2YgmG7es9/3JAu4iQ?=
 =?us-ascii?Q?F3+dhIz9rX+KlIJwva9LNGs2JnZJTiOvcVHM1I0qdGDljJ7uUxTL5hYFcGuy?=
 =?us-ascii?Q?5qtyCHuWlM0pB7QZHG5qDgXMCJvlBFaxe+f8h9hkc47nesS2Lwx88YzY12EF?=
 =?us-ascii?Q?wQqnA6UrYvjH17AjZtPbbYomga/3gTB725RkVXeJqxWWVUxi94PTn4CGIEb3?=
 =?us-ascii?Q?yCPlZEnTarbP0vvew9Feah33Z/O3VuuGw2AuAeyxzfx4l9Qb9EcN0/INJ6gr?=
 =?us-ascii?Q?O9WgDWHqGN2tsGpUZvroGud0lI0TGaf915lyBHGgvm4L8fumqP07j0VcOBGU?=
 =?us-ascii?Q?soJg49irKD0M8AeAFWe8iPEovFe3T5taOoXa1Gd0rLmSa2MfwleaIM6E6Dyv?=
 =?us-ascii?Q?gf2TYmzkRkt5ElFjiWFi4s4acgOuFnDMxWJvu6bngGZcCnRNQckbBmZtxYUq?=
 =?us-ascii?Q?jJ1sd1pwR2O3lveqC+g4wJwNjwVaeI5Sdcis4xn5Kj+V2YoheT5gSZOdpmw3?=
 =?us-ascii?Q?+Va39ZM+tmkI4YKZe5B61hsPtw0z1kvD4LEgSnnmEDtI1HZZoNUjyWoq3OUg?=
 =?us-ascii?Q?fomPcBplCrYBqf1SbyHgHIqOlcDudOTYJuOpaO///R30aOLlAqjw9s9FTy+V?=
 =?us-ascii?Q?F+TzdASxic25dSKMGQMXRLZRmQfr/jjGaShovX0zynD2WZbqgXa4sYc8Kj4g?=
 =?us-ascii?Q?y6gkUe/C+GuMrTBDUOvqrZ/AG2XDWCSk5BU66Q+dztba+KY5JRRYRcxAznyV?=
 =?us-ascii?Q?K0U/EL4kjuY0jKaEgPUfol3DTvHNr6RSKuEZIQpR7R2Cd1T+SQHrnIojDnSF?=
 =?us-ascii?Q?M4JxSnCoS1Qw6rMWnvgTYU4aYFcTCNUEyjn7BlDRTF58ofch/gKI+3vzxMSk?=
 =?us-ascii?Q?5tG44o3PNCCJGn65FT6ipCjl+h/Z9u1G0niWvzKkbguxtfW0XHmh2AoFYEOZ?=
 =?us-ascii?Q?P7H9KtqMqWGlD9vZjGJRXLOA3r8VUKZNq0bRr950qtB0AoOFruHZipnC0SS+?=
 =?us-ascii?Q?26nT3bsCXjqfLttAm63AfVIg02VTKncU0Lh1bZ8LT2wV7KjLbNzRUpS0hGG+?=
 =?us-ascii?Q?ugXcNScmIVeUGAirtfDX+DbnHZgcpSfw8tUCtOP/Nie1k8/j5Py5owhE1TAy?=
 =?us-ascii?Q?zWLetOgLgMHt0qOhw9a1ENcvIVvgRKlmxKWNizAWbycsn+zZwX+8nEC1mo8F?=
 =?us-ascii?Q?5cclQnbW/qoKi/ots3ICFnY5XhkI6q75WfHT/B6alUTxn3mxgGBpPM7QV7NH?=
 =?us-ascii?Q?BeJuKaTXXObhi4ndUEZYoeq+BRVawUNJeT8LZndPGYbR3jRFYO+vVDaitb4N?=
 =?us-ascii?Q?qQ=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c9ec92e-6c00-42a5-1bf4-08db05cb0ad8
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 09:43:02.3054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3ODv1gVAVBH1/t5Bmri1I/SsA0Av1l831G+YDr+izlVolEnKFtAeLUCYPJVR71maB1SBvyzdaONIMV2ARusLurORM9SdYo7758PhyuifuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1485
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

It's necessary to set the value for each device, so remove that.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 sound/soc/codecs/sma1303.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index fbedba574ff4..fdcc40f5fc61 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -1621,21 +1621,6 @@ static int sma1303_i2c_probe(struct i2c_client *client)
 	}
 
 	if (np) {
-		if (!of_property_read_u32(np, "i2c-retry", &value)) {
-			if (value > 50 || value <= 0) {
-				sma1303->retry_cnt = SMA1303_I2C_RETRY_COUNT;
-				dev_dbg(&client->dev, "%s : %s\n", __func__,
-					"i2c-retry out of range (up to 50)");
-			} else {
-				sma1303->retry_cnt = value;
-				dev_dbg(&client->dev, "%s : %s = %u\n",
-					__func__, "i2c-retry count", value);
-			}
-		} else {
-			dev_dbg(&client->dev, "%s : %s = %d\n", __func__,
-				"i2c-retry count", SMA1303_I2C_RETRY_COUNT);
-			sma1303->retry_cnt = SMA1303_I2C_RETRY_COUNT;
-		}
 		if (!of_property_read_u32(np, "tdm-slot-rx", &value)) {
 			dev_dbg(&client->dev,
 				"tdm slot rx is '%d' from DT\n", value);
@@ -1733,6 +1718,7 @@ static int sma1303_i2c_probe(struct i2c_client *client)
 	sma1303->last_ocp_val = 0x08;
 	sma1303->last_over_temp = 0xC0;
 	sma1303->tsdw_cnt = 0;
+	sma1303->retry_cnt = SMA1303_I2C_RETRY_COUNT;
 
 	sma1303->dev = &client->dev;
 	sma1303->kobj = &client->dev.kobj;
-- 
2.20.1

