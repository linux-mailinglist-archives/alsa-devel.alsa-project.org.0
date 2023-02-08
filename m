Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B807368FB42
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 00:38:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9942A82A;
	Thu,  9 Feb 2023 00:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9942A82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675899537;
	bh=LVQbdgdh3CTdlCOtyCFYV+vbl6/0V75SrqqKBEV1MNQ=;
	h=From:To:Subject:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ibqml58F0tzH/1acwRsfL/RehEJxd2fcAEypQtb0iRJnE8xGNLI9VDrk1AFUlRxx7
	 j5pLCNHYqz+piQ4n9m7ObTcTVuHwx6lUD4TSryxsKu5S5KjNoOyjY2Vd++akoK5Fwk
	 JRASwvTLnRXzJUmSsuFYC3vOKMulIphXAYGqV2rk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C28DDF80094;
	Thu,  9 Feb 2023 00:38:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8469F800B8; Thu,  9 Feb 2023 00:37:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5E8FF80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 00:37:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5E8FF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mtGKV8ZR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKpnyDi82jOrcbAohetZRrWrf75zzbiJM8R0BEm5EcowCBbEDdcmnV76E5D4zAxvBT4rBKTw90muccLYen262oy445lLC7XrRXhV97ZwJ3xrJl8nTDvy+7lYsLcNlAhpAUgRzw7DLWGgVZlAIcdCbyofS+jnfDw745R91GYZPD6A6t68utUKN1lff1L8+cRoRvjebY2oOD2zyX2kd+2Cdr+X/l+8KgZW7K1tA5UX1R9H1uJlJUTNckWzlqX45gpV8VVQtArfdqS3rn9fHoUWtd+aqQ28cD1fRUYJO6aAee4SF+8UK6CtIfbKgtvsazrmQIh/GZekekhBeJHvDtmZUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlW6EyfI+NjBxileUMWKxnUHwK9s6+wZQrV93wCBv4w=;
 b=I5z0Gxc/Zx9gUkykC0VlKhFshJQRyUfVz8vQbeJ86fiVuI4+7ACGa2yFJ9euaoy+RCCr4aXEj3+4UUegOnUK2U5L3yd1iGalKUzT+tnRZ7PcODtuUWuH3dE+/wjIMz62pssbxz0T4c2MIszG5nGe/nd3rpS+5dRiGz0P4f8m3ZiG7cKEwfEH7H/sXxWZGV41MY45neCe3UfBk3eBlVzBWwPzHOlFXJ9QB4UdZBSD6u2zRP0kGce3FxTW7hgavm6N4cEPbSUfAncUBoO5ZcC3jfvs8T8rVhfHx+wje8Yra+1pMxGrpjZhlcL2iIWVdQkCk+LSKyL08ewULyJslyuz0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlW6EyfI+NjBxileUMWKxnUHwK9s6+wZQrV93wCBv4w=;
 b=mtGKV8ZRN/3Jd1f2YFU/f//KvFO/bH9kFEyW67nDdxNIDmbsURLJdJpjJ8l3uo9ynhpH5qwiTNLBgYJkWzVqXeZv4mnExhVBpI8sd4lzdoZZsonB71OpDmM62NyjK7ZmHv9olsUygFoAy9BK3L/sluDKjs3QRo0wpVpDACTY+yc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB8451.jpnprd01.prod.outlook.com (2603:1096:604:16e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 23:37:25 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%9]) with mapi id 15.20.6086.018; Wed, 8 Feb 2023
 23:37:25 +0000
Message-ID: <87357fd8zv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: adjust to R-Car
 Gen4
In-Reply-To: <8fa6a9eb-df09-73c0-528b-a2efd9b262e7@linaro.org>
References: <87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com>
	<87o7q5t012.wl-kuninori.morimoto.gx@renesas.com>
	<8fa6a9eb-df09-73c0-528b-a2efd9b262e7@linaro.org>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 8 Feb 2023 23:37:25 +0000
X-ClientProxiedBy: TYAPR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: 9647b7ff-cf29-4b9a-bb92-08db0a2d6ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9tECKSrPHbzLpVt1Q5gjNgM7CGJnAKnzidYLQ7q++DqXVzgJW0eBI0fZHQM19Kf3tmebs2+9dRardjwjQqWgJ/c/HplY/TnoC2E0vcgxWAvTBp90CLfdUmy9sGCc1yNvksjDiWtxcf/IQgXCqoCCLhVWbK9pLc8MOoXP+gbEgz8+BRxcTHtdHccWl+w6gOJyMqrAPlu0ob98tw1sMnljLtieqz13ln86fl/DO8xPDC8WLbFZ436p279JgneqYbvh/ObzS5PxaCWAea4/LOc7YvU12Kxb09f3VNV1PFEb3PGMOnB464Jokz+Z/LYeEQvbm9IW+PNdZ7tX8dnSAxd2gOZA1lOzQszdIXnmCtN61ZJ1xWk7NbejygzQi4vfa3vvcnEVksczj6xb7oEuTg88IlOsspuv+dbcQ8nSMZjw2479dff4Hx422NT1CvD/plpnNQlaFGQuOIWxT7phCRM9iEbyGVy16WS5B6NZ5IY2czsFshHoG9Bt43RdBRbnYCVQHDATX/aTBNMN7z7DFBaBc4L/GdgQxhokFltIPEJptcLzLEPLBpKveKZ5x9t0PBvbQHiaYHtZXek1m5HBui682YLZd4vFP2kpdoXtjhUuFj8jsSYPEfpD+YjLKLsvcOIlcfOOc0mkS0tr/n8d4DNu9ftgj9llbrJv/L+OtdQw3oAiYY7Ry/51ObpM097ID9iUNhi6AxFaYlttdLSj0TnLdiDMvlReQwbxPhFCZzjbOyT4ylcKdmpzZx+nFNjSoTCrePKhKrbqlxGgg6MOWPufKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199018)(6506007)(8936002)(316002)(6512007)(26005)(186003)(2906002)(83380400001)(52116002)(5660300002)(54906003)(36756003)(86362001)(6486002)(966005)(478600001)(66476007)(66556008)(66946007)(41300700001)(6916009)(4326008)(8676002)(38100700002)(38350700002)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zEjT3rW9jqQ3OrElWxG3NC6tpTK0ppZYhxnYFuCfOcOJlaR6e2Q4BfVnAnoz?=
 =?us-ascii?Q?RhD4cBQTngT0Tx2SkQNDZROq8pvQi96ZTwiB2eKaPA1zhYvOPIwigUqX6cKi?=
 =?us-ascii?Q?NZZaJyVZodGRoWYRtEh+Zij33AiFPAg4ps1mDEcE90/5oxm8P0ML44f+rlLy?=
 =?us-ascii?Q?LVFpcGH72DF4fyHGyntX5rx6oFoFTdG60PkiGYtma2RVNRkDrRJK/7aNDAK+?=
 =?us-ascii?Q?Cdv+dIyiSMQHoIDYv0FAkiOch7BWHIxE2sMAAI1HeaANOj/NA6XbYF5QJtmt?=
 =?us-ascii?Q?N7DQ0snSLfOcWmH5/HuDNE5tkFhnPj60TlAo46IYdB36V2NBLQem3FPaQDqN?=
 =?us-ascii?Q?vEInNu88rr10festmtsZGiS6gmPoMp2D30GxuhE7mWPy/xSTjp/XDreiKPoC?=
 =?us-ascii?Q?PZ0fP8S1XltWWKSz72dvjyE+GQB5Cs//dAnOpOkvv6WN7ufcRE4zyTaNRJVd?=
 =?us-ascii?Q?TpEudUhVSsjuz0CaNGaJI5ZJ+LQBdOs+viy35jZB8gs3HbYJ+OPuRY3KJ0wm?=
 =?us-ascii?Q?bbYFE9JSU4aYevEjO1NUrkdLynkksgquUVTeM4PmcWBaQBolQ/UbROvEhhNV?=
 =?us-ascii?Q?YDTNOdLRXkjYrV7bPp1VTF220a1tgYFrNkWRtejFkT0/8j32+4i8S7gMaYKl?=
 =?us-ascii?Q?waEeBaRzS5IjAhDBujQIh6sOpBF3DqZRod5u+VMmyg5VsH9qLhVWKgNZti1e?=
 =?us-ascii?Q?9yMTX79rYx/gqhQ6bKiHT7hb8dyQGokx/FiaaoCHFC4LAmIeAPhdXl1gzfq/?=
 =?us-ascii?Q?a8KED1rTTl8/PgHanrz+hUKCDVcYUSeICmFuXBYYxzDLfbNdE7dUeOeVlX5Z?=
 =?us-ascii?Q?Sg2fCAih9ZBhCpDZvGtx4akfkgpe3G7+85cmtEW0uzQc7sk2+Lw0tTiCFZ/L?=
 =?us-ascii?Q?wWBevIpmJhKAqFyIA1kif/2jAPK1RnERSyKCXH2Iw2LjDKjXmMclm4p9QDs3?=
 =?us-ascii?Q?32j8zQpQh23JRJevyjwV2Acb7VRB7XKwmrYShpOC0jjwHLSfcyZIuMwhWqRy?=
 =?us-ascii?Q?LylnC0OdYUcvHgCaCYS/mXrVjZYlwt5aydQIGRgsAzN124wx+QPBibwojDrx?=
 =?us-ascii?Q?hgfZjbKFny/8q492cbRqCURsGWaI5HdQABDz6dHTOX7WylSZTVToTo8RZUbS?=
 =?us-ascii?Q?flLhz69QG9Fhhp/nPSAjUldsRvpFlObbxY4wi8WLaZv6YKDzEPl5yGaXxYvn?=
 =?us-ascii?Q?neeien42QmUU4a1c1706OCciTG9T3DlQV223b7nMb0FYcx4b250gRZpmkoZD?=
 =?us-ascii?Q?q5+VzGnlHNKKYJCI2WlCzpy4hX0pZ/H+aFRfUjRKX72FBRcB6QBJ3cGm7LAs?=
 =?us-ascii?Q?asDnmEzDMe3fnKxtDxadmWHDlan2OoL3E2lAapVpm+o8Clxa3oy9zXGPYU+S?=
 =?us-ascii?Q?Vy1XjhJoDUF96iUHvmJmcqTeCpyoUZ8WXowXBx/mZKX3b5j29awsGOyh2wbf?=
 =?us-ascii?Q?djKA6DXDTCDcqkKgLfW2uR9NuOqeAWkaMMWEWrNI0Pl04AKuYftRkOsvbqyy?=
 =?us-ascii?Q?K83ofijyeQcEJqyfxXUl/llMm2oEsmim9V9obunJ+7oxSYa7fEJkH9/bfUgz?=
 =?us-ascii?Q?UUsk+Ra3YLhSZFNOSmf42XF4QvEFs96feyXEEn4AekxGdJOrqJVilOsd+dYh?=
 =?us-ascii?Q?ygriZGzS77M0arbgwOeQ24g=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9647b7ff-cf29-4b9a-bb92-08db0a2d6ee3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 23:37:25.4374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 C5ciSGM4xexUK0FB39HiPRTJggmQDBfQ21VYzCX3DyX5CLkGpPAPwHUuXHAhP/1QZKOIJnNrxI/CwjiL51K10wwOULPFMb8XkcBe+Vc+0/uzdXpiDEU0WBle6ToE4UZg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8451
Message-ID-Hash: NBIJWCUJLHQTANEC7NSGJUK45CH2CCTT
X-Message-ID-Hash: NBIJWCUJLHQTANEC7NSGJUK45CH2CCTT
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NBIJWCUJLHQTANEC7NSGJUK45CH2CCTT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Krzysztof

> Do not use "This commit/patch".
(snip)
> Same below.

OK, will fix in v2 patch

> > Link: https://lore.kernel.org/r/CAMuHMdW_QHmODAKvn_GwHHUWw-=z4Tdq0NkhdK2u2piG_YgB-Q@mail.gmail.com
> > Link: https://lore.kernel.org/all/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com/#r
> > Link: https://lore.kernel.org/all/87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com/#r
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
(snip)
> You gave three links, so why? You should rather explain why it does not
> work.

In my understanding, "Link:" is used to indicates what kind of discussion
have been done in ML, etc. Above are the link to related to this patch.

And I'm not sure why it doesn't work, it is the problem.

> > -  clock-names:
> > -    description: List of necessary clock names.
> > -    minItems: 1
> > -    maxItems: 31
> 
> Don't remove properties from top-level.

It needs if-then-else, So it moved to bottom side,
not removed.

> > @@ -256,8 +242,6 @@ properties:
> >              $ref: /schemas/types.yaml#/definitions/flag
> >          required:
> >            - interrupts
> > -          - dmas
> > -          - dma-names
> 
> Even with your explanation in commit this does not look related to this
> patch. Don't mix features and fixes.

Hmm.. indeed.
Will fix in v2


Thank you for your help !!

Best regards
---
Kuninori Morimoto
