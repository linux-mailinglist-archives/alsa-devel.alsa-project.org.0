Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1438670E68
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 01:09:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F8737104;
	Wed, 18 Jan 2023 01:09:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F8737104
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674000599;
	bh=YAgVBU1hN/tBlJfBZF/TEbGM9lmLJ+cMYTtUWrUZiC0=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=vODbDNG8VEW2yvxbDdh2flPGbIvBuLnqdcMFg1+JQ955gfL47cNaOiNeFi+DCzx+l
	 J5w61IXkQAT0DXtE695W6D23i21ogZM2iNVivHxc1OWq89BWdR33YKij+Gtemcyhmm
	 J7n5HD+6c1PJUKvSD0UFUb8R9lff2jzjQdOHXAlA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3DDBF804E6;
	Wed, 18 Jan 2023 01:09:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01BE3F804DE; Wed, 18 Jan 2023 01:08:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2123.outbound.protection.outlook.com [40.107.114.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52ABEF8023A
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 01:08:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52ABEF8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=D+iarF3t
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8dylzCNolELCuCzRFj+IR+tN1KS/wC0lDzdbPEN8gvZo3Lz5LH35A85CJzIuRiBPfX2RvoElBl2v+PgaqPc2/FfQed3zU4qEzGCNimAZVaxOpa0+mNmCDJ8NE6OTMOkgdu6F9VimsLIVgomtc98vw1yPi5ON+lE5aC3dcYoE8tnSOaLr1K7Rtn7z8ZAFrvc/fy7VOpwlpCunbfUo3uoViwUrVl4ggwuTCMSl518X2I14cpDZFAv6j4DhB7prEbvrYSstSFnDKkrYEca42KWX9/TNJkbnwYKkihdDYO5Lkaszf0QIH2krKbc1Mzhd58Aej4AV0aSpwoj01asVIiSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4o0z540TedtUZovYKFBjTKLnSxvp9p06nAtKw48S/E=;
 b=SBPuDFZ9omTlM4gMMzHVIE8EiC1VFjHwet00hG47Bt05z8TEdESi7at+iYAMWD9LZqAGXVbbluVefz7P2LMzK5Q50DsLZgUeAy1i8y0jG6lnzZirxLfZFVWNIoFizgHtonvA4yta/dXqtHRWwLyP/a9aTxmtkelt+y6rRgPdOr84B9ngVhTrq+Vt+CpP7HZPDn0HSiYnOhbvYUDmAfpk3/8+kGRGtjNTWvBrlNdoX9Z/CwVtge2A5hI8eRKI0GcQywe59P+1EzMSgZkJCsN5IUaCY4EOrq0KwxwD/AdhM5+OMs8nyZJjsQUAQMjJEYlVpoe2zi/d7l2+U0WExabPTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4o0z540TedtUZovYKFBjTKLnSxvp9p06nAtKw48S/E=;
 b=D+iarF3t7VR/71WiKR8FndW31smapB/Z3z67+MEL29YOEC/sCnrIW6Yc6js5WW7J1xV4vXGw0X+0w+w3EJbrxCoKpVA3JbyiBSJepQffpcc15Wp4gIye7a6vAXMPXzxp4LkMy0Dwu0kaf0WhF+YKfE4wWWD5FZuyFDhxPjtnhGI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB5709.jpnprd01.prod.outlook.com (2603:1096:400:a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Wed, 18 Jan
 2023 00:08:41 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Wed, 18 Jan 2023
 00:08:41 +0000
Date: Wed, 18 Jan 2023 09:08:40 +0900
Message-ID: <871qnsd7qv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Rob Herring" <robh@kernel.org>
Subject: Re: [PATCH v2 02/10] ASoC: dt-bindings: audio-graph-port: add
 definitions/ports
In-Reply-To: <20230117170439.GA3225212-robh@kernel.org>
References: <20230117170439.GA3225212-robh@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TY2PR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:404:a::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB5709:EE_
X-MS-Office365-Filtering-Correlation-Id: d2916f36-07ea-4738-f818-08daf8e827e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: llLXPwY1h0PvCZRy92y5HB25abHum7YHH3lMOigBqO9UtXU1SVih5LQxqN7fFKBewne3ttvOTu/mjpyIJ4oeF9BhC8rIcC/XJlGBCKobcHrORQr6hBGELh7ZnzKZDObBOr/UmVssccWJ0PdG3N6e3TwXPNPaqWbrIluruvqQ97PT304OkI8fNXxkj4TkCHOH899tbTxPGnQAX7EzLw+S31ZQRwo9WsHgJ6n2Zx4G7YcYOcTi20VwOWaicGUXYqQAJp6vVw61v9McvkRTEY20iOAV2zB11FnWg5skUwmPIBhDJeuMxqm3RGY94RxhkV+Q3zYr8U+OV2L6IVoTVLpYu3pzm+bz3GQ6BzvMQY5xLSC6LeCxitFJO3/jcugzxZ/yz65Myve+YQ36eRkkpDNkeHCq66YZgyjs54sp0Rd9lOPSSZNEEixLPOCCXrQRHyeAA/IewSapoZHJWEzpt3Ws/yV/Xmk7KYOsRAKGC2MwfNVBh//bVK8BQHGNpZzlUAogOqjhDctPf54ss1ImtxDpqpJ1U+AZ4Fiua8YVqXzBzhZE8Mmr0oivUKImo/+D1+o3E02818tqSD4Jp/B8nE9SO0G48QH3HM+GIOhqOrAZLxvByuN9W81nEEAgA1EoWcgU9F7FM900zSJoqXOObKH09vfRBoH2mXzmGCGa9zZdBz1+QKFO2j12yiUa2a68Crd1WjthOMqm3VIQsxgkDdSmZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(451199015)(5660300002)(36756003)(2906002)(54906003)(41300700001)(316002)(2616005)(6916009)(66556008)(66946007)(66476007)(8676002)(4326008)(8936002)(38350700002)(38100700002)(6506007)(52116002)(86362001)(6512007)(26005)(186003)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T0hO27Dcjp1nO3oXEu0C4LRlYrvsw7H2v1uRZelC8GFNoWEKhhrG//1L5Ggt?=
 =?us-ascii?Q?8wwwpDqjg7JUF79oWkOrWI2zxZG2rF1OYAA4ZBLxCk0S5YLisrIW+AQzNiDf?=
 =?us-ascii?Q?e7V4euiNxJGL6uTs6byAh3yod/AmPmQxgth53LfdUL0c5dJl6MfonbcWlWy8?=
 =?us-ascii?Q?Zm7Gt2mAXLcQsmIU97GpR4C7aKkDrH3g9tTOMVZF9bZdpIGy1ONbm9ALgJE5?=
 =?us-ascii?Q?5Blu+GYtNlm0YzAXFElr81LzOaXk5sG3Ej65RHhO9UPsEODkJ6ujg8tx3KUI?=
 =?us-ascii?Q?xtfOar/FG41Eb88X0+zEV9/ZwPOInvKvPYWH0oskEFUQ3Rn2Bq4JVH60YQlq?=
 =?us-ascii?Q?ppdv4IRbWQaI+A9DBoP6zi8df+QxeYk0OyOlOf6LdsPOBI0UNd+lHHhHNI6n?=
 =?us-ascii?Q?dlZ2en1gLKDoVEdSsbPn+kbhR+v8q97x/olLXEbQ6IIL52gJlbzqDQ5ypVnS?=
 =?us-ascii?Q?MCckmqSye9UnZ5dAcNuEHCdsqSEfYf9JI0eBPvZLeiK0J1c4Zxfsr8jLnMi5?=
 =?us-ascii?Q?ArduWVMRz+kBTa+ba+N7tVJf2udjxm0yDM4hrCthdesDTrGMbJXgDH5eFLiZ?=
 =?us-ascii?Q?ouY0OcC75t2ZL+3N+fsZ4k04Qv66iPylXrmN3Ts+aUI+mxPlsDiKAvK6EjF5?=
 =?us-ascii?Q?MVFgeVPsefQL2173i0ftKrwUw4OVTd+BFgJ1FeNNg9+W812eqsLrOWUYCTTo?=
 =?us-ascii?Q?s3997q8mdOPw+aY4mDvo2QVuv8W9PWBZoTUpF7vhTTvX3JJ8E7+Y4JVaD5SX?=
 =?us-ascii?Q?P1G5evXP4sOMRUiQp/Jd+Luh39+OGo1zlHygH3w2DGUCPBKHSLNR5NTIcVwj?=
 =?us-ascii?Q?eAHPfKkvyZnGNulB0DELRdTe5QzO2XW+Ok+QzHBsX16hiQbZytEbUPFmGbI1?=
 =?us-ascii?Q?S92F4JzgXKTi+UbTKlOuDyMSoQHwceTAMzqZTwLHoEOhzMV2vOtutwwuWbtu?=
 =?us-ascii?Q?lCEsK+FKwWupwwEZOuIGU80bTZOuIhy5jpczTx6QJ8kHI67LXT/6D47l91Lo?=
 =?us-ascii?Q?PP7Yio7pGMchjST7hWywJn5Et2B28XbQvl7THKFqhVwak5y4OiBoTs5yLnUU?=
 =?us-ascii?Q?AYi6DoAZvYis2VHNEais8bYh/hfmwJ/Ue5kGY/YDc8RlXAkEtRnRvEblQtOz?=
 =?us-ascii?Q?8T1iNb4/8BJST8d6MmQXUtG2ksrzgWkJeWDbs8bkJaz2avC3ttg+448y//p7?=
 =?us-ascii?Q?cR0igRuKvULNP52MxhmpNQW1vcFJxCaix5EUpGBqnNpXYVVbk3UcrFq+K7Y2?=
 =?us-ascii?Q?vuZkMgMyA/vKA84eMwCZFUoCwYUP5zLZfOks55HL6gPH6txeYVuMOrOeHtam?=
 =?us-ascii?Q?N0Pia/TPWvaTqkgNC9w3OuQuudWW+9eNzUP2HUXAdEp3c3UKwyS7Vk5Otivu?=
 =?us-ascii?Q?AI53uFKEoJ/XSXFP7w6kBXgJom2h9xbOe3wO84u0EuC7zb6wHVXsJHt5lFnW?=
 =?us-ascii?Q?tFpyj0uE3vkv+WveZYJ9TnR4c9rcJO7ZX4yB00dtSSKcCOpnACcD9qdIAZ9W?=
 =?us-ascii?Q?lsx+tjxKx/mBnfvBC6DZQy83U2Zx7JkIraw5fjMoSO6V5ikIThCtpHJ1PaRi?=
 =?us-ascii?Q?H+pm3x1V2d5CmGKw5y5C6JDVps/Vvw6gBZn5lPq5yyIunZEnRAVWBrocfc2G?=
 =?us-ascii?Q?KbImV+FF61z0TgpF07roKNk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2916f36-07ea-4738-f818-08daf8e827e4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 00:08:41.7232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bG3Rm0710iUGRG2gg9k7QDz6mU1qWl6np2ahEQFqOvONBEKLB7lUXY8xyCH2nj9n0fm76lqsnopYG7a2Eibhj4NQSbwGhT1k9F13brHkjOWOQVDHq/D7lEUYt1XkPMeu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5709
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi Rob

Thank for your feedback. 

> > +  ports:
> > +    $ref: "#/definitions/port-base"
> 
> This applies to 'port' nodes, but this is the 'ports' node.
> 
> For example, this schema says you can have endpoint nodes directly under 
> 'ports' which is not valid.

It is a little bit confusable, but "port-base" doesn't include "endpoint" (A).
It is the reason why audio-graph-port.yaml has patternProperties for endpoint (B),
if my understand was correct.
And user use audio-graph-port.yaml for "port" (C)
Thus, above doesn't indicate that "ports" can use direct "endpoint".

	--- audio-graph-port.yaml ---
 ^	port-base:
 |	    $ref: /schemas/graph.yaml#/$defs/port-base
 |	    properties:
 |	      convert-rate:
 |	        $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-rate"
(A)	      convert-channels:
 |	        $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-channels"
 |	      convert-sample-format:
 |	        $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
 |	      mclk-fs:
 v	        $ref: "simple-card.yaml#/definitions/mclk-fs"

	endpoint-base:
	    ...

	allOf:
(B)	  - $ref: "#/definitions/port-base"	/* this doesn't include "endpoint" */

	patternProperties:
(B)	  "^endpoint(@[0-9a-f]+)?":
	    $ref: "#/definitions/endpoint-base"	/* "endpoint" is defined here */
	    unevaluatedProperties: false
	-----------------------------

	--- port user ----
	port:
(C)	  $ref: audio-graph-port.yaml#
	------------------


> But why do you need this? The graph.yaml schema should be sufficient 

Sometimes Audio Graph Card/Card2 want to use "ports" not only "port".
People can use "audio-graph-card.yaml" as "port" today (C).
So we want to use similar style for *normal* "ports.
"ports" is defined under "definitions" (D), so there is no effect for normal
"port" user, I think.

	--- port user ----
	port:
(C)	  $ref: audio-graph-port.yaml#
	------------------
	--- ports user ---
	ports:
(D)	  $ref: audio-graph-port.yaml#/definitions/ports
	------------------

As I mentioned on git-log, *normal* ports user can use (D) style.
*custom* ports user can reuse "port-base" and "endpoint-base".
see below.

	---- git log ---------------------------------------
	If user needs standard "ports", it can use

	    ports:
	      $ref: audio-graph-port.yaml#/definitions/ports

	If user want to use custom ports, it can re-use
	audio-graph-port.yaml#/definitions/port-base"
	audio-graph-port.yaml#/definitions/endpoint-base"
	----------------------------------------------------

> because you aren't adding custom properties in 'ports'.
(snip)
> If 'ports' schema is applied to a DT, then its 'port' node(s) cannot 
> have any additional properties. That defeats the point of patch 1.

Renesas Sound want to have custom "port", but sometimes it want to use
"ports" too. [08/10] patch customs both "ports" and "port".

Thank you for your help !!

Best regards
---
Kuninori Morimoto
