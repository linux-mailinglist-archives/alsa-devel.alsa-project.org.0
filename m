Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 042EE6BFB0
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jul 2019 18:35:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 851D116A5;
	Wed, 17 Jul 2019 18:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 851D116A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563381355;
	bh=u/6RVwFldttNTOOjy1g2bB5C3Boi2mXaw51hEJwVuzI=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UUzsezQHanN41mCkhtQnVoRF9bwTIFki+H2LipwZva7AU8CkYiczeUE+8qxKNMaBE
	 rqvHErnC+ESOIHNO0FYLcyIK87C+78VGtRCYI9utOhmaT3bnTlrUnFExHnWw/6yb+J
	 k0q0eG83N2Dgcf9wyEnw44+M92mG96cMLPNfkZ3A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 381B3F80482;
	Wed, 17 Jul 2019 18:31:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCE08F80445; Wed, 17 Jul 2019 18:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60098.outbound.protection.outlook.com [40.107.6.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19CC1F803F3
 for <alsa-devel@alsa-project.org>; Wed, 17 Jul 2019 18:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19CC1F803F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="nTSftXk0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WfUWOxiMah6hHVBClnLs8r/xvLJ0KKfts/nncIgxpRnDOIbtMezL8fZBTcnTwdgumoaJnBGE/pU0+PQ763NgG8/w7MNQCfs7i4yXLWNprPqZtjfz49x1zjRazQhdjcDfzOM6QHGJUykAzj25vNcDAJk0ony0j1Us2dgRkHrFtpszGcpQY1d3KDkHzXkd24nSg6ED8Eme8CtiVzjpdCte54A4c0sPg7MO/cqeeLQU7FeDZRlStvawPYGgvXNb8nR53ww1smheDsg+8K+RMlLlQ6vrD5MZHwcp/0OlfMl+trURNOcGYc9R2Stx6WNob6/3aJ2pObKqCvylq260Bo83lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIrw0DsoEBE/Kyv7xQZQW02YH1iJP6RtEkaPNFXINpY=;
 b=H5rq02AkQVSaPKDZvcSlpKUxdotRyWfkalfDJ1NKz42/FbHBA1UE8O2AVpzzUC8WbaMRVIHJhIHNCZYenXGln5nTFE5s564vxdyrVHq3pb08UdLZgttxuJq13AyXGoNMReKmzMeAegLSFUWR1ttITVluJscnuH1F/Mzdwb4V18uqRhPbVIe5aY9aqV+D5OF0VV8F7Jj4at+SPsmyOw//n74NScGKfiUD3lwBjvNxyr1zrL1CXWOGzAVAD8HbH1K5xQp+WwIqndYdu9krL2lD56yNHp7utxQ3Puxy1wu3hSUDwrhjAin7c/h5y8IZtLn6fVIBnUJY9AoYjJY+wpwZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CIrw0DsoEBE/Kyv7xQZQW02YH1iJP6RtEkaPNFXINpY=;
 b=nTSftXk0G2vplLUCa+WUvw2bilnfqburZw3fhr3Jv36vMZI0Lea3g6f/HST2HYVJKwUpxlevWVD8wn083ZT9Jb8/uAez7BxUSpBUXQATvO91Haludo4zuVUApzmh6FaaWjVRGyH572xGIjO0c4Pcrrstrb9Q38PCgCpwo1TN9D4=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB4455.eurprd05.prod.outlook.com (52.135.162.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Wed, 17 Jul 2019 16:30:53 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.011; Wed, 17 Jul 2019
 16:30:53 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v4 5/6] ASoC: sgtl5000: Fix of unmute outputs on probe
Thread-Index: AQHVPL0APvMXuyYKqEmMI8DZ4RRwwA==
Date: Wed, 17 Jul 2019 16:30:53 +0000
Message-ID: <20190717163014.429-6-oleksandr.suvorov@toradex.com>
References: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190717163014.429-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR0202CA0006.eurprd02.prod.outlook.com
 (2603:10a6:200:89::16) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d173b83-7225-47c7-15bd-08d70ad422d3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB4455; 
x-ms-traffictypediagnostic: AM6PR05MB4455:
x-microsoft-antispam-prvs: <AM6PR05MB4455514BE87F70FEF72630C2F9C90@AM6PR05MB4455.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(189003)(199004)(7736002)(4326008)(6916009)(478600001)(66556008)(66476007)(66446008)(81166006)(5660300002)(50226002)(305945005)(66946007)(71190400001)(64756008)(66066001)(71200400001)(1076003)(8936002)(2616005)(6436002)(81156014)(256004)(476003)(2906002)(8676002)(446003)(11346002)(14444005)(3846002)(52116002)(53936002)(44832011)(186003)(486006)(99286004)(102836004)(6506007)(386003)(76176011)(1411001)(26005)(68736007)(36756003)(86362001)(14454004)(25786009)(316002)(6512007)(54906003)(6486002)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB4455;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7XK7MH4SDC+j5Kn9t5ZIPzC0te5xwJZ+t6EprXqbDcL8FwKbWt9bSXbwraCHS7ghY9wqOkalyIkHY0/+3OMgYjdcVkmZPIHy3HBdqXAXeJVrlrWe2UWfZqg2CGNb4Bpu0PA3R2F8QnLfJJbK63C1wE5NmmgZM5n3PAqPe3EYKw80fclL8krpIXACnHMGrWSi3pb/gzate0kF20I2bDx8IV0L7VlyAmvZ0X3a4LapWLXhyfXdPYaXe6lU13Ii02XBbr0BfttrVNuvb65Ye23Dve5IrzsesG48PjG/wKci3AOCbY9Si1tg4H1e2N4ppLpUgsP04nsWZ1iq38VEHAAvXduMEgScw7bw1sBx/gQc1n9429vIwsRNwMhF+5PXbgFH1VHbytokdfDLF0mzePS/tKwFSEUsMXGiDTq+k60XDLk=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d173b83-7225-47c7-15bd-08d70ad422d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 16:30:53.0747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4455
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v4 5/6] ASoC: sgtl5000: Fix of unmute outputs
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
