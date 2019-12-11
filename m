Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B981411CFA2
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:21:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 487D616D8;
	Thu, 12 Dec 2019 15:20:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 487D616D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576160480;
	bh=FOdq7nBSQLNYjZVwR2vQjazAp7FSGxy9Tll///hnl7E=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SqkHSiw+s7Tk8DM428Ehi2zsmu23xWDVNIC2DyQYdqxxE1DGIavHKGFSI7wC0wNMa
	 ryShHZrPEX23St9Mbt+faPXbCV1vvJnRi5O4q1eAJWWpqbueIqJx0uZ0qeIcbnIJa+
	 d5Ce0sO1JXoo6jEWjK5xIMJOtP8xhXNRh3Koj17g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF385F8020C;
	Thu, 12 Dec 2019 15:19:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C998DF801F4; Wed, 11 Dec 2019 08:59:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30040.outbound.protection.outlook.com [40.107.3.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79F13F800EC
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 08:59:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79F13F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="V3zhuLS/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiYuAmxNH8wm9yrO5AoVbdAf4kcSVAmAA06mSkTetBs4KV3/m5mJLC1yX66HtjDh9wi36GQalbGOAGnzyqWVsck3w2RAMbpPUPnyS+6AUaYAx3hUkT7H3YijYKAc40BoozDyThbZf+XVfSxwXCWue52bS81IL/47VFt73x4kqAAH6fslDTk8FkEiUZLQ7t96XffOlstZtaW6xlNYUl7Ue9Wb2vVZe45niaoADYR6Hs63/VVl4/lsgVbeM6RuNGG99cygaw+LhNaiPB8zxWnwVsnVCytgI7IxXhIn1Q46wNidqsAJkZIIZJeA+t7prkr5ScDbxdSM4ilERVsJI8fhqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIM7lbDD9F5e6lQRoV8744G5mHLv1GLTU4ehOBOTeao=;
 b=ECfOS/Ha3KdR1oSzCszjQXD/rbBIjXW2w6gHphJsBRHCTydW8GGuCoS7IhW64K1WEPaG6MuoYLhe4swqb+K0+ntgM9eheOae8kG7e4Vy4axsyD4BitV5TutbzFmTmL4BPMGDVJzdDjhKrYuzMn1q4zgKDolp39SHxWqzEF+TmfefVAJBcPuppQ85HPlFYCb8IFkqYx5aa5y1RwLA8C895exwoKJBnK9bmqARPN1naJ9Vk3FdeaTWAGOoAZfcQdIOiOF8C5EXJQ6bRV7/cvKPaNjSrboIBym7ZuwFhtKfrSVRWkyxX7WFqX28c1DIKTHCVqgvsl3JhaCQH8mtBpj9Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIM7lbDD9F5e6lQRoV8744G5mHLv1GLTU4ehOBOTeao=;
 b=V3zhuLS/JJIesT9nUqa6GqKixXcxsgSZdiwE0kbKzUKnYmkbtfaycSjsrZUA9kl4okMms/gIoconUtgLEKLYzEfbqGmRggv4s4+a240ZPG20JFhvP6M4i+LOSuW7yGIpnR96YafYVvefiK9bxN5Wcid1gpeSSamypzZ9rE+xme4=
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com (52.133.12.32) by
 VI1PR04MB5839.eurprd04.prod.outlook.com (20.178.126.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.14; Wed, 11 Dec 2019 07:59:23 +0000
Received: from VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03]) by VI1PR04MB4062.eurprd04.prod.outlook.com
 ([fe80::20fe:3e38:4eec:ea03%7]) with mapi id 15.20.2516.018; Wed, 11 Dec 2019
 07:59:23 +0000
From: Alison Wang <alison.wang@nxp.com>
To: "oleksandr.suvorov@toradex.com" <oleksandr.suvorov@toradex.com>, Marcel
 Ziswiler <marcel.ziswiler@toradex.com>, "igor.opaniuk@toradex.com"
 <igor.opaniuk@toradex.com>, Fabio Estevam <festevam@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>
Thread-Topic: [v6,5/6] ASoC: sgtl5000: Fix of unmute outputs on probe
Thread-Index: AdWv8c/6ILgEMkLmRYinQyj4db74kQAAAgFQ
Date: Wed, 11 Dec 2019 07:59:23 +0000
Message-ID: <VI1PR04MB4062BD2BB10ADE4EB0DF9C37F45A0@VI1PR04MB4062.eurprd04.prod.outlook.com>
References: <VI1PR04MB4062948CF9A3C420C6345A7DF45A0@VI1PR04MB4062.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR04MB4062948CF9A3C420C6345A7DF45A0@VI1PR04MB4062.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=alison.wang@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a8a5f9b0-2e61-4064-30e0-08d77e1008fa
x-ms-traffictypediagnostic: VI1PR04MB5839:|VI1PR04MB5839:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <VI1PR04MB58392F1947557573AB075306F45A0@VI1PR04MB5839.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(189003)(199004)(81156014)(6506007)(316002)(4326008)(64756008)(8676002)(2940100002)(9686003)(66556008)(66476007)(26005)(81166006)(71200400001)(66446008)(66946007)(55016002)(76116006)(7696005)(478600001)(8936002)(52536014)(33656002)(5660300002)(186003)(44832011)(110136005)(86362001)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5839;
 H:VI1PR04MB4062.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5hwK+AmIwFA1Iwtl23StpAEEhuQlykXE1TgHxLHlmj3gbVy8itvQoa0M8yqTt7YRkO6nThHTcD6HpSsBpH0tQ6i9SUF5hpuSDc3DXBM55X7vdKGeITcTt4rfjxAcWCGqUuiBDcLa7WQ3+tfAFeF52VZdoISGaXiIo9orRexpe9dV5vEppgqZ1seNtAI6tsgu11nhi0WurQimuoq92ZDzLJDtoCq/YH0ezBDW4PsC/piQCehxbTjZgwn7A1Vkp4moKb0gh+j2ygNZzoN8LGuLCnecNGvj2g8Y8c2dHdDl8UPWdW8P4W7G39kARb9iDqP5clz/4LvBxN8PZMDsZ9j2ECTW1EIX4n8j3Y77QHai1pehRQG7PCqqZLLgktbMtolTRYnjUvezi23JlXUrssIN2Nrp8hgJSsTbVVoGgCwTxINWA5fWq5imrn/tsA+idqfq
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a5f9b0-2e61-4064-30e0-08d77e1008fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 07:59:23.0495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PNvxiUwsm3uKfK+YKWpfEn2t6ThVBNQOXZBrpUjzuUBHR7tRrkbkDFqGWESsIeqcAKldmVB21iBKywsuIjjPLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5839
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:19:27 +0100
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [v6,
	5/6] ASoC: sgtl5000: Fix of unmute outputs on probe
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

Hi, Oleksandr,

I have a question about this patch. Could you give me some ideas? Thanks.

In this patch, snd_soc_component_update_bits is used instead of snd_soc_component_write. Although EN_HP_ZCD and EN_ADC_ZCD are enabled in ANA_CTRL register, MUTE_LO, MUTE_HP and MUTE_ADC bits are remained as the default value. It causes LO, HP and ADC are all muted after driver probe. BTW, in the original code, snd_soc_component_write is used and MUTE_LO, MUTE_HP and MUTE_ADC are all set as zero (unmute).

I saw the above phenomenon on the latest linux-next. For LO and HP are muted, no sound can be heard.


Best Regards,
Alison Wang

> Subject: [v6,5/6] ASoC: sgtl5000: Fix of unmute outputs on probe
> 
> To enable "zero cross detect" for ADC/HP, change HP_ZCD_EN/ADC_ZCD_EN
> bits only instead of writing the whole CHIP_ANA_CTRL register.
> 
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
> Reviewed-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> Reviewed-by: Igor Opaniuk <igor.opaniuk@toradex.com>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> 
> ---
> 
> Changes in v6: None
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
> - Fix patch formatting
> 
>  sound/soc/codecs/sgtl5000.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> 
> diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c index
> b65232521ea8..23f4ae2f0723 100644
> --- a/sound/soc/codecs/sgtl5000.c
> +++ b/sound/soc/codecs/sgtl5000.c
> @@ -1453,6 +1453,7 @@  static int sgtl5000_probe(struct
> snd_soc_component *component)
>  	int ret;
>  	u16 reg;
>  	struct sgtl5000_priv *sgtl5000 =
> snd_soc_component_get_drvdata(component);
> +	unsigned int zcd_mask = SGTL5000_HP_ZCD_EN |
> SGTL5000_ADC_ZCD_EN;
> 
>  	/* power up sgtl5000 */
>  	ret = sgtl5000_set_power_regs(component);
> @@ -1480,9 +1481,8 @@  static int sgtl5000_probe(struct
> snd_soc_component *component)
>  	       0x1f);
>  	snd_soc_component_write(component, SGTL5000_CHIP_PAD_STRENGTH,
> reg);
> 
> -	snd_soc_component_write(component, SGTL5000_CHIP_ANA_CTRL,
> -			SGTL5000_HP_ZCD_EN |
> -			SGTL5000_ADC_ZCD_EN);
> +	snd_soc_component_update_bits(component,
> SGTL5000_CHIP_ANA_CTRL,
> +		zcd_mask, zcd_mask);
> 
>  	snd_soc_component_update_bits(component,
> SGTL5000_CHIP_MIC_CTRL,
>  			SGTL5000_BIAS_R_MASK,
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
