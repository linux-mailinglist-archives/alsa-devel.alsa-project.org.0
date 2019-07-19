Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 368CE6E3F7
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Jul 2019 12:09:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC73E168C;
	Fri, 19 Jul 2019 12:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC73E168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563530996;
	bh=GtHznw1+LfLKZBRz1BKRL8DCGd4Ec4B0X8YZqMPePPs=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WQDcVF66jXV+WriheufZAMTx0uIn5CzDqPypPBiAnrV+SrL2EOmqmwfwptTnm9BhT
	 RjeJgqNzNPtAZQlg8f1GjQikLpEAIZXSowTf4Pz2kRJRbt6GXY1bfLFmzJ+rZROx8B
	 wgFqL9eefXyvYGA2UbO0DYP2noArRO1Fg+xs2kkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA1A3F8045D;
	Fri, 19 Jul 2019 12:05:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2683EF803D6; Fri, 19 Jul 2019 12:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40101.outbound.protection.outlook.com [40.107.4.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C61E7F80369
 for <alsa-devel@alsa-project.org>; Fri, 19 Jul 2019 12:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C61E7F80369
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="J/sRy4uC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5UgrP1u/MqJ7gpV1x4YF9bApi9AIFIG/e62ykFGdrlxrA8HtonBfHwTMP/awd51ivqnnEFKwv/JR6Ow0JkTfbPByY80gIbBr+cxEDJNtnRLY+rYImXhxQ1MPRR3VL/eINShn155PLFqWFxF9Mnm/GuJF8gN+VUWBoaEwg1Wi4BHWx8tt2e/KpuBG44x5ot4o3AIsdQNMZhvRkOKzJN+LpBYsmqnMkcBF3UgJ0uJ3QXcmQ41JbdHbwW4jgH4zxocY3kOmGWZzhO94oNPa6aqYQP23XAL6KOHqSE+iJJUdTYOcxDDHUck5o8etPr2IEGk4PO+cWdqCAwL7CB81gfuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ne9/66fzNnqSrx7C88pPEdCm0f/kRbSaQoxLFDwHnY=;
 b=NKOh129T3mh0QizRbbYSMaOZ/vy4bra3NC5ImkoKUmZoWeZ9fPwTipK7FLey/n56MkOJSDRaQVA5F+ubHAeAkOn8OuezuVT4hpUwJNhLe4E2GdCRG53b7WoxF62pX2qdBt16zUV4lqNiVTi7pwROIqS3IUuNNt58q1ixVx+F18bX2+IM5oIwIkbhghKfpRhds5b4Gq0pzakfV2BQGBl+S8mA/JoJPNdg7P5GCaT41iE99EXQ/GqnXfA1zyL7g1eUPA5E47dI4JmyPTPaMT7ZHgpdpfwh5BLnEBu1LNT2mayt4CPyDiwOZzJ7+wznYTaCj0lwKGeSieIWDJfKwZaw+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ne9/66fzNnqSrx7C88pPEdCm0f/kRbSaQoxLFDwHnY=;
 b=J/sRy4uC6bJr+F668hNnBTFcNSvjDsG85p1ZoDxAQcXabJZrF725f4m9vQp2R5F+bH0I0pILpyLF+8fIX2bhZzPNaWTmpDnBjDIth1Z406sn69BZpHQKS8r8f+sr8PdgFH5mK4/gFW8LTRVZBobtCPrFbCp+qSMiG1RqO2eeCec=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB5925.eurprd05.prod.outlook.com (20.179.0.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Fri, 19 Jul 2019 10:05:34 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.011; Fri, 19 Jul 2019
 10:05:34 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v6 4/6] ASoC: sgtl5000: add ADC mute control
Thread-Index: AQHVPhmB+ZcOy3sA7kOKlGoQrxM/0g==
Date: Fri, 19 Jul 2019 10:05:34 +0000
Message-ID: <20190719100524.23300-5-oleksandr.suvorov@toradex.com>
References: <20190719100524.23300-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190719100524.23300-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0093.eurprd05.prod.outlook.com
 (2603:10a6:208:136::33) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6181830d-fc35-4aab-b83a-08d70c30a3fb
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB5925; 
x-ms-traffictypediagnostic: AM6PR05MB5925:
x-microsoft-antispam-prvs: <AM6PR05MB5925D99B5BF46DA46A7F395FF9CB0@AM6PR05MB5925.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39840400004)(396003)(136003)(376002)(366004)(346002)(199004)(189003)(14454004)(68736007)(8676002)(50226002)(6486002)(8936002)(54906003)(305945005)(7736002)(71190400001)(71200400001)(6436002)(81156014)(186003)(99286004)(66476007)(66446008)(66556008)(64756008)(1411001)(81166006)(2906002)(476003)(36756003)(66946007)(446003)(256004)(6512007)(86362001)(6916009)(26005)(478600001)(66066001)(11346002)(52116002)(53936002)(486006)(76176011)(2616005)(25786009)(1076003)(6506007)(4326008)(44832011)(3846002)(6116002)(316002)(4744005)(5660300002)(102836004)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB5925;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TbbxHtuFyzW1mB0UnLBRshDWJuuDCC9i6G1VYjI8Utvyp6LLAcb7ctQRbRAh5P6+HeqzMhdM7aLjS0s74bBOysJ+yuuWQG6aAmz/wzqhOjxoIumJQFran1gcepKzJfcTm0FxtvrB6xMZ/T035CbCyiG1LBK+I/HQrUejshsUja7xzkmvhA6BLqN/GPns3pgkTRlU4DtisnA8TOoLKx5AMLjUFJoSd6DM1tFs6lJyXtlc/ZapRwolZf+lOhtWeFo60xOPeV/VNGUfYlaI+1ZXnCgqGUu7aIx7IzG4PjuSLSICNwGhtiF7yqlt+/iVOXtH00VJ7yoAuMQStlq9cK1gz/kC8XuMss5SuQZwuJyg6f8CmkCx06zTmTqJgnnSe88PnzL18p2RZnk41MXljrEFgxp5JePT4HXdE5ZTIPQsf9M=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6181830d-fc35-4aab-b83a-08d70c30a3fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 10:05:34.6840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5925
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v6 4/6] ASoC: sgtl5000: add ADC mute control
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
Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>

---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2:
- Fix patch formatting

 sound/soc/codecs/sgtl5000.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 3f28e7862b5b..b65232521ea8 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -720,6 +720,7 @@ static const struct snd_kcontrol_new sgtl5000_snd_controls[] = {
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
