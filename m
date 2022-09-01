Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1AC5AA37C
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Sep 2022 01:03:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA2281630;
	Fri,  2 Sep 2022 01:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA2281630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662073404;
	bh=fXebuuaku0bkFhVEhBmyYXWkEFZFVFOK5kHnSAxI3WM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LzPh27HCBQ06ldy9Z8nAoiWenMDc1+Sy9wXz0Z2PQMwPs67qsYuHIRTImaG/Ywk2f
	 CouAnO9PKIWtl3WPseYYnR+M04w/EKCG9YClmeFYqlZAEEEEYZXu1F4HCd4VVL25hS
	 XkdBGIgp3IyxJXLtmO+hINbPFMbwmjGKyHBa77Tw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 369E1F804A9;
	Fri,  2 Sep 2022 01:02:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB08BF8026D; Fri,  2 Sep 2022 01:02:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B35F8F80236
 for <alsa-devel@alsa-project.org>; Fri,  2 Sep 2022 01:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B35F8F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="f6u86VKh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOg+fvGzwNeI+rba2G2QO2adXaUUrWJXufzb3m5wioAhk3aluwZKSwsR1GOBVKS/0y9LhZlkxEQtPx1dqwOq/TIwyXm5+YXQg1t/zbLhH84SS7wQ7FawX7oUQ+28hn4IPmQ6A0wRemAthuycRIa9wh3wuZgJq9f9VgCWfAuJvnFUFK8QOzVAmxWxxIPuZDEeiiJS6dn9e3aQsGOcIv2aWXM/+k+ILvZee4m9bdgDL/YFoBcddmvalqi8hAu+5cXrT5jQc+1IEdsAbmZWbITnIY79lnBJmaIRn6Gh7ylKNNOs4vJbFdD2FUHMbgDhs14WHzXzEWdLCGJLmy8BblJ/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mD4Yy/VtjGQ7jb42cvnkYLrpDK1rmRh3xskU4vaWS9o=;
 b=lhUspfnbpCBayMZ/cNsqUBKHa4jNobVvwToe+cikehMcNjpcqJsKX+T/C5XFDzRYU/3bAD48aDRn3mm23LJaDVciyv2cQdEUXVFUANZgniIsY0wxsbYgQ+pI/47l1zvtynPD/1rTA8/dvZW/uxP6KFim5L5G7tuBtfsUMdm40iJdHMEFCo8TEZSXJcvCo0vrkOkcgaP0It6e4cCiqWE/9cNehzeBUn2DaI4TsDQxuMKYqj4D6xo+SPrGCxUnduUPt03hrpyh84heqkwas3cZGZDJ1zyt0qkXnqMYzNbVuLIzzOk0ydWNhmi5Pxe3PUWWGGMMipfH0iPA4+eZXxihYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mD4Yy/VtjGQ7jb42cvnkYLrpDK1rmRh3xskU4vaWS9o=;
 b=f6u86VKhznI8mmzTSPT8cxarturWrHnfTd1oiAj0usFI7Y+MU70oWCfm5xQHHEioeGsNQlJxLAobK3aG6DdBvWS1iLxhs4agEZL6aBXnySXFdYpBpa382wHMU4ZG/PrXya4q6rWziDNV8O4VQESo2zWhYuwQM95rguJ0rS8xNn8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8848.jpnprd01.prod.outlook.com (2603:1096:604:15d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 1 Sep
 2022 23:02:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::bdab:be26:6e36:88c6%3]) with mapi id 15.20.5588.015; Thu, 1 Sep 2022
 23:02:08 +0000
Date: Fri, 02 Sep 2022 08:02:02 +0900
Message-ID: <87fshavgut.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: rsnd: Add check for rsnd_mod_power_on
In-Reply-To: <20220901071127.3448059-1-jiasheng@iscas.ac.cn>
References: <20220901071127.3448059-1-jiasheng@iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYWPR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5affd808-ed74-4d5c-319e-08da8c6dfeb2
X-MS-TrafficTypeDiagnostic: OSZPR01MB8848:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A9BFoc9O9ZHUXvX/IjWhI0mMJa6OVXzm/CijLPMP/LSyj+li1J0jbUH8cSiRrYfgP9XFneH2n68jgE3mR0IJir8X1gW3jTbMe23MbNIZd9rt6R0Q0l2b+IlFuvjNz8SeeLpzeor5QwuC7Vi04uSVR01qiJL+QzuyTB7oSnjy/LDa6Gw+Ps0pGa/I3ulRuFhyV9fGvX2IURqzPuJCukNJken9ZQrpixB0rDc2p0kss872CZCXghfE71Pod3MISa4KVcdMavOM4tUO287xz0RtNhANYAOj07EmfkfKTeLKteo8ehlB4lmYW29c9tqIl2MIxeOocJgUKaCjwndkbvjMH3J0MvA/l4WFYIy5AQbhRHjxEQ4SDnRUtu4rxT/ysNwnsZKgAy844oNPMgAjo+Q7o0x4vS+Y7I/3aGYzZyufuzfNcwAlI8/TekSrhFMQq8f9/lYZGUWskSRVcteRGEbE6d9yWEXtSymdeg8j+hJVdWlJk73ps/EXSkddIYz4TzNDlNWWCckhkmh+eBexGg5oYfXpyq+zih3GM2Sgetb/ddMaFz52F8FpPXgQQ1iiOyE1K93bEiUEjMPRNniJu9I2xgargvVhMjozyjWBPsFF7boC+NN49ZPdGTAUKXhxD2xnnokm64uDgLB/iqJ4Sqwx6oaAkiBItZNjov1WILD9dsPM9tNeUljT9WGY5I9XI4T7cB8G4KFLVmapWmaTv8pzyU4d/ezova+4Y4mlLF2meUzCWtZqXKCrexyHQ04tPOpQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(66556008)(66946007)(66476007)(41300700001)(8676002)(4326008)(2616005)(186003)(6916009)(478600001)(316002)(6666004)(36756003)(26005)(6512007)(52116002)(6506007)(86362001)(8936002)(5660300002)(2906002)(6486002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y6+jvVvllAfjJO8H5cLwpi4Ks0YH/VyU6AQaqeg0Z6Nkppo4lHb65k0+T3hY?=
 =?us-ascii?Q?1DUBl9BhU4sd9fNtHBZkRqM4GMa3tbGNQ3M37Aq4A2nMK2eL8DzBOdNNsVlA?=
 =?us-ascii?Q?yueMesJFKrijbpglLoCh0CHf1D47ixOhzbG57xPjtB/v+7QPe5WjviINntcn?=
 =?us-ascii?Q?UkIjWbwKDKXaNavcD4ddtIKCidQlj3lEnrl1zNYhupCKcdCbygUK1MRCI1MU?=
 =?us-ascii?Q?Ejj0ozSoU+iHe8ti8hiiULECWZr1c54KeGc8o3NZJ8wWrX/rXnQV73eMSOJx?=
 =?us-ascii?Q?++nPPQGktrajYlsvAnzb3TacZIdgtCcvsDLDVHmcsGvhJ8usHXL3yDSaUTzk?=
 =?us-ascii?Q?DLdmV+LFce6bikZwIy+U1Tf91Rbuc3/vup8Ku7dFBFAlvZrkeulsbHDreB4Q?=
 =?us-ascii?Q?qu9Md5rLQJPg2sAhEwySuPjcgXhIVdLr3wcgdLAJ+O9PGm5orFhFPLNHdizS?=
 =?us-ascii?Q?s2e5XUfy6MjMVLOCWDkhdWATUjXyCceS/qYgzU3LrDW4MdaGrXdrazkH6H8d?=
 =?us-ascii?Q?fEuX9TeNrcU7h5gBzWBjFb3dRGRhN0rxz2nyypXXeChIAh0iULBGanwWPUEj?=
 =?us-ascii?Q?hJG2syR/iOkbgagbBuLvUk+anru2LZLZ7D46c03cdUyfLkzWErWXUT/YS5ot?=
 =?us-ascii?Q?zHLuBXh+Rs76lEXvfMQnrAz629IK92BZje41tQk2yav58Tgt+44EAXfdYTLF?=
 =?us-ascii?Q?CuwRhJHWy/ykvqfj6gcXa9X3tvGvXHCtI7ROIL/DNJmxCElMBOvw+/3eSDru?=
 =?us-ascii?Q?+itNt0nHAUZJpdtfNvTQGErguvjh0JtnDrDMbahMhl/s2IjSU+6n+iy6orT1?=
 =?us-ascii?Q?kPNcF5vFlEkpy3e2+dWKc/q3DuBrmiwSpKt8E23ML0EWtmlN1lria5UguDRX?=
 =?us-ascii?Q?Auwr+V9qGwgGow5yfyRQa3LuKcLlFFVBikp/bynIMcGyUWd8/XvK0a4Oyu9S?=
 =?us-ascii?Q?oL+L7yBkg+oUSF4sLG4BV3kaP9N6diPLoGiafHfBKhP3kSlb42QLmXSpMbRh?=
 =?us-ascii?Q?aBIFpQCkzPyLP37bTGtjZ2lZDHc76w+PEZPqFTshXgsodiC3yXwA5N85eJA9?=
 =?us-ascii?Q?d2Y9/lfHCN8rPiT63LQVMh80OMrfKtWkwfg+rTiCJkuOq27ckUt5op22VXfr?=
 =?us-ascii?Q?i6nwcI0cTecQo8Nob44Zw/xBy5zoTwg4G9QWfQr2fDbIV73ONSd/QDvyuczU?=
 =?us-ascii?Q?HUaNIkk1xWfo6/XES0wVEvFxcsJIz2hwQRweeMt3IP8aF0oZ9e76B8HN3jqL?=
 =?us-ascii?Q?YBrQULU1t3qOnNH73Q3iIQWmtBkEs38Jqpt+08FuZOcuNlAbW7+2kGn2a8jD?=
 =?us-ascii?Q?v4EAdmZ5Hxisy8oXjSvnhDuOrmSoc8Nz7/HlDfWUuKlATne0w3S3FHTT6wCM?=
 =?us-ascii?Q?JSp2sMhkR5zQtvo3DPioBfcxdwXLMaOcl+Gtn3faO5sVjpPweCpyY4fL1F6r?=
 =?us-ascii?Q?V+WDEYRCnKiK6E6UBj74DoGi3AjTI7fbO4IyXPhJkQbyUqQAu2VU0xt0iPxH?=
 =?us-ascii?Q?FSOU2281RptjdZbwIJzgf6p9ctbK6DXJRIMS3hkZU4qyeT9WT5R46I1tqd2W?=
 =?us-ascii?Q?y/W3l7eaUPN7/4vsIxDqUVCokPuHYcllFL9SovL8oGonbFs8ysZnR7GNORZ4?=
 =?us-ascii?Q?S4D4dHmfXx897bJ9uj+Nf6Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5affd808-ed74-4d5c-319e-08da8c6dfeb2
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 23:02:08.0011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obSWr08+5Hefj9OIu5+0yC/AjxoRCHeTVOSdH8MJszxrSvZ99/8knNSsu+MXYpYAUBl8R1JBbL2yZT1zPjlBc95mkDE2bC9HJr0l+viyw29gbtM1gRXs15BTEqAmsAPY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8848
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org
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


Hi

> As rsnd_mod_power_on() can return negative numbers,
> it should be better to check the return value and
> deal with the exception.
> 
> Fixes: e7d850dd10f4 ("ASoC: rsnd: use mod base common method on SSI-parent")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
(snip)
> --- a/sound/soc/sh/rcar/ssi.c
> +++ b/sound/soc/sh/rcar/ssi.c
> @@ -480,7 +480,9 @@ static int rsnd_ssi_init(struct rsnd_mod *mod,
>  
>  	ssi->usrcnt++;
>  
> -	rsnd_mod_power_on(mod);
> +	ret = rsnd_mod_power_on(mod);
> +	if (ret < 0)
> +		return ret;

This looks good to me, but, the code which is using rsnd_mod_power_on()
and not checking the return value is not only ssi.c.

	> grep rsnd_mod_power_on ./sound/soc/sh/rcar/*.c                                                              [~/Mail/tmp]
	sound/soc/sh/rcar/ctu.c:      rsnd_mod_power_on(mod);
	sound/soc/sh/rcar/dvc.c:      rsnd_mod_power_on(mod);
	sound/soc/sh/rcar/mix.c:      rsnd_mod_power_on(mod);
	sound/soc/sh/rcar/src.c:      rsnd_mod_power_on(mod);
	sound/soc/sh/rcar/ssi.c:      rsnd_mod_power_on(mod);

Thank you for your help !!

Best regards
---
Kuninori Morimoto
