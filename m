Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE946CB80
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 11:06:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B88DC169E;
	Thu, 18 Jul 2019 11:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B88DC169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563440782;
	bh=YvF89ZSaEsxwIOsWRBcpA4gPheJyYIMunr78RrnQbkY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HE8mZIj9M2kujJwrC/frap/XN30gomYpty0NIm3vfoYdIZrCEQPekHXZRQDE9Jj0l
	 f+fr4RT/hwuZCjmInA/E7BYZm/fexA1ySqrcusBIBogk0yUvtBqU0g1OE/OckEPKTu
	 YrFVi9q3TUrB/iQx9Me/C13Dtw42zb081aWIKw6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72923F80444;
	Thu, 18 Jul 2019 11:03:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28B6BF80391; Thu, 18 Jul 2019 11:02:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40095.outbound.protection.outlook.com [40.107.4.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DC1FF800C0
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 11:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DC1FF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="bI1kk/RJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ifz9wzmY5t8VUYDGA0m25e8deF8ohlT0PsQQaTJvjgn+VqRxThRmVCC8jnfG1/FR4+YKGq/1RV52JqQ1Jy6dV1XnqR+Z1HqS1X6gyf85K2vtyOPnXJHvrTmuYEgmWXQfSf4yHbOkQQrtlcSHeGuLH/a4jaKNEyLhJyXzyrAbAZxVDkqO40vNLnurSKleEVZYOgWhizJ8rZnS5RBOG2CZjEO/w1zxQK0dfnAku5JIxJCUVjJS9gyGKmHY2qWQYQQmCF4YCscScidQ4WJc34Gt6VfNXNmrEKZ80goaBsCRoaTDk/Wokn5vCuWPW/c2L2KU60G5QMg6fYwnmyWczFlS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S87Civ+imIotVJnH/pRunGuVH1yWxjeYZ9AM8eXK11s=;
 b=WCZgbzQmymLZtYysWsarwmVpQTC30IHvfEBwLNVmNPna+IrG9/G4KAKzq9mQe+lhKtb48eOdEVFAG9HIMG1bZo6MuYBpdXYC+wVq0dqzyp3CPO4nq/BNIJax5RHjJkm6ZqIL092QL2SXEih0qSG1zH2vCkfirVsteBO6CkOIvNb3VasvIP5WWhPPL6K7iVg10Yk7xqjY5YDPqaS3jHwd73TgTkSWJPsPt5tQGCJnV3qGvZefFBh72oxPCSeJAv5ypsC8rwD/Y/ewaLn9P3UX2Ld7Eb7N9RLuWo47F2Iq5kTMcbBYFt+M96fclRW4fJJvDh2jOmFEuzSNkY11zUFKiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S87Civ+imIotVJnH/pRunGuVH1yWxjeYZ9AM8eXK11s=;
 b=bI1kk/RJZN28IZXceylRPHDFOSEKmuSAYRe2zJT+bHfGmrbgtf4G4M04Kect7Icuj9dthSJ8m6fOYfh1moRv8Yckmf4jGWISZakaLVbYU+F69M80zD451mBbI/DflvfvJ4VvNgLIGMKHdoj/T0sf4NWE5g3ibsf88sJHGJBMA3E=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB5013.eurprd05.prod.outlook.com (20.177.35.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 09:02:45 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.011; Thu, 18 Jul 2019
 09:02:45 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v5 1/6] ASoC: Define a set of DAPM pre/post-up events
Thread-Index: AQHVPUeQIlRxXSX2H0OhdtyVf6Sb7w==
Date: Thu, 18 Jul 2019 09:02:45 +0000
Message-ID: <20190718090240.18432-2-oleksandr.suvorov@toradex.com>
References: <20190718090240.18432-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190718090240.18432-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:14::46) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c76ede34-0c0f-414e-e279-08d70b5eb2fb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB5013; 
x-ms-traffictypediagnostic: AM6PR05MB5013:
x-microsoft-antispam-prvs: <AM6PR05MB5013CB503FA430C3D2A6635AF9C80@AM6PR05MB5013.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(346002)(366004)(376002)(396003)(136003)(199004)(189003)(2616005)(99286004)(68736007)(476003)(446003)(50226002)(11346002)(486006)(86362001)(8936002)(81166006)(76176011)(81156014)(26005)(14454004)(4326008)(186003)(386003)(6506007)(316002)(102836004)(6916009)(54906003)(52116002)(36756003)(6486002)(6436002)(71190400001)(71200400001)(6512007)(25786009)(66066001)(256004)(66946007)(64756008)(66476007)(66556008)(66446008)(1076003)(1411001)(5660300002)(4744005)(8676002)(478600001)(7736002)(44832011)(6116002)(3846002)(305945005)(53936002)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB5013;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d8RjVqcodn8twyL9OeTLVp4nqi97gBaqQK3CBOR7PTmg4itUVDJ5v5rAf/7Vfes+X6eXbsGFmai/uvwGiwGXfLj+FWXzvirbZMQCJ56P/BX7s/UYiLH3LYU8/eEa3XfgwU07bXoKK5xAmfLPxoXSnt99jG9Ctc+Mxg3LVHh01og4P0QZf2eZCnsVEC1kGPzoW//1pIlQmTAuHWHbnHrmQ9gElk62j73nHm4JIexs2pZeiw5zk2FXUbLm/eYKJt67suQ+/7a2Hanh1k7td+lGRVDYQ6uI38hmj94pbdXSILiNSh62nCCOPW5z/TpaQDFnv5Gnm9Rj+TqmWrTCU0BcC93Fk4oBXfXu6bLku0TVy5OOyjfgaR5lqefO+n6WLxtdtTkNngvDFbzMen+e9oEk0Kivby9xipSmAIsC4ypZA24=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c76ede34-0c0f-414e-e279-08d70b5eb2fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 09:02:45.4767 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5013
Cc: Sasha Levin <sashal@kernel.org>, Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v5 1/6] ASoC: Define a set of DAPM pre/post-up
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

Cc: stable@vger.kernel.org
Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>

---

Changes in v5:
- Add explicit stable tag

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
