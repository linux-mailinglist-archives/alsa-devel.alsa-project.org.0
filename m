Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A08D7D42F7
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 00:59:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EA9F84A;
	Tue, 24 Oct 2023 00:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EA9F84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698101979;
	bh=URQiPCIYM3C+Hjo5b3Fz6nEVCJXAYOiN/69EwqSwKuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eMSCeZqXOCQD5bsw90l3efNbS9Q2dnSooZqGz+aKt6FUwqux3h2j04mCsvFCkUMjP
	 85srjLKec6wY90qqYEwpd6zlkFq1Zrs5tBfx1G2mw1USvcAlaXVQ+9DV5nkjtpxrv1
	 ue+Fj88aw7G9Ju9IM9SLOvhM4hD7ubwBWYAHfAVU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E6F3F8028D; Tue, 24 Oct 2023 00:58:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67AECF80157;
	Tue, 24 Oct 2023 00:58:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA67EF80165; Tue, 24 Oct 2023 00:58:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D290FF8014B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 00:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D290FF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nBC5ITbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BIevUAXn4qaJgC+6YAqZ5tvqUcyjNLwKMt/BzboPqc58/rhvQYPtiC/SllzwrpWhFR0PRl4nPbB0CcC2m1N8lizidRfNlluZjP9nn2iB3CTCLDlSqOx7T77OqeMWnY83GA2jJ8DiCoJQfXNmAgO/I+K20E1wFR9a4ZikwGnBz4nYZvCY5sdT/+Axv8aVKAiptw0wC4jlrYDBTskTE2x9fhDbw1/QyK+ST72i5ye33Y7AnshvhIQC8vN21FnDhBxAunuEY+b5nNe//CGSzioCXJ2cxbk0grsjabdWiYTpD/vPNsJfWGH3d61gAHmyyIPgk2dSOhaemVVSs+X8qbfgUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUrK8TiRk7LX3N1pVTVuC5gMPc0s1Ed9EgSkiega7B0=;
 b=BAnM6E5v8mAtSHg7lSIgLKHVqE7tsdYkfL87DUmshHR/VrUTz+F3tdb7WcbziX98/0E2aroXIiQ1bT8xloZD5tIgm2BvHJ8ZVDtzyCPnLKV+ntXdC1jBZSUe2IzjYQDLs6BE6auZq6cY2L6r6nMA4CySUu4rG46Oud0261chSyyEfbTj8r+i+90fsIOLY6n/C8mW+DWhS93zcKLCZV7kW+ygQhj5RrfHKQEJKCpmFQYht6b2IqRiaQIkhJE+4Qbg2V/Yt4xin1WZxhFKm/IlFxEKAGHtZj4uvl83KEMaCt/RpB+ut4MIGCf2IAhp8h3pDruRVzLEn+P39Skuzd4teA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUrK8TiRk7LX3N1pVTVuC5gMPc0s1Ed9EgSkiega7B0=;
 b=nBC5ITbbdGuts8JuG8SOjTDHMfeKIGOtcsctA0pe10sXbmvgwEuKVI6jy+P+raka/UchcaoiJkNc6NTSheCmx5O3G3pLLa3FAUnDXz/ev1eyD9C12YKYn0mi5oo54RgkY5WV2PdaQtD8fkPbMga0ONRUtHuHFkaMz5RqqdVbQIE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB10153.jpnprd01.prod.outlook.com (2603:1096:604:1e4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 22:58:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::be8:b648:c989:8e7f%4]) with mapi id 15.20.6907.032; Mon, 23 Oct 2023
 22:58:28 +0000
Message-ID: <87v8axj698.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/5] dt-bindings: audio-graph-port: add ch-map-idx
 property
In-Reply-To: <20231023-security-tadpole-8b4fd45a96da@spud>
References: <874jihlx44.wl-kuninori.morimoto.gx@renesas.com>
	<87wmvdkiif.wl-kuninori.morimoto.gx@renesas.com>
	<20231023-security-tadpole-8b4fd45a96da@spud>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 23 Oct 2023 22:58:28 +0000
X-ClientProxiedBy: TYCP286CA0230.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB10153:EE_
X-MS-Office365-Filtering-Correlation-Id: 6841a68f-7e5d-4e29-0cd5-08dbd41b921c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DV+k3uvYmKR2IKcwZQu7Tpl3YGJC1rXxylt5ikNsgRRwVZSlDgu/xj5xLTxJrHjT8OtMklb+XEz51AtEItv/OEkexdhJJtXRwGtBl3oOfuYGq5R9sDsCBMu9kzzJ3jfeE8wEYYuCAM6XoBFZove8onzu/fQEaCs82Ci7LCmUoXXw/3ZPAadDi7oQP0UrXqfUZGRCOzwhJSVW0L6R3n3yJ5C6vr063cIVgAJmLG3DPZPLhOhtZ7o5elgUCp/7bMuEi0GmzFOSj0Ml57tJ5I68khN3vUtVpaYRVsprS1cu4/kbHGlCRaUw86g0XpgZeKsLc4nKMTGGSpGucwh5FbwtxwmKPH2bX6XHJ/qRF94QUxgPfTv5f/G7IbCJpunu+RvwtzHDffsHOGQdlfwkfW8hHpsUtBjtLVL0HCz8BZHeElKwv6pda5NMxSoMX2nhropZv36NHbaoARpln2RM+oUVkxNA6G4YLrVIAjsXkQP35NPbxPR+KdbJIQGh2M/DlQK8Xci40sU58zLLBYs7Z5HUXKpN64Sh/wEC524a+f3kmCQ9O9tgxFt1rRHUBOr8XH6Vi3gOb7Fb5NCwmc+8Et/UGdqGoP2GsULX2YG9G52NstD17XiPKkshNEfiWhbLVwUInViM5PXyUtn0aW6T1EQd5Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(39860400002)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(52116002)(6506007)(6512007)(316002)(66476007)(54906003)(478600001)(6916009)(66946007)(66556008)(5660300002)(4326008)(8936002)(8676002)(6486002)(41300700001)(4744005)(7416002)(2906002)(38350700005)(38100700002)(86362001)(2013699003)(2616005)(26005)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ub5a131P/aQQ97pV0E3rwbgDLxQCzC36iYh2UryyM/Tr28CNSG7pifHzeD8w?=
 =?us-ascii?Q?Cr51TfAF6HpXlkoEkdE/gZ0OOZZUT7G8z+1g7diqKqHZlEANr6/6wksXe8yl?=
 =?us-ascii?Q?V7PR4+PeXTT1T8idK07uxan3hO6Tr+mQZw7he/MKRUVHddbfgbPDQrFd7kbc?=
 =?us-ascii?Q?POuiiuDXfodUVBIPb8KcBujA9lC2ItELK3kQx1RDop5eYviHZAI8FHHP/3IE?=
 =?us-ascii?Q?WrDcWSr1y0iMO9Icq2HSscWnHddpf5x7n7QQEHYwn6FZIMaNcmEtHuwkm38l?=
 =?us-ascii?Q?61BeQd1OkUlRZdWJSOIe8+Nd7KfukWVglql6itzHCRv4xMwENoNnaaUVhmCD?=
 =?us-ascii?Q?S2N5oD+xh2xibSB0s/0f4QTR0FBSoU0cv2+VrwHY5eLSiv1jIrrKMLw0OZYp?=
 =?us-ascii?Q?hzbqIthqYP5Xz92fYGYN+ylm0mh2Q6kHQboGvvC88r0wVxZN9iXGDf5XYZkc?=
 =?us-ascii?Q?z/inoRx7bVF5fbJTYyw4WYF4iwh3EO8sfoMPacmE9vIGH4QwE9DgMr3Vriqj?=
 =?us-ascii?Q?aml3/6g75zuN0zoPMKyYgHYHMiowEicGHC/DUrKWmi9IMOGqEDYXQAmwRDWi?=
 =?us-ascii?Q?g1mFmbuJzPTFOdvL8lFEvyxuf9tM4jMIQA849Z7KONrNdit92GnnXN4i8Lxz?=
 =?us-ascii?Q?QInGyMOGLF+BNgqZ/8QiIkN0HomcKBLHzc8VtGka2Ko+8vY0uWE+ZR+9v7Nc?=
 =?us-ascii?Q?d9FDLFuLIr2x9sAFOpea/0Fl5hDU3Wr3BSEyI1wEwbbP9sKq3h0Bpl7/qmcI?=
 =?us-ascii?Q?b4I0pDxmRuXiSnPv0emx3DmlipLsrEz0V2AMd/ACrP7x2IMhxsrjxYSvFTWB?=
 =?us-ascii?Q?BgcMAexfxGihwMZh6kdhYtgyLh+RBz6m+UQ+Bj3BX9nvlLxqzCN2TmdRBw/U?=
 =?us-ascii?Q?Z3J/GDRuSsMJNTr5lJXticRI86LqQdqy/THNQ8fBMXhT+D8ttTAYt3IRbVzM?=
 =?us-ascii?Q?jK3vUu6ZwL8mHrC5Z9s/luxo/mADVz3m59o63BQgaP/uTwMCdAerKn92pBcP?=
 =?us-ascii?Q?2XbX6v+dqNAy2myK8uahf/fM55PC6D0QthjkPdYCWnUu3A5Z+MPK5yGG8sIA?=
 =?us-ascii?Q?DxsOT4+c4qX4Yv3tqEZyJqLdGZLe6Bie7UmjytQ0J9E9KDikGQDz/o75telv?=
 =?us-ascii?Q?vX4szaRJJCznKgOOz8POXZAVGyos6FR/rw9FLLgIIr5k89PcpbkMWTs9Gguv?=
 =?us-ascii?Q?NTnYvAIFOf9f/ti34OK9mLZIKrvgThJMicLbJ0IIjhcAUTH/Up3gWEcoFdKB?=
 =?us-ascii?Q?94XOMqqA0BJJRrGFeqz1+XKR3t0EDeVIQOz9vyguddDlVLp+YbxM0l2x/2lu?=
 =?us-ascii?Q?ShML24SDJ9Z0KNhu7P0h7R3p7nG2E4gNviu0pDsYMaKSexaDcouu/DkeN0xi?=
 =?us-ascii?Q?KDiKkT4623A2jmOBc4vZW4lX+FlCvHp8M2Iui9uDt8Zmup9ebPBk2tbeGccM?=
 =?us-ascii?Q?zzKHY+qyQoQCpJ8LPV49e6Ku3XobyEnSgfFFTQq3Y6EeAUpL9v4PXkQQh5Kc?=
 =?us-ascii?Q?iQF8I4Tfn5rjl+1bsQG0eYoFcuHFDLDbFMSof9TwZGnShi57X1bdXFESC3u8?=
 =?us-ascii?Q?g/ohRlq/TTDTbJ6E5xCHt0yaMlm+4KBT7sSSe4aplpGYb5yiI3mEUcrTHTO3?=
 =?us-ascii?Q?faLM7MSvx607+xAjhm4xIvs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6841a68f-7e5d-4e29-0cd5-08dbd41b921c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 22:58:28.4906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OCrejLPT+/yqdpAW8FicIC1q8I13ZWj3CuQdp7wh0brXZq3yKjiXq61EzeJ/MDMpCGOeV22h0YBJSVIqEyjStcwAo1U3753KSbhfw8TkOqs5k41PzYZ9FEYoDvmk6XVD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10153
Message-ID-Hash: A355CMYTLHITZ6VAC6KTOU6UTBQQHVYH
X-Message-ID-Hash: A355CMYTLHITZ6VAC6KTOU6UTBQQHVYH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A355CMYTLHITZ6VAC6KTOU6UTBQQHVYH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Conor


> > +          CPU(N) / Codec(M) DAIs were not same in one dai-link. ch-map-idx is not needed if the
> > +          numbers were 1:M or N:1 or N=M. see soc.h::[dai_link->ch_maps Image sample] and
> 
> Again, relying on header files in an operating system to explain the
> property is not a runner. You need to explain how to populate this
> property in an operating system independent manner.

Sample is not mandatory here, I will remove Linux header pointer from here in v6.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
