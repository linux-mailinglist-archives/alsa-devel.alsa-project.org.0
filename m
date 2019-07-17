Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5B16BFAB
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 18:33:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8A8D1695;
	Wed, 17 Jul 2019 18:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8A8D1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563381195;
	bh=r3GjKQMUqOWC1eBDaUk5LD0UOD3O6DOuLimOTUpM5x8=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dXwvrDpyEvarlbphm/hperAtGug5RQfn6BrfDyoIhRj9+sHtkHkLZE7cX6/s3KDha
	 /wHMD0X5k0zkPX74mq09sDDY7/Uh1ez60fufSfQkwMPBPnt1XCIvUU2Rw6JxVUYLsL
	 vAkfcYDUty7AxBVJUiR0eqvwPyMalWtSLmOXCqXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFD51F803CF;
	Wed, 17 Jul 2019 18:30:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFAEAF80367; Wed, 17 Jul 2019 18:30:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe07::70a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 428A0F80228
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 18:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 428A0F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="jCvqkDRC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=og+RGvyTyiNwi6GX+3YZr03BMTnKRHLsc3X9hup24wA8gRVsS+uK51D1aMgPVuGk4MNgqDbJmhbDswtIrObM1wTiaMiwRksfsxxrrsM1QUpvDVzRnd1bq+FzKMLpBoNFKu+imZDb4CfBiUL6E+9R1K/4X69N8hr6/I4qbb9R2w5MiaXCmi8+xwOTc4j45SJCKEzLBypQz2BqqGzB3JKlC3+HpKagp0un/JiVsed8wXuNcVof+uR2EmjSGPuGb/DTVOPuQwsI0+WR7MsliOLoeuKZOv3Yjk/oGR3OA3pYZpgh7wYr64pfT7OUz/2W7PqQMP4KqKVUywTTjW5FVPWEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2UXyMi9DYe+ul0wF8SP426L4Srsrjmy/9dcjFCM2jA=;
 b=SvHvPex5pAWXt5A7kUlhKfjKgOSzaimsQsah3GgbgJ57bHCXW5tGRXFNuitSjf9C+pvZ+hjB2CyYurNIS/qTE8L4NkpSx9ub69sBTm18Nz6HvG0niRyQezyYF2PNfkyZ0SkuBu4VDS2exxmTrryOM+577VyY9CheAcaK4tWwvD4B1AnXT31sMFj4BqVkt/hQAHA61WHUHbjk1t/XgSg1UW63CLf36zyhaxbvn/LzE5APjZTzuV9S5omkw5JavPn3GCxfw6o3GcLutw2fvquGBaj59TgLFahRjWeaStm26aBYEfbX2Ag6heUKseIVIXlJB5OsBWouFgJjImYgy0Bx3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2UXyMi9DYe+ul0wF8SP426L4Srsrjmy/9dcjFCM2jA=;
 b=jCvqkDRCIWd1oPRjY7j/gpcoxqZWbrbNVrmYcbto6WTKJwfvf+rEYMIeHafNOnnPRtCQzmpR+3sBalXfBGhJWxkoBsMFtgrUcWagNCzUy4/QdLu92XvSXoG2W+EiTPFBz5A1wzwvOF9Rnk3Jacfv/R7QRHl2JRxJ0bTC+8hXG4Q=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB6408.eurprd05.prod.outlook.com (20.179.6.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 16:30:40 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 16:30:40 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v4 1/6] ASoC: Define a set of DAPM pre/post-up events
Thread-Index: AQHVPLz4I2peC5u/q0ONqoJMqxCAfQ==
Date: Wed, 17 Jul 2019 16:30:40 +0000
Message-ID: <20190717163014.429-2-oleksandr.suvorov@toradex.com>
References: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0202CA0001.eurprd02.prod.outlook.com
 (2603:10a6:200:89::11) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2b052f8-35dc-48ea-5460-08d70ad41b40
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB6408; 
x-ms-traffictypediagnostic: AM6PR05MB6408:
x-microsoft-antispam-prvs: <AM6PR05MB64088BE6176B49F732C7B578F9C90@AM6PR05MB6408.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(189003)(199004)(486006)(305945005)(7736002)(2616005)(11346002)(476003)(446003)(1076003)(52116002)(36756003)(53936002)(66066001)(81156014)(81166006)(71200400001)(8676002)(6436002)(4744005)(6512007)(50226002)(8936002)(256004)(71190400001)(4326008)(3846002)(44832011)(6486002)(68736007)(14454004)(6116002)(2906002)(316002)(5660300002)(1411001)(99286004)(478600001)(66476007)(66556008)(64756008)(66446008)(66946007)(76176011)(86362001)(6916009)(6506007)(102836004)(386003)(26005)(186003)(54906003)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB6408;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CnRA2phoJVoUe3lDqRmYC5IF8kcpUTpITrYAYzefnTbJlbyewZ3j0V41tKqJSoreWyAYLJcC1uBgsUE1+GSOypeY1zWTr83GYRCoXj/WvYPtfYuZPVY/E3ykExbZdYkNxV/l+L2RykQ9uNh4O47tRFvGK5mfMN6rKSsnQ012cE/N2ySArINbHHWnEgKnX4HUKiUbb14DECw5Tygop3EmHqp6kyl9sVTv8Rq5vf8kXmzrY036p3cQsrHhGTZEnuz3FO8+BR/YZr9AVt9nhAXxK6Z8uaLYX0XnCjU7mnNnTUsx5yhsc2kEgpsyC0rJ3H7dItfcy9e//iuy/4Sg6JcfD6DmWYZ4apzyQzpOBVUNaOldstYRmWmnirYnmO1E+xqaD0D7LcZ06jI9zjm0PdK9FUtmd4/nvvnjEEhbxC/7Io8=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b052f8-35dc-48ea-5460-08d70ad41b40
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 16:30:40.4698 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB6408
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v4 1/6] ASoC: Define a set of DAPM pre/post-up
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

Changes in v4:
- CC the patch to kernel-stable

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
