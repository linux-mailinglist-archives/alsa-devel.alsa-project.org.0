Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C17A56F7
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 03:24:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E322AEA;
	Tue, 19 Sep 2023 03:23:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E322AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695086676;
	bh=fl9RTu/J+2nKoKFe30wTkuZi6/qI2InRBoATgwNusH8=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kj14pCc4fSpIItqydb2+3O/+nqRAZBIqxJ/boTcidcWureyMsvE28JMp1dharCUID
	 qDjRBgcoI7NZxl+AwxmHLKbz5wbOrGK+rCUcv6+ZnPufSH9/OXbTyk+afy6D6SKPfo
	 CYN9axchLnAAuu1Oj7YPOGsrfg/jqh5v2Oy6Gcvk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98DA4F80563; Tue, 19 Sep 2023 03:23:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D232F80494;
	Tue, 19 Sep 2023 03:23:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F6EAF80549; Tue, 19 Sep 2023 03:23:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-5.2 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6ED3F801F5
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 03:23:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6ED3F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=b5mRQqCK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iV2v9oh53VfbhNh6+XLn1DJCG5Lv4FGnxhl5ns52g/kyMwwumTr7I9a47AyvSOS/Y8zBqIsEIKo+divqPN0Uoi+L0ncgjenzTsMrfAFkIkQ+gKvW5iC2mQNONJuF1zCEzi57Uoz4Pgx8gF9LVAQBwQaKLJiaywyLf9rAX8DlvzP/OJRmEfnwwIg28RAV7vbKRtzH9EbOIdfgtSsFH0zgEl8a1X06MS95LGE6UZSZ/1CI0QVor7CCSWAULjgaKilyAW7x7uEPZ1pk6EOXe25jtSsab8uvjdxH4vJu1ubGC5EbBsRmf4CrzhP71SanWhWzqrOwZIfVVNm/n9pEXqTLmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5nzHWgrBRsMptXCOLD3Yb+GBemELCD2h+X11hB9dO8=;
 b=PoZcU0I1fOnJBlzFMDWwYDPNqzlqjf6I4DuerSIlFMMYtz0vd7uQmYezsY2OIo7LGpvr3HVb+GVAoDe3IjqMNgdasB4jX+/2oJw1TBOp4OHd+as+nQbZnLosRoqhCdZqoVQPvit4aZvK+Fix06Du5SwyD88zFIj0+RPj4k7cbXKFV0SujM+Zi+F82tHeVfr8tCqcFIr6MvD0oZAeimtG0mcywKBRZ2tJmZ28I/+vGKe+ad/Djg3HiVF3mbCCTBnw1ofUi0P2d4MNIEX2xJWqKFGEsAsIpGWosem01xbHK0lXmgULW1F2k0A6sInqekqMngA+AeaDecFTjP+VSP1N6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5nzHWgrBRsMptXCOLD3Yb+GBemELCD2h+X11hB9dO8=;
 b=b5mRQqCKnFqQ9jEpRBAW8KrnmM33CvDMb5BP2HwQ+LwgQTHluSPc86TGg4xeYBV8RVI261IJ1vN0AinVLAWlKSGy6HcFKqjEV2wem2f8f2v9k/A4XQ4bj2yKtPfJgh8H8imNtGKoJyKPM3OMw3QeBAL7U/WTdu/UJSt8mi6sONw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9288.jpnprd01.prod.outlook.com (2603:1096:400:194::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 01:22:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 01:22:57 +0000
Message-ID: <87v8c76jnz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: simple-card-utils: fixup simple_util_startup() error
 handling
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Robert Hancock <robert.hancock@calian.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Sep 2023 01:22:57 +0000
X-ClientProxiedBy: TYWPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: e45cd90e-acfe-4b82-d09f-08dbb8aef4d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JwPEx6nnCi5Cx+v9TUnLboIu3kP+aRPQML8yEeTMQed4bb1daihIJnUDXcu3pjZg7kTtZWTsCcybWNhQBzCCVNn7DcjRLO75eqWJ488XOlmGtrtyqlB5OYoP15p8fg/dYrIGpwNbzglzMv7SgARnrhKXSfSt9fF+GVhyMpoa+0PisGGrVmsVN/9IdltYn+2GeiTfvbYCO0yeEXpID25ISE2BLZc2/jlKa3+RPYX74Z683tdWh/RYsDZxF0S1nWQM5Q9ag6Stt7llXC2sejLs2z4cHadAIkimSlGDo8UMWduq57RwMdyaWCAaHr0c00Hefb/lqf16wz4vWgYCnj+80c8qOUqNzCQv2fgmUVI3KyqaCIVB/xTnhUayuGpIwL7O++enBHuaFX9jKRsPZ9hcktu+ILJwFuGI+XGB/ntRmW3LfFoHoi08OHJUF99+Zo3ROp946xqwO6lK7QJrKHfSctD+be3LW+DXuF8Ne073y83/8T+Gt4Wkg7N2LsdSpuJmYWh0hFBn+XRcyUTjCddaUWNFfuG5JRKw3h9QwGWBHoIGCuyW0VafpAz+iz0aG5iOk2psuE9TJEBhfNlsK1QB3we5dujTbyAm+k6/0FjsK6XiwINtbrfXTVzH8oei28nKer/EGF1MlEQbzDrmaVQvtQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(396003)(136003)(376002)(39860400002)(1800799009)(186009)(451199024)(2616005)(38350700002)(38100700002)(4326008)(8936002)(8676002)(52116002)(6512007)(6916009)(66946007)(54906003)(41300700001)(66476007)(66556008)(316002)(86362001)(2906002)(5660300002)(83380400001)(26005)(6506007)(6486002)(36756003)(478600001)(966005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SBp6cgFrObNItfy1ETNmA8McMWJbRIjXp+kpHk9Ei0KjsbtLkyzDAIRSIyBo?=
 =?us-ascii?Q?tUSClTNS7+VHBIM1LTQB2Owc5ChhwbGDNaJKlb/wW1K+LUCSFw2r6bOqXiIX?=
 =?us-ascii?Q?pXkwa0+FYgOy13lwR5lgGt/nhrDBEFXValH0Ne/bnV9XvqjcVKm5ucFwyH1K?=
 =?us-ascii?Q?HDS4ymcTkPYA9Qesy8dfgfg1SWRVKTgjCJwxy6dWmWl8LoBd8uPsOomQEFeU?=
 =?us-ascii?Q?5E9CFIUy6p9rH2AQiTJ33ScPtnIkSs37zag2+e4+3D7ZLNO1d0sTV5KJvXHG?=
 =?us-ascii?Q?bcyB5fd+yP5QP2m2t6iL+avFa1YGd4fKG/XTKdHL5pChHP88ly9awWy/6y3F?=
 =?us-ascii?Q?paACKT0DnI0s7qrHUMwrP6PczaLc1CHZkOAsX/qvd7VzqKfCEHSmmkPAfpaB?=
 =?us-ascii?Q?DsIUB4+qv4iwFlFgWAGTgdbnTYhdTVP6aoIclo7HlrCxlTozv8puDxxQn5ln?=
 =?us-ascii?Q?fu2jje8a4gji6SLrU+39imWmeFEg2NIkB5L/NRUC6ZE+2J8bpOEuI+l4LP3y?=
 =?us-ascii?Q?uMpx4LroyuY9fM1KWTBrom8Lx93tAN/wnnJKbK3xHzWUbfG4rJ2Xi2Hd7ZJ4?=
 =?us-ascii?Q?w5AEhTvPC1TzjCsyHTqma/g5+fO+XXCaPW4LyKLBRqPsxePxmqgGu012jK02?=
 =?us-ascii?Q?mEQGl5YuQ0QpnW+pVOo0UUujRw4w2X2ZGqX6qy/v12UK3SPFZYP9Vy1ykZop?=
 =?us-ascii?Q?ISShPAIjZLVd3OfXCn3sigxWktazuRt0DfzgnwiMS9uzGsYyx66hXZ06PvNj?=
 =?us-ascii?Q?IAPaufZgh8ceARTskYC7pxyhihYlgNlGbTfLRtRsSv+thjpSK3IyUQbKrC7o?=
 =?us-ascii?Q?awHyEg/+TVf5VPxx0Q17rPCHW42UL46PsGHbNAxSU+0JgXENNyANbuWBNxtm?=
 =?us-ascii?Q?h1YVMOvcWOG34H7MCG5ncC2WLMGKemGSop+PAkgnybCy6aaTPNcZe0EVabcr?=
 =?us-ascii?Q?ybAYE4UtCwqpq90g8fHLTJQ/8K2Ot5McP+GOnrtOmFOu5HemxIoXSw0BWecx?=
 =?us-ascii?Q?BfiHvr1j/gUUqU/4O9yFDpLnsno2fTThY9eKeDBPoBHUdej8EfaKbEl1xR0s?=
 =?us-ascii?Q?xfXL6crc/GEVXW03z/kfjEExX1wQA7+lc3LH5db/SCv2nfSYpPo2i+hAktTv?=
 =?us-ascii?Q?JDiioVAAPuaIQjnDbYucQGPtuIRlsnqgJifF+Dkx35bzVWJF8oBhNHteFyc+?=
 =?us-ascii?Q?f5HcGzt+M/+wRC86Xyc3bzWTKfvib3CRSAI0XQYEvfX6uk/OLKxDLMc1WyQQ?=
 =?us-ascii?Q?tfWy6UJbUa8rnv2Zb0+T8jPH2S75/7lfGvAuLTtIs2p7UIR4W+K2Em5MS7qF?=
 =?us-ascii?Q?aBfgwaDN4VXkng7KM39sSUCHN28/BMAXxiRS1JNsOEOSBBGHH7pY9W9SsGOl?=
 =?us-ascii?Q?im03HZDV7RaifIprpA7jox/CGT6hByt1TmEjc/WE26KcWI+YqPkSRu1b8PfX?=
 =?us-ascii?Q?ozFJ9t14ezdTx8/liRzaeWU+q56j7r1amQkDto/iEsL6kfNNtC3CmccEMEZq?=
 =?us-ascii?Q?GHn2ZKsXdS/afbmn6gVaGJdZWMpgpD2sL+cOo1j5o3jenqcqjxjr30fSzmgR?=
 =?us-ascii?Q?QevrMdsYTVpEWo9ZKD65sxl0dCFnyEhrwL8k9TgSK+MPjyw+BRWWlm4btadU?=
 =?us-ascii?Q?he0N3OQb5usexIyW4ZXBj+k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e45cd90e-acfe-4b82-d09f-08dbb8aef4d7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 01:22:57.5796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 M8/ILvJ8fBZCEEivggVGpkVQx0OZFU6sdxZCnDfbEKRcLCVl44W8OZ5isW7LDt1RiRMI0TDUipRHUA5Fj6+ORPpvUJcK93b7H1r8zv28unP7GuvnBclI+dlyZgClzayY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9288
Message-ID-Hash: 5EJ6DXSYTTR7GEA7KVE765PQHYRN5VFZ
X-Message-ID-Hash: 5EJ6DXSYTTR7GEA7KVE765PQHYRN5VFZ
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5EJ6DXSYTTR7GEA7KVE765PQHYRN5VFZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It should use "goto" instead of "return"

Fixes: 5ca2ab459817 ("ASoC: simple-card-utils: Add new system-clock-fixed flag")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/202309141205.ITZeDJxV-lkp@intel.com/
Closes: https://lore.kernel.org/all/202309151840.au9Aa2W4-lkp@intel.com/
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card-utils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 5b18a4af022f..2588ec735dbd 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -310,7 +310,8 @@ int asoc_simple_startup(struct snd_pcm_substream *substream)
 		if (fixed_sysclk % props->mclk_fs) {
 			dev_err(rtd->dev, "fixed sysclk %u not divisible by mclk_fs %u\n",
 				fixed_sysclk, props->mclk_fs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto codec_err;
 		}
 		ret = snd_pcm_hw_constraint_minmax(substream->runtime, SNDRV_PCM_HW_PARAM_RATE,
 			fixed_rate, fixed_rate);
-- 
2.25.1

