Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A129DD1149
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 16:31:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36D6F166B;
	Wed,  9 Oct 2019 16:30:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36D6F166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570631476;
	bh=7sy8oEKF99ST7m7dK3z/QmgDp1AUIr+qYfmHNd32y3I=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H9sV2S2zD9aqpSlsuqF+GXuePboaok1WYWkds2vMTVsvLo2COW48uFzU+S+eUpPzf
	 GjuVGZMAyBsB/x1eKmBk+2awR1U9AWvM9K+Vzt4KJlFjHY5/ms4Ae+YAC7o8NdQ1Lj
	 x4CdJOVs2VqYjThSiwGxHOAqqT4GRcC8WpjLTXzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35B01F802BE;
	Wed,  9 Oct 2019 16:29:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84CC9F802FB; Wed,  9 Oct 2019 16:29:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70129.outbound.protection.outlook.com [40.107.7.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FFEBF800AE
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 16:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FFEBF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="IRYK9JqW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eChznSHDK/BPeED0gmV9bouQ52HNysszjgvSmgYpqwCunk7sPf1hvJ3w6FvHdyqKVe7RFPv30+PJVwFfv/rWxvmKfL9Ouj9ZX3LMsTpDErnnFiDGH8DmZpX2NZdz8hnIU25cIZcJB/zeTLtRxLeZKq3Kq/0tmsYfsfR3bvIEFtoD2GhGMJnvt4xFRJJO/tdFHQMiWRjPAZXLM/NyIeICYJzK4OpaJZwvRDZ4LGQMxh1anQO8lXVh7NaIk+pbq8tQvfMM1QHAfdYTfJJsVzDaV24z0GZT2PV7vToOmuJD+hPMHMtX/F30+t3Q/RkcO6qVGk+IQ8Dngi9vCLFpGvQnug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gk8AG3qKuRsuIMYjn869Uf2zCoMbcqW55wnY+ApUiiM=;
 b=MikQpiBe9MBeYkvjapYLK4AFcXuyqEitCf5MB2tNcqmbtSYnQDxbWuSAf44EXvzCggkssc2tq2kVq9+kxNjruVREUMMVlVfQOOmMoFy6kKUkdZap07VPrgZqRqXuIY4feD6ZQIcN1N/1Cn1vmLnaeI9Jh9jeEc3tdP+dPvq84//JEdikZcmBESw9hpqDSUY3YkXLCaBsbSsIUO/LRQv7vELesmM7DtRyXpXi+K632rXLp/3IeJ8/2ypTWZqhuG0/YDdsxQGfZT4Hl5DJ01WmsCujqyMbA9t+S6nFFUXLilPxMs8FEzAoXE7dSDOiWvzpGpkQ/t95PBIt2yiY+Oibsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gk8AG3qKuRsuIMYjn869Uf2zCoMbcqW55wnY+ApUiiM=;
 b=IRYK9JqWLiULFnxDMqNI93M0DLu5qjTpcOikrnDibY33eCLtH5lLAOcMqcXsz95q2Q1IcxJHrY/0F6AaSZ2WXbmD7cTeb0uzgaYsw/iqBeANVSoOQRvUt5HdJZjy77ntuoLLGI40YRwO0ZxUoifL55NLh3EyUvkzi3miIRuc8I4=
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.212) by
 AM6PR05MB6582.eurprd05.prod.outlook.com (20.179.7.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 9 Oct 2019 14:29:41 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c9f9:f21d:d401:7f35]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c9f9:f21d:d401:7f35%5]) with mapi id 15.20.2347.016; Wed, 9 Oct 2019
 14:29:41 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
Thread-Topic: [PATCH 1/1] ASoC: sgtl5000: Improve VAG power and mute control
Thread-Index: AQHVfq38ih3nz15oy0qN94yWfTlkWw==
Date: Wed, 9 Oct 2019 14:29:41 +0000
Message-ID: <20191009142822.14808-2-oleksandr.suvorov@toradex.com>
References: <20191009142822.14808-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20191009142822.14808-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR07CA0019.eurprd07.prod.outlook.com
 (2603:10a6:205:1::32) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:74::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a9f6b7c-67cd-4c33-83ac-08d74cc51f40
x-ms-traffictypediagnostic: AM6PR05MB6582:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB6582AC223115F7C7BFEFD7BDF9950@AM6PR05MB6582.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:248;
x-forefront-prvs: 018577E36E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(366004)(376002)(346002)(39850400004)(199004)(189003)(81156014)(386003)(6506007)(30864003)(2906002)(1730700003)(305945005)(5660300002)(476003)(7736002)(2351001)(14454004)(6512007)(6306002)(8936002)(7416002)(81166006)(99286004)(50226002)(76176011)(486006)(11346002)(446003)(44832011)(2616005)(71190400001)(6916009)(8676002)(102836004)(26005)(71200400001)(1076003)(86362001)(186003)(52116002)(6116002)(3846002)(256004)(478600001)(966005)(14444005)(54906003)(2501003)(36756003)(316002)(5640700003)(6486002)(66066001)(4326008)(66476007)(66556008)(64756008)(66446008)(25786009)(6436002)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB6582;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rvg5ySEy/mupCjg4AtAquRB0DTIhe2hoHaXabh8+H8Ksk0LpFbWglucQgn4NIy9zbVLo7z0eNo6cASfn5gwsMe0qO57CxWHrnVn42K2btDE6DjzEljRksl/XlojAl/u8qZquVd6eV2zcfO/fdrFmpX+MKy3Z8gV8YocoAOrcbElgclt4MRtyBKLvD+s3p+cjzDmVz4JPlhnkHBXMXnWUhZ2yOC55eogdAY7Fucw7TuE5Cd8hUHGH9e59ew2vtVdJmQhPQlQq3E2DLZckKq+4G4FU7ASItDfJL6rXc5Gxoasj5Uc0wM2poEeK33KPp+lQBLrwb37SgNhoMTPbJZJNUT/Fl8+sJabNcmIgNsr9o3n0WYYeNvw3OZPK2Lyw3SfGi8dnPIwRsQ53dmDRxXtzxvuIhbvVXKePKI0EENQwD9QWX/qoycg5EmwobhbRn2ZxSqnZtInWtzuRr4nIL27VlA==
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9f6b7c-67cd-4c33-83ac-08d74cc51f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2019 14:29:41.4123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Xk1f0eWC3+GG9GAUXGUmw7MzTo89fDwsSXP3sSLZrOikEKIino9OTdVtaUbkZWtZ4Fkpax57gchPqUoDfXBWI/0lM4bidIN51iyf2wXxtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB6582
Cc: Sasha Levin <sashal@kernel.org>, Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Subject: [alsa-devel] [PATCH 1/1] ASoC: sgtl5000: Improve VAG power and mute
	control
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

commit b1f373a11d25 ("ASoC: sgtl5000: Improve VAG power and mute
control") upstream.

VAG power control is improved to fit the manual [1]. This patch fixes as
minimum one bug: if customer muxes Headphone to Line-In right after boot,
the VAG power remains off that leads to poor sound quality from line-in.

I.e. after boot:
  - Connect sound source to Line-In jack;
  - Connect headphone to HP jack;
  - Run following commands:
  $ amixer set 'Headphone' 80%
  $ amixer set 'Headphone Mux' LINE_IN

Change VAG power on/off control according to the following algorithm:
  - turn VAG power ON on the 1st incoming event.
  - keep it ON if there is any active VAG consumer (ADC/DAC/HP/Line-In).
  - turn VAG power OFF when there is the latest consumer's pre-down event
    come.
  - always delay after VAG power OFF to avoid pop.
  - delay after VAG power ON if the initiative consumer is Line-In, this
    prevents pop during line-in muxing.

According to the data sheet [1], to avoid any pops/clicks,
the outputs should be muted upon input/output
routing changes.

[1] https://www.nxp.com/docs/en/data-sheet/SGTL5000.pdf

Cc: stable@vger.kernel.org
Fixes: 9b34e6cc3bc2 ("ASoC: Add Freescale SGTL5000 codec support")
Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
[Backport: Replace snd_soc_component_read32() with snd_soc_component_read()]
Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20190719100524.23300-3-oleksandr.suvorov@toradex.com
Signed-off-by: Mark Brown <broonie@kernel.org>

---

 sound/soc/codecs/sgtl5000.c | 234 +++++++++++++++++++++++++++++++-----
 1 file changed, 203 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index d81ac4e499aa..7406ea5c9a4f 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -35,6 +35,13 @@
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
@@ -99,6 +106,13 @@ enum sgtl5000_micbias_resistor {
 	SGTL5000_MICBIAS_8K = 8,
 };
 
+enum {
+	HP_POWER_EVENT,
+	DAC_POWER_EVENT,
+	ADC_POWER_EVENT,
+	LAST_POWER_EVENT = ADC_POWER_EVENT
+};
+
 /* sgtl5000 private structure in codec */
 struct sgtl5000_priv {
 	int sysclk;	/* sysclk rate */
@@ -111,8 +125,117 @@ struct sgtl5000_priv {
 	int revision;
 	u8 micbias_resistor;
 	u8 micbias_voltage;
+	u16 mute_state[LAST_POWER_EVENT + 1];
 };
 
+static inline int hp_sel_input(struct snd_soc_component *component)
+{
+	unsigned int ana_reg = 0;
+
+	snd_soc_component_read(component, SGTL5000_CHIP_ANA_CTRL, &ana_reg);
+
+	return (ana_reg & SGTL5000_HP_SEL_MASK) >> SGTL5000_HP_SEL_SHIFT;
+}
+
+static inline u16 mute_output(struct snd_soc_component *component,
+			      u16 mute_mask)
+{
+	unsigned int mute_reg = 0;
+
+	snd_soc_component_read(component, SGTL5000_CHIP_ANA_CTRL, &mute_reg);
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
+	unsigned int ana_reg = 0;
+
+	snd_soc_component_read(component, SGTL5000_CHIP_ANA_POWER, &ana_reg);
+
+	if (ana_reg & SGTL5000_VAG_POWERUP)
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
+	unsigned int ana_pwr = SGTL5000_VAG_POWERUP;
+
+	snd_soc_component_read(component, SGTL5000_CHIP_ANA_POWER, &ana_pwr);
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
@@ -144,36 +267,46 @@ static int mic_bias_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-/*
- * As manual described, ADC/DAC only works when VAG powerup,
- * So enabled VAG before ADC/DAC up.
- * In power down case, we need wait 400ms when vag fully ramped down.
- */
-static int power_vag_event(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *kcontrol, int event)
+static int vag_and_mute_control(struct snd_soc_component *component,
+				 int event, int event_source)
 {
-	struct snd_soc_codec *codec = snd_soc_dapm_to_codec(w->dapm);
-	const u32 mask = SGTL5000_DAC_POWERUP | SGTL5000_ADC_POWERUP;
+	static const u16 mute_mask[] = {
+		/*
+		 * Mask for HP_POWER_EVENT.
+		 * Muxing Headphones have to be wrapped with mute/unmute
+		 * headphones only.
+		 */
+		SGTL5000_HP_MUTE,
+		/*
+		 * Masks for DAC_POWER_EVENT/ADC_POWER_EVENT.
+		 * Muxing DAC or ADC block have to be wrapped with mute/unmute
+		 * both headphones and line-out.
+		 */
+		SGTL5000_OUTPUTS_MUTE,
+		SGTL5000_OUTPUTS_MUTE
+	};
+
+	struct sgtl5000_priv *sgtl5000 =
+		snd_soc_component_get_drvdata(component);
 
 	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
-		snd_soc_update_bits(codec, SGTL5000_CHIP_ANA_POWER,
-			SGTL5000_VAG_POWERUP, SGTL5000_VAG_POWERUP);
-		msleep(400);
+	case SND_SOC_DAPM_PRE_PMU:
+		sgtl5000->mute_state[event_source] =
+			mute_output(component, mute_mask[event_source]);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		vag_power_on(component, event_source);
+		restore_output(component, mute_mask[event_source],
+			       sgtl5000->mute_state[event_source]);
 		break;
-
 	case SND_SOC_DAPM_PRE_PMD:
-		/*
-		 * Don't clear VAG_POWERUP, when both DAC and ADC are
-		 * operational to prevent inadvertently starving the
-		 * other one of them.
-		 */
-		if ((snd_soc_read(codec, SGTL5000_CHIP_ANA_POWER) &
-				mask) != mask) {
-			snd_soc_update_bits(codec, SGTL5000_CHIP_ANA_POWER,
-				SGTL5000_VAG_POWERUP, 0);
-			msleep(400);
-		}
+		sgtl5000->mute_state[event_source] =
+			mute_output(component, mute_mask[event_source]);
+		vag_power_off(component, event_source);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		restore_output(component, mute_mask[event_source],
+			       sgtl5000->mute_state[event_source]);
 		break;
 	default:
 		break;
@@ -182,6 +315,41 @@ static int power_vag_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+/*
+ * Mute Headphone when power it up/down.
+ * Control VAG power on HP power path.
+ */
+static int headphone_pga_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+
+	return vag_and_mute_control(component, event, HP_POWER_EVENT);
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
+
+	return vag_and_mute_control(component, event, ADC_POWER_EVENT);
+}
+
+static int dac_updown_depop(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+
+	return vag_and_mute_control(component, event, DAC_POWER_EVENT);
+}
+
 /* input sources for ADC */
 static const char *adc_mux_text[] = {
 	"MIC_IN", "LINE_IN"
@@ -217,7 +385,10 @@ static const struct snd_soc_dapm_widget sgtl5000_dapm_widgets[] = {
 			    mic_bias_event,
 			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 
-	SND_SOC_DAPM_PGA("HP", SGTL5000_CHIP_ANA_POWER, 4, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_E("HP", SGTL5000_CHIP_ANA_POWER, 4, 0, NULL, 0,
+			   headphone_pga_event,
+			   SND_SOC_DAPM_PRE_POST_PMU |
+			   SND_SOC_DAPM_PRE_POST_PMD),
 	SND_SOC_DAPM_PGA("LO", SGTL5000_CHIP_ANA_POWER, 0, 0, NULL, 0),
 
 	SND_SOC_DAPM_MUX("Capture Mux", SND_SOC_NOPM, 0, 0, &adc_mux),
@@ -233,11 +404,12 @@ static const struct snd_soc_dapm_widget sgtl5000_dapm_widgets[] = {
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
