Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5865257A
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 09:55:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62FEB1677;
	Tue, 25 Jun 2019 09:54:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62FEB1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561449347;
	bh=Gppt+nMHSI/LHNFXw5SlgK6t74mZVKtwdgILfObt5iU=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AyKXw0vNOaQFSDjjp6jyZymWS4QFP/LWrFUenjGo10EssZIFSqUieN6E4Bm4C9cvY
	 VLWF+HTfZYbCMpYa+LZhogVPXcIstD3F/mTYHDfXJExgim80SqKkxVMrb0hJEQ2BsJ
	 orBk8xiqh++9ZEFnOkZ05JTBkrMi0wqDlrbCuFwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54490F89749;
	Tue, 25 Jun 2019 09:50:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DEB4F89731; Tue, 25 Jun 2019 09:50:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140137.outbound.protection.outlook.com [40.107.14.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5E4EF89719
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 09:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5E4EF89719
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="Zl6qnbqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxFY9FFtPp2Oc06t8dNQ4Sc83o+ecTZNPFSLh8StZao=;
 b=Zl6qnbqtlGZInjf42AE5UyVNbPxgT7Cl6vdWW6kOpS+L9Ol5wOcxSpPINd/gyrNHnmBzGDZibOsK4H7RG0bcg3Z99go3kVmXpYH1tyNC9Mq+3q80jewixoI6RlfBkob0HXBBUG8uf4yeW9ng2stIbJD3sHIay0Tj0EELaIf58Qc=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB5352.eurprd05.prod.outlook.com (20.177.197.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Tue, 25 Jun 2019 07:49:56 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::2c23:fdba:9ce4:7397]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::2c23:fdba:9ce4:7397%7]) with mapi id 15.20.2008.007; Tue, 25 Jun 2019
 07:49:56 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Thread-Topic: [PATCH v2 6/6] ASoC: sgtl5000: Improve VAG power and mute control
Thread-Index: AQHVKyqUql0vzju0UkSHkCtX1cvVEg==
Date: Tue, 25 Jun 2019 07:49:55 +0000
Message-ID: <20190625074937.2621-7-oleksandr.suvorov@toradex.com>
References: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190625074937.2621-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0080.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::21) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db2b49b0-66a4-4cf3-3fe8-08d6f941b6ee
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB5352; 
x-ms-traffictypediagnostic: AM6PR05MB5352:
x-microsoft-antispam-prvs: <AM6PR05MB53522AAAD2C358DDCCC5F169F9E30@AM6PR05MB5352.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(396003)(136003)(39850400004)(376002)(199004)(189003)(26005)(5660300002)(1076003)(54906003)(71190400001)(1411001)(71200400001)(2906002)(36756003)(305945005)(86362001)(53936002)(6486002)(8676002)(478600001)(6512007)(25786009)(50226002)(14454004)(6436002)(6116002)(3846002)(7736002)(316002)(68736007)(44832011)(486006)(476003)(2616005)(66556008)(81166006)(4326008)(6916009)(256004)(66476007)(81156014)(64756008)(66446008)(8936002)(66946007)(73956011)(14444005)(386003)(102836004)(6506007)(52116002)(11346002)(446003)(76176011)(99286004)(186003)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB5352;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fh69sYwzs+ldoR7MrDlolLqEk4Csuq88k98xfSJxGnriMEHZ61qv5Iv1VxheREF0OiuEnf1gurPSuFYe5wgEfWFPVY4UTLv0+NGVLzTkXEH9kVyGL6C0DYRQPzOgIEDLqYN6PfNBJjDl0pIpmYuhvR92mqmDA+8lNT/iDcDhL2aJ27gVMH342/KOXTBScR6L2IBu+Qjm2fVxNkDtiE8RPmDW07+6A3aUfWi6WE3nvaW0/BpG/C1v+D6PU2rP/Af2pbdJxM8/4790AEgFYGtPJcjceKZ+61R60CTBRLApw6ohdShNzovZxyTcM4VQUVm9zj/nKEV0hvd77Eld3zXDBQ44S/+grp5AV80TiyQ1WIDCLwnhyBW+Lv1nqliGGCJiQWxDiVxfG2XIx2gHq1ZnGKk7xZC8eO2uX0T6yHLfc9I=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2b49b0-66a4-4cf3-3fe8-08d6f941b6ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 07:49:55.8760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5352
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH v2 6/6] ASoC: sgtl5000: Improve VAG power and
	mute control
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

Change VAG power on/off control according to the following algorithm:
- turn VAG power ON on the 1st incoming event.
- keep it ON if there is any active VAG consumer (ADC/DAC/HP/Line-In).
- turn VAG power OFF when there is the latest consumer's pre-down event
  come.
- always delay after VAG power OFF to avoid pop.
- delay after VAG power ON if the initiative consumer is Line-In, this
  prevents pop during line-in muxing.

Also, according to the manual, to avoid any pops/clicks,
the outputs should be muted during input/output
routing changes.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

 sound/soc/codecs/sgtl5000.c | 227 +++++++++++++++++++++++++++++++-----
 1 file changed, 195 insertions(+), 32 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index ee1e4bf613227..acfbd5cdf936e 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -31,6 +31,13 @@
 #define SGTL5000_DAP_REG_OFFSET	0x0100
 #define SGTL5000_MAX_REG_OFFSET	0x013A
 
+/* Delay for the VAG ramp up */
+#define SGTL5000_VAG_POWERUP_DELAY 500 /* ms */
+/* Delay for the VAG ramp down */
+#define SGTL5000_VAG_POWERDOWN_DELAY 500 /* ms */
+
+#define SGTL5000_OUTPUTS_MUTE (SGTL5000_HP_MUTE | SGTL5000_LINE_OUT_MUTE)
+
 /* default value of sgtl5000 registers */
 static const struct reg_default sgtl5000_reg_defaults[] = {
 	{ SGTL5000_CHIP_DIG_POWER,		0x0000 },
@@ -123,6 +130,18 @@ enum  {
 	I2S_SCLK_STRENGTH_HIGH,
 };
 
+enum {
+	HP_POWER_EVENT,
+	DAC_POWER_EVENT,
+	ADC_POWER_EVENT
+};
+
+struct sgtl5000_mute_state {
+	u16 hp_event;
+	u16 dac_event;
+	u16 adc_event;
+};
+
 /* sgtl5000 private structure in codec */
 struct sgtl5000_priv {
 	int sysclk;	/* sysclk rate */
@@ -137,8 +156,109 @@ struct sgtl5000_priv {
 	u8 micbias_voltage;
 	u8 lrclk_strength;
 	u8 sclk_strength;
+	struct sgtl5000_mute_state mute_state;
 };
 
+static inline int hp_sel_input(struct snd_soc_component *component)
+{
+	return (snd_soc_component_read32(component, SGTL5000_CHIP_ANA_CTRL) &
+		SGTL5000_HP_SEL_MASK) >> SGTL5000_HP_SEL_SHIFT;
+}
+
+static inline u16 mute_output(struct snd_soc_component *component,
+			      u16 mute_mask)
+{
+	u16 mute_reg = snd_soc_component_read32(component,
+					      SGTL5000_CHIP_ANA_CTRL);
+
+	snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_CTRL,
+			    mute_mask, mute_mask);
+	return mute_reg;
+}
+
+static inline void restore_output(struct snd_soc_component *component,
+				  u16 mute_mask, u16 mute_reg)
+{
+	snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_CTRL,
+		mute_mask, mute_reg);
+}
+
+static void vag_power_on(struct snd_soc_component *component, u32 source)
+{
+	if (snd_soc_component_read32(component, SGTL5000_CHIP_ANA_POWER) &
+	    SGTL5000_VAG_POWERUP)
+		return;
+
+	snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_POWER,
+			    SGTL5000_VAG_POWERUP, SGTL5000_VAG_POWERUP);
+
+	/* When VAG powering on to get local loop from Line-In, the sleep
+	 * is required to avoid loud pop.
+	 */
+	if (hp_sel_input(component) == SGTL5000_HP_SEL_LINE_IN &&
+	    source == HP_POWER_EVENT)
+		msleep(SGTL5000_VAG_POWERUP_DELAY);
+}
+
+static int vag_power_consumers(struct snd_soc_component *component,
+			       u16 ana_pwr_reg, u32 source)
+{
+	int consumers = 0;
+
+	/* count dac/adc consumers unconditional */
+	if (ana_pwr_reg & SGTL5000_DAC_POWERUP)
+		consumers++;
+	if (ana_pwr_reg & SGTL5000_ADC_POWERUP)
+		consumers++;
+
+	/*
+	 * If the event comes from HP and Line-In is selected,
+	 * current action is 'DAC to be powered down'.
+	 * As HP_POWERUP is not set when HP muxed to line-in,
+	 * we need to keep VAG power ON.
+	 */
+	if (source == HP_POWER_EVENT) {
+		if (hp_sel_input(component) == SGTL5000_HP_SEL_LINE_IN)
+			consumers++;
+	} else {
+		if (ana_pwr_reg & SGTL5000_HP_POWERUP)
+			consumers++;
+	}
+
+	return consumers;
+}
+
+static void vag_power_off(struct snd_soc_component *component, u32 source)
+{
+	u16 ana_pwr = snd_soc_component_read32(component,
+					     SGTL5000_CHIP_ANA_POWER);
+
+	if (!(ana_pwr & SGTL5000_VAG_POWERUP))
+		return;
+
+	/*
+	 * This function calls when any of VAG power consumers is disappearing.
+	 * Thus, if there is more than one consumer at the moment, as minimum
+	 * one consumer will definitely stay after the end of the current
+	 * event.
+	 * Don't clear VAG_POWERUP if 2 or more consumers of VAG present:
+	 * - LINE_IN (for HP events) / HP (for DAC/ADC events)
+	 * - DAC
+	 * - ADC
+	 * (the current consumer is disappearing right now)
+	 */
+	if (vag_power_consumers(component, ana_pwr, source) >= 2)
+		return;
+
+	snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_POWER,
+		SGTL5000_VAG_POWERUP, 0);
+	/* In power down case, we need wait 400-1000 ms
+	 * when VAG fully ramped down.
+	 * As longer we wait, as smaller pop we've got.
+	 */
+	msleep(SGTL5000_VAG_POWERDOWN_DELAY);
+}
+
 /*
  * mic_bias power on/off share the same register bits with
  * output impedance of mic bias, when power on mic bias, we
@@ -170,40 +290,79 @@ static int mic_bias_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-/*
- * As manual described, ADC/DAC only works when VAG powerup,
- * So enabled VAG before ADC/DAC up.
- * In power down case, we need wait 400ms when vag fully ramped down.
- */
-static int power_vag_event(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *kcontrol, int event)
+static void vag_and_mute_control(struct snd_soc_component *component,
+				 int event, int event_source,
+				 u16 mute_mask, u16 *mute_reg)
 {
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	const u32 mask = SGTL5000_DAC_POWERUP | SGTL5000_ADC_POWERUP;
-
 	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
-		snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_POWER,
-			SGTL5000_VAG_POWERUP, SGTL5000_VAG_POWERUP);
-		msleep(400);
+	case SND_SOC_DAPM_PRE_PMU:
+		*mute_reg = mute_output(component, mute_mask);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		vag_power_on(component, event_source);
+		restore_output(component, mute_mask, *mute_reg);
 		break;
-
 	case SND_SOC_DAPM_PRE_PMD:
-		/*
-		 * Don't clear VAG_POWERUP, when both DAC and ADC are
-		 * operational to prevent inadvertently starving the
-		 * other one of them.
-		 */
-		if ((snd_soc_component_read32(component, SGTL5000_CHIP_ANA_POWER) &
-				mask) != mask) {
-			snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_POWER,
-				SGTL5000_VAG_POWERUP, 0);
-			msleep(400);
-		}
+		*mute_reg = mute_output(component, mute_mask);
+		vag_power_off(component, event_source);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		restore_output(component, mute_mask, *mute_reg);
 		break;
 	default:
 		break;
 	}
+}
+
+/*
+ * Mute Headphone when power it up/down.
+ * Control VAG power on HP power path.
+ */
+static int headphone_pga_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct sgtl5000_priv *sgtl5000 =
+		snd_soc_component_get_drvdata(component);
+
+	vag_and_mute_control(component, event, HP_POWER_EVENT,
+			     SGTL5000_HP_MUTE,
+			     &sgtl5000->mute_state.hp_event);
+
+	return 0;
+}
+
+/* As manual describes, ADC/DAC powering up/down requires
+ * to mute outputs to avoid pops.
+ * Control VAG power on ADC/DAC power path.
+ */
+static int adc_updown_depop(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct sgtl5000_priv *sgtl5000 =
+		snd_soc_component_get_drvdata(component);
+
+	vag_and_mute_control(component, event, ADC_POWER_EVENT,
+			     SGTL5000_OUTPUTS_MUTE,
+			     &sgtl5000->mute_state.adc_event);
+
+	return 0;
+}
+
+static int dac_updown_depop(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct sgtl5000_priv *sgtl5000 =
+		snd_soc_component_get_drvdata(component);
+
+	vag_and_mute_control(component, event, DAC_POWER_EVENT,
+			     SGTL5000_OUTPUTS_MUTE,
+			     &sgtl5000->mute_state.dac_event);
 
 	return 0;
 }
@@ -280,7 +439,10 @@ static const struct snd_soc_dapm_widget sgtl5000_dapm_widgets[] = {
 			    mic_bias_event,
 			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 
-	SND_SOC_DAPM_PGA("HP", SGTL5000_CHIP_ANA_POWER, 4, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_E("HP", SGTL5000_CHIP_ANA_POWER, 4, 0, NULL, 0,
+			   headphone_pga_event,
+			   SND_SOC_DAPM_PRE_POST_PMU |
+			   SND_SOC_DAPM_PRE_POST_PMD),
 	SND_SOC_DAPM_PGA("LO", SGTL5000_CHIP_ANA_POWER, 0, 0, NULL, 0),
 
 	SND_SOC_DAPM_MUX("Capture Mux", SND_SOC_NOPM, 0, 0, &adc_mux),
@@ -301,11 +463,12 @@ static const struct snd_soc_dapm_widget sgtl5000_dapm_widgets[] = {
 				0, SGTL5000_CHIP_DIG_POWER,
 				1, 0),
 
-	SND_SOC_DAPM_ADC("ADC", "Capture", SGTL5000_CHIP_ANA_POWER, 1, 0),
-	SND_SOC_DAPM_DAC("DAC", "Playback", SGTL5000_CHIP_ANA_POWER, 3, 0),
-
-	SND_SOC_DAPM_PRE("VAG_POWER_PRE", power_vag_event),
-	SND_SOC_DAPM_POST("VAG_POWER_POST", power_vag_event),
+	SND_SOC_DAPM_ADC_E("ADC", "Capture", SGTL5000_CHIP_ANA_POWER, 1, 0,
+			   adc_updown_depop, SND_SOC_DAPM_PRE_POST_PMU |
+			   SND_SOC_DAPM_PRE_POST_PMD),
+	SND_SOC_DAPM_DAC_E("DAC", "Playback", SGTL5000_CHIP_ANA_POWER, 3, 0,
+			   dac_updown_depop, SND_SOC_DAPM_PRE_POST_PMU |
+			   SND_SOC_DAPM_PRE_POST_PMD),
 };
 
 /* routes for sgtl5000 */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
