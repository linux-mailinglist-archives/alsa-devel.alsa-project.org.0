Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A096764C1D6
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 02:25:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41C5118DC;
	Wed, 14 Dec 2022 02:24:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41C5118DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670981143;
	bh=gqOBXZCnTBqWoVUuTebBMEMQkG54xKsNsJB74kl8mVQ=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RW0LT4vdoTk2QDM0Z1y27gHtvAtRmRvRGK6k3r2mlZ+4yOWuH9JNjgA5cTCrRgqOa
	 0mc2KTE/Vq8nZPgJCFjtS7tJDp24jCVn1VRQRjf7B1E1MKjEB6bonq9uA70yIk0dcw
	 ghIKXr9RgqI58c9cQgyg7qfd4GnA6vM2/SXbV5eo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B05E4F80141;
	Wed, 14 Dec 2022 02:24:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD084F8047D; Wed, 14 Dec 2022 02:24:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2100.outbound.protection.outlook.com [40.107.113.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF4B7F8047D
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 02:24:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF4B7F8047D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kEQbF8bf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIOF4vAHCWViXFm5Fv3vtUhM1/vvZ8LGJAWGHPMmTmjQpaE9xLudZT9CbrWyuNWnu0rxjSyWB/yeEokkmYtgZOyc8W+IzFW+8KeyA4ySVd3f4Xuv7lDoi5QhnlM5EQnsRRpHjpz+imS7sChrg9kQETNnlZ/JLzE82wraUqpRUJI9WH9F/Iwe2BXMHJLBh5SLchTRbTdh9wDcX4zQHYFMX+Ze6fgjsOnAyxK9Jcs+dtaIpudsY5fGlAGXNXqJ/kKF4hecC8SsEnxTpZLIRjMt3xQ4GwDb2rzD0mearE1Cv4KKbRqu/bM/2kFQEvgkZAhBTwwiuqVKeFXhGObbd/pNzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbKWE3qJLxCL9d79wXsnJOe0Eys5+wd9pivYLhERsdE=;
 b=TXAbQ4oZpR9wXXiBmCvqcQx+TXk/ekUq0RzCqTwXFRippkdzbey8WAx8Gt8grKybEYqr2aSOr7iw3+Nso6HjH1+bzhJjxS1ZIRl27YjZe8G7cu9n823ezpc3Jck6ksZiWKRLYZXF14sYdlgvcgav+tURYNoyJ5vJznY9dLxLW1/Ft+3iyY8bkRlWrVXvasHuIm/8ARpMJJ5vu6rz/0XDqO+Y+OoxRTpk4snzMJwG7b8DpZXwiExwciun2x23IiudOpOiCrIw66HZS4SNWfAAr+Xk3ZvHVNAYFgVUgIgnP9joXu4oTk8Is1n4lZ8x14BL1zcubYwKeaWGkTVN4M7vog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbKWE3qJLxCL9d79wXsnJOe0Eys5+wd9pivYLhERsdE=;
 b=kEQbF8bfGClBV+t8iL+4w7b6FyJq3aFFcnA6+Wh7qxP7OQUUCpOIIj26ojzJKb4iOd7SfwA4EVZhbxNkGumWSk48JiRt6vyCdcqaPZDUrNcZH/WaYMb3LQK4Z+A0x4AWKoLoAdzkgXSd1UP1uW/yeL+RBoOfzcjP4llqK5CCurM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7783.jpnprd01.prod.outlook.com (2603:1096:400:116::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 01:24:31 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::a5a6:2344:db9:431%8]) with mapi id 15.20.5924.011; Wed, 14 Dec 2022
 01:24:31 +0000
Message-ID: <87h6xypyk0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/11] ASoC: dt-bindings: renesas,
 rsnd: #sound-dai-cells is not mandatory
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Dec 2022 01:24:31 +0000
X-ClientProxiedBy: TYCP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a16c648-fca4-4adc-9632-08dadd71f3b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EF5hn2WeT0lF8wAxJKkdAOTfRpPzkw/7e0i2cKmiYFrQVBorMkccgKyschHxIVxWeWxO/VqHUB/xkiR+kYbWqgpCTJe008DTzknR07t1L26803EG4FSFqBYC9cR1GqqTF+Q+RoOjEdNllrjR/aK4CSTpvvDsaLB5iyksRrCBTcAtU7PEvV5DTp1YzD2rvSa4okTDEuG2qAalpvUCKs/ZI2IPbB32x2p5mLLyGAvqiFb9B1H4gIVCgt/DRGgYoowMPW5N7D/0GVltTENlogYt0caqiiI3ajsOW41BfCsixAwycK0QLQSfcrkTUM+oFycBiYbjFs7hbMzmUy2cIMdkwWacJ1hFmM5u2lgmQllx90rA5Ydt9T+326OTdqvmemZ+iZh6p4uU6mzjLleCLTIpvMUkaj4oCGXZ0xwhMPlBxYSuT31otpwehue5meMMBBL5lr/JI6IwOqa5zuGX04E5ud9u++23D8uy8Br4Sky+LBgOHeKpyhInG3LTn21jDKXf+Rneo2n7Kslsu3OIGb4SxHUONn446guBmLxo3qVsKDEGZoK8UaL3+zDOu3+OGWF9kHdudDzaLlv3aQbCWe1BmE/wlqYy9I8gjDR+ypSu4Qc+7GIbcJfP3kPsyzzvMHGc+BALnn9JfBm4GGW9O4AJe4YmzA36Z8TYjHR1IkOstxF0+wKgOeK9bsyj5OyJBn/G9fxBfcLHfHDTwc3M+U9DAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199015)(2906002)(2616005)(54906003)(83380400001)(186003)(110136005)(36756003)(86362001)(66476007)(8936002)(66556008)(7416002)(66946007)(316002)(8676002)(5660300002)(4326008)(6506007)(26005)(478600001)(41300700001)(6512007)(52116002)(38100700002)(6486002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GJZ6EUkOZwUq8SpxxJBQICM9cvuyfSg7c5/2pkpyVvHrblW/sGqac02wKF9S?=
 =?us-ascii?Q?9qh3UlO/YzDjxOlS9XpCG8jO4S4YC3HnRpWloyQGaZJlJRaldgmo7j/IlSMq?=
 =?us-ascii?Q?wY/dcH5iqcb0c0Dllz0BvJ3PFHF486PffmeyexYas/M/KwHqD/QfbuVqRAHH?=
 =?us-ascii?Q?Asz9aPfszvojThc/Z6TRh84O5FEMEgXl/3YzufSgdvjt1CLLn+mLm7GdTTPC?=
 =?us-ascii?Q?Je8ZKjs24ILe4NQ3w8l1oOqCMhNAPSCrtXYJWolvvoY8eQ5LXbTnPUeU/VzT?=
 =?us-ascii?Q?lWfFJbPwlMAPG7Xa8fz8JbPlESEQXSDYlAkVVaVBG9cnK+8E9BKq8zcZv8EV?=
 =?us-ascii?Q?YICjpWgNctCFlZQfxKoRNLUziupd814HWKctQhUQnzt5LNTak1LuIoYChAWk?=
 =?us-ascii?Q?BPvHw3plKsvwgRsVlt2SPxmcrnPFq87vUXX94+sQl0Kgc5dmExlywRsxibqx?=
 =?us-ascii?Q?ojr57xTP6iU2JpsviuzUbDxf9EH2h/c37yYOGO9qeC/3JpHCBqUpgetG35Ig?=
 =?us-ascii?Q?ci9T6JdA3SFa/zDr5hUud6qhBBubS6yrAM5bmms0280ahKlXvlJYpg3qZ/9o?=
 =?us-ascii?Q?z9MjZsHj56tvPmKCZjQpmUClgVzjvUxFRO+cj62B+lGYHlVzZXuQftYttpjU?=
 =?us-ascii?Q?eJEp41IWpY7lLGWlw+nXvDcSemGKhPgkLt5RcKzqi2AraagvubQjMIk9E7EJ?=
 =?us-ascii?Q?MfV740In8GEC3UeuFyKWMGSKznb9KIR+HXM3J+x2XquwUEQdBWaI/xQxWv+r?=
 =?us-ascii?Q?kwOoKFSnTweHHUk7WhPoDofi6tQA0rFUP6A5bEMq58+9G7UGztGG47C+9bgg?=
 =?us-ascii?Q?no0HNzX/gmN5dx1w08yaI7MOTlKmeHSoPeoXL29vq2BfciDQowo7wlMyZqo6?=
 =?us-ascii?Q?TgFikAX1gDwLR4nV6ZkrCS7/k77IHOfTLEpXj4Wvjnz05pPbjKOiCHOz6tF+?=
 =?us-ascii?Q?GNRvNxMhDUHxNA03KwQEphWdzhK3SxSyDHZN8v/BwisfO/GN4N6heGjg/tbc?=
 =?us-ascii?Q?1AYl9NeUgeNwtx/ElKzknYUiffu1jFUn4yylxDHHq0NU3YM6ZxOiwqKOm0ry?=
 =?us-ascii?Q?2aeMPWZjwxrKdMD44B6S4yJmUSXnTBBiBkVIsCEPbZzgxxwEcgEFYDmTD11X?=
 =?us-ascii?Q?KJZnbvDV0YxynnOOEdCQWE4DziAViYeUEHgS/xb6Mjgm2Es3pTNsF5pPRvTo?=
 =?us-ascii?Q?Uag6WDYj7ASQBEXCO9rdw8uLblk+J0ppmVtCWOpSG9zTecnmbHyVf8IU1PW/?=
 =?us-ascii?Q?oBC+8oZeX4qJYpdfBULe8H1YBzq8xxlX1qw1tRk3Ftb845CAf+yc1amObgKs?=
 =?us-ascii?Q?E9DQA4Mj6HRVaf8M105XtJTzM+0viAo8soLKIiCABPTGq2ITgtea/xUXBG5N?=
 =?us-ascii?Q?DyWG0+RrSij7VpoYIe/oERZKz9jT/54lyTIxpY/+r4ztmrYnypo7L9EVS9NF?=
 =?us-ascii?Q?pCBQaf9tvJl60zduDemm21ds47k2/+sxud3E45gUFXus1IyanDnMSB0OsWPS?=
 =?us-ascii?Q?4LbYwkYoz8C3fIlbkBpT62rWCI5C1D1M9uGXbgYuWsRRDLxhPb0vbmGsb35I?=
 =?us-ascii?Q?eBlHGxF/zAfcsco2BAByKZ3cx/WqloLbOX/q03RE4byCJMqsRM0MpIHgmAyF?=
 =?us-ascii?Q?R5OkyALPAJ3qpUaujUtzRpU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a16c648-fca4-4adc-9632-08dadd71f3b9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 01:24:31.7352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JtnNjh4hfEyGtjuMAqzcAeRD3Fl4+5dj9JvtGKgL5eAM0UdRuYZPWy/gHgyy1xNBjJ9CFEUeYFr6DaThmUm7n8QKBotZJhpjjpphS1aYpfPdUZRCtpIHkA+qUp7kqstW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7783
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
 Geert Uytterhoeven <geert+renesas@glider.be>, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current renesas,rsnd is requesting #sound-dai-cells, but it is
needed in case of it is using "simple-card", but not needed in case of
"audio-graph". We will get below warning without this patch.
This patch fiup it.

${LINUX}/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dtb: sound@ec500000: '#sound-dai-cells' is a required property
	From schema: ${LINUX}/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 637130b7c307..5dd41838538f 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -68,6 +68,7 @@ properties:
     description: |
       it must be 0 if your system is using single DAI
       it must be 1 if your system is using multi  DAIs
+      This is used on simple-audio-card
     enum: [0, 1]
 
   "#clock-cells":
@@ -290,7 +291,6 @@ required:
   - reg-names
   - clocks
   - clock-names
-  - "#sound-dai-cells"
 
 allOf:
   - if:
-- 
2.25.1

