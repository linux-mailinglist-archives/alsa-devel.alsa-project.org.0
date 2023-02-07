Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C568CBC3
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 02:13:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4A201E9;
	Tue,  7 Feb 2023 02:12:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4A201E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675732417;
	bh=YJGvSDnGmN3jDBPCvaqvYOZ2jE0dwpRDDev3wEcRq7M=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sxIVPaOQrCvb0PtS2UYnry4Y3ji+TvCe7wr2eWsotBSf/ImaqI1pL8VijS2GZvsZM
	 5ujyV8Q36CFy/4tLHkyeMtXocff89tNmdE/NXhuQNzQ2dRRlDZb/EPqqi+M5XYBCv1
	 2IoOQRIJh8AKE05zb4u7WMGez7/T8vujijyaURhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E42DF804FB;
	Tue,  7 Feb 2023 02:12:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 250D3F804F1; Tue,  7 Feb 2023 02:12:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AC_FROM_MANY_DOTS, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20714.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::714])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D4AAF800E3
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 02:12:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D4AAF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=eM6Qkw+V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQpfIUARPrkvy6wwOKYZq9Yiu9KXYTXbTOSkp5+/5fMH5gjGnDwcI4myZKVz9g59uQ+vvDWC8bqMqbfRFduOt3m0nNkIMyukWYxSZKLMQBVbdP04BQxJPQ4LPLP4xDe+jmWyqcPKhL0IdSeqbu/7HkFzrd5Xml2QLuerWOQRRrhRmDJMDCD7kNE8pIkwH8YfFX82VMxvFTJZxeEXmWuYJ9LMm/EbQhLWmRjZxkSoXQ/IAG99B5xQNaJAG6r7Sp9ct4tzrr75EURaECUmNKug5uPcuA/jiR4w9JUclu666wbHqem0a8jQmCtqAQKzZlZeIlJdZs4UgZxmfP6pagK6Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLHooIfitUsaUlEHvcJTNRWS/xDSAsJlOcDV7FT99bM=;
 b=iPQpttOXGSt5ffSlXOqnu2Pf0oXDq3eVx+32SMnHak1VxUJbwJhYfyMtBg0bY+CPcOLOfFsxyqs1VChzPtWkZNBxJT70Au6Nuy563mxxRgedWBmpocp4a6voonakRhhyJKrpsBwXnTWIP0uhderX5ft8XFyxDWG05poMgbeL8of3IWX+AivBlE3CBm916BZLSndBR0fE5wKExN4+g3kEUfkzraUH5igfkMn1rzefFPSssMGtkFB/YyUtAZPyDUnHDa32SdIk9AtMKkGDQbGxhxhQp9SREyexuAqfv4sJzrPdrBraHNjoIWH608NUyWeSqRKg0BM+XH5jLAQEQkXTTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLHooIfitUsaUlEHvcJTNRWS/xDSAsJlOcDV7FT99bM=;
 b=eM6Qkw+Vnk6ZYtu2dkIjF4fVfUjtDZP9iYaCcMa3XsDoNzxNnTje980xxlgdwVSnVrjGiIcLr/vViqHczCUzzjIV/mpATIgeOQXb+N/GkjZTgefxb1opczzCUE2b2iV/ZlFEUA2cvMYmtCBb6FzgwrFb0w6J34bWiB1fTa8bpLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11511.jpnprd01.prod.outlook.com (2603:1096:400:379::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Tue, 7 Feb
 2023 01:12:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%9]) with mapi id 15.20.6064.035; Tue, 7 Feb 2023
 01:12:17 +0000
Message-ID: <87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH RFC 0/2] ASoC: dt-bindings: renesas,
 rsnd.yaml: adjust to R-Car Gen4
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 7 Feb 2023 01:12:17 +0000
X-ClientProxiedBy: TYCP286CA0232.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11511:EE_
X-MS-Office365-Filtering-Correlation-Id: 95d8290a-d591-412a-94d2-08db08a85ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3fpsBtSN+2wopCPJsqL5n3FU/rQkLxOafuQgHIQLi4znNd+IvAGTqeQaJIptyHIhTi2QDaXlVeb0IwueCKT/Iy4HnQIg78ZJLNsg7Q+m3vwixhD9Zm1Cji+jznRZ6KuGMmqz7kDalyQcxSXG3osP6rpeFixlciaTh+JFG6DceBImDXeJ+J/rAroH7B3dGT03ZvBxYPVVrrkEDG7/4J/9J4ufQVhQq1cI+98KFB4Fbro/IRTN+/wnkMyz9CP1135K3Kb7xw264XzFj/JNk2yUOtWQnL1zrlRdFxjUpizesY3mKt/LYNsbYLBqCt8kIJ/6X60h+SuRl+AkYO9UkQOmBU8PxZCNo4z+kEBeLI+l+TeMKEuUl54mlVr3WMhOSvQBVAxfXdBjZZNX7ZHNXLtK9V/NWW4Yv8rmamJHYKXVkMQ+qE9U7y5RkPGJ7bsOacX0sgFyvhiBivvW/sbMlE7QHt3zloTnw+y8UJmkfA3+KsAWCGovm+cnh2R3dRcdPADeF43jNyEYs8UzUQPn0tiGC9URj0Fr5RoWQ1yvclEK/va1tCN92dHQSNTG/otqXlk6agYNHXu5iayhn0+Ci+oE111ZaSn/91xrT0Qulgfk0MIYzLsL3WncyTmhOJu5g/vy9tMZDSvPsz7us0Xozx9XdpsPzc7jV7eqk3H+FrOGnQDy3aUBVHBtZLUhqdX9aiEyB9QQaMzwb5ZF0HskSCdgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199018)(6512007)(26005)(186003)(478600001)(2906002)(52116002)(8676002)(66946007)(83380400001)(66556008)(110136005)(316002)(6506007)(66476007)(2616005)(6486002)(41300700001)(8936002)(5660300002)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qHNyAZG7mlB7I6OUKMitDMxRr2aXhEWdMPBwzqpRgCeSMJwNHzaZqzaMtsH0?=
 =?us-ascii?Q?0OkQ2yxEL3D+Y9WdwCtSzYgiJZV+Of8HhLiGu31mczuyy820uvtDPBy9gqNm?=
 =?us-ascii?Q?RnfDYHFMkyGJMViQQ6ZufkkrBFdLlP/Ja908WbUIIVhDgYQlThNsLeu2pmBp?=
 =?us-ascii?Q?gIGD0Pqhri8Op4s2ePOa3YpU/SFfW0aU3QmKYmTTUZ4SgnDqZBbrSuGb5smy?=
 =?us-ascii?Q?BWiF5PAoKPEXhMsxGs+QlikTCiabANUuvKbMr+xSMYqFwD748IT7MtPVPhCS?=
 =?us-ascii?Q?s+XgE7Zw6KgsFH1jd/g0xQPVnZhqr9g2uDWdH3AbSrUfcfwNzTZ3bL5E+8Ps?=
 =?us-ascii?Q?zBbmZUMtwAD+mtc4qPAa4KEe+7cS9NW0+XKcVMHRXdbYTPRfnsQ5r3eM9qYD?=
 =?us-ascii?Q?RrOzelquFr5YoViZfpTCfdcgBPNDrDOoNO7tne7YoEJlTjy+pSzBPM9F6izr?=
 =?us-ascii?Q?QNYFjunPEq/sl9wXu5l1iBuKEfqN2OiSgUCVvZxwOyTf6S8WMfk803Zi325V?=
 =?us-ascii?Q?nCZIaRjmX0xdT38g+/9rNzv719OgV8MckgC6x3e39+zSqqZTad1iapFaCUPk?=
 =?us-ascii?Q?kZ+CAua/YsFBzLpUqK3LBllZKuQ+oJzc1MhmiJ1N6PnXNHB3zkxX51TBrkMm?=
 =?us-ascii?Q?bE+piOMGFQlj6FI4FfyDnep3q+aSL+Fhl0coQ4uQ8MXVKnCl5KXDjX2dELBi?=
 =?us-ascii?Q?7oRsV7l7lJLEDYxz0aXcX59RUuLwwLCpLiSIV3Gd76X4nBslh6W9r2UV+VKj?=
 =?us-ascii?Q?e607khDDu2sXH56Y+fTY1w6F1IGjs2WmdomwrwfkQzhZt+nwzR4NJ8Aup5qh?=
 =?us-ascii?Q?v8GRWuSp7dwtCjKlMTOykjE1PT4JqVEHZcJTcdkmaWVkkxUyVw6tCBpN9Usi?=
 =?us-ascii?Q?HaphJpjwzkt4Bb/yONzqp+6IRQRitHWo9A1WHsc3xXcXCX2ULAF4TByzH0kY?=
 =?us-ascii?Q?lbHaEyJo+69eD5NMbkeESJuslLZg49y5I26bkLsD6ekmVrP0Pg5PUG1iBjjE?=
 =?us-ascii?Q?3QHT/B5OfolHkFH69wXG0XifOVASDGxa3EctvO1alo8ssMI1GqJ7vQFqboWP?=
 =?us-ascii?Q?jy8KD2S9lwLcA5hacU+GSJvEzouBpUtLA0a83juXGIc21xAz86zZuikMENAT?=
 =?us-ascii?Q?WHAJAnlRHGBDTSdM4x6BEkNzUbSgyaVEJ4X6ms5eHTkvP1mLWEai0y6nGUmV?=
 =?us-ascii?Q?6ZK88wiM5a0PEs78ycdIjm6ZSVVvvF0xhodOhBN2U4NI25N4CwohmbEkviY7?=
 =?us-ascii?Q?GZ2hVmEo1iaEtSzEvnKjnDtM+ODJ86JwXipLve/kn0cN32upZ0QXXAVhB8Fn?=
 =?us-ascii?Q?qdSmDRaJNExtbJsVFuwyq5JhGAb7bk88j/a1zRLy1sN57+gJccw4D5FEHA9R?=
 =?us-ascii?Q?DhWPvOQhXpm3bLWs4EM5CGsW9TArgGJAKXxmaSMsDlYQ93Qx2BzPla1Xo8w1?=
 =?us-ascii?Q?SchKaN8J9kKNwNHvBv7dD2gpYa76hLjIzqECP5/p62G3No0Hfahom3GwHX/2?=
 =?us-ascii?Q?3e/lQffWAm3OyEhSJowcGHjf5xbkOONcdadJPReRNmXZ2sQJnfGMD8wO3aqk?=
 =?us-ascii?Q?/mFEsNnH8FvIR9M9iUwXzfdD30LwT+UgJXaZvtWTnd7jmc0fWI00fAGtPG0s?=
 =?us-ascii?Q?+BptyrWRHMbLmisPaioVZ5c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d8290a-d591-412a-94d2-08db08a85ae3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 01:12:17.6542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjjfcPub9QoAdQLXkDdvguUFcGhyXui4ws0kiJEUY0jfaKMACvRTlLSdM86ayzlXgTzmXokMNuuw4WR5KgE15RJBKKljiMkj3ErezyVl0HDx54NoFlNuGDS0TubmgZfY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11511
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


Hi

This is [RFC] patches.

This patch-set adjust to R-Car Gen4 on renesas,rsnd.yaml.
It works and no error reported.
But by this patch, non-Gen4 leaks from "ssi-[0-9]" checking.
I'm not sure why it happens.

	-----------------------
	rcar_sound,ssi:
	  ...
	  patternProperties:
	    "^ssi-[0-9]$":
	      ...
	      required:
(*)	        - interrupts
 ^	      allOf:
 |	        - if:
 |	            not:
 |	              properties:
 |	                compatible:
(X)	                  contains:
 |(4)	                    const: renesas,rcar_sound-gen4
 |	          then:
 |	            required:
 |(A)	              - dmas
 v(B)	              - dma-names
	-----------------------
	sound@ec500000 {
(3)		compatible = "renesas,rcar_sound-gen3";
		...
		rcar_sound,ssi {
			ssi0: ssi-0 {
(*)				interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
(A)				dmas = <&audma0 0x01>, <&audma1 0x02>;
(B)				dma-names = "rx", "tx";
			};
			...
		};
		...
	};
	sound@ec500000 {
(4)		compatible = "renesas,rcar_sound-gen4";
		...
		rcar_sound,ssi {
			ssi0: ssi-0 {
(*)				interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
			};
			...
		};
		...
	};
	-----------------------

I want to do here is that "interrupts" (*) is always requested,
and dmas (A) / dma-names (B) are required on non-Gen4 case only.

But, it say no error if I removed (A)(B) lines from "Gen3".
This is not my expect behavior, but I'm not sure why it happens.
It seems (X) part is not working.

I'm happy if someone checks it and pointing what was wrong.

Kuninori Morimoto (2):
  ASoC: dt-bindings: renesas,rsnd.yaml: tidyup reg/reg-name
  ASoC: dt-bindings: renesas,rsnd.yaml: adjust to R-Car Gen4

 .../bindings/sound/renesas,rsnd.yaml          | 89 ++++++++++++++-----
 1 file changed, 68 insertions(+), 21 deletions(-)

-- 
2.25.1

