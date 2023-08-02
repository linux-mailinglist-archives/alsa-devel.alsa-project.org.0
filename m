Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C1A76DB51
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 01:14:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CFC67F4;
	Thu,  3 Aug 2023 01:13:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CFC67F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691018067;
	bh=qlqX0cPVpWSWlovWO2g7uPdxoe/NGJckbp9fodVHinE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aHWw9DH39Z7ys4izsuOaNTMFKDRNHioeaa8R8FiS4glR9OCNnjVHhnurKPLKj9NzI
	 CbGdPqQi1BX7FOnh1CYBpRJbhH2J0jwiXFgRPvQgQZ9G2EtmZSqjNJeYclpON7GFOG
	 iNE/GQCKhYVpDFmKiXC+/7Tumjbc8OVMFlTny18o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 178E1F80425; Thu,  3 Aug 2023 01:13:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A17AF801D5;
	Thu,  3 Aug 2023 01:13:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A028F8025A; Thu,  3 Aug 2023 01:13:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D536F80149
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 01:12:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D536F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Uz4+QZGl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zfcddj7mtLfZZyuIndawFBDQ7M6gAMWI+nHRciN9QJzp6TYXGvDCvsm0JE4wYIqSOaIoy6uxPLZCgVCOABXo+pWBtP4z8S+tYFy/3df40ZScw8bvJk3WvqRxzC1T6UcnnkcnIK4YIKQ8UKESZ1E9Lsz+xKlF4aAaPwxPoxMnej3+uf9ocCusHS0HwpfvUHLw35LvV8Lfr7qMgicgLYuo6sO2yeddVfmoXeu6xUONU9s/mpUD26cEZurfKo+HPq/QaWvkYs5f+9RfJGhTj2DPuv45kMTXZNj6cno30G0u2lMG9IbznkdwKpqKgd4GqtOzyxWC7HwRmCLOgGIjg8r0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEcWDoE4767ddVoF07ppZCO9iyyrirB/2zU+fbLtY4Q=;
 b=c5/8kSK8JtRavJuHRGNuRxySywbYaNB2BhsXqrlOrHPuZxJAVgb3IGCU4r2nfgvy5RlEJGhMchBM1ni8hQf8IebeoDv0qpanCxzHDtJNyW0qlrsNDknf6v0S8tFsjVrWRSdqY/V0ChEeJ3zxqygSIH/3g72JE10NFRH7G4pbALdE9Rrv4L5zWWTN0QRT8T3BdARG/cOPKsylc5Ueon5Zch91NRGSeXNHgM8nuh1JhwxUCtK7XGlumKFZiMnaFTkdXiQT2nDIKXgaviKQGuEsZZVRsS6x7C9OAMFhaf9x7/99flHl8H0nQi37ocBVne2UhR+nw/+d+P3g6nGVp0uPVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEcWDoE4767ddVoF07ppZCO9iyyrirB/2zU+fbLtY4Q=;
 b=Uz4+QZGlPhBiiibC6WnUcKIMKTMcmqKDVONtQXPFL1+2x/oJjp8ZYS5iYaG2Pgn+EJWTYldH/hJaCnrSZS2IwrWJOxhKWlgvEjxBNXhX6AVfNilVVyxOPw+n0T/TeRjwwQMTtIGCnRy2GJuzR2g7vrpilQkRhA+DRqSa/pxbCWk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10731.jpnprd01.prod.outlook.com (2603:1096:400:297::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.20; Wed, 2 Aug
 2023 23:12:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.020; Wed, 2 Aug 2023
 23:12:50 +0000
Message-ID: <87leetrqbz.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Trevor Wu (=?EUC-KR?B?5+/Z/tXe?=) <Trevor.Wu@mediatek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>,
	"alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: Re: [PATCH 27/38] ASoC: mediatek: merge DAI call back functions into
 ops
In-Reply-To: <5e141dfaba1bf70c51e9d49dd5e40f7d4a1ac9eb.camel@mediatek.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
	<877cqetg6l.wl-kuninori.morimoto.gx@renesas.com>
	<5e141dfaba1bf70c51e9d49dd5e40f7d4a1ac9eb.camel@mediatek.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 23:12:49 +0000
X-ClientProxiedBy: TYCP286CA0325.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10731:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d5e3a6f-056d-4bd8-b8fc-08db93adfdd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LLvoPXqK8V//yUi2XkcvLEwz3qzLHYPZr9qoqZdHSiq9KO1EkC/Y7kJ+8TeMCabwXtkKRw411tahGEHwFQb7BSLDbtP6YrAPEyK3+JZLyN5snLsPDhWS3MeJbxr2huzQfcCDU98K04YUfR+l6LKCLEgcXeYFsarwSbZQuPXVblkFBHmzDrTUZYL098MtpLeCRejunVRcVVs3q+RFKvJ+jVxzDhODgRATBhmP8O3n0KsdFMc4b2yL2A/q4WTL7BbFyOfeM3Aa1A4I1PvPPS22KYGi5WaNmjzVsdflR4Wdq6mfVPwm+0EWBWrOUqiiV0VM36w9hHzsddU0J+k26cvnKwAmD1R7y+eVR3STtMWkSnTOhV9geQQQAvmtIqA06t3lmbusbOvDOeIcBCCIHBO2FYEoOhC0dWZ41/nsQnMdNRU9lkVFyAV5kh8cjB6H8bxvGnE0s6kQf7hOq2Uyg/h5Hn1DoMz+/EpDBoxXss9er7re1nOpm3NYeFLtDCWiYoCYGtqaWRNfZ+rM7SkLuAdXvRxLdUPKJorzLH4OU79obbzbXJjuVvYhXYzYKcIfTB3mo/qf2xp6wAJjhSagN3w9tbF+RQ/NGOwGxsdqw+oZq/tM35F1xRkyr9Afydot/239
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199021)(4744005)(478600001)(86362001)(6512007)(36756003)(52116002)(6486002)(316002)(8676002)(8936002)(41300700001)(5660300002)(6916009)(4326008)(66556008)(66476007)(83380400001)(54906003)(2906002)(38100700002)(38350700002)(66946007)(26005)(6506007)(2616005)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rjMPjYJo6GasvhlmGtq1/RRyfA/NBXOOyRkMrwadnaJcmiGgV9WWLANKcRQf?=
 =?us-ascii?Q?N09ZId6mrEydiEEdMsz0E3Z02LF5pPyk8418ZGCNNC+gvakvobRUuXnLLsrq?=
 =?us-ascii?Q?HUgvmHNuJggyUm/0uZBu0fi4JWyiGfrryd8m1EZdlsdZcRvyAKtl2TDZpWRa?=
 =?us-ascii?Q?mQtKYS3XlWtBC54gshjTH3FLMddQVVVmtXdpuJCcd8qXW1PWmyTVElTPtCFz?=
 =?us-ascii?Q?VOS5se61EtS2c+GXYREbFLG7GAI+tjZOyptpoH1/FVyeKdtSOVOJKVonrMhR?=
 =?us-ascii?Q?L7u+TC/JF/qKtaIBByv4H9bIrkmjQBGNghmN+8gnBS+iu64J6n1T2LST4ozP?=
 =?us-ascii?Q?IFHPM/nFDd3DHAcCfpsD0WJHDtimZbJwqLFmuKdw4deb0GiBFOOOFSva1zjI?=
 =?us-ascii?Q?gfF19R+D3nGjMn9K3eVOHM/kfw6eU7LPrUsk5IbuSEgPveW9q4MeA1XO6diB?=
 =?us-ascii?Q?mwe9Nm3rQCEukyACuNYaSXLPde2z0/CcNr+PqQVJkWl/0yKzZZ+8BpvJnYq+?=
 =?us-ascii?Q?RpdIwnT6XTHOnsSvMBL8jjHLBs4XebTb72nZIZmtbQBb9EWAu16nGryLkv4N?=
 =?us-ascii?Q?tj5rodyZA/1u54Qjp25ROn7EnMq8GqIg4Ovda7HCDXmNBTWTroan3t2QtmXz?=
 =?us-ascii?Q?iE6ppk/R/kjooYAOmqFtw8yG0tbQlQdffAK0wyTEsoNxx+ayj/mrz1dTykx/?=
 =?us-ascii?Q?+zVJbZpacF61NfxZRB5sCdtIfN9eZFvcMJS44bHN/9Kb6SkEOeFoymVOBWf/?=
 =?us-ascii?Q?zt6oegekLl5bMoKaPdaDj5jHMOmC0DWmYLi5fx7+xunk1dPPbGHYx6a7CGoV?=
 =?us-ascii?Q?+OUfBc8A2ONMEwJOGRoKLJJzNT8SS0E9WvCotFXTxsCIo7mU0tyc5cok14qL?=
 =?us-ascii?Q?sGrH+r3na5CadCAO720pcTzQ1IY9COyG9HSrnx1NA5CRhR2nADnU63hKWIA0?=
 =?us-ascii?Q?ONCwcvD2eHVXGnMLcx9O4WxsHMazWUsDBDqGEj/O0IW/GqG5SAE9zMrhBot+?=
 =?us-ascii?Q?+sCf1zRf9C7PhbA+qzwthlsotcGci1tizMNyi8PwP94a3svw2F/6jrnwCpCz?=
 =?us-ascii?Q?gFboHhn88SqZ11pfBGZtbhZi5lBOO2ePCqAzQmQGVp0cp+v0UAwbLdkZMDvD?=
 =?us-ascii?Q?w9FGMxsVRCWgtUMC9ZnFjxQ0ypbMyescCwjEC1R9814GVQAXMUz9b6NlNHC4?=
 =?us-ascii?Q?3b72+p0tbAlnAbxtmK1gli1zhMYtVo6c30T8FDCjzIHs5DAdBWbTClNU3wTL?=
 =?us-ascii?Q?BJ9TxrUfpIZ05trjIOOM6tVkntetA8uV4K3vkKeTsdxF+K4AdbsPabym5/OW?=
 =?us-ascii?Q?T4U2CKK2QfFeCd/nBYn8tNCBqqhc3ncHRK6hJYueVZpXu8uQ+1PyJkwO0O/j?=
 =?us-ascii?Q?bPu5bxuxDEESfsAHC5Otj6Ni5M5hNx9OrAwsDQEs0a3+hYXLHDGKEBaTB0Lc?=
 =?us-ascii?Q?6BnuSlnr+KRAASXJJ2cKNrFfrhUBJ/PuuXS2s0pRN7hhJ1rzFGB+PVppUByr?=
 =?us-ascii?Q?cgDjFzGQ9uZoSiHWL3W57gu3rsNosE9ZRD77TyzOCT1zBeOmEMExEpJSLKz9?=
 =?us-ascii?Q?oHrOU204Q899a3cyK+wQmr+yZpMqw/9gh4bmPxdf+G0U+sKj3HEtAdDyrSKK?=
 =?us-ascii?Q?I0pF0vPTWE+o+WlgWl3MQp4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5d5e3a6f-056d-4bd8-b8fc-08db93adfdd1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 23:12:50.1465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5h3vBaHFadaqO7iNbNWSir0xVpLfqPJqthmLkqZL9JZCkZu7eSDY8AZ8noKbEw4LjYU0O0I55qU+5SAd4SpIeQv6zfAKUFJBY9ovANZpoT4MHQEdBhwtpZzwsm1jjiwU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10731
Message-ID-Hash: 27QDYNQ3KW7QQWTB6M23TMS2RE7SNFT2
X-Message-ID-Hash: 27QDYNQ3KW7QQWTB6M23TMS2RE7SNFT2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/27QDYNQ3KW7QQWTB6M23TMS2RE7SNFT2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Trevor

Thank you for your review.

> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  ALSA SoC merges DAI call backs into .ops.
> > This patch merge thesse into one.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
(snip)
> Why are you including mtk_dai_hdmitx_dptx_ops2 and keeping
> mtk_dai_hdmitx_dptx_ops even though you are not using it?

Because there are 2 users of mtk_dai_hdmitx_dptx_ops (A),
one needs .probe (B)

	static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
		{
			.name = "DPTX",
			.id = MT8195_AFE_IO_DPTX,
			...
(A)			.ops = &mtk_dai_hdmitx_dptx_ops,
		},
		...
		{
			.name = "ETDM3_OUT",
			.id = MT8195_AFE_IO_ETDM3_OUT,
			...
(A)			.ops = &mtk_dai_hdmitx_dptx_ops,
(B)			.probe = mtk_dai_etdm_probe,
		},
	};


mtk_dai_hdmitx_dptx_ops   = (A)
mtk_dai_hdmitx_dptx_ops2  = (A) + (B)

Thank you for your help !!

Best regards
---
Kuninori Morimoto
