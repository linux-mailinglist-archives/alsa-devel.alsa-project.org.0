Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 179A9567AA5
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 01:22:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A73116B9;
	Wed,  6 Jul 2022 01:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A73116B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657063353;
	bh=70AQ3KEfJsly2cXEkJ0j7DFuc+vzGlNcRH4gKWw+cOo=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LwDeFBGmaTnOim+l0qU+2qE9hvPuVdyk357WYrs+u2jQ4RKf9pn8M706DBtKm2vmP
	 lKrzkVhMBsaqaJwrYC949D595OLFZc5iO6QSlh9PYhG0qE8Gzv7eIGLaZMlPRtkhs+
	 NjyhWIorxqmxFnWfASxrNOLo+c1iQC2qaMvkoaM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7ED9F800CB;
	Wed,  6 Jul 2022 01:21:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6260AF8015B; Wed,  6 Jul 2022 01:21:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2133.outbound.protection.outlook.com [40.107.113.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3F3DF800CB
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 01:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3F3DF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="jWr0IP1B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxImvmgJFNqkOlTRW6ZTBiKTqXyypS8j5aNzeTBA/uV+mQc9QbBKuqT+3zn4j+nNfTssULyBIFcdXge1B/l78TD8K54R109BTozDdCK7QP0xwVkMU0PCmMa4N6nTExhnznxK/mAS2Aupwxe/7UJounu7wx8wxcXIIjsduAP76u+kqVKv3AuhNz9GtjPMpi85EIhXSIK1Q2PUAry5HZ6B6ZX4VdulIMYk2JxqIPQQw3skHBjwqypUKqIdVwcwRqil3bZdi5UovlETFIRtyUYjIui3ceb83u9SAS6lJomaoOwQr09ej03G1cbnagC2Uxk/1RpRKOrC5NiZNxvRwVWLBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcMySVoHWyS/1IxCXOho/9KXiELj5JPIytQLGcaio/s=;
 b=MXczLZCjpYlRDEko6suDHFGf0RrrtgKEREgqPi8FHAm6oKGYgByNLuFwN/eJN93KczlJNyzKBwce+qbLTSXX71IIbFkMdnT86qdbU67rHXY5iwzxDF6SU0M6D61bBynRZqVhx/0Ekf3zDPWlNpRlM5SbvpbYK00TF47uTMGU+IKC1vkg7wHHQ968E25Kqdf9XEIuGgiy5w2bHwoucp2BSx9B1TgMlT/SD8oTBlivT8AfSww82dw8XAkm6Yfxr3n/XLro67Zi7NXq6sdwoFgR41rRxnPvyhORA2g6F0Vfj5f3KZozmOHGKlbAivqRPLuk6H0qPNUAecZ+v91cKoaACg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcMySVoHWyS/1IxCXOho/9KXiELj5JPIytQLGcaio/s=;
 b=jWr0IP1BEn3VzRGMmOWGnPhSLbZUDQdqsoof+hV/Vqh68Ny+Mj3JmG5jx8nafAySip4zBdhvRMLF3wVlexZmQ0JOcO7k5p+StrrZTCkfBToTr0Gwu/wvQAxmyj1coUTHJfRQwcontKyVG5rGJbTQ/A4B8mToHOrm9xsNkqmwtws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6336.jpnprd01.prod.outlook.com (2603:1096:400:79::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 23:21:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%6]) with mapi id 15.20.5417.015; Tue, 5 Jul 2022
 23:21:21 +0000
Message-ID: <87k08rf8no.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: rsnd: Emit useful error messages in .remove()
In-Reply-To: <20220705063613.93770-1-u.kleine-koenig@pengutronix.de>
References: <20220705063613.93770-1-u.kleine-koenig@pengutronix.de>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 5 Jul 2022 23:21:20 +0000
X-ClientProxiedBy: TYAPR01CA0179.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1adcb583-efd2-4a63-913d-08da5edd1207
X-MS-TrafficTypeDiagnostic: TYCPR01MB6336:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NRHWnGsCSRwCr/GvIBcxVD/MIE8RCLWJlCZspLRvnaWj2ed9f9OLBDR/qJe4+S/7YyzRc088kYC/IsnwyqrsOuaKCPZI1F/MBoR9/7v5+Q1vx2V8dIfkEDWjaX7OnxxBaEw0aQHA3effRmIjYyheGgb3q3FC/9XAGXRQsXKiMV0Q9JXipQ1xyTUds3nRdB9h8HrrSeapPxGnQ7ZVQQM0JwQumvd/OXiE0uJ657Tm+CvY27bTpyTfbr7pM/PArCWywznCvlawcei/oYY0/LGcmTCpl1K96ujjtQaXI4IFxJ2haDjXAzzw61x3veNpODsD56I5KRGFB1Hg6ycCX93zUgONmE/49NzLEUIbyqD8RJpGORfHY/2BaOeAgRe4qnpSLBXaP7tzNW44AJ1thOiJ9lGTZSBTxOABwiMpVl1xrgO/V0Py9SO74eXnxiWaaaeQ7RqdP6WVz3rPNQNwynXXBBw+NhCFcED6VqpBHDSCr0dssWc1dQJu1Q6nQqIc1mlqsp3jqrCel2FCzWmdjoFbpsQdpjfDO69E4Df0becM0/NwrDUNbhbAYHA7kP2Vf+volV/0kXfDzzdvc8e+rTN0mwpZ9J2IoU2QCGpS/F08WNSmY5+6CnHLTGpq2qAqTpljnJDluorJpo5N+MNmD8IMiuu4dqWvIGDJotm71tl9sPgm58oBqp+/HFlwDb/bx51hvrK8im2MuRdvZT20plo1hm3ydtRJvRozwrs7FaXwmDJNnNdGhTk92K1oxIlVF+SaSX46JSmRBWQn24+yjscK9VepCtr40mEKnpV1GpU9w8jHCsIhv/UM+lNMJtUUTL7Q9lLn/TMarUQVX6YtyD3t7Kw/rVdoZklQltpqGC2Dhn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(6506007)(316002)(66556008)(66946007)(66476007)(6486002)(4326008)(8676002)(478600001)(41300700001)(8936002)(54906003)(6916009)(4744005)(5660300002)(2906002)(38350700002)(86362001)(36756003)(2616005)(6512007)(38100700002)(186003)(52116002)(26005)(142923001)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+NZ4geaKkXHh9/AOjs97VxDQ9y+gUUT6gxAxLzp5zKWv7uYS01Y5CWTRulDZ?=
 =?us-ascii?Q?/yue6ZljI7aHxONF5mKUFb6DaJnjqYZza3oFdRhSZuYCNKdg+iCgYwUMvRI3?=
 =?us-ascii?Q?utEREVenEu67iGiJ0dLStSLOKy+OHCN9epBEH/6sAMMlWnCJS4loGIt9H4Bq?=
 =?us-ascii?Q?/yKTVYX+Bu75PEkGvR7CIiwtk6o34MdBNjBI/EDc2Fm0/Tlt5dtmJvBfIqlZ?=
 =?us-ascii?Q?ltWpwojpxeHApU4BfGgRc46n501G6UmqSTCpHd6iEG1hb7w5ilmRj5hAMShx?=
 =?us-ascii?Q?4Zj2AzH/Ox6pBXcZXtrcnMYpjydfyoLEb+v3F+T8tf4s5ccKchvgr86/A1Dz?=
 =?us-ascii?Q?ydSkZA58cEV6p79kOK/mhCI8gce3RhboYNPHgMSmPwbZ/yvdP9NZ9q+vnf5G?=
 =?us-ascii?Q?evkCs9ujBp5sp8Cwwx+T7CD0IxeQALekN4t/jUTuyqXYKtlI0SGGRlG8JByv?=
 =?us-ascii?Q?GiCSDsT0f5M5o6DuCOoIC2i6d1a3CWLD9HcJBRPOOowkUvWUktCetPNSTXRs?=
 =?us-ascii?Q?q4JCF4jy9DdhUIRgtJMnMGpfTu+HN0noFVb4keC1YU+F+HuCxEMQ6Odd60vk?=
 =?us-ascii?Q?Bec26wg9ggE5imi7lNkRTDDTScU40pslY062+ACp3t+FBbIGMk53MGiVJGLg?=
 =?us-ascii?Q?Lxt2+vVmxFx9QLUxrJAMBbDXyjJHZvaDvRjFCVqq9IBkEEy0aGpaR1gR7z+h?=
 =?us-ascii?Q?Ld9b24AUWEk+EdZg/+xcsw/MapZfelaEyjVxsPc9dOwEzC0rSnDohgaNuyb4?=
 =?us-ascii?Q?ABy4X3GNlf1xVVbKVW/gLisXYJExP9viUlV+FSFd0f2Numrw4lrGekPAGQYu?=
 =?us-ascii?Q?gQp5zEEL2STugsMEqToJzZe9QSCHackhG9eedUZuskNRPxvzB5tmwzui28l8?=
 =?us-ascii?Q?ARJyy16j/2kIXe7pEiknPMH6FxXVsQmrO9aTfMXGePKClz9StchIR6nM8oDe?=
 =?us-ascii?Q?xtMQOTHjPaO6dTGDwgCvCZ4LD5MuqW3iKoTkTkEsgLwSDcwhRcKa5kfzqDG/?=
 =?us-ascii?Q?H2vkij67mvjgrShZgY3Z+1lv2bkvkEMaFQurn7rFqKkcqIXZA96UazUwu1yV?=
 =?us-ascii?Q?t8roRiMA48TgakzN7gTYVAx9LFIn/4m5xF6LagoHicnhrJZ3SXZ3s/8QUzhc?=
 =?us-ascii?Q?HEGQ74RSt0caFKA/PUn0iw09vmGsoHDpBM6jJbKQTrj8boL/Lc3kHpZ35/mL?=
 =?us-ascii?Q?qynv1Q8q8HQUy/ssJhq7BgPBba5sCddIZ/VEqzib4jvdlc78v8fll8RhvYQH?=
 =?us-ascii?Q?kEYCwfN28SdMgavEmzAFGXYklUb7QO6itejJVuPmqjp5/DXcNteAcW32KXzB?=
 =?us-ascii?Q?C7sg4SDAFuaPCAWQR08iF8ZlqHZJmp2hNZDI/8NPtiZBBGoI0nyVJEqmwMnZ?=
 =?us-ascii?Q?nRwv2fdI9xonZrU8BkmcDsH+PSYc4/VcW51dxJI0uWRGneqU/OOHCfuyoLMF?=
 =?us-ascii?Q?cj2mv9/Jpma0d8SRHYMD9JjdkJRh6xOJbdmIsjwubH4TffJd/+4BwLCcj0If?=
 =?us-ascii?Q?+KjzvypapWCs/367PX7zpvwLV0ezIUVanZvCsWnq9xgdLkoG9/BY3K+//CLT?=
 =?us-ascii?Q?Q2nCbO7xcWqhiRSPx382AHeJ9V/VvopUxOA5RXZOB+INUHe1IfcxvQbDxaXE?=
 =?us-ascii?Q?UhkEYi6sodsElht8k4HKrAI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1adcb583-efd2-4a63-913d-08da5edd1207
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 23:21:21.0865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t2Io+hOgMciKjWqFjLbq4qfVXu4d/nxs0f04Ql2HmKMvzW0NYeCiMj36BalOM9W5ADaS5Do9hcuTgmBP9WHmW6UlZzAlAdf5XCbIwq7Ldo9O7JRNOtWOdGqt3CxnXZHd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6336
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Liam Girdwood <lgirdwood@gmail.com>, kernel@pengutronix.de
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


Hi Uwe

Thank you for your patch

>  	for_each_rsnd_dai(rdai, priv, i) {
> -		ret |= rsnd_dai_call(remove, &rdai->playback, priv);
> -		ret |= rsnd_dai_call(remove, &rdai->capture, priv);
> +		int ret;
> +
> +		ret = rsnd_dai_call(remove, &rdai->playback, priv);
> +		if (ret)
> +			dev_warn(&pdev->dev, "Failed to remove playback dai #%d\n", i);
> +
> +		ret = rsnd_dai_call(remove, &rdai->capture, priv);
> +		if (ret)
> +			dev_warn(&pdev->dev, "Failed to remove capture dai #%d\n", i);
>  	}
>  
>  	for (i = 0; i < ARRAY_SIZE(remove_func); i++)
>  		remove_func[i](priv);
>  
> -	return ret;
> +	return 0;
>  }

I think we want to get return error ?

The reason why it was using |= is that it should call all function
without break even though it was error
(Maybe first/last error is very OK).

So, we want to is maybe like this (it uses last error)

	int ret = 0;

	for_each() {
		int __ret;

		__ret = xxx();
		if (__ret < 0) {
			...
=>			ret = __ret;
		}
	}

=>	return ret;


Thank you for your help !!

Best regards
---
Kuninori Morimoto
