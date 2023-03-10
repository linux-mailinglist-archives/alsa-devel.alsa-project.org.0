Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0926B366B
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 07:14:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82EAE174B;
	Fri, 10 Mar 2023 07:13:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82EAE174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678428888;
	bh=HZpjx30Se9SsQHbHbRwxCn11/vC+ZfXM4QSlLyjUbl0=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bmeW2ekEWVeZGVHcPQFySng8EvWA51+wRUEJ+3Z1U5WXOe8KU1/sH4l509OI6XXFQ
	 8Ja9PY2UDEH4HAJdp2XQFDMpFTzNBfIfKTuxL37lem1d8D5P+yY4tP9GQhYKmbFcaq
	 NTT7r0f24pQpQ3t4gCOEorMHLgPlJOHKMyJARALo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E816EF80236;
	Fri, 10 Mar 2023 07:13:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5941F8007E; Fri, 10 Mar 2023 07:13:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B923F8007E
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 07:13:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B923F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=PGoInEJv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMW94CFQMyMuxO3HGLiMI6FWm69BWhdiFAwokWegAEfYtWWkFSIMuTP4ZF5ApiLNdmApf3i/8Z8/3YPbATa+Dtah/wmKvkh2m0bE63SWMUnHhIjVXwk+RDAsxCj5hhxuGkGM3YduR4DJaiv002jRezR59fNfr+1WCv+yo8nMG3LCqcz/3OBSkZlRmCfoYenLDWxaJlNoS2g6fqHsVJ5pbNTJNxp7ishHrRVqgLJ7S5syHvg097YvwYOn3eG/V7muJBWd2NstLf6cI2Kf04A1GT9KeHsRm/2Fw3wHDBoRtm6r9af6HjJYVKeR2ZLBGFluTGYq66j2iU9syDQo+EtthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmDNud1kgb4WAQKdI7SN8s1Vm9fyt7CZLa3yRcI0lSE=;
 b=GXuwXVd8AUdYqUUwk322YQnAd0f8HQppzeRi28xdEYBn9QNW2wsXn6+Jq001aDomQYAK15vy3zS/ANDz7pC2JpygCkTJNcsKqFHnwIrtJeXBsdP1GKAg6Q+4W1O51iGiQu6JWkSppQZSjYkHArFktCilh8RMklQYtP9AlqGy36IBMRWgm03H+caKau0MK+ddxPJOe0eLd713XK/MeAn/uEqInACTUz6hO9+i6Q1so0iLfJHALT6hTgBDQLM2pYlV8Yg+BoU03jOXcIxlSru4aR74NMKLL7H+iVLT0ya/oSjEpGezrEQT4mh2KHa7iUxHD8/Hv2s+oJKdkQkLvUZuQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmDNud1kgb4WAQKdI7SN8s1Vm9fyt7CZLa3yRcI0lSE=;
 b=PGoInEJv4Ra2XHBKG7ojcCnQpDazdX328B4gsoe2vHZePMjtXiTwiVbQp76/Jx23F9u4T/D+SjNz8FZBnqkJcxBySd6wCMKGD1sQLAaG7e1bTELqxYZQT0QIezoNGXRWiJD+3ywTKqvLwOhajr8V5pwRwBAKBxx0oiZUOHncioo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10612.jpnprd01.prod.outlook.com (2603:1096:400:2a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 06:13:10 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 06:13:10 +0000
Message-ID: <87edpx2ky2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH 1/2] ASoC: hpi6205.c: check pao in control_message()
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87fsad2kzn.wl-kuninori.morimoto.gx@renesas.com>
References: <87fsad2kzn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 10 Mar 2023 06:13:10 +0000
X-ClientProxiedBy: TY2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:404:42::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10612:EE_
X-MS-Office365-Filtering-Correlation-Id: 54353523-c0ed-4b83-887f-08db212e860c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	peArKdzGn/kjt8O6qtqm8xNef10Z8FYr8Akv+ZJzWXf/jQjEkgE74cxX4qlKOvnxo0cgUuRHi5suW6AokYAvoJ3xjHT9KXY7dX64BwWRCgfiuDc2dzWCyLkn71SWT4R1oupwfQASWzC2Exeq0nAp742KrsyxAUrcs70Ozwh5w/9xJee3yNnlwKIpHQPe0G4ZMSe1pfW/q//IRvWyiWsg/XGFluI9YzoeWgNXGO3pN7l+QxXiUpw3KyyedGrKU8y3dlZTGJXwR0xrbeRbfbpZO2wHze5O3OaMgfJQP0FQMlrvTQ3uG3Agtk43X8A2OiZG12qC5fjdk9kG4/rO/SgvKwBrpXl0xOLdE8AnXBkLSauaOjKfk/Vi29JQS5ayatX6EKFcznbrDjZ94wDps1Ui89KtRmTeyvf7f6TabQUe57EAhEHRhNZXQmwWYZLUE1LrVpVzyMz/b2ty58z07v+Muk0ioQF77Xe8nHkVvJqcb+VSBjCDPnglBeowaMljinUEvSdITKeGknxph86WnID9JaYOmxxyk+Ou58pWgJDMnTmJzr7u48lKewKlyYnZ4VOKqlKx4g5nHvBlmIbS/cbJ3brSQqbFFTK5azEGOAVGaYOW/C/zPGqmimxL6VhmIybgoX5IyPsX8omuFnT4iTwvCRcy4J7Q3XrKPsHrDH9timIIx0GJEOvYnBcmHpu+hIBFanyoa+cIhPSNXMmnyLo+3A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199018)(36756003)(316002)(54906003)(478600001)(6486002)(52116002)(8936002)(5660300002)(4326008)(8676002)(66556008)(66946007)(66476007)(6916009)(2906002)(38350700002)(6506007)(86362001)(38100700002)(41300700001)(186003)(2616005)(26005)(6512007)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UjBQ9JO2XngcQJK2KdjWGJwwEsFTTtAPj7ck9TACTrCU0eQXVnP8T0UjRPlV?=
 =?us-ascii?Q?+IfEI0dWqKa5jKRnWH6sieOimWmpxicStrgOzJNrIrXlCGTeIHr45H01ZCdA?=
 =?us-ascii?Q?tkT56wKiADR9dWphtBTEvTVkUrQ7gJYDIaF+H+bQzGGb4e/vrlhK9ZoTveFU?=
 =?us-ascii?Q?+2SIfGQ9C/ljYiJg2BA3yqLi98Tu14QUn1HbL9iSk29pcxds9wZZCF93WOPl?=
 =?us-ascii?Q?tONhrAiizgcwPr5bBDXoNk2djidLe0a/n7dV6rlyXP0J1UDw1Tm3JKS6LyK9?=
 =?us-ascii?Q?qgPKzCvHjFjGbwcOsShq0m4BedahoO5f3v+XWbtzvXtoFPORXaTEYQTKul3x?=
 =?us-ascii?Q?4dJ5qrcIHiyzJukoKcHAawJbEsrBGXQtiskJwGgYJC9MlbS84vx0GfwdMeUb?=
 =?us-ascii?Q?593CTkuHgHKfm1WKkC3QyllMw9bI9aKNWktHHUP43w9dnRmifVQBD3mlo/Ag?=
 =?us-ascii?Q?CQqYsbocYTz48Xi3KU5IhDeFmDG3rd+ukmIlvxqO/cXTFv29Un2VJpHDSa3R?=
 =?us-ascii?Q?C1lxGFxE+sIReAKvmmpySK20YvbN/V5w8dJCTCtYp5kUf59Bck6j8/dXYKG6?=
 =?us-ascii?Q?X4mBs54ee0yc+gwtrt1zuPPbb61FG1684MgEGAZeeBgvakSzlo0nZD0m1vpU?=
 =?us-ascii?Q?jruMOH1ZXF9zYPMo7DMSSTU02t3gh+h6Kg3/B86K6UXgEiTR975d5dYZvFXs?=
 =?us-ascii?Q?DOzBkXfG5VoI+n9n0qnWkEtjt5xQv2xYaqQSYxrIYH0WoqV3wkJUQd/UfkL/?=
 =?us-ascii?Q?cjHQqKUFU0FwHKLjdFYFECZE9aaymVKA4dxeWJiUd5soudDwv1UbbBdGqEfd?=
 =?us-ascii?Q?+UnnGdbkWXf4ymerJs+funLpT4yniorkvNtGc5OiZScMB9srA9grwr91npEB?=
 =?us-ascii?Q?ECPNhRv94LYVWvOepj9aOUvzF6JMyTbbCMHWIJ/7fftubZpY9xsb9V2BqDAr?=
 =?us-ascii?Q?j9kh2NQm/eJy/UF5R3e9N6bT/mjnw52GTYWUp9HFffd5C156qMkA1iA4WjJC?=
 =?us-ascii?Q?yYLCdewBb48VW7vuW6jcnUhDykADtgkoyRYs+VIS9UjCHJ8AOQknXxXDCzFk?=
 =?us-ascii?Q?WEFOsASPHZcXG7XQ4GixRMGREK83i3DZuKg48sF7HpA3hDfDtvABNphl8JQI?=
 =?us-ascii?Q?fhGVAdOTK8dGZBEuA1CbIKVlEI8rRkSBL53sdhm9fMCXjS4qXIyFjfaFp1G9?=
 =?us-ascii?Q?c6/kh17mOi+TB2yuoCjU8R+1ypAtFzbABzowc+f5jqLfWQrgAcKuAVo8bKQz?=
 =?us-ascii?Q?p+1LmVmF2pWlu6C9w7+lvgmrgyqHw6142AIq1WBsSsS2Z/+6cINjfLMuKopR?=
 =?us-ascii?Q?Yd8zNV8qcH05ajt4R86w/DEPXGuJQYWhlyJyZ40kH+/zOxw1sCCNWMSUpMKK?=
 =?us-ascii?Q?bndwpzs3QQhrPMdKkEXjAOsuhVxIqBB7bXbytxcg6VtRGxRTcXBTt+z8scCL?=
 =?us-ascii?Q?Lh/1XP7DT9/TMUlYlSMa+uk6FUZqbFYZNFnuBfFB93FMyjAKBiZrBlPoJ3ya?=
 =?us-ascii?Q?A19NjBrP55F8ujXyeg6z796uc/qjg5xoYC5lMDWjHGxmS/szyVd8DVCoobKe?=
 =?us-ascii?Q?Wh7A4G1JUFzBBZsgDUhiQkJ/9MXmQgCkL2TjKsNNH0/kbTC+n0bSJZH5Bte2?=
 =?us-ascii?Q?DCN1vYTMi/CqP5efrRLj/eE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 54353523-c0ed-4b83-887f-08db212e860c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 06:13:10.5799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aEGjuQVIofoFbfMGi6nRzDhr0CupWXBk4io42Pjbe+HyZvSGPEjE+0Mx5894uRtLDWjMie6D2Z56lGBTfjjNNDFOti3o70TLaNoM4PDUZ0OsuBKRtCCZgP37Dr7qTaDK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10612
Message-ID-Hash: D25LFX6253EHVCUUDQJS3UEWLRFIQO3F
X-Message-ID-Hash: D25LFX6253EHVCUUDQJS3UEWLRFIQO3F
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>,
 shaomin Deng <dengshaomin@cdjrlc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D25LFX6253EHVCUUDQJS3UEWLRFIQO3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

control_message() might be called with pao = NULL.
Here indicates control_message() as sample.

(B)	static void control_message(struct hpi_adapter_obj *pao, ...)
	{                                                   ^^^
		struct hpi_hw_obj *phw = pao->priv;
		...                      ^^^
	}

(A)	void _HPI_6205(struct hpi_adapter_obj *pao, ...)
	{                                      ^^^
		...
		case HPI_OBJ_CONTROL:
(B)			control_message(pao, phm, phr);
			break;          ^^^
		...
	}

	void HPI_6205(...)
	{
		...
(A)		_HPI_6205(NULL, phm, phr);
		...       ^^^^
	}

Therefore, We will get too many warning via cppcheck, like below

	sound/pci/asihpi/hpi6205.c:238:27: warning: Possible null pointer dereference: pao [nullPointer]
		 struct hpi_hw_obj *phw = pao->priv;
		                          ^
	sound/pci/asihpi/hpi6205.c:433:13: note: Calling function '_HPI_6205', 1st argument 'NULL' value is 0
		  _HPI_6205(NULL, phm, phr);
		            ^
	sound/pci/asihpi/hpi6205.c:401:20: note: Calling function 'control_message', 1st argument 'pao' value is 0
	   control_message(pao, phm, phr);
	                   ^
Set phr->error like many functions doing, and don't call _HPI_6205()
with NULL.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/pci/asihpi/hpi6205.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/asihpi/hpi6205.c b/sound/pci/asihpi/hpi6205.c
index 27e11b5f70b9..c7d7eff86727 100644
--- a/sound/pci/asihpi/hpi6205.c
+++ b/sound/pci/asihpi/hpi6205.c
@@ -430,7 +430,7 @@ void HPI_6205(struct hpi_message *phm, struct hpi_response *phr)
 		pao = hpi_find_adapter(phm->adapter_index);
 	} else {
 		/* subsys messages don't address an adapter */
-		_HPI_6205(NULL, phm, phr);
+		phr->error = HPI_ERROR_INVALID_OBJ_INDEX;
 		return;
 	}
 
-- 
2.25.1

