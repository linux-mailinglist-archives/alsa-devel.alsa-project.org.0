Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BC4AB8B30
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 17:45:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B15B60181;
	Thu, 15 May 2025 17:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B15B60181
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747323955;
	bh=R+yukpNzwSYwE8xUc61uICqr9DGZfji6T7rRQ2kepao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C9rRHAJx4iplmEUWCDq3O+PJiJSrgZpw0WFIeGywH7pOVoeI3xBGztYDCFK5q4HQQ
	 3R092SpWaV6ywFXJ13xaNtenmhngMkDTZ7NteskLthZ9Hf/a7e42jEUliXFxzOMRrz
	 sqNyVW184Q8Z9RuTn8QlsYzLVCjbzey6cUHNQof8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81324F80075; Thu, 15 May 2025 17:45:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CF14F80100;
	Thu, 15 May 2025 17:45:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BCBAF80075; Thu, 15 May 2025 17:45:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::612])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B782F8003A
	for <alsa-devel@alsa-project.org>; Thu, 15 May 2025 17:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B782F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=jz5jlLBj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYACIPaimB9h0QSuWaitBenausF/aJNNdNbVQFU7nO7/gWspKb+Ht49PbCYh1kbEf3P3aNPFnB5XUH98S6k2AamlyL1qNX8aOFdrBxn+l+s0KknfQeSyCPdtU4RyinbOgXeeDbzjCtMNshoKKRJa0c0IGqR7SJITyvnfUgCAGCtwuFHiSFK1IuGdRFvN5Ckhu2GZNN+FYUeft91KU+ERCki1Uj+s+M+yqQAB6rdS+NlCzTUAYxUcz8s83ZdgjeTuSzd+b+ihyxzu/lq0YartJRCqY0NWGqHyOngrjFrRTyWR0J1SkEqwzxTwIbxX50JesdOxPIRcQnWvM+uPuhmBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZDD0RDhaAzErWAwfL21f+Nv4uQVIP+eff2o0Wy9Yc8=;
 b=dsblv8jjig+XritfHCkR87OdMjJMu3AROAoJI1uADHsSEYINtADjKJCSxDC/FhAc7F1OUVbUK8/K9ORdNZkH0xOLTUsy0ZsIrxrBi8fgAmx7cO1UWMYb6gswX0urvrgycverGGp9mDK7RFh7K5573RE8V1uAmz7ExaoXOA5s+Tb9Y/jc4eE74TGZY57dyCYEVq1nNvzK/OL6izSC0mKR7Vpo5qfa6e5kMWLqqDteju8x3PjsO7iCwLqe4+bjR3oumoPPV9mvXxyg6ta7X9foHLC5itlVEmvpDQQWeVBytuHJMWzSMjXUaUTBoGN3sNCWsdlHhkMlx9NicUR/bbu7CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZDD0RDhaAzErWAwfL21f+Nv4uQVIP+eff2o0Wy9Yc8=;
 b=jz5jlLBjYyBic2Bre0SwHGChOhbgaxbSWW20jOpRPafB4HdzuQz2APy2cjBEcJZisHLxTUUq/0bwlPJVmZXUp4UkIPR1oW0NU23PzAm2QkkBF3jDS3q8bV9AR0VZrgD7EtinailjQr5XiUpcwzmvVZ9K4Tq6PfkJutEdMj+FWVM0Rn/NIjXVi7u7keriT3wtriZgPQrIOwEaIQvtEkh9qGK3t+Onp1aCpT1V3POi1CgnqKbpes9AwAD8kMrvWGbKjbfWrddL5noACGyvv+xTSD8mhqE4EQ5sce7TLH66s7LmOPJF+3mFcEEHTAUCVw1u4SUX5uLADWTQfgZDOGMeZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by DS2PR12MB9662.namprd12.prod.outlook.com (2603:10b6:8:27d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 15:45:12 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 15:45:10 +0000
Date: Thu, 15 May 2025 10:45:08 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda - Add new driver for HDA controllers listed
 via ACPI
Message-ID: <aCYMBDAxKhD_30Pa@ddadap-lakeline.nvidia.com>
References: <aCXswg1gr6cufyzp@ddadap-lakeline.nvidia.com>
 <87r00qx78f.wl-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r00qx78f.wl-tiwai@suse.de>
X-ClientProxiedBy: SN4PR0501CA0050.namprd05.prod.outlook.com
 (2603:10b6:803:41::27) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|DS2PR12MB9662:EE_
X-MS-Office365-Filtering-Correlation-Id: 17bd7b03-c069-4bfb-ec89-08dd93c779b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RsOcrYNzPmdMcK1eBQNYg8OONTjDNDihmgXVtVz7xzhAWWQPQN6jfMUVhquL?=
 =?us-ascii?Q?lkgOKr5L17LiiuDzxxwQCQQjfT+bErsiuo/w3iqc4MSlVYO41BknPK58YU9h?=
 =?us-ascii?Q?liN9hC5tu1xgVIFmqlCkmaaP7mpw/xjUSS7ffZq3SCkW36/vPDDGFYzyGzNw?=
 =?us-ascii?Q?Dm6wPq8N2FfVaalJ4Q1U+XG19flwO9X5Cm8duTqa8+lwIWNkcCygnTaqgaVI?=
 =?us-ascii?Q?zZv1GCnQObwtXOOdLWGGcPm0i/g6N6uPRa3sa8csQQRSO4GtqOZpfeeBd7Tz?=
 =?us-ascii?Q?F7UviyAh1eseK8pRcw2M0wnV/WejREmUOtGfzVJZjDn0dWfLz1LGBdhv1YV+?=
 =?us-ascii?Q?byPtIQZvPkoHnSl+QbdLEy3pWXzCWvKQcUcRTYPglUrRMvEwJhBGVIAAUJZR?=
 =?us-ascii?Q?kA7mFAU3PaEcnsUj8MIF3Ojv8MzcRUWYDYLkzrlztV2hdurMv+20aOAMEBNB?=
 =?us-ascii?Q?TFpon/Z+XphZb+s+f5AkJQcppSYkAcOdtZp81mrTYT+FJoOaz8msDUmXsGlv?=
 =?us-ascii?Q?PJLonjfjJ/QBW7Je1wS0eI0lhmP0w/DKimEZjfOnTotaQeTHpAcXxAnyaLzi?=
 =?us-ascii?Q?bRK90NDaFaUNw/UQXbPtQ8oXYOgI/8eV/K2I7jehVGQ7RwGXICxlwEkBU4bk?=
 =?us-ascii?Q?Tt0K5/XBVHIQmjlBuLAIwtRtLSWTUY85Acdpljgn/alEV/HEuEVzu85kDvcJ?=
 =?us-ascii?Q?H+D2fY3nGkyXYdGp9ynZHnbJTUBCAkKl+GXfhKpGGiqpGtvboPt88WGVJTA1?=
 =?us-ascii?Q?bE3RCAOBlhTQBSiLPHCQIm9vcD0bRjhPqQsx5Y5pHlk6GxlgXoKu9biTqbFj?=
 =?us-ascii?Q?dnnUXryKoH3SRSOCRM6kk/4dre++8z+LVDi/3EinffZVm7b+uSWxZrgSZRmr?=
 =?us-ascii?Q?PjBeDzmdyBismMLAWFpTgqS8o/qHscChvtkk8XBconE5QUG7GHMsKeLgoj9G?=
 =?us-ascii?Q?50+eW0S9VEkpLRmWMb/vAwcHnBvBWnCAxP1phx2OWLgRw8Wrnt4xez16kns3?=
 =?us-ascii?Q?qguadFD+xTx5NNnfwjtn1mOJYA8dRrgFp3SCKW33ecJn2YCWzyEk20oXS0k2?=
 =?us-ascii?Q?C47DuBZnQW28Iiy/WeP4kCEzWOCyZeL8hsUkay8Q6/L2Lq3SBPyGDHJ7p927?=
 =?us-ascii?Q?sZRZAs7uP4fwfQUBDBM2Fip2XfgQjCCuDIxhn+/AztsMWvnCTHFEtWehEtew?=
 =?us-ascii?Q?yJE4pFhQDJuRTikCiD2Gt8r3on3TIGw7J8jZHQm+XCaIW6BCyU9w48rsV2ud?=
 =?us-ascii?Q?sOLwZmmILVLVQJKy1XVwthxFbb567SL9NVCt/IIcoNt5Ji5BD+wVHofSTvHS?=
 =?us-ascii?Q?JGxovtPCP8pAPZ77oj6VcUcSzLKswMI5uRJNWh847PnO4ZKbnZUQIbB5RJKp?=
 =?us-ascii?Q?GKx0aitbbVfn4ZvpdRi50hBeSPcDzQ3z3X32O0gW8qWUTxbZ4xP4wPiaAsv/?=
 =?us-ascii?Q?LDEMKgQ1t7w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XNJdabawfp6Sgs/9j3sOm+4JbLJlnjbPfU03f6ErRK1heg+iKWYG0yEnRYNZ?=
 =?us-ascii?Q?9sp73HWg7As5rC+9AC9zeAsNnghmeMnSp3Ozr6HNfx4aFZkWldEgOwJpIChK?=
 =?us-ascii?Q?J92Qobj3s2GqtnL+dxmWa4KvaY+QydmaDHRIL5XG5Oxad4MET+ohG33e4YnI?=
 =?us-ascii?Q?8/BZQQb4zxGXHK2E/8W/fJtESrUDVNAYz2Ru7hFgcjtvHcGqxYuRsM4aMIpa?=
 =?us-ascii?Q?Kb3AEWd34bzJb76PDIIyWpY2cPivRt1BluYEHHhtQDl7STlXRPJJAWLWf0vx?=
 =?us-ascii?Q?qPJoQUChXz47oVZCErnEBgt20XC6tbkrGLrPWdWYUvddTanHEai9o0RBcEJL?=
 =?us-ascii?Q?7FoLDGV2DoCCNp1nK6iyxAtv3sa/Yc4GbhvNJEQkiD9ZLVFQKnjQ8ARhYhXT?=
 =?us-ascii?Q?xnHlA2Rfn8WouqcPCK5yfmQLxoUJFZffm07u+s6JGg29sUyIcqeNHbRooJmF?=
 =?us-ascii?Q?PfGiGGqBlgy3MwsKH9U1yVIm+ii4XMOhyYfdgH6btY2ab5QFKMrpP60csHE8?=
 =?us-ascii?Q?/6N8yu2RWafI1e3vBcq4ps3xSl1xGXgBBiGTbdrcwkrsvdSHa3tCTl6+BEMg?=
 =?us-ascii?Q?HB6lY1SxX9OgrPTvsliDtv+VHoIDye4UNO+ylFMf5fM77pz95UBnxmK3dHY2?=
 =?us-ascii?Q?UWZjYzMC1N/uiEmm4IxMYFMo1I9tl/GhVkTz9R7MDnYO2gJ6lvq6v/Z50rbg?=
 =?us-ascii?Q?oYNU78BgZYtxJmkXgvBYi3+shdX8155BwG1cxylw2v6/Jmv6rYO4izU1Rntn?=
 =?us-ascii?Q?kisFO+NROweaNdmLbr7kaDpFJ2WIgwx98F+u3SRB5MDhVVF7YNw/axcR26Ep?=
 =?us-ascii?Q?FMA9oS1T40dJkrDQqaMiUkcVx/+dVKCQ4lWjetqvcUPIAi14y+uGqB3mteYq?=
 =?us-ascii?Q?LZSO4HSOcLO9RfAMoqxN3ZlXR5Q7n+upHp+wCUioa2ELSfZjg9KFIHiH+9vG?=
 =?us-ascii?Q?NTCqD7hJ+fCwTPd3re0beMsKDTRBWLVcVElGjpedUScaEi9zQPWeIlZOciQn?=
 =?us-ascii?Q?rPJbAao5G1hZ+BzL01zu7BTcICb3GKNyInJxVrEFZO78bnDP90W36nX7j/f2?=
 =?us-ascii?Q?p3QbmUPxK5oaXf83wlg0TZ71nEng3j/FDfRkut5TdTuWb0ZWD3+IApwE3O+6?=
 =?us-ascii?Q?b9pHRrTnYM6XjSG0g0f4w4OThlOYjVsdjvZ5OP4LTTHIRGeHkaBBcSPu2cmi?=
 =?us-ascii?Q?48fhXGVEMbQ3WqC0vZ8aKgyPkppJZ16udl3MrxnS6j07YTD226Elxop61XZ+?=
 =?us-ascii?Q?oQNfoYMOybs8+dlhNeB9bxjfIkc8Pv3AcDRjjO882/2KFEtoKzDibJkDaEmr?=
 =?us-ascii?Q?1ksHqh2LT4bxlMlyEwhmF9F6G/+oXw6GwYXJ7aYbSo+oDBmgMExPB28wJHTD?=
 =?us-ascii?Q?rigW7kUtLpt6aZ712L/soXd23+pLWzh+/hTT+OlLXk+yQQKnM+S9+OcVoBhb?=
 =?us-ascii?Q?WwrTmGySCm5ukbtJUqZoKMthxpwhisGyBeJZfScD/+/D8MyWLHyHQqHJj7NG?=
 =?us-ascii?Q?8Ja6YFW1LguwkIuW8JKRI1ww4R6wgwJByW0XYKhQQerGLM88vuniywVaHCvk?=
 =?us-ascii?Q?JHIW5rZHpQyKeQlRDZdM0c0FA1uQ2mDwDvmDnqaW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 17bd7b03-c069-4bfb-ec89-08dd93c779b0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 15:45:10.7454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 B5RYHOkDwV3ol8Ffh2hAVU3uz6YT1mYi65COqwDpVIg95LvrA60tMkuWQj+MMjYCw+ICIMwO/kkeHNJAPp2YTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9662
Message-ID-Hash: EQPXRQ6ABBHOCRTY3KK7SSQCKRLH6GPJ
X-Message-ID-Hash: EQPXRQ6ABBHOCRTY3KK7SSQCKRLH6GPJ
X-MailFrom: ddadap@nvidia.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQPXRQ6ABBHOCRTY3KK7SSQCKRLH6GPJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, May 15, 2025 at 04:45:52PM +0200, Takashi Iwai wrote:
> On Thu, 15 May 2025 15:31:46 +0200,
> Daniel Dadap wrote:
> > 
> > Some systems expose HD-Audio controllers via objects in the ACPI tables
> > which encapsulate the controller's interrupt and the base address for the
> > HDA registers in an ACPI _CRS object, for example, as listed in this ACPI
> > table dump excerpt:
> > 
> >         Device (HDA0)
> >         {
> >             Name (_HID, "NVDA2014")  // _HID: Hardware ID
> >             ...
> >             Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
> >             {
> >                 Memory32Fixed (ReadWrite,
> >                     0x36078000,         // Address Base
> >                     0x00008000,         // Address Length
> >                     )
> >                 Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
> >                 {
> >                     0x0000021E,
> >                 }
> >             })
> >         }
> > 
> > Add support for HDA controllers discovered through ACPI, including support
> > for some platforms which expose such HDA controllers on NVIDIA SoCs. This
> > is done with a new driver which uses existing infrastructure for extracting
> > resource information from _CRS objects and plumbs the parsed resource
> > information through to the existing HDA infrastructure to enable HD-Audio
> > functionality on such devices.
> > 
> > Although this driver is in the sound/pci/hda/ directory, it targets devices
> > which are not actually enumerated on the PCI bus. This is because it depends
> > upon the Intel "Azalia" infrastructure which has traditionally been used for
> > PCI-based devices.
> > 
> > Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> 
> Thanks for the patch.
> The code looks fine.  Just a nitpicking:
> 
> > +static int __maybe_unused hda_acpi_suspend(struct device *dev)
> ....
> > +static int __maybe_unused hda_acpi_resume(struct device *dev)
> 
> The __maybe_unused is superfluous when you set up
> SYSTEM_SLEEP_PM_OPS() macro instead in the below:
> 
> > +static const struct dev_pm_ops hda_acpi_pm = {
> > +	SET_SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
>

Thanks, I'll send an updated patch. The hda_tegra driver has these as well
so I presume it can be cleaned up from that driver as well?
 
> 
> thanks,
> 
> Takashi
