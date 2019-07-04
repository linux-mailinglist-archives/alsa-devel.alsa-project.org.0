Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 652515F8A6
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 14:57:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0238816AF;
	Thu,  4 Jul 2019 14:57:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0238816AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562245076;
	bh=ngVnNBcrSe2W6naSgfTM7ZppI9DOJYy9RNRCKztHNSI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Q0fbV4ZgREYljRTJ69WR9Dvlx+duuGzxAn45HG7IX2wlHKoSARS2zHmT8D1Bm6bDH
	 eDWat2mKgYWeW6DXzDXbblkB2v4XtF+P0qM6xdiVKkNxFIvkufoynQZ1RGITrwL2Di
	 e//7FVvJqih5ZWWMJNF1sUq/9c6tXWJpZOln3U4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0653F80135;
	Thu,  4 Jul 2019 14:54:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11B02F80111; Thu,  4 Jul 2019 14:52:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF763F800E8
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 14:52:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF763F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="AG2BVr8q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JI4hawTdUSmn5Sy9V9yzG2jCKT/6+1+Gh5LHTNR4T7Q=;
 b=AG2BVr8qCazOECARhphbfRjwQ9MA0yRhg0r8CT6R5QKM9x+XhxHv3G34eY3/UwkG7XN0WeHkis8zKK8ApOXowFjWiqsBACPYAyzVwKVLGPwI/G4+RbAODgqZcIaH6V8J2BxSGcn3LyvuufHtC0J8ZEqZnu1jIJ8Q2TusCwBGKTM=
Received: from VI1PR0401MB2640.eurprd04.prod.outlook.com (10.168.61.135) by
 VI1PR0401MB2637.eurprd04.prod.outlook.com (10.168.61.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Thu, 4 Jul 2019 12:52:02 +0000
Received: from VI1PR0401MB2640.eurprd04.prod.outlook.com
 ([fe80::c048:28f0:3bc2:f708]) by VI1PR0401MB2640.eurprd04.prod.outlook.com
 ([fe80::c048:28f0:3bc2:f708%6]) with mapi id 15.20.2032.019; Thu, 4 Jul 2019
 12:52:02 +0000
From: Irina Patru <ioana-irina.patru@nxp.com>
To: Viorel Suman <viorel.suman@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Thread-Topic: [PATCH] MLK-22197 sound: asoc: add micfil dc remover amixer
 control
Thread-Index: AQHVMmdGkhP8uUk46U+4u9g/h8BbSw==
Date: Thu, 4 Jul 2019 12:52:02 +0000
Message-ID: <20190704125133.1463-1-ioana-irina.patru@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: AM5PR0701CA0002.eurprd07.prod.outlook.com
 (2603:10a6:203:51::12) To VI1PR0401MB2640.eurprd04.prod.outlook.com
 (2603:10a6:800:4f::7)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ioana-irina.patru@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 232b5d45-0169-46ae-ff75-08d7007e68ed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR0401MB2637; 
x-ms-traffictypediagnostic: VI1PR0401MB2637:
x-microsoft-antispam-prvs: <VI1PR0401MB263762164E2FDBC6C334DBCBA7FA0@VI1PR0401MB2637.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:454;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(189003)(199004)(316002)(2616005)(110136005)(52116002)(54906003)(6436002)(486006)(66066001)(186003)(6512007)(6116002)(3846002)(68736007)(50226002)(476003)(53936002)(386003)(6506007)(305945005)(6486002)(6636002)(102836004)(256004)(14444005)(26005)(99286004)(14454004)(8936002)(71190400001)(71200400001)(478600001)(2906002)(7736002)(66446008)(73956011)(66946007)(66476007)(66556008)(64756008)(8676002)(36756003)(25786009)(81166006)(5660300002)(86362001)(1076003)(81156014)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0401MB2637;
 H:VI1PR0401MB2640.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LpX9G1elzIEoke2WgGKNg6vVUVWqu5fIaDnSbRS9l78HsnTVOzVeUhH4ZnzsWK2qBq/ZyrhsgmUpFaB7M5/8VhfDAGWklGUIsydrNA7v7/p+Bn3XuLcX79knTH4NL0c6yueJTuSVOgNDO0OCKuhNRM/Y3aPLo14RDMlNo3KttO1ud/l+pRAeIXj/Hsb/G6YiDy90spaPz7JxhP+bnaK+pWup35hltbwl5yU8noFMZ59ei0rpLRvrdQjlzRhv6jrL256UEijbluPZ7+jBHhY3VJ8O4DOOoOC9wY8hYdubehhVocRa9eDKYGfmVICmqguS3ich94h+oX0hGaeCG7b45av8C3QjkHYbhDgnU9XJm1VOQwjU0MoR8kHslRfu/nnnkPArMc700nMZbYxc6pT9EZOu35abKuMFAIhhMfvAgi0=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 232b5d45-0169-46ae-ff75-08d7007e68ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 12:52:02.5494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ioana-irina.patru@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2637
X-Mailman-Approved-At: Thu, 04 Jul 2019 14:54:43 +0200
Cc: Irina Patru <ioana-irina.patru@nxp.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 LnxRevLi <LnxRevLi@nxp.com>
Subject: [alsa-devel] [PATCH] MLK-22197 sound: asoc: add micfil dc remover
	amixer control
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

Add control for DC Remover Control register:
11b - DC Remover is bypassed
00b - DC Remover is cut-off at 21Hz
01b - DC Remover is cut-off at 83Hz
10b - DC Remover is cut-off at 152Hz

This control modifies DC mode for all channels. For more
information see DC Remover Block Diagram in  micfil
reference manual.

Signed-off-by: Irina Patru <ioana-irina.patru@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 59 ++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_micfil.h | 10 +++++++
 2 files changed, 69 insertions(+)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 7bb8d4cb5f71..2eaf9fda4865 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -45,6 +45,7 @@ struct fsl_micfil {
 	bool slave_mode;
 	int channel_gain[8];
 	int clk_src_id;
+	int dc_remover;
 	int vad_sound_gain;
 	int vad_noise_gain;
 	int vad_input_gain;
@@ -140,6 +141,17 @@ static const char * const micfil_clk_src_texts[] = {
 	"Auto", "AudioPLL1", "AudioPLL2", "ExtClk3",
 };
 
+/* DC Remover Control
+ * Filter Bypassed	1 1
+ * Cut-off @21Hz	0 0
+ * Cut-off @83Hz	0 1
+ * Cut-off @152HZ	1 0
+ */
+static const char * const micfil_dc_remover_texts[] = {
+	"Cut-off @21Hz", "Cut-off @83Hz",
+	"Cut-off @152Hz", "Bypass",
+};
+
 static const struct soc_enum fsl_micfil_quality_enum =
 	SOC_ENUM_SINGLE(REG_MICFIL_CTRL2,
 			MICFIL_CTRL2_QSEL_SHIFT,
@@ -168,6 +180,10 @@ static const struct soc_enum fsl_micfil_hwvad_rate_enum =
 static const struct soc_enum fsl_micfil_clk_src_enum =
 	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(micfil_clk_src_texts),
 			    micfil_clk_src_texts);
+static const struct soc_enum fsl_micfil_dc_remover_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(micfil_dc_remover_texts),
+				micfil_dc_remover_texts);
+
 
 static int micfil_put_clk_src(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
@@ -194,6 +210,45 @@ static int micfil_get_clk_src(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int micfil_put_dc_remover_state(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(comp);
+	unsigned int *item = ucontrol->value.enumerated.item;
+	int val = snd_soc_enum_item_to_val(e, item[0]);
+	int i = 0, ret = 0;
+	u32 reg_val = 0;
+
+	if (val < 0 || val > 3)
+		return -1;
+	micfil->dc_remover = val;
+
+	/* Calculate total value for all channels */
+	for (i = 0; i < 8; i++)
+		reg_val |= MICFIL_DC_MODE(val, i);
+
+	/* Update DC Remover mode for all channels */
+	ret = snd_soc_component_update_bits(comp,
+					REG_MICFIL_DC_CTRL,
+					MICFIL_DC_CTRL_MASK,
+					reg_val);
+	return ret;
+}
+
+static int micfil_get_dc_remover_state(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+	struct fsl_micfil *micfil = snd_soc_component_get_drvdata(comp);
+
+	ucontrol->value.enumerated.item[0] = micfil->dc_remover;
+
+	return 0;
+}
+
+
 static int hwvad_put_init_mode(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
@@ -676,6 +731,10 @@ static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
 	SOC_ENUM_EXT("Clock Source",
 		     fsl_micfil_clk_src_enum,
 		     micfil_get_clk_src, micfil_put_clk_src),
+	SOC_ENUM_EXT("MICFIL DC Remover Control",
+			fsl_micfil_dc_remover_enum,
+			micfil_get_dc_remover_state,
+			micfil_put_dc_remover_state),
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "HWVAD Input Gain",
diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
index 792187b717f0..e47dba9b90b8 100644
--- a/sound/soc/fsl/fsl_micfil.h
+++ b/sound/soc/fsl/fsl_micfil.h
@@ -278,6 +278,16 @@
 #define MICFIL_HWVAD_HPF_102HZ		3
 #define MICFIL_HWVAD_FRAMET_DEFAULT	10
 
+/* MICFIL DC Remover Control Register -- REG_MICFIL_DC_CTRL */
+#define MICFIL_DC_CTRL_SHIFT		0
+#define MICFIL_DC_CTRL_MASK			0xFFFF
+#define MICFIL_DC_CTRL_WIDTH		2
+#define MICFIL_DC_CHX_SHIFT(v)		(2 * (v))
+#define MICFIL_DC_CHX_MASK(v)		((BIT(MICFIL_DC_CTRL_WIDTH) - 1) \
+				<< MICFIL_DC_CHX_SHIFT(v))
+#define MICFIL_DC_MODE(v1, v2)		(((v1) << MICFIL_DC_CHX_SHIFT(v2)) \
+				& MICFIL_DC_CHX_MASK(v2))
+
 /* MICFIL Output Control Register */
 #define MICFIL_OUTGAIN_CHX_SHIFT(v)	(4 * (v))
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
