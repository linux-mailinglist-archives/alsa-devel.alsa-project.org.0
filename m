Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C246C6CB85
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 11:08:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D8A816AA;
	Thu, 18 Jul 2019 11:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D8A816AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563440880;
	bh=Xn7qzQxKdp8FIz+CEQUKi3fiRxHsXQiReJZBEgHwUc4=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aidImWhfqWWYqr1ephpNlAaz4jArXgf5VRiY9a7hMcYEaU2CRAjF+tHM437CN1XZc
	 7N52+TD9+0FGoY+/XuOTYnSXM2e80CVl4WUxKjCT2xKPQTpzQYF6Yyz4tTJPqGFlmv
	 GbWhFSc/N7pRojxNUS+k7jHGqdZKOtzzXa2tKx6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B02AF8048F;
	Thu, 18 Jul 2019 11:03:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BEFBF80448; Thu, 18 Jul 2019 11:03:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150109.outbound.protection.outlook.com [40.107.15.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DF02F803D0
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 11:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DF02F803D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="q8ZRS0jd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYZCc4pgnE1rJWTMDhqhe/0YzEkDME8mJASJdq0HrnrL6isKOUXARCDA6uG6thvFmRASz+6ew+0f6spF2PaBCPZsVaGimK+s/cW0JnrjSV7HtJLP1kdZY5wzw9O+q7MsIcWS8Yc0u4wU6w/46RwiHYhpIXas0+VFw53O87E0jhcqNuYmtdjsPQa9/51yLQwcS4ELZt9+FPRaxxLHBXvp0ZRwDxFBwZaAERpSWCNLpdNeIp/KqSWKGcrsqgDQVZx4P1dtSe4fxjNdRPtrDs8M2Phye2dxZYLcyfZ7HoHeCG+5Qi0xAB89fD9ED+VNbbe8/z+15ajqxRfLVpzYWxZzyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uLXKJYrLvfHg3G7lZuDe0a46kS1kUy/19CYoEhFZ8o=;
 b=djbttD9JIf7mYEpn1d8/SobCzlvVyv3lmxBhJL/grHJ1qRNhCGtrpbARd9OtFWFlqm1aAJzx2JE9ss3GtuVW7QzHOB4XtTPL1mEJtzorOv5t1g5DYi6GjEnCw//3hG2MIqOOLEv2GiVZ0UdXNK0Vz6e70tHbm2WQ2xJyFlvTVECbHpTIkfEtzfrYkhY15gzeyeJ2nPcJIYthepKBqvx94GnGoynqCBo+qAazjkdcRRaGuDLQUxCekkgsmOrm0t84ILkn6Qxnr8QGIcKUm0Xp7vBSQX6DZ85HvwGOcRIXbijrrI9AVw6t7TCMsVZQBfK9QVQ/2fl08O4He2GkjxQ1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uLXKJYrLvfHg3G7lZuDe0a46kS1kUy/19CYoEhFZ8o=;
 b=q8ZRS0jdoMecmlBF7Y1puxynwCSafg0TBSl1nLybxE6kzOif//Bep0fi5e5MUm3MoGU8FerwL94nN5G81MnOqPs1TpV6Phb91mY87kqfOTx0/Ews+S3oJpiDjsLSJxLz96v6ZJb+6VfOsUtvXSh9nagFjnRCobBvYZ89GX3A7FE=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB5013.eurprd05.prod.outlook.com (20.177.35.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 09:02:54 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.011; Thu, 18 Jul 2019
 09:02:54 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v5 5/6] ASoC: sgtl5000: Fix of unmute outputs on probe
Thread-Index: AQHVPUeU/o3Hdj/K5UqwPeiB1Nflkw==
Date: Thu, 18 Jul 2019 09:02:52 +0000
Message-ID: <20190718090240.18432-6-oleksandr.suvorov@toradex.com>
References: <20190718090240.18432-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190718090240.18432-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::14) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b14652e-3b4f-4b88-eb28-08d70b5eb74a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB5013; 
x-ms-traffictypediagnostic: AM6PR05MB5013:
x-microsoft-antispam-prvs: <AM6PR05MB50136BDCF176333C6632F4EBF9C80@AM6PR05MB5013.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(346002)(366004)(376002)(396003)(136003)(199004)(189003)(2616005)(99286004)(68736007)(476003)(446003)(50226002)(11346002)(486006)(86362001)(8936002)(81166006)(76176011)(81156014)(26005)(14454004)(4326008)(186003)(386003)(6506007)(316002)(102836004)(6916009)(54906003)(52116002)(36756003)(6486002)(6436002)(71190400001)(71200400001)(6512007)(25786009)(14444005)(66066001)(256004)(66946007)(64756008)(66476007)(66556008)(66446008)(1076003)(1411001)(5660300002)(8676002)(478600001)(7736002)(44832011)(6116002)(3846002)(305945005)(53936002)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB5013;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uJZ8wbCj5V1wQSomMxF4TN9ZL4E6y3WcyyJGQLp2qPIG+lfweDzCq9Ud9D2igmOLbFLkLJSHNfaN0JxpTVKLJW5dAPhBvui2mr8HH7trn4Dvz8aMT2PkY3Y4BGuEruvVKqja2IxwP74KkB+u/XtmnOGdOeUxQZLmqzeRjUB0ZeuZF5XQDQhGqQy79B4fzXRXr6KLNCr5ItLZyq4G029OSlahdRn+V1pHkmPJ3/C3PG8dAaKRGqsEU0WCwdpz03vHOR0JQXmCSh6P6Fxphh65KRiXsp9grWpng+yTqBmLCVakKU1mr03aUMZFaytSdALCK4cZ+JdxPY6ztqJqDmp4hAtkNTOLleZnUPhMicFc/mV288OJqZpgkudkEcpv/j0ZViGIENE41h4s3sonbPpVdiyARaiTduAWblcyWFq6GvI=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b14652e-3b4f-4b88-eb28-08d70b5eb74a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 09:02:52.7115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5013
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v5 5/6] ASoC: sgtl5000: Fix of unmute outputs
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
Reviewed-by: Fabio Estevam <festevam@gmail.com>

---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- Fix patch formatting

 sound/soc/codecs/sgtl5000.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 0123d9cfcb473..31d546abde717 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1443,6 +1443,7 @@ static int sgtl5000_probe(struct snd_soc_component *component)
 	int ret;
 	u16 reg;
 	struct sgtl5000_priv *sgtl5000 = snd_soc_component_get_drvdata(component);
+	unsigned int zcd_mask = SGTL5000_HP_ZCD_EN | SGTL5000_ADC_ZCD_EN;
 
 	/* power up sgtl5000 */
 	ret = sgtl5000_set_power_regs(component);
@@ -1470,9 +1471,8 @@ static int sgtl5000_probe(struct snd_soc_component *component)
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
