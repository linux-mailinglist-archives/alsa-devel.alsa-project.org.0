Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8701B671CD
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jul 2019 16:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 234E41667;
	Fri, 12 Jul 2019 16:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 234E41667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562943577;
	bh=WLLtdrMtRMFL9JLhhfAz4Q+m5BaR3TPmHBImC/wMbUo=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TJ2cJOuz9vaxEa2Pc/bY7H4mShQv3PpvkKTdjnmrmxXrdrJlhPL3OKsolmQz+eamA
	 6kTiYVR0drmQ5sZxWycZONuvL/U8yHk7yECvr4UenxNfoIGNTH/tOoFk95A8qnR32j
	 Qm/e9chePYHRLz4rnXs5x8duuck69kBC7oa4zWEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CAD8F8036D;
	Fri, 12 Jul 2019 16:56:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71758F80323; Fri, 12 Jul 2019 16:56:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PDS_NO_HELO_DNS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00094.outbound.protection.outlook.com [40.107.0.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68FDDF802A0
 for <alsa-devel@alsa-project.org>; Fri, 12 Jul 2019 16:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68FDDF802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="oAambMlY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QyiS0kgHHxaf+ecZLJsqlwUzDprXVyxPmn7TCjSXpo=;
 b=oAambMlYrfxdQ4HGgfHCK/ZaujF/q1l7DzZHKKnTTmfhsHfvOZhWQl0OklBzTC04GqQZmszM9Ud2c2WRhwVJvHCTtnjjB1MdjROUuElP9t7vb4BA27AFHFdSQNHGEVBmRxpczJb4tBVyk4W49JwNVj4tCpXFrVROCvBnWvz98cE=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB5508.eurprd05.prod.outlook.com (20.177.119.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.20; Fri, 12 Jul 2019 14:56:03 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2073.008; Fri, 12 Jul 2019
 14:56:03 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v3 3/6] ASoC: sgtl5000: Fix of unmute outputs on probe
Thread-Index: AQHVOMHs0C27s3Y6sk2L0C84XH8y3w==
Date: Fri, 12 Jul 2019 14:56:03 +0000
Message-ID: <20190712145550.27500-4-oleksandr.suvorov@toradex.com>
References: <20190712145550.27500-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190712145550.27500-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0202CA0036.eurprd02.prod.outlook.com
 (2603:10a6:208:1::49) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 041d7bfa-7233-415a-bd9f-08d706d90f5c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB5508; 
x-ms-traffictypediagnostic: AM6PR05MB5508:
x-microsoft-antispam-prvs: <AM6PR05MB55084A0B57CE03AAA6FE95EDF9F20@AM6PR05MB5508.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 00963989E5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(39850400004)(376002)(346002)(396003)(136003)(199004)(189003)(102836004)(186003)(66476007)(52116002)(305945005)(26005)(66946007)(64756008)(66446008)(6506007)(5660300002)(6436002)(86362001)(478600001)(1411001)(66556008)(53936002)(8676002)(386003)(7736002)(316002)(76176011)(66066001)(1076003)(6916009)(54906003)(99286004)(50226002)(14454004)(36756003)(71200400001)(71190400001)(68736007)(6116002)(3846002)(486006)(6512007)(2616005)(6486002)(2906002)(44832011)(11346002)(446003)(8936002)(81166006)(81156014)(4326008)(476003)(256004)(14444005)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB5508;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WloXpiUXsiSiE0BG3xZEOx7LeCjKhRZsS4VUIE/XKDJEtSx6975S/WKWeMF6RT++BHq1Gif/Sm8VXM9MnNe4DJH3+2BPmpkmjkvOPzz9zk+7qEpS6xxrtEZpqybUr2HLGKJXIt0jdj/34U9Dle2442codgIi5gJaJ4Yldf+1dYhQhAG1KAL3OJ1SWjD3V6k41a7j168RBXVJHcPwU/7qdicug3zxIxR/DP7DFNpwig7DdIwh1CrSk0AHL9tb7Y+TexCe5ZpyVVDdxPCm2xwgePsUI7e7rWELNfTv1ZCc2cRV1GMEyclH+lUZaejHznuBCUY/TaakvGWXp1C1sWOfd1oslp0IK/nzq4y3e5wCGiP8MYGKAbOVT/wV8947RBk/leDSNZbrhAGZZCmYQ/I0g0R0cEtWix9IXIWGJAWQ8Pw=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041d7bfa-7233-415a-bd9f-08d706d90f5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2019 14:56:03.2779 (UTC)
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
Subject: [alsa-devel] [PATCH v3 3/6] ASoC: sgtl5000: Fix of unmute outputs
	on probe
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

To enable "zero cross detect" for ADC/HP, change
HP_ZCD_EN/ADC_ZCD_EN bits only instead of writing the whole
CHIP_ANA_CTRL register.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>

---

Changes in v3: None
Changes in v2:
- Fix patch formatting

 sound/soc/codecs/sgtl5000.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index bb58c997c6914..e813a37910af4 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1289,6 +1289,7 @@ static int sgtl5000_probe(struct snd_soc_component *component)
 	int ret;
 	u16 reg;
 	struct sgtl5000_priv *sgtl5000 = snd_soc_component_get_drvdata(component);
+	unsigned int zcd_mask = SGTL5000_HP_ZCD_EN | SGTL5000_ADC_ZCD_EN;
 
 	/* power up sgtl5000 */
 	ret = sgtl5000_set_power_regs(component);
@@ -1316,9 +1317,8 @@ static int sgtl5000_probe(struct snd_soc_component *component)
 	       0x1f);
 	snd_soc_component_write(component, SGTL5000_CHIP_PAD_STRENGTH, reg);
 
-	snd_soc_component_write(component, SGTL5000_CHIP_ANA_CTRL,
-			SGTL5000_HP_ZCD_EN |
-			SGTL5000_ADC_ZCD_EN);
+	snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_CTRL,
+		zcd_mask, zcd_mask);
 
 	snd_soc_component_update_bits(component, SGTL5000_CHIP_MIC_CTRL,
 			SGTL5000_BIAS_R_MASK,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
