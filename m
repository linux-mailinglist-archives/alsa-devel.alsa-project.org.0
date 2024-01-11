Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3483D82A54D
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 01:45:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 452CEEC7;
	Thu, 11 Jan 2024 01:45:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 452CEEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704933956;
	bh=vB9ivTXbH8P1uTw2IRjCD0DAEoPvPTgt0Tc6hqleBO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XURp8dPAoA382qm0HjW3bLqbbgfEst+1jFi8mo9ULFrhirRMsEo5u4Vz32T7FBIsW
	 vG2sMD0TMGNTbGftCNAdrnWAhMl7L+o6o3IEeeVHvzvQIrTIrKaqdxUmd6P8MhsND3
	 vXp0B6uyXe/AChA8u5HeKrgAzqULb2e5IsPmcR08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDA30F804F1; Thu, 11 Jan 2024 01:45:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35208F80580;
	Thu, 11 Jan 2024 01:45:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 359E7F80254; Thu, 11 Jan 2024 01:45:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B012FF80086
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 01:45:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B012FF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=C52Lg1eh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Njr9rBAyo2X6BKXdEvw9Ewk/lh7XmICyWkEuyEuy9S3LpCgrc+1ByHfy6xDfv9I8YszUPM4qGMaZ+UxOIXL2Qjcsj9DLQMCURZJiyi/BZSpVN6X7MuE+otOim6WVDxKdQPGNYuq+L44lxGR+x/FMHi9XAQgVSw6GWKhCHj1IZLqN0FMR5mdhqfOGuPHvX1REfhCYdRqVS9eeGM+yGoS65cSSTXZMNAl/xzLP0IOE8V/shEqNiiM2lZvu2+2OKrlxhXoAm6/ofahi1o8QEfjLUkJWFhx7BzP2Lwg+UEe2h2vqwhaj4DDovHv6BzLN6pzHQ/6O0O3PHb63BpMAcMP4Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UEpDNystJ9JB9faFO04TlwOPAhd6QkTw0OdBwiBcXE=;
 b=ghLSGcjZdxJih+qcT5aZoDRNvZ98A7SHqCXSvsE6LazjMyj5kRDeSdiy4gYjBncN2v3nxcWmrKraTJ8cMErsEiv6h/DCiuOreIYMlCendmYmwr23VzSdnQx6qtMRYUCkidSR74oXaG5LyfeFydo4LFPwDOiLaqJKlC1+T1H5hs5S3PPPoeHRTMMUrbpYJbYVbAjExFwOZkE5WoWfeWmhwD6mOExXgcJqdpZ/E975W6tMD8OQ6eotjBri9XeMf5CT5dWAko9GRrIuuW106/i82nG5tkV6XbiiuHi2FA4+MCEIyVL5GZ0ZC5u9GL50uyGc7gTPUwmaKQnoGAvZhOwUbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UEpDNystJ9JB9faFO04TlwOPAhd6QkTw0OdBwiBcXE=;
 b=C52Lg1eh4qfgdmEE5G3V3iqcItkJVVBWedsNJHh7PCa0dcARv0MZV/5bMZH2LQv6K2Ky0Ai0AZ0qb7xPWSaMVIKGHyAuM+3MzaNSWlNrt6WX2CrOgN6F7vX7F4frssjN2GC6HqNMPbBtduHbxLZ1lik914vNWjPHsk1wraHCzDY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5426.jpnprd01.prod.outlook.com
 (2603:1096:604:96::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.13; Thu, 11 Jan
 2024 00:44:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 00:44:58 +0000
Message-ID: <8734v4y9yu.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Sameer Pujar <spujar@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: Query on audio-graph-card DT binding
In-Reply-To: <cde6d5d5-b6ab-4c64-93f8-78d721a492bb@nvidia.com>
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
	<ZZblyhfzQjzyoUc_@orome.fritz.box>
	<42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
	<3faec2e9-8cd9-46f9-8807-801922de0edf@nvidia.com>
	<ZZe5sTNz005Tt4jk@orome.fritz.box>
	<8241c953-8ae5-4f26-b108-fccf826ed87a@nvidia.com>
	<875y03i739.wl-kuninori.morimoto.gx@renesas.com>
	<e7f9085d-9db1-4c5e-9940-e461835b20aa@nvidia.com>
	<87il42gkua.wl-kuninori.morimoto.gx@renesas.com>
	<cde6d5d5-b6ab-4c64-93f8-78d721a492bb@nvidia.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 11 Jan 2024 00:44:58 +0000
X-ClientProxiedBy: TYAPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::29) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5426:EE_
X-MS-Office365-Filtering-Correlation-Id: 8415f29a-9e79-4842-5c88-08dc123e8954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1YgUb9MyrJWaQUJ8hWD3gmm2GogGfZ/wRhKR9459R3XZ7tsvrIODdZOAo95fJ/QIMHYblotNJjIR06KA7KCmbzLCIIC0e6Cev9i4uU1qJBxQnR1Kos34+Fbc/Ch9K2W2oNXuOyONSzFtUcblYuGTRr/195xgvbPxdsL6Ks+N8O0MXy5n3qthPbbIc6WdgFvmW1t5cgb+7OeQVaxnmzJ79XJdRoeRXbcOVz0iZbgajQcQuTqRd9Ew0KtyVNOBg6HTWPXW9VRR1sf3jF6Mdh51yzhU3gmOSkpYQT0BACytg2qmVvU+bZ51WKg7MBT8qV48vBFRT/eU2N8tai8czpR69sxtAo3I0QJEr8B3DIY3FthFD+Hgu5l+B89DTwIio1Ea2EbHsPqlGJlPj4NTs6NzcQJmK8dYyO0FADUhcXNcV/ZYQJjdIENnu2tlFSUJkT+7SvXKMhEaNn21QmS3Bq88DESpFPqRSOO9AfEhcnE/A7AUk+nDgZzLYy4fWinjlNrHyiyaVL5h2B0NPLTuE2nvzZCAagvzPmD4sxjqut3FtvwdBXjPahYOs4fbuNxJl34Wab2URvQhJl7XPfhBMDzDDlGDC+NgQ2Djr0EwCNQpGLB266Z5UcyAIV3KQuGv+Xfn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(5660300002)(8676002)(4326008)(8936002)(2906002)(6916009)(66946007)(54906003)(66556008)(66476007)(316002)(6512007)(6506007)(966005)(6486002)(478600001)(2013699003)(38350700005)(52116002)(36756003)(2616005)(26005)(41300700001)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DnEWx+m5fM5z0Z61j7uuZO2CK9Ho7SM0OQiSt/8+Efg6WxElR3GzqZSSCMZl?=
 =?us-ascii?Q?6UyUylvUjjsD3CqAjqJUkow3JSWX9PeMnikwv5qlIa/YFGbVuef/klp0KNhy?=
 =?us-ascii?Q?zTTBrl4K3SRE4RqzoW6N19tz+2PBxZ0YX+uuJsIXTPL2BL9l9xwUGIVIeyDL?=
 =?us-ascii?Q?u/e2gclgrLSo4ZALe6xUsMCTouvNfso2IzlmcO7QmFbFVoiYCE7yRF0T36nP?=
 =?us-ascii?Q?itzJBDA27YbYVGMfiQb+pwoouYsLGGXZWAE0UArY4XaRCwdxds/JxY4CejCn?=
 =?us-ascii?Q?rJPDsbVfcV6/hwgL7iU62B8Z6sPTDYHYw73l2phc+hCs/G24ie/bOikNna/P?=
 =?us-ascii?Q?BrwmR6pNVECaRHLFV54kIHb0kVlkFRr/I/RVauijt/c3rXMMhbAfsM0EegPW?=
 =?us-ascii?Q?GnxumbqV/451vGr2W67IPRpOZhiVlOc5KgHUAtcMReYPvgkMCS7duTCex1ia?=
 =?us-ascii?Q?8aax1Wz75cFBwCeGUUxQ88RvRNR3cQOzyZwkHOar9CYiuLWf+BUhzAlkeQzC?=
 =?us-ascii?Q?ZufCcpcFBQVlvFkyVc5ianrl49ErkxrH416vwLyw4gif3ufO3DGKa9QVd7b5?=
 =?us-ascii?Q?vali7M2VojQraCpHPb0qbsef2B3WvFqxiIbk80jX0uWanB0OxTNPtc5lPd8n?=
 =?us-ascii?Q?5XKC0Pjhf7x9gW0mc0MrfoSPASE1NBLsVIiJA8yi744pahkq99b1TusInCLL?=
 =?us-ascii?Q?sSoiNViPeri37wKo3nb7dVGbTTARHHwdUVn6qn96M67hm74PmBWR7hmVlqps?=
 =?us-ascii?Q?SFvfVqVy6ZvVDcBof7u/wlp7f67dLVVKHh0cclkwgyMvZJmVpFmVl51hai9O?=
 =?us-ascii?Q?NBubGmMHx4IWbdE4Sk3IxSjDlyReBYUtEfLFqEydvJMoOInFBnSK+d5UD+gg?=
 =?us-ascii?Q?e858eZ8QjxLfa669VdRCfnzq3l5J/fUBF/BOrGm+OYJ/lGvvgPyMG7H7056m?=
 =?us-ascii?Q?oCdg2P7AAHbzVNfHNaKRUv1LDrZOC4u3BK7/DLwWv9BddRB6cGkAPbUq4EIc?=
 =?us-ascii?Q?Ovg6Z4Ej0XSV3MvrV4gNKRk0mJUxmZUpN51ZHOmrNq3vfpyRJhuMay079+w1?=
 =?us-ascii?Q?2vLi56k7TJqxnFjRTaCzmAYvKRuJ40nEWp1kYAbGuWOjc0x/cUzBiWhtfPho?=
 =?us-ascii?Q?JpVDfyfWh1P1gFuqbxgmKCFuytVYTXPjKMhoPxheWYy0s+nm/tKuc4dFD4ID?=
 =?us-ascii?Q?zofdXxRo7ZNVXB2kqNVnMF6Vn0Bw7BKKwz1lZuRAsPsmRxTg0BT/ApRhnACP?=
 =?us-ascii?Q?bMTy22VKFnnqewPJKNmO64eGIRDpwQ0MGlGwgEFpo9wWAHzw514CjZo8wbuv?=
 =?us-ascii?Q?vri2FnTiLCI0YCqVhtct+zq29gxMeVA/TQbPUxEkRTWndMHuV5jsQRPW040U?=
 =?us-ascii?Q?2pEUZSSLnOxtlyHVD28VlxA3e3NvM7dohon8YwtcqCv282fQ8J8ySsyONi5Y?=
 =?us-ascii?Q?Rp4LyiGxZsJRN70jg1Bl6hi2VAbczUKZsqYDMANmEWV17SaU7nnTWoXivNoi?=
 =?us-ascii?Q?9Qjg65dtSWJIOp7mNREkgRHxETKw1bEAQFDypvASoW4YYSUfJTUxsiMplNCC?=
 =?us-ascii?Q?OWtQyq0raky41A+3MhAqlgdNJgFGBSmUIyEPjuZ5h5J7/dvAH4ZO6vBlx62r?=
 =?us-ascii?Q?dLuBosnMMyuwp7aKaoOV3hs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8415f29a-9e79-4842-5c88-08dc123e8954
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2024 00:44:58.3168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BHBbhA7mnE4P1uX+wkzkULWQ72UVkJUVLTyvBErVfVzLkVIuRqaagW+nUnllTYkHiUNMzoi56YXvO1Pv8scGhX27n/FUcsubAd3onuTdmFfruDGvCYFZKVpEgpsczHJ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5426
Message-ID-Hash: IOG4GQ76XMKHRHVW7WM36BTBBZIXKQGK
X-Message-ID-Hash: IOG4GQ76XMKHRHVW7WM36BTBBZIXKQGK
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IOG4GQ76XMKHRHVW7WM36BTBBZIXKQGK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Sameer

> > CPU
> >          port {
> >                  cpu_endpoint0: endpoint@0 { remote-endpoint = <&codec1_endpoint>; };
> >                  cpu_endpoint1: endpoint@1 { remote-endpoint = <&codec2_endpoint>; };
> >          };
> >
> > Codec1
> >          port {
> >                  codec1_endpoint: endpoint { remote-endpoint = <&cpu_endpoint0>; };
> >          };
> >
> > Codec2
> >          port {
> >                  codec2_endpoint: endpoint { remote-endpoint = <&cpu_endpoint1>; };
> >          };
> >
> 
> This is a workaround. Note that CPU endpoint@1 doesn't exist and a dummy 
> endpoint needs to be created. Like I mentioned in previous replies, the 
> number of dummy endpoints that need to be created depends on how many 
> CODECs user want to connect and it doesn't look scalable.

I'm not DT-man, but it sounds you are misunderstanding about port vs endpoint ?
"port" is for physical interface, "endpoint" is for connection.
If 1 CPU physical interface is connected to 2 Codecs physical interfaces,
above is for it in my understanding.

Can Audio-Graph-Card2 N:M connection [1][2][3] help you ?
Sample is for 2:3 connection, but it should be OK for 1:2.
You need v6.8 or later

[1] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/generic/audio-graph-card2-custom-sample.dtsi?h=asoc-v6.8#n67
[2] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/generic/audio-graph-card2-custom-sample.dtsi?h=asoc-v6.8#n339
[3] https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/tree/sound/soc/generic/audio-graph-card2-custom-sample.dtsi?h=asoc-v6.8#n372

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
