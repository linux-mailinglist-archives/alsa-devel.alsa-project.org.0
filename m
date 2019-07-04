Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEBC5F912
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 15:24:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2639169A;
	Thu,  4 Jul 2019 15:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2639169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562246662;
	bh=GrVEtc2poB9LlDRoPl2pbnXjgJYd28RvAVxxQ+hRmHs=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=e3f/KrMkGaMN6mukTdTTqsDUTrMsGZAM5RNuYV+sPzgUztz+xUv8THrQHQSc2J5G5
	 fyn1nSA13ViiLLXuabhoUIOdeDajVBzIfIzXtCdU57xTVP060cJO8D44JUqbrG8+fR
	 ioThbHYFUbDFHILdhExZb0MUbrP5hQhUdu+ypIZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2043DF80110;
	Thu,  4 Jul 2019 15:22:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27568F80111; Thu,  4 Jul 2019 15:22:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_PASS autolearn=disabled version=3.4.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::620])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 844C8F800E8
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 15:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 844C8F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="a9gbvUJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJryFDwq8H2Aam3U5xF7TwHACw2c1dFvYQbYJxrdd6s=;
 b=a9gbvUJZP8rCKau9USu3wUiunV0zzBa84KjXthZDX6meoNrVfKrMjqLnCHtmQqmIAoU9rm8trThwj8xS2YbcjQ80fXXLKVLDQe+79YLH0IdIzBzeRb/AUvoVby10l2sM2j15UDFOaR+cXUOpYTTCphnSDG/nUq7mxfQ/VlD4upQ=
Received: from VI1PR04MB4704.eurprd04.prod.outlook.com (20.177.48.157) by
 VI1PR04MB3311.eurprd04.prod.outlook.com (10.170.231.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Thu, 4 Jul 2019 13:22:30 +0000
Received: from VI1PR04MB4704.eurprd04.prod.outlook.com
 ([fe80::64ff:c835:2165:3c3d]) by VI1PR04MB4704.eurprd04.prod.outlook.com
 ([fe80::64ff:c835:2165:3c3d%4]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 13:22:30 +0000
From: Viorel Suman <viorel.suman@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, Irina Patru
 <ioana-irina.patru@nxp.com>
Thread-Topic: [PATCH] MLK-22197 sound: asoc: add micfil dc remover amixer
 control
Thread-Index: AQHVMmdGkhP8uUk46U+4u9g/h8BbS6a6ckEA
Date: Thu, 4 Jul 2019 13:22:30 +0000
Message-ID: <1562246550.22836.17.camel@nxp.com>
References: <20190704125133.1463-1-ioana-irina.patru@nxp.com>
In-Reply-To: <20190704125133.1463-1-ioana-irina.patru@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=viorel.suman@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d34e063-f201-4eff-dd9b-08d70082aa90
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB3311; 
x-ms-traffictypediagnostic: VI1PR04MB3311:
x-microsoft-antispam-prvs: <VI1PR04MB3311EF4592D9831548A8CAE592FA0@VI1PR04MB3311.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(199004)(189003)(66946007)(76116006)(91956017)(44832011)(73956011)(71190400001)(71200400001)(6506007)(66556008)(66476007)(68736007)(6486002)(4326008)(53936002)(99286004)(50226002)(25786009)(256004)(446003)(11346002)(14444005)(6246003)(2906002)(81156014)(486006)(81166006)(2616005)(316002)(66446008)(64756008)(3450700001)(54906003)(110136005)(86362001)(102836004)(476003)(8676002)(5660300002)(66066001)(36756003)(26005)(43066004)(14454004)(7736002)(229853002)(6636002)(3846002)(186003)(6512007)(8936002)(54896002)(6116002)(478600001)(103116003)(76176011)(6436002)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB3311;
 H:VI1PR04MB4704.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zbCJdnLlQ2HjAT1tXi5OWWNfaLqJTotosSf8ZXJDADQt84Ow8s0pc5tKpxVvRlr4td0ZQmpd/pFK5zIvPvW7irSVMlKhsVHoqCrchhQbc/pU82loKFJljybKnSc3ayERHhAFQU073WC8mfK4xK+v1Y45pO1kaOmOfO/McEdaoqq5CrTbyd/EZvSnYUsXWjw4sKbt3LkKqw+lFamz0RM8zzTeoOaqsLPIiWiPPcQ1wZacNz61vZwbaoKgDKHZ6pirSmWHHjd717b/WLn+24kjvGr52Z+6o0MnsdVimkQ6bWIwbQ2bVGIggpsiKj+4RfRgveRAgHL6n5ZLIdyvTtXZWAMOW/aZSUcHxsX66Sf+/Hk9/V2+IljlekWrR/E8NFTfyC1kLQj0LJTiC3nUQ1pUXotTKbuXrsXsVufVO5XfaGM=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d34e063-f201-4eff-dd9b-08d70082aa90
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 13:22:30.2973 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: viorel.suman@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3311
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 LnxRevLi <LnxRevLi@nxp.com>
Subject: Re: [alsa-devel] [PATCH] MLK-22197 sound: asoc: add micfil dc
 remover amixer control
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
Reply-To: Viorel Suman <viorel.suman@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Irina,

Some nitpicks inline.

/Viorel

On Jo, 2019-07-04 at 12:52 +0000, Irina Patru wrote:


<snip>


+static int micfil_put_dc_remover_state(struct snd_kcontrol *kcontrol,
+                                       struct snd_ctl_elem_value *ucontrol)
+{
+       struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+       struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+       struct fsl_micfil *micfil = snd_soc_component_get_drvdata(comp);
+       unsigned int *item = ucontrol->value.enumerated.item;
+       int val = snd_soc_enum_item_to_val(e, item[0]);
+       int i = 0, ret = 0;
+       u32 reg_val = 0;
+
+       if (val < 0 || val > 3)
+               return -1;


Maybe return -EINVAL here ?


+       micfil->dc_remover = val;
+
+       /* Calculate total value for all channels */
+       for (i = 0; i < 8; i++)
+               reg_val |= MICFIL_DC_MODE(val, i);
+
+       /* Update DC Remover mode for all channels */
+       ret = snd_soc_component_update_bits(comp,
+                                       REG_MICFIL_DC_CTRL,
+                                       MICFIL_DC_CTRL_MASK,
+                                       reg_val);


Please check the description of snd_soc_component_update_bits return value:
==========
 * Return: 1 if the operation was successful and the value of the register
 * changed, 0 if the operation was successful, but the value did not change.
 * Returns a negative error code otherwise.
==========

We may need to return a non-zero value in case of error only, ie:
=============
if (ret < 0)
return ret;

return 0;
=============


+       return ret;
+}
+
+static int micfil_get_dc_remover_state(struct snd_kcontrol *kcontrol,
+                                       struct snd_ctl_elem_value *ucontrol)
+{
+       struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
+       struct fsl_micfil *micfil = snd_soc_component_get_drvdata(comp);
+
+       ucontrol->value.enumerated.item[0] = micfil->dc_remover;
+
+       return 0;
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
+       SOC_ENUM_EXT("MICFIL DC Remover Control",
+                       fsl_micfil_dc_remover_enum,
+                       micfil_get_dc_remover_state,
+                       micfil_put_dc_remover_state),
        {
                .iface = SNDRV_CTL_ELEM_IFACE_MIXER,
                .name = "HWVAD Input Gain",
diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
index 792187b717f0..e47dba9b90b8 100644
--- a/sound/soc/fsl/fsl_micfil.h
+++ b/sound/soc/fsl/fsl_micfil.h
@@ -278,6 +278,16 @@
 #define MICFIL_HWVAD_HPF_102HZ         3
 #define MICFIL_HWVAD_FRAMET_DEFAULT    10

+/* MICFIL DC Remover Control Register -- REG_MICFIL_DC_CTRL */
+#define MICFIL_DC_CTRL_SHIFT           0
+#define MICFIL_DC_CTRL_MASK                    0xFFFF
+#define MICFIL_DC_CTRL_WIDTH           2
+#define MICFIL_DC_CHX_SHIFT(v)         (2 * (v))
+#define MICFIL_DC_CHX_MASK(v)          ((BIT(MICFIL_DC_CTRL_WIDTH) - 1) \
+                               << MICFIL_DC_CHX_SHIFT(v))
+#define MICFIL_DC_MODE(v1, v2)         (((v1) << MICFIL_DC_CHX_SHIFT(v2)) \
+                               & MICFIL_DC_CHX_MASK(v2))
+
 /* MICFIL Output Control Register */
 #define MICFIL_OUTGAIN_CHX_SHIFT(v)    (4 * (v))


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
