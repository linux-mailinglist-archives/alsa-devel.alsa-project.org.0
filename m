Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B46CB8E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2019 11:08:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3A33168F;
	Thu, 18 Jul 2019 11:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3A33168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563440923;
	bh=6JMeAyR+ZtFFSoQn2UnB2i/iq7xJsDSGhCv78Cyn+Ug=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ND69QrYPlNSRPFCwjVy6u+wtB5WxtSC038z0a/s82JOoMM1xsW8RHbPbSEnwPK4Ir
	 9jxrcv6ftRdAKjblLIoPEF6Pd95GYoTMxKVS3aezZyNHSnHCqhxI7DboTqLn2MBp7a
	 MhOLZzjn0DPcWxNnl/vHorF/UoMlqovpaN1zpjXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A79FF804AA;
	Thu, 18 Jul 2019 11:03:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B66F3F8048D; Thu, 18 Jul 2019 11:03:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150109.outbound.protection.outlook.com [40.107.15.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9998F803D7
 for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2019 11:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9998F803D7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="BU4loIDy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZe3sdMX9hQ9Iv05IKMsNq7N8Bj0I/z8O98wCaF6bWLOxP7EzI8wQNGPqnP7VyG1+sS6c27TpRzCrMDi14Uc2Jy0+PBtGMiGPmF95vPNGX6RGh/SMfdFDmhh7zcN9pYQPlM5i3S/3Cfh6uFpP/DibWuNNXGPTZMnDi6B0giaG6Knkeno/wAW1Ct4qjX2ncJGXObpNTv3GP1Q3nEnclapzh+Pm5kDqid98BtVQfgqH2SG+jH1L8tMVMjhhLS5/dz104g+5HBQLOyosc9KHMph6KqvlOh40q+i2saLfhV0Zp57COG4j2p8IzbEyfnD1dyoDVLyEZ+AdBdqu2Mu7CK3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYc9e8uahuZAcaT3aYVVhZcDDrFl+ic72daQUBU6/S0=;
 b=UzT6VEF8h0bX8lOiKu3OuaHeBlmAgGcQrOOOlPA6As0spDS9KG6NTFqPQP5MOIeEfAiUgl2m3ozCtjU9gCthUuZRAW9gHfAYXB37nxRfZfGJMd40wzD/MA0jr7tuPyVQV2iRUM1+/FNcX/QN4Vk6iZMWLlwIyJP68Txhjaw12Egb2NTqwd3erXUtyEe16Jpp5vSG7zXYH1Cfcm8N96OVeXtvOT/pG2ixIOMCn6rUSUNQIOKYfucgUr8wliuGSP/fyipX4xyF3zatK7Ms7GHeeVYtdMEBttajDQR8hm5VaqHkBkWLvHXMVc6ol9M/6jHOZlLvmdcK7YijbLK4031E+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYc9e8uahuZAcaT3aYVVhZcDDrFl+ic72daQUBU6/S0=;
 b=BU4loIDy0aFyvMtCfkSGO82ZdgWTmpA2T+X3s+sQnxGSMuwPGf8K9I/DJ8oEGiWD9jgfvF8LebV28ztpyXKaPKOzDDEILKeqhxvSIPGF92Bxiwg75jNmXCK/kdJu+z6l9mXorU5VtgXHrYbC1SY7ASg7UH7Lfj4qZ1fFGVLFOS0=
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
Thread-Topic: [PATCH v5 6/6] ASoC: sgtl5000: Fix charge pump source assignment
Thread-Index: AQHVPUeVZISUvwZOT0igggD8Y5/fAQ==
Date: Thu, 18 Jul 2019 09:02:54 +0000
Message-ID: <20190718090240.18432-7-oleksandr.suvorov@toradex.com>
References: <20190718090240.18432-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190718090240.18432-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0084.eurprd05.prod.outlook.com
 (2603:10a6:208:136::24) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 694a4b9a-0f84-4976-4b30-08d70b5eb837
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB5013; 
x-ms-traffictypediagnostic: AM6PR05MB5013:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR05MB501308DDFCF53ED9841CAA30F9C80@AM6PR05MB5013.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39850400004)(346002)(366004)(376002)(396003)(136003)(199004)(189003)(2616005)(99286004)(68736007)(476003)(446003)(50226002)(11346002)(486006)(86362001)(8936002)(81166006)(76176011)(81156014)(26005)(14454004)(4326008)(186003)(386003)(6506007)(316002)(102836004)(6916009)(54906003)(52116002)(36756003)(6486002)(6436002)(71190400001)(71200400001)(6306002)(6512007)(25786009)(66066001)(256004)(966005)(66946007)(64756008)(66476007)(66556008)(66446008)(1076003)(1411001)(5660300002)(8676002)(478600001)(7736002)(44832011)(6116002)(3846002)(305945005)(53936002)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB5013;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HYgO9frOYddaYCVwS2gHQCZjnpEitNPA+QhlGLo2T57XJP6hcsN6gZpiR64j3tIcQ5HsctVjlS1ScgJy3JgOnbVwi3vij3PhnpDATThvaFMF/WAWy6D6FMopg//yQcCV7jkJ40kNPiXfwiIBU9ApIBjpMgG0qS9lqpxJc0ORo2kFg84iHFyN33jBrhKXam50NOQ5Dyw1JT16HZgFQdKNhBFjsji9v3X2GD1OTq1e1zZrbuf0td8nUN90+jm/3WzgHd3jcyjWd0eLrlLDAFdyivI/L3G8P/JGWnBOil+t8FVXB/b+r3BlI18a8RVo5g2iIvCp8RlHAIrjPJI2gM4TDTQdZdsg8pfBO9VZT6cCK/3uPCuZqg5fzj1UwGWQxZGme8mPInsrjw1l0MtlvcAREf9g6bPVE8YzULCBAgAaJyA=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694a4b9a-0f84-4976-4b30-08d70b5eb837
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 09:02:54.2586 (UTC)
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
Subject: [alsa-devel] [PATCH v5 6/6] ASoC: sgtl5000: Fix charge pump source
	assignment
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

If VDDA != VDDIO and any of them is greater than 3.1V, charge pump
source can be assigned automatically [1].

[1] https://www.nxp.com/docs/en/data-sheet/SGTL5000.pdf

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>

---

Changes in v5: None
Changes in v4: None
Changes in v3:
- Add the reference to NXP SGTL5000 data sheet to commit message
- Fix multi-line comment format

Changes in v2:
- Fix patch formatting

 sound/soc/codecs/sgtl5000.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 31d546abde717..a04cba66615de 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1328,12 +1328,17 @@ static int sgtl5000_set_power_regs(struct snd_soc_component *component)
 					SGTL5000_INT_OSC_EN);
 		/* Enable VDDC charge pump */
 		ana_pwr |= SGTL5000_VDDC_CHRGPMP_POWERUP;
-	} else if (vddio >= 3100 && vdda >= 3100) {
+	} else {
 		ana_pwr &= ~SGTL5000_VDDC_CHRGPMP_POWERUP;
-		/* VDDC use VDDIO rail */
-		lreg_ctrl |= SGTL5000_VDDC_ASSN_OVRD;
-		lreg_ctrl |= SGTL5000_VDDC_MAN_ASSN_VDDIO <<
-			    SGTL5000_VDDC_MAN_ASSN_SHIFT;
+		/*
+		 * if vddio == vdda the source of charge pump should be
+		 * assigned manually to VDDIO
+		 */
+		if (vddio == vdda) {
+			lreg_ctrl |= SGTL5000_VDDC_ASSN_OVRD;
+			lreg_ctrl |= SGTL5000_VDDC_MAN_ASSN_VDDIO <<
+				    SGTL5000_VDDC_MAN_ASSN_SHIFT;
+		}
 	}
 
 	snd_soc_component_write(component, SGTL5000_CHIP_LINREG_CTRL, lreg_ctrl);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
