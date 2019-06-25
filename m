Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6998052563
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 09:53:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7E4F1664;
	Tue, 25 Jun 2019 09:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7E4F1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561449188;
	bh=D/O/9rJjjloxgHwd3zy898TAv2f5qsD/JcxjcTKXNjY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QPx9ibYtD8os2XnryVfiQedajL/31QFqu5hjgO2dDimh+r8mUfZfUBtPZQMtlvRwR
	 BghJvbTHDykrRpQRDQkgoPDO7yvXUANGPrInC2J+sU5arK/MX+B5M+fxX2AODCILDH
	 OEG2cak3mph71Zf2u37vd+FU9u981gZLK38kBM3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EBDBF89733;
	Tue, 25 Jun 2019 09:50:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 821DAF89719; Tue, 25 Jun 2019 09:49:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40102.outbound.protection.outlook.com [40.107.4.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FBEDF896F0
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 09:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FBEDF896F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="tByNCMOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA6JBJb6oWxZQN8cj41AYPnn1HGbKv2UuwLOigCxT4o=;
 b=tByNCMORj3IF9EmbsjewuOMAK0+noyH8RLinZ/J2aVzTxlMze+AfnkE5SHabH9JZBomM5dQT8g5kRf2NoQBenjTtnunmx6w+PH4T8pqfp+Rm/xoKlYguS6pgFjnMvDHeraVKF7XnxKrxIZOtKZq2HUqTeoT0eOtPjfdNZJjyWho=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB4150.eurprd05.prod.outlook.com (52.135.161.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 07:49:50 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::2c23:fdba:9ce4:7397]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::2c23:fdba:9ce4:7397%7]) with mapi id 15.20.2008.007; Tue, 25 Jun 2019
 07:49:49 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v2 2/6] ASoC: sgtl5000: add ADC mute control
Thread-Index: AQHVKyqRcZ04ncDZBUW/bJGcuQuzmw==
Date: Tue, 25 Jun 2019 07:49:49 +0000
Message-ID: <20190625074937.2621-3-oleksandr.suvorov@toradex.com>
References: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0402CA0035.eurprd04.prod.outlook.com
 (2603:10a6:208:15::48) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e6064a5-867d-4716-0659-08d6f941b35a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB4150; 
x-ms-traffictypediagnostic: AM6PR05MB4150:
x-microsoft-antispam-prvs: <AM6PR05MB4150F79D7B316AAE8CA31400F9E30@AM6PR05MB4150.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:669;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(39850400004)(136003)(346002)(376002)(189003)(199004)(6436002)(86362001)(8936002)(6116002)(3846002)(186003)(6486002)(81166006)(81156014)(446003)(102836004)(6506007)(386003)(26005)(486006)(2616005)(11346002)(478600001)(44832011)(8676002)(476003)(305945005)(71190400001)(7736002)(6512007)(54906003)(2906002)(316002)(4326008)(68736007)(71200400001)(66066001)(53936002)(25786009)(50226002)(66946007)(36756003)(73956011)(64756008)(66446008)(14454004)(66556008)(1076003)(66476007)(4744005)(6916009)(5660300002)(52116002)(76176011)(99286004)(256004)(1411001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB4150;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FgKBrGWsHlyXSjqSkXA2jhegJfKn/kQMLHPhSyaMQ9eXlnh0boGHHZQINXzmmIFJcrZBx6hf4H1b88GUc0MMP1AS00sxXz1oBnnDUYwQZy9CfHUqTK8gAfdOGeEkpg8glzN1AuyCbHXDy6eMAtCLQq0jMBRehn+nIsL66yO/qsasCxHxOZLlh2nP++AW1tt0ihpCYft7C+yZFzess0D+eF3UzWiQFGZEezlimCDjQ0jSHkpmvlN/zSNUFDkQm59FoCoTgntmfgIF0isTmleogsMWhwyHloAGQM+xRti3z4hVHyI1GpG+uLQvL77dSJXQi2vPhpu5DBm1wJkr/bN5Qh9QxfFIcDcSjSF5PgpDfmISmNFXTY0VF+FSMtJHE2GE/NVaL5FGXdgNqS+SQDIpajrTl8bV3hAiQs77ILt16Pg=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6064a5-867d-4716-0659-08d6f941b35a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 07:49:49.9374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4150
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v2 2/6] ASoC: sgtl5000: add ADC mute control
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

This control mute/unmute the ADC input of SGTL5000
using its CHIP_ANA_CTRL register.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

 sound/soc/codecs/sgtl5000.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 5e49523ee0b67..bb58c997c6914 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -556,6 +556,7 @@ static const struct snd_kcontrol_new sgtl5000_snd_controls[] = {
 			SGTL5000_CHIP_ANA_ADC_CTRL,
 			8, 1, 0, capture_6db_attenuate),
 	SOC_SINGLE("Capture ZC Switch", SGTL5000_CHIP_ANA_CTRL, 1, 1, 0),
+	SOC_SINGLE("Capture Switch", SGTL5000_CHIP_ANA_CTRL, 0, 1, 1),
 
 	SOC_DOUBLE_TLV("Headphone Playback Volume",
 			SGTL5000_CHIP_ANA_HP_CTRL,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
