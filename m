Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BCDA1E89
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:12:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3EBB1700;
	Thu, 29 Aug 2019 17:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3EBB1700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567091537;
	bh=jSUwvsB0qS9ZKe78wUaMD1pifks26eCe5YzA6kXeIy0=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dmQINtBvph9czufuO73Xfas7tkN+wBgf0tATF/OTGhFNT10Bza1N4NlU9xVheHjjD
	 akwQTIRv8djez9H/q4+Bw0Lu7hV05Q3umCzEchSPAkq3FdkPrvfUWFl9+TWJBFSIbA
	 AlG7tk7MdWW3gU1xPuT+zz/AdiJZe2Uv4xv86Foc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFD56F89861;
	Thu, 29 Aug 2019 12:03:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BCE5F89852; Thu, 29 Aug 2019 12:03:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80052.outbound.protection.outlook.com [40.107.8.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD40EF89852
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 12:03:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD40EF89852
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="arDISNE0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acovKZzwEcEF6rfLziXMa3ae5XLmArcc0Ro3+EzxgLOlAgaWPrLPt8kuXS1FBrPsF6+ak2Txg3CPboDwyhNHi1V8yhNR2jvJY3MWiHzcJAosbWsSi9GfC/PoW2EcC16j4feX+cxts+jFHiL/Sb7RwCE0aFKpLJasI1lXAZbdUoRj2WT7v1fjmBfF9r7ncWvrJ3dUkYnqUzYcddtBVKoCtJ2xdsoH+f0T/6qCl2d+FmKeLmUaPK0sLedaedLeYeOKKBG0ZgpWMHsqI8tNpiNRInMBohWVQuMkalhLnmXJpr9l+8Ma2uk2lsKNsjKSOSWogagNyQ25j0gVJq9LNxXdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61kIDKLFWSPaecxA2gh/zWB5Hf3lSZwL8gRwzPXIUhY=;
 b=DeUjlYawCcYjH+osRnkjWzSWkvmESrFG/mtMpIqHBlKtZmxCA1suy0xRDl9umwblAqxSGH+ABn7gonSxni5stp2FCVyDAswRgY5aJbfSR6xF62uKGHCLedcFh2RlMhJTlQbbB1lwlKSN1XeUY6od2l1GH1lTFrLCHU37I6TJ0N97ymd/XEgJk0/DxkCOlg5cZ+IaeNpwW9b9NVp9RoteyP6f1fcJKCMOVJMCqG0Qb4ZJlKwjcMckOzjYnmOa2GpDzL6x9SkClmWwAOpkCBzy7N+aIguYDUQQZmDb5kd9YEm3PHdXUGAA1+UXcu1pjwu/Epv67ObyXSTT1r91nj0XDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61kIDKLFWSPaecxA2gh/zWB5Hf3lSZwL8gRwzPXIUhY=;
 b=arDISNE07NFAL7vvbFpFA5/eYH7StF0XzEocHv0aifmvCsgaQNy9qTmvm64NGZmL1f74ZYfbpXTuEq5Pc404VeZjFIDdqNjZ6xJ8i250sbM/22JZM1zj/k4okk4+x8uGdq9R61GR9b+Br19niyjHMsvgFOpXkIufT0avBg1p/uY=
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com (52.133.13.160) by
 VI1PR04MB5613.eurprd04.prod.outlook.com (20.178.125.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 10:03:34 +0000
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c]) by VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c%7]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 10:03:34 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Paul.Handrigan@cirrus.com" <Paul.Handrigan@cirrus.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "S.j. Wang"
 <shengjiu.wang@nxp.com>, "brian.austin@cirrus.com" <brian.austin@cirrus.com>, 
 "perex@perex.cz" <perex@perex.cz>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH] ASoC: cs42xx8: Force suspend/resume during
 system suspend/resume
Thread-Index: AQHVXlEEGU4b2ITnKkSzGQAmiDenzw==
Date: Thu, 29 Aug 2019 10:03:34 +0000
Message-ID: <0b6116bb10c1d94246383b715b89abd9d458a661.camel@nxp.com>
References: <1566944026-18113-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1566944026-18113-1-git-send-email-shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a02723ec-6f05-4793-c6e0-08d72c68272b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB5613; 
x-ms-traffictypediagnostic: VI1PR04MB5613:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5613EE39815D35F357233C16F9A20@VI1PR04MB5613.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:428;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(376002)(366004)(396003)(199004)(189003)(8676002)(81156014)(478600001)(486006)(110136005)(316002)(81166006)(8936002)(44832011)(71200400001)(71190400001)(14454004)(86362001)(66066001)(6116002)(3846002)(6246003)(99286004)(25786009)(50226002)(91956017)(76116006)(2201001)(6486002)(6436002)(6512007)(53936002)(476003)(66946007)(2616005)(11346002)(446003)(26005)(118296001)(186003)(66446008)(64756008)(66556008)(66476007)(76176011)(6506007)(102836004)(2501003)(4744005)(229853002)(2906002)(15650500001)(7736002)(305945005)(36756003)(256004)(5660300002)(14444005)(99106002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5613;
 H:VI1PR04MB4094.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KJO5O2Pn3M4h56u5ukeY6vs1IaT7zFeVH8fzvgQekYKeRz4XGuLpT+vyh0REZYH5kMQPhVz8bneYgQ7N1buyuBmZDko41Criv2C1G6TRgZg1zvGgxAeACRC344JZP680SUyrNpkgYV6MRQMm4zzCrBQwBAcNU4G4ruOgWXOrQv9bXByNE/NW59M079iwi0cLJW2oo3715tlkIKw7YOQl3wTaXhZdkLD13tBGEyQk6bBoSgG5M4xYoNC4qdxtcEz/3fOwBG3bjODTkxgoYJR2vTql7pB1e8Ks6WFAoZRp9xl5+cQWm4GtlwfPyjDTpCCpok1Ux+7Bgi/IdEbA4i8JDCLnS58CINLnP/VKIX6ixg8/koA9nVIvJe7P9TihfGLxWq06EwnXc1lSfoOVA7vGV2Sr2mkq8dPHlMf22E80kP0=
Content-ID: <41D1E37C5A1C8C4A8C580A13345026FA@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a02723ec-6f05-4793-c6e0-08d72c68272b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 10:03:34.0546 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3t8fe0W2qxCPnzWM/DA4kTFha3h6zLizxFZoXjq6L9ejyojGWQUv+UkS21oCMNF1MbbsGVML54Si9CH31Xy30g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5613
Subject: Re: [alsa-devel] [PATCH] ASoC: cs42xx8: Force suspend/resume during
 system suspend/resume
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

On Tue, 2019-08-27 at 18:13 -0400, Shengjiu Wang wrote:
> Use force_suspend/resume to make sure clocks are disabled/enabled
> accordingly during system suspend/resume.
> 
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
>  sound/soc/codecs/cs42xx8.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
> index 5b049fcdba20..94b1adb088fd 100644
> --- a/sound/soc/codecs/cs42xx8.c
> +++ b/sound/soc/codecs/cs42xx8.c
> @@ -684,6 +684,8 @@ static int cs42xx8_runtime_suspend(struct device
> *dev)
>  #endif
>  
>  const struct dev_pm_ops cs42xx8_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
>  	SET_RUNTIME_PM_OPS(cs42xx8_runtime_suspend,
> cs42xx8_runtime_resume, NULL)
>  };
>  EXPORT_SYMBOL_GPL(cs42xx8_pm);
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
