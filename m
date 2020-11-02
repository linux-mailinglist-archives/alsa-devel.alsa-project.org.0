Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A15C2A2C3F
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 15:03:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B67CD1714;
	Mon,  2 Nov 2020 15:02:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B67CD1714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604325828;
	bh=0soCGfwvMicyNsKlnQavfnjgADWiW/AiWtZZPXweAi8=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X+voEE22GyEBtt8HcntCVD+6X49+Mgx8b9Kjndf8/oWqYDNMKeBQUO7pDJTa1LJYT
	 2zaTp0PaqLzYVWRwxLV9MQuZqI0bUhIVCJz5haVelX7Pu9WQ/5OGzNPwpxUy3ee4E1
	 7KusfpqhOIz1GnlKqxkLFRji6BMMgf/h230MxQno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68084F80259;
	Mon,  2 Nov 2020 15:02:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6FCEF80256; Mon,  2 Nov 2020 15:02:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00069.outbound.protection.outlook.com [40.107.0.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3067DF8012B
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 15:02:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3067DF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="YSED8k3B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNqeQTlWJp9xMG1UhxKmE6CWBuyasDjIfrmZLG4NqB1Dd5b+SMk6tIb/ruJa9JGAP06uDasSR0VdrRHUhg1dHgV7+1zDSpUSR4RAeYutZvJoD6rcJ6B++2LuAXBEnBFGmYSIuR7q6LK6COAZQIdxeyMl+K6ksuiXXSYoFcBVTMx7W9Nt0R4BFULfmT9LDwn5rH/7/pdrudoIUzX8prz4fjveoJp4y/Rr5vWu8/Hv8N6QUrAnnjo5YAM78zcUC7CyqTRjidLkZdpoPYXEYPDcwRxvf3da/sdEk7tQvVXQ5Eh7h0hAiqZR/WJAHjxFp5k0pJqSfE0oUNHM5N9ZM9Ckrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP2dx0uOBO3WqQ5LnJaQ4fS0lkyEspGZhISFQfnDud8=;
 b=aJnFymbYlkDH+WYsz45g9AMUfBjJxOwa7Is9v/H2uE4UDJz6uIZLo7RcNwHIHPqmzHXibTOvCKIV5p3U6yVcEswRVYQemnKx9or+HlRiyi3vjOzazF6jlW+cpSRxIopgCxchIEVu+iJmiQex55nSoejmN2hD2GTaWFZ/4Pfs7Y4PQ0sf6els3f+DSYdKmQt5XZZ9EcUfqAuQ5+W1zt5FnxGxeee1aBtGitMTRrNzKGrvsrQAfm6GJROh2+Q8QrogVa6Us1ajFGez7TU+gSGn+iYoqzLJCZzra15bcko/OOLKVWEYA8wK/fbQnl4hGagCm+lhcPb96Rp/HI7Gin29FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP2dx0uOBO3WqQ5LnJaQ4fS0lkyEspGZhISFQfnDud8=;
 b=YSED8k3BYGWODmGo5770YjvD/LyIbpJMOl+PbaNXOvnWzdzKfmbz9guChiLPGCSHKSd8HFdsK1nTgFyQtBQHeyRlfdGovgqwNor4HgwgRass37TCNIVuErZjAwPf484LUfnzuuTxy5hMR1VxeC4xSis/9GY6KxWhnILHQqTRCJQ=
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB4621.eurprd04.prod.outlook.com
 (2603:10a6:803:6c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 14:02:42 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 14:02:42 +0000
From: Viorel Suman <viorel.suman@nxp.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: RE: [bug report] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Thread-Topic: [bug report] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Thread-Index: AQHWsR+OncT3nuMUC0OCAKoMyE+ASam03Vlw
Date: Mon, 2 Nov 2020 14:02:42 +0000
Message-ID: <VI1PR0401MB2272D142F42AA5A2BDA10F6092100@VI1PR0401MB2272.eurprd04.prod.outlook.com>
References: <20201102135317.GA41527@mwanda>
In-Reply-To: <20201102135317.GA41527@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [5.12.106.221]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 56bfefcc-f566-4022-85ef-08d87f37f767
x-ms-traffictypediagnostic: VI1PR04MB4621:
x-microsoft-antispam-prvs: <VI1PR04MB46215EF5AB47EC9ACB2072CE92100@VI1PR04MB4621.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9naPz9z+kCJllMpT7mpi1Mn9nxdeQ+Zer3RfKl0yLYooW1urPM/KLp0+f4bSUjdK0yIyL+SQg8hcZAyQ0mv/92dNf9swI8c5YQ11PG6aar9fV9vqC113+JfNxo8TQI73psk3NzW8GN4Oxwca1kkB0dRkbzh+tIiE4foHUT+JzQllug7Uu8he6MqhxstEDOcUa1CkN1y6DlwjfhqEkWSCCkHjjF38uZV1GlQ8CnQjeiBLSvAm4V8tJ9gLMEi4gutaUCKpoIJqtZS5/wa0Yb/2EeEnLZ/pwc1Y8gCSeuxlCC7ctdgBfY3TsPviUUilSDND
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(26005)(186003)(2906002)(9686003)(53546011)(6506007)(7696005)(83380400001)(8936002)(33656002)(44832011)(55016002)(8676002)(5660300002)(66446008)(76116006)(316002)(86362001)(478600001)(6916009)(71200400001)(64756008)(4326008)(66946007)(66476007)(66556008)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: frc2I3QhiRO5tPETuOyWL/+4jDM1eYxNVx/VHLm/pOukrnxJSDDXmL942IqFVjiZSouicEHPgN12GOQ02S9c3551rLm+XzPLDCTouIhF693azOndWf1pGh5GHJo4IbJjPUbbpwPt+KvQ6eWKiaLOPdnR8VFB2hMWZotlVTv+sgC3TG2FxX4LzPyctcRs9cIwUpINDDwK+U9yrW8g6/sTF3Qu8mASISw+DRyxzUuhgJvHckMCgZ4iKbOpzgwgGwsDsLFpAZ749kYijfwENRLXi2mRkxgH1ocvuXYNaBaxiAHjcLMQqsNX0BN+0HigCbffozxA5jZWzWGRxuy5cLLiThQ+wJbG/dUGWs+ErJpLNXL6mhOC0IYboIBCCzCCZFwmVO0rrYi/b4lhkDAVWXYR1UyV5Ktn/fMLrCBFZu5opA3H5q75WSp4vqL8rR2TLI5FffJo9ma+pJYk82ztOcQ40GX3n5BTmolfqTYyH8mAsWxGiIrSo1g/ZFR1zov3KmAny7yRj/YKFq/ykhogcarYy0Sg7410H3zaXYJVXIa19R403gGm45qZOrrK5/J4UyNCGnn1rkel0PMI0O/QbO4xDrWbD5T5GlFEuXseRLvj+fpDqzpzeEh41UkBj/2OxFnqpbl0qdCQUvahTzXt3U2BoA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56bfefcc-f566-4022-85ef-08d87f37f767
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2020 14:02:42.2921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ywC8Y2O4JiqksV07NH2cAzAXFW0M/iYjF6Ul1rzitCmJMtB3R+VKABVJhJJ/IynkiJfpXtyZSK++jBVQCpWlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4621
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Dan,

There is no issue, the context is that the clock is enabled when " fsl_xcvr=
_en_aud_pll"
function is called - please check the line 356. The clock is disabled at li=
ne 356 in order
to allow the rate change at line 357, and then enabled at line 362.=20

Thank you,
Viorel

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Monday, November 2, 2020 3:53 PM
> To: Viorel Suman <viorel.suman@nxp.com>
> Cc: alsa-devel@alsa-project.org
> Subject: [bug report] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
>=20
> Hello Viorel Suman,
>=20
> The patch 28564486866f: "ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver" fr=
om
> Oct 13, 2020, leads to the following static checker
> warning:
>=20
> 	sound/soc/fsl/fsl_xcvr.c:393 fsl_xcvr_en_aud_pll()
> 	warn: 'xcvr->phy_clk' not released on lines: 373.
>=20
> sound/soc/fsl/fsl_xcvr.c
>    351  static int fsl_xcvr_en_aud_pll(struct fsl_xcvr *xcvr, u32 freq)
>    352  {
>    353          struct device *dev =3D &xcvr->pdev->dev;
>    354          int ret;
>    355
>    356          clk_disable_unprepare(xcvr->phy_clk);
>    357          ret =3D clk_set_rate(xcvr->phy_clk, freq);
>    358          if (ret < 0) {
>    359                  dev_err(dev, "Error while setting AUD PLL rate: %=
d\n", ret);
>    360                  return ret;
>    361          }
>    362          ret =3D clk_prepare_enable(xcvr->phy_clk);
>    363          if (ret) {
>    364                  dev_err(dev, "failed to start PHY clock: %d\n", r=
et);
>    365                  return ret;
>    366          }
>    367
>    368          /* Release AI interface from reset */
>    369          ret =3D regmap_write(xcvr->regmap, FSL_XCVR_PHY_AI_CTRL_S=
ET,
>    370                             FSL_XCVR_PHY_AI_CTRL_AI_RESETN);
>    371          if (ret < 0) {
>    372                  dev_err(dev, "Error while setting IER0: %d\n", re=
t);
>=20
> clck_disable_unprepare(xcvr->phy_clk)?
>=20
>    373                  return ret;
>    374          }
>    375
>    376          if (xcvr->mode =3D=3D FSL_XCVR_MODE_EARC) { /* eARC mode =
*/
>    377                  /* PHY: CTRL_SET: TX_DIFF_OE, PHY_EN */
>    378                  fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
>    379                                    FSL_XCVR_PHY_CTRL_TSDIFF_OE |
>    380                                    FSL_XCVR_PHY_CTRL_PHY_EN, 1);
>    381                  /* PHY: CTRL2_SET: EARC_TX_MODE */
>    382                  fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL2_SET,
>    383                                    FSL_XCVR_PHY_CTRL2_EARC_TXMS, 1=
);
>    384          } else { /* SPDIF mode */
>    385                  /* PHY: CTRL_SET: TX_CLK_AUD_SS | SPDIF_EN */
>    386                  fsl_xcvr_ai_write(xcvr, FSL_XCVR_PHY_CTRL_SET,
>    387                                    FSL_XCVR_PHY_CTRL_TX_CLK_AUD_SS=
 |
>    388                                    FSL_XCVR_PHY_CTRL_SPDIF_EN, 1);
>    389          }
>    390
>    391          dev_dbg(dev, "PLL Fexp: %u\n", freq);
>    392
>    393          return 0;
>    394  }
>=20
>=20
> regards,
> dan carpenter
