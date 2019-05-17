Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CE121266
	for <lists+alsa-devel@lfdr.de>; Fri, 17 May 2019 05:11:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFDB616C0;
	Fri, 17 May 2019 05:10:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFDB616C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558062680;
	bh=mgvZKX612A1vHPRalbQF2Ww9z8N5Fgpz0Sky9gCxLCE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hkm+CNE7u9QcnEpdH79FvyHe+ITD++02Ml2CcfkiuLDcR9XQ9lrQBWKGIcesWcqJw
	 6pr9DkM73QbGKRJIOPeRijPdMRsbpdbNuE9lNXKt9hnwImqvbIZN8aimBy5bf34E3O
	 Wg27NiaAuyjDGfH4Stsf18n8mITwrGab4w+DQO0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B3DFF896B8;
	Fri, 17 May 2019 05:09:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EE9EF8968A; Fri, 17 May 2019 05:09:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::618])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6FD4F806E7
 for <alsa-devel@alsa-project.org>; Fri, 17 May 2019 05:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6FD4F806E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="D+8wIcsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0FuCMMzpP/ODHlbwv4mvoBdANto4iRezsdTzITLA1M=;
 b=D+8wIcsJgbRuzBifCHU2ddmWnteXWLpoG0ybWKwGdV26T62Qgsmj5Vcp2lET6MIAW+h5XGmay/lzmjNtZgW/Wq3JELu6jMQx8DpO+cD9ix5BatpwnuvAhrQc421Fl8ZmECnjepBWiH0cmpueY7HzkbdYF2l92TBmxLNbXc0KEP8=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6462.eurprd04.prod.outlook.com (20.179.233.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 03:09:22 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::a5b5:13f5:f89c:9a30%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 03:09:22 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "timur@kernel.org" <timur@kernel.org>, "nicoleotsuka@gmail.com"
 <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH] ASoC: fsl_esai: fix the channel swap issue after xrun
Thread-Index: AQHVDF3seZkwEu4He0GObjqY7EqttQ==
Date: Fri, 17 May 2019 03:09:22 +0000
Message-ID: <20190517030903.25731-1-shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To VE1PR04MB6479.eurprd04.prod.outlook.com
 (2603:10a6:803:11e::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d02c888d-3473-45fe-839a-08d6da750f23
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6462; 
x-ms-traffictypediagnostic: VE1PR04MB6462:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VE1PR04MB6462A0508F4A258D203150ACE30B0@VE1PR04MB6462.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:132;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(396003)(366004)(346002)(136003)(39860400002)(199004)(189003)(71200400001)(110136005)(71190400001)(2501003)(52116002)(50226002)(81166006)(8936002)(102836004)(8676002)(54906003)(316002)(6506007)(386003)(81156014)(6512007)(6306002)(305945005)(7736002)(6116002)(99286004)(3846002)(6436002)(4326008)(25786009)(186003)(5660300002)(66476007)(2201001)(36756003)(53936002)(86362001)(68736007)(66446008)(66556008)(64756008)(66946007)(73956011)(14454004)(486006)(2616005)(476003)(14444005)(256004)(478600001)(26005)(66066001)(6486002)(2906002)(1076003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6462;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yXPrYiIHXB7h/ihjvVjo49a3Sur5qGkFD4mFCZpPhJamuEUCj3eYLvH+35mZqi7Ke121MpEGOxnrRBIKCB6i1cOIW0xAkUjcdRKtBPGcMuin87icz40H358rBm1TMCLqwWXUpq3zcaftOAsTEvQZIVHl3dtXxcXxuNgZJzKy4zFMOxefRV4eDqtd7nT4JIKXOecDkaZKUfG2zO2OpAGsFq8c9NME2OEulNoTgk946fSY5QnGAbIx6b2cLcwqva+6siK2rAgSI8TLu1ZIlnMH0wRGgzQlhlZK6rYNxjkQONTBr9hls5pvagKdTU4QKWchIQz+c/eRE5fTckux96m22Hz6aPWrPtSsyaRcvEydflNac2DxbaK5XO+rZxF9xUjpxPh0j4Id6waTDtJ6XffuNtwHbHaZfbetSn9g68kqkt0=
Content-ID: <CD952D0B5BE728489F6FFD2DDF2D3DA2@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02c888d-3473-45fe-839a-08d6da750f23
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 03:09:22.2356 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6462
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: fsl_esai: fix the channel swap issue
	after xrun
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

There is chip errata ERR008000, the reference doc is
(https://www.nxp.com/docs/en/errata/IMX6DQCE.pdf),

The issue is "While using ESAI transmit or receive and
an underrun/overrun happens, channel swap may occur.
The only recovery mechanism is to reset the ESAI."

In this commit add a tasklet to handle reset of ESAI
after xrun happens

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_esai.c | 166 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 10d2210c91ef..149972894c95 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -52,17 +52,20 @@ struct fsl_esai {
 	struct clk *extalclk;
 	struct clk *fsysclk;
 	struct clk *spbaclk;
+	struct tasklet_struct task;
 	u32 fifo_depth;
 	u32 slot_width;
 	u32 slots;
 	u32 tx_mask;
 	u32 rx_mask;
+	u32 tx_channels;
 	u32 hck_rate[2];
 	u32 sck_rate[2];
 	bool hck_dir[2];
 	bool sck_div[2];
 	bool slave_mode;
 	bool synchronous;
+	bool reset_at_xrun;
 	char name[32];
 };
 
@@ -71,8 +74,14 @@ static irqreturn_t esai_isr(int irq, void *devid)
 	struct fsl_esai *esai_priv = (struct fsl_esai *)devid;
 	struct platform_device *pdev = esai_priv->pdev;
 	u32 esr;
+	u32 saisr;
 
 	regmap_read(esai_priv->regmap, REG_ESAI_ESR, &esr);
+	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
+
+	if ((saisr & (ESAI_SAISR_TUE | ESAI_SAISR_ROE))
+		&& esai_priv->reset_at_xrun)
+		tasklet_schedule(&esai_priv->task);
 
 	if (esr & ESAI_ESR_TINIT_MASK)
 		dev_dbg(&pdev->dev, "isr: Transmission Initialized\n");
@@ -552,6 +561,9 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 	u32 pins = DIV_ROUND_UP(channels, esai_priv->slots);
 	u32 mask;
 
+	if (tx)
+		esai_priv->tx_channels = channels;
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -585,10 +597,16 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 		regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
 				   ESAI_xSMA_xS_MASK, ESAI_xSMA_xS(mask));
 
+		regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
+				   ESAI_xCR_xEIE_MASK, ESAI_xCR_xEIE);
+
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
+				   ESAI_xCR_xEIE_MASK, 0);
+
 		regmap_update_bits(esai_priv->regmap, REG_ESAI_xCR(tx),
 				   tx ? ESAI_xCR_TE_MASK : ESAI_xCR_RE_MASK, 0);
 		regmap_update_bits(esai_priv->regmap, REG_ESAI_xSMA(tx),
@@ -618,6 +636,145 @@ static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
 	.set_tdm_slot = fsl_esai_set_dai_tdm_slot,
 };
 
+static void fsl_esai_reset(unsigned long arg)
+{
+	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
+	u32 saisr;
+	u32 tsma, tsmb, rsma, rsmb, tcr, rcr, tfcr, rfcr;
+	int i;
+
+	/*
+	 * stop the tx & rx
+	 */
+	regmap_read(esai_priv->regmap, REG_ESAI_TSMA, &tsma);
+	regmap_read(esai_priv->regmap, REG_ESAI_TSMB, &tsmb);
+	regmap_read(esai_priv->regmap, REG_ESAI_RSMA, &rsma);
+	regmap_read(esai_priv->regmap, REG_ESAI_RSMB, &rsmb);
+
+	regmap_read(esai_priv->regmap, REG_ESAI_TCR, &tcr);
+	regmap_read(esai_priv->regmap, REG_ESAI_RCR, &rcr);
+
+	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
+	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+				ESAI_xCR_xEIE_MASK | ESAI_xCR_TE_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+				ESAI_xCR_xEIE_MASK | ESAI_xCR_RE_MASK, 0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TSMA,
+				ESAI_xSMA_xS_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TSMB,
+				ESAI_xSMB_xS_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RSMA,
+				ESAI_xSMA_xS_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RSMB,
+				ESAI_xSMB_xS_MASK, 0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
+				ESAI_xFCR_xFR | ESAI_xFCR_xFEN, ESAI_xFCR_xFR);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
+				ESAI_xFCR_xFR, 0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
+				ESAI_xFCR_xFR | ESAI_xFCR_xFEN, ESAI_xFCR_xFR);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
+				ESAI_xFCR_xFR, 0);
+
+	/*
+	 * reset the esai, and restore the registers
+	 */
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_ECR,
+				ESAI_ECR_ESAIEN_MASK | ESAI_ECR_ERST_MASK,
+				ESAI_ECR_ESAIEN | ESAI_ECR_ERST);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_ECR,
+				ESAI_ECR_ESAIEN_MASK | ESAI_ECR_ERST_MASK,
+				ESAI_ECR_ESAIEN);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+				ESAI_xCR_xPR_MASK,
+				ESAI_xCR_xPR);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+				ESAI_xCR_xPR_MASK,
+				ESAI_xCR_xPR);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
+				ESAI_PRRC_PDC_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
+				ESAI_PCRC_PC_MASK, 0);
+
+	/*
+	 * Add fifo reset here, because the regcache_sync will
+	 * write one more data to ETDR.
+	 * Which will cause channel shift.
+	 */
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
+				ESAI_xFCR_xFR_MASK, ESAI_xFCR_xFR);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
+				ESAI_xFCR_xFR_MASK, ESAI_xFCR_xFR);
+
+	regcache_mark_dirty(esai_priv->regmap);
+	regcache_sync(esai_priv->regmap);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
+				ESAI_xFCR_xFR_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
+				ESAI_xFCR_xFR_MASK, 0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+				ESAI_xCR_xPR_MASK, 0);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+				ESAI_xCR_xPR_MASK, 0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PRRC,
+				ESAI_PRRC_PDC_MASK,
+				ESAI_PRRC_PDC(ESAI_GPIO));
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_PCRC,
+				ESAI_PCRC_PC_MASK,
+				ESAI_PCRC_PC(ESAI_GPIO));
+
+	regmap_read(esai_priv->regmap, REG_ESAI_SAISR, &saisr);
+
+	/*
+	 * restart tx / rx, if they already enabled
+	 */
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TFCR,
+				ESAI_xFCR_xFEN_MASK, tfcr & ESAI_xFCR_xFEN);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RFCR,
+				ESAI_xFCR_xFEN_MASK, rfcr & ESAI_xFCR_xFEN);
+
+	/* Write initial words reqiured by ESAI as normal procedure */
+	for (i = 0; i < esai_priv->tx_channels; i++)
+		regmap_write(esai_priv->regmap, REG_ESAI_ETDR, 0x0);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+				ESAI_xCR_TE_MASK,
+				ESAI_xCR_TE_MASK & tcr);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+				ESAI_xCR_RE_MASK,
+				ESAI_xCR_RE_MASK & rcr);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TSMB,
+				ESAI_xSMB_xS_MASK,
+				ESAI_xSMB_xS_MASK & tsmb);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TSMA,
+				ESAI_xSMA_xS_MASK,
+				ESAI_xSMA_xS_MASK & tsma);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RSMB,
+				ESAI_xSMB_xS_MASK,
+				ESAI_xSMB_xS_MASK & rsmb);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RSMA,
+				ESAI_xSMA_xS_MASK,
+				ESAI_xSMA_xS_MASK & rsma);
+
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
+			   ESAI_xCR_xEIE_MASK, ESAI_xCR_xEIE & tcr);
+	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
+			   ESAI_xCR_xEIE_MASK, ESAI_xCR_xEIE & rcr);
+}
+
 static int fsl_esai_dai_probe(struct snd_soc_dai *dai)
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
@@ -787,6 +944,10 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	esai_priv->pdev = pdev;
 	snprintf(esai_priv->name, sizeof(esai_priv->name), "%pOFn", np);
 
+	if (of_device_is_compatible(np, "fsl,vf610-esai") ||
+	    of_device_is_compatible(np, "fsl,imx35-esai"))
+		esai_priv->reset_at_xrun = true;
+
 	/* Get the addresses and IRQ */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(&pdev->dev, res);
@@ -899,6 +1060,8 @@ static int fsl_esai_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	tasklet_init(&esai_priv->task, fsl_esai_reset, (unsigned long)esai_priv);
+
 	pm_runtime_enable(&pdev->dev);
 
 	regcache_cache_only(esai_priv->regmap, true);
@@ -912,7 +1075,10 @@ static int fsl_esai_probe(struct platform_device *pdev)
 
 static int fsl_esai_remove(struct platform_device *pdev)
 {
+	struct fsl_esai *esai_priv = platform_get_drvdata(pdev);
+
 	pm_runtime_disable(&pdev->dev);
+	tasklet_kill(&esai_priv->task);
 
 	return 0;
 }
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
