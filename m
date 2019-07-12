Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E14671E4
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 17:01:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 715E915E5;
	Fri, 12 Jul 2019 17:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 715E915E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562943675;
	bh=L7wh541Mr+IJ2+F09X8/CvYqv865thcymwAdEL30XTw=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bYVM+bVoPCCOPLoicOoYDp/gmNOVIiB2nzG91sS6ifx23PnBiWvcgC6LHmLLpbqPp
	 NKhPfGVZBhHgPDzzXF/RmP2lqMO63N6KRQSpzKR6P4X5/9t150psGX4M3BCBvj6+dT
	 iKtWw5bWc/SUO+i4vXeaIQXHj08sIPWAm+Wk5g3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0855F803D6;
	Fri, 12 Jul 2019 16:56:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBD44F80368; Fri, 12 Jul 2019 16:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_NO_HELO_DNS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00094.outbound.protection.outlook.com [40.107.0.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB5A9F802BD
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 16:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB5A9F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="lbw0XFBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmtaRo+ExGvXgwTS1LST4pXblnna0kkS9oVAaLkPlQo=;
 b=lbw0XFBK1wnieYkKwDvT/IXBEgo/WkcZtvwxxvFBGVAeqQEpGfygBgxpohv4ExX2CUPB5CkRRIS8aJO9IntQ22bXF54bf7KNRelKAUtd5XneJI8Yn8JdUqJ3o+cvpBvHRPoMZhi1C2is6W2zcjWyLw5cSAX9S6QQJ75rNxC1t28=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB5508.eurprd05.prod.outlook.com (20.177.119.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.20; Fri, 12 Jul 2019 14:56:06 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2073.008; Fri, 12 Jul 2019
 14:56:06 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v3 5/6] ASoC: Define a set of DAPM pre/post-up events
Thread-Index: AQHVOMHu58gu7Z1sXEawL2V8p9gffg==
Date: Fri, 12 Jul 2019 14:56:06 +0000
Message-ID: <20190712145550.27500-6-oleksandr.suvorov@toradex.com>
References: <20190712145550.27500-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190712145550.27500-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::34) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19715c05-5ce0-48fb-1752-08d706d91126
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB5508; 
x-ms-traffictypediagnostic: AM6PR05MB5508:
x-microsoft-antispam-prvs: <AM6PR05MB5508BEDACCBEACB4D9E98DD3F9F20@AM6PR05MB5508.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39850400004)(376002)(346002)(396003)(136003)(199004)(189003)(102836004)(186003)(66476007)(52116002)(305945005)(26005)(66946007)(64756008)(66446008)(6506007)(5660300002)(6436002)(86362001)(478600001)(1411001)(66556008)(53936002)(8676002)(4744005)(386003)(7736002)(316002)(76176011)(66066001)(1076003)(6916009)(54906003)(99286004)(50226002)(14454004)(36756003)(71200400001)(71190400001)(68736007)(6116002)(3846002)(486006)(6512007)(2616005)(6486002)(2906002)(44832011)(11346002)(446003)(8936002)(81166006)(81156014)(4326008)(476003)(256004)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB5508;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Yp/S9zrAq7GkLEFXHx4zjrjlmqe+vLdyBJcKq1rKZE6ZG9cSoXZY6OW2W1VaGDP0w/WufaZk1TQ1PpTtjzCNs3hn+Z8ApxnNSkw2wkCDFBZnV1wC+EZX+zw0PbpYkZUbHNB//OMOhLEmS0NYYM5AQ3vnxVry2gVA2nREBkBaCFZxkLo6OirqX4GAXqvUIrSzQfCCBcJi8ntvIhsjZf/jZTtEeNo+qxKujhesZOBR3rlTHS3lMB8AylGa+lpHTcCmxJuY443pfbf1NzqABtYqmYnNFC6Pc1/MA3lcHODFlHny6O6+eUSSMyRzVyvilqVC3sSktT5TrW3RJ+3ObmOkNf451s8VJMB2IBP+NveXfX4oS6t0o9M7u8R4YDSYJLS1vXM6C19VV6EmXKTQIufeIIynZ2ZzNyQJsw0sOE892OI=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19715c05-5ce0-48fb-1752-08d706d91126
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 14:56:06.2782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5508
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v3 5/6] ASoC: Define a set of DAPM pre/post-up
	events
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Prepare to use SND_SOC_DAPM_PRE_POST_PMU definition to
reduce coming code size and make it more readable.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>

---

Changes in v3: None
Changes in v2:
- Fix patch formatting

 include/sound/soc-dapm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index c00a0b8ade086..6c66941601307 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -353,6 +353,8 @@ struct device;
 #define SND_SOC_DAPM_WILL_PMD   0x80    /* called at start of sequence */
 #define SND_SOC_DAPM_PRE_POST_PMD \
 				(SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD)
+#define SND_SOC_DAPM_PRE_POST_PMU \
+				(SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU)
 
 /* convenience event type detection */
 #define SND_SOC_DAPM_EVENT_ON(e)	\
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
