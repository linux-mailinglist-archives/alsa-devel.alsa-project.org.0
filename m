Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F6A522C9D
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 08:50:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44E5E1926;
	Wed, 11 May 2022 08:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44E5E1926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652251843;
	bh=r5ArQ0rEIN2ODyy1Fl3kY/2EShF8NuZlZV2XmVii2Qc=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUDh1PzIpkDgO6NZm8Uk8DpoiIJ12xOdSNofIZHvf2jjS+lwM3NL8lEul2VJb+Yqy
	 tLMWQ5dHSSHbT3tGVZyx81mP2gS6xdwTwvN8a3mmx9ezQJHt8J2xiTvx9xG9e3KYzg
	 4lIACe/ivJXqyxjKGC7z4y5Qlrl6IQZd54nBeb70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8446F8015B;
	Wed, 11 May 2022 08:49:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9D2DF80137; Wed, 11 May 2022 08:49:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE80BF800BB
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 08:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE80BF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CYnlqwH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652251777; x=1683787777;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=r5ArQ0rEIN2ODyy1Fl3kY/2EShF8NuZlZV2XmVii2Qc=;
 b=CYnlqwH0wYNDGMOcatXV9cNpkEGN4Kul81FZE7l8XSMsBdauH7J60zCL
 dcJuX9lTQxPWi4Ev4Ze65VLLPwSbDz6HezMASAqc9WWoR91Ex/q7IatZk
 j7aiYSlVY0Br4Bkqs7la3cDwwRvYzqS1NkS69SvJ3YzVmv0pu5ZXhRWna
 Zsrm4UiR6jmpc05Y9IIbeZUAgjPkNl+vq3tf6pEXHxeOnEzOqaIAVulJ2
 KqxGcHmsVfnVegGD2cc9pIIu7Wf6ryHh+aI9p87Qlfhu+v/J8yR6CqkB9
 /Bd1JCPgUzaKyw3oO2PSzyx5WAltbnBcindsVpSfx4sILGHWIksCopcPU A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="267195742"
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="267195742"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 23:49:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; d="scan'208";a="566031851"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga007.jf.intel.com with ESMTP; 10 May 2022 23:49:27 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 10 May 2022 23:49:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 10 May 2022 23:49:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 10 May 2022 23:49:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyDpO1LHypayU1JGWKCt5KIobh2712e6HwB0ESrStQEN1LPnlawIWYMOTnnJfXsjb9VSCekOPaRFzoO77z7S4Iu5YlXS8WZqWc4cEPStreORFQ3QrjTrvkYHWmYWFfAApK03uL6kEMb+JcCQT6yuK1QWqe83P3SvWHz15g8DYUCXybBNOrcsDbZ/qRMiFDlePduQ264aSNGEX1EhyUHluCAFss4KL4n/cHtfQEoGWef+uAARQ+ZKea5/O/P714ekriZzBWrAFlkkqm2YsMmEoWK9J4z6codW0USaNcTgjARutQlXhG/uZ6FSq/p6HpcJNu5ryTrH1HncShsWRs7QUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5ArQ0rEIN2ODyy1Fl3kY/2EShF8NuZlZV2XmVii2Qc=;
 b=KqAahlzhdgAGbsFeALli3ob9fxFwPj6twt+fl1wqfsxgKUCSidpN6KAyw1BfB5sDKVnE89NSMKX+nBHrMKW5nXdgmSsv2JYRS2H7Ew4SAbUZCK7IxsNv+JliJ8cW6WaSVt5lyNdH+cdv4lRza3HINGDbN1mynjwHOdutUekCMOpHPGVUwt88MvbCh6aIU553oSiq1Ev2t9siCNxGYYvvKEUkmurvKJ97QO7p1MXxDsWS83ZPZFsxGTseOWrjmj1c2QJ9fBtw7e32zIXqfWYB9mOUG5xCKx/ostzzxZU7Rw6mAm+yqTHbUMhfh4f6DlbBhQC0iwG9dP+0Vv9PO3RA4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA2PR11MB4891.namprd11.prod.outlook.com (2603:10b6:806:11e::18)
 by DM6PR11MB3018.namprd11.prod.outlook.com (2603:10b6:5:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Wed, 11 May
 2022 06:49:25 +0000
Received: from SA2PR11MB4891.namprd11.prod.outlook.com
 ([fe80::6545:bc8e:a452:2d5f]) by SA2PR11MB4891.namprd11.prod.outlook.com
 ([fe80::6545:bc8e:a452:2d5f%8]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 06:49:24 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Terry Chen
 <terry_chen@wistron.corp-partner.google.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] [v2] ASoC: Intel: sof_cs42l42: adding support for ADL
 configuration and BT offload audio
Thread-Topic: [PATCH] [v2] ASoC: Intel: sof_cs42l42: adding support for ADL
 configuration and BT offload audio
Thread-Index: AQHYZFuI7zALnu441kqBxEWBUyOJdK0YLxgAgAENrdA=
Date: Wed, 11 May 2022 06:49:24 +0000
Message-ID: <SA2PR11MB4891CBFA1FAE454EC7620F0C97C89@SA2PR11MB4891.namprd11.prod.outlook.com>
References: <20220510104829.1466968-1-terry_chen@wistron.corp-partner.google.com>
 <190c9add-7fa4-8e76-bfcb-43d30f22f8d9@linux.intel.com>
In-Reply-To: <190c9add-7fa4-8e76-bfcb-43d30f22f8d9@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.15
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4f110fc-f1e2-4702-8972-08da331a62db
x-ms-traffictypediagnostic: DM6PR11MB3018:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3018C604F3369DF9882D36CA97C89@DM6PR11MB3018.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NSGaYHwY0Iu/J2VsWZsks0+dvLHvPRT2uWt4yMHXsItkz+xkvYMvzjvdtYBb2SXvCY5Hk4diTiYrcc3l9KCF9ZHEazicBQDmds/Xmv+q8qw7n8RKe77UADB+iAxq1yahG2Syy0/H5h6pqN53roe1jRsqi5NVe3sjzQTpyQDQZ7zeqJaQv9TNnccoGJqdTfAZjlJy78x88REATtKyeNcqPXhVwVxRBwDWvWuGkf08qNawpvtAT++cKC8dACEM+qlw+Tu5jdHP9WzrV0QY7CmP/tEvzwz9WxEw6TgzPXkghHt1ubMCUpcSB33rm7fRMs+IbnAOcbIA9vSoue5jERgDcgFsJ9MQFCUo6ND/97wftiFuYk6mzm1vzQNu3xPN6LU0M4zqm5QQgKWjD8b5Aeo8D4u81bWQCQuXevqWejxoHiJ+AaSFBGH0Bf2Eat+ZJJpg5sYusV3qmiOHwmmWFf/pIzqp9xh86TqsH3e/yEYeb4z4I+bIsBs3uWu3nU9yuRbBADOWBXGJUHASsTe8ReRe4O7vk116QUWsdcN91vTXPDTCvdv/YkXHqBbhjXmZT/Mc1vbLxjaS1ydGNi0F4Yoz4LsBFRGWkXkNpZFKwPCDgEBJEM2f9njm93WMfS+TUeVZaytIhJ9u/KIQ/bU8zX++vbCYWSBlhj9ZM2eaIGj2dAM+D+TTjadJ6NenU6sJWP4qvJvfj+s0g9Ij2e+zIx5Gs1qBtUcFvEqb3kGbs7RZ85M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4891.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(110136005)(9686003)(54906003)(8936002)(86362001)(55016003)(316002)(7696005)(6506007)(4744005)(5660300002)(508600001)(52536014)(33656002)(38070700005)(66476007)(66446008)(66556008)(66946007)(76116006)(38100700002)(4326008)(2906002)(7416002)(71200400001)(64756008)(8676002)(82960400001)(186003)(26005)(122000001)(11716005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czNCMmdlWktuKzdyMmdlMGtUU0pRYjRsQ3BVZTdrVnVJaS82SFhKUG9iMG9Y?=
 =?utf-8?B?ZERMdTVNbjVRcXlYaTZMZ2pzbFFSNkxlUy9kbTBlMDk3UTJHRjNVbldoeHMw?=
 =?utf-8?B?QmZZRHhYN1U0djlKaDRHb0dLRjdBRThQdE1pT1FPaG1Oell4Q3RJaFd5NVlt?=
 =?utf-8?B?a2hNajFGNjYyN0J1aWZHbEYxNnhXSGE0ekh2VUdHOHRxTko0a0pBZm1kcWZn?=
 =?utf-8?B?Rm5vQmpmeWI0N2duWm9Dd0JML1NXdWhOd1owNWd1QnhGL0lXSUVZdnNGR2NW?=
 =?utf-8?B?UXZmMExvbU1ROUp1ZU05WTU5ZU04QXBMMzU3emMzMGxMTXZBbjhDQjF6TnBW?=
 =?utf-8?B?ekp1YWtTZkxUMmRSdzc3YnFpMXBFdlhHaGY2NGpIR2g4QTdKcjdLYllGYmk2?=
 =?utf-8?B?dEhUSDhNV0FwMzBNODlEYUlHVGRLVlZoTXNJWDlNRXdRcGRFazdzRTFxdC9h?=
 =?utf-8?B?b0ZaTFFmbG1zSnBvMWcrd25ZV2swMGU1d2FENWNsQmNaSUlYeVIrWHZjZHpo?=
 =?utf-8?B?OTVjVHhzNTEySG1nNHYzMnJyeUY1RmxGdzEwS1NJZXB3NDJnNEI0QVJWNGZ0?=
 =?utf-8?B?Y1FjK3oyWk9FdTdkbzgwdmR5aVJZcUQ2anQ3RTk1Y2VybytKK2czc00rV3ZC?=
 =?utf-8?B?Unl6QWZWK3ZkNnFLOGVRUUVPNHRxOWNWbm1WYXBMdjVzZ1Y3QjU3ZXpvYkk1?=
 =?utf-8?B?elRkL21aZWw4QkJ1Rk9YSmRjN3I1NGFUVDF0aHZndGlnbVh1Zmp0c0hCTlNr?=
 =?utf-8?B?MVFUS1Uwc3U2SkZXZi9ydktBR2pWOU5UZzF2Q1FVSVo1VU5PbDk5OS9Ra0Zt?=
 =?utf-8?B?OU5HeGN5Q0NYNzcrcnc5Y2Fabng3Y2xzL2tEVXB4anJMSzAzNFRRSitwWVdC?=
 =?utf-8?B?UGtCREQ0T2NuMVdac3hoUGVUMllveHNVS0hzZzRmWW85dHJLWmRCZ0FJMk9T?=
 =?utf-8?B?QzhFUlZGOGxheTRIY2lRSUpDSU5SQUFjdGsybE1VMkx4RDJVRGovTWRWK3hi?=
 =?utf-8?B?N0FRVEZlMHA3bnVadTRqZ2dFZlRYNk1ZR29GMXZ6c3NISk96ZVgrL2hBSnhQ?=
 =?utf-8?B?N01yWU5Fcit5Ulp1aFRzYlJoR1A3Um1JdVlQNUcyTXJ6WXI0TmVEZGhBUTE2?=
 =?utf-8?B?QlR0TlQ1bE9MWmNQMElBMGwyamFhYlEwQVlqbmppQ1BJRWMxSEhucVdZNXNj?=
 =?utf-8?B?ZEhnYVk3RG4rL0VKcENadStVNEFjSnd1UjZoL1lLd0swN3BMQnh3WmZDMkc2?=
 =?utf-8?B?SGJuWlZiMHhOTHN2K0FmOWZWUkVpd1NoVi9mNEVwWC9ySWpVdmRlQlNhSWVp?=
 =?utf-8?B?Z0VSb3R2V01aR1BBdnJaS01NSitSNVRVWFdrSFVVUmhjWjMwaU9pSkY5ZzBq?=
 =?utf-8?B?bzc2aTdjSFZqK2ZpQkJsOVNMazR1akZwZTdLYUxSNjZkN1JLMHhydFhtRUJL?=
 =?utf-8?B?d2pJUkNEQWdPdU82R0JSelBqT3ZvdHQ1OThXeWN0c2xZdjdPQmp5UmRud3U0?=
 =?utf-8?B?bWhQTEJyQlBPUGEweHErTVlzaDRldlB5TlRFMDRuNlM1enh6QVoySkV6Rk1z?=
 =?utf-8?B?OWhRejVWc1YzclFmVDY0K1YxQUhZZmN2UWIyY3AxSDVLSzhUdW1SRWNBYWdK?=
 =?utf-8?B?TGFYbHJMRkRtVEFoNitxMmZLOE5Fd3B5dUl5R0E2VUhIYTQyRGhiV2lvVmFS?=
 =?utf-8?B?TDM5NkpnVVh1STZiKzBzRE9lcmk2WFUxWi93T0ZoeVZHb2xYbjRGb2x3a21z?=
 =?utf-8?B?STRwbXRZS2M3RnVqRllXQUNIUVpvNDJ3TVFWbEl4em5ldlNaQ1VFSUp4TGJw?=
 =?utf-8?B?YS9ueUI0b05sdVVXWDBLVy9LNnVOMlY1NWZlcEdsVjhUQTUreVNQMHFOLytN?=
 =?utf-8?B?Y1o3SnNaVGR6TEF0bHgyajVPTTNpUW1PckswRk5uTjViN3oxZHhYRVE3ZTRG?=
 =?utf-8?B?MEIwajRaOXpsb2tacGRQVDdwSGZNOWkyWWVUTnYvc0cyVGZCT3hTVGxFanJW?=
 =?utf-8?B?ZmNycHlDUnZRWjZHeTg2eEt6U2dKajJyQnJGcXF1VVRUNFJ0WEtOM0lQakdt?=
 =?utf-8?B?eWN5NE96RFpJVnAydkd2eW01NmNBd3dtVXF5VWhWemk0M2w2RDZsM3RHSVQz?=
 =?utf-8?B?K3RybjE4cUx4NHRoZGUrcG9HcUtCUDVRd0dNN1UySGJVTy9HVm1FbnhBdG9R?=
 =?utf-8?B?dFNnekE0aHlaV2prTllldkpuS1VucVJUTXpXWStTNURuMmpTUzVJNERGRUhk?=
 =?utf-8?B?bmlVcnM2Y2F3Zjk4eTJXaTJiMFlBN1pjRkJYZmJLaGk3aGlqVVBoaE0zUDdG?=
 =?utf-8?B?N0lNazRnOEQwS3c4dkVnS3BKTVQ0OUIxajFWOVBiZmxTLzhXcnY1QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4891.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f110fc-f1e2-4702-8972-08da331a62db
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 06:49:24.6443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6c8yO4TsVOaCnBbC0s4EG00zhzvTfS67nYmSwngoDOhqc8fVWwTwljweCAwoF0QUvhGpRNooXIWgM4WQoG01LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3018
X-OriginatorOrg: intel.com
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Bowman,
 Casey G" <casey.g.bowman@intel.com>,
 "yang.jie@linux.intel.com" <yang.jie@linux.intel.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "mark_hsieh@wistron.corp-partner.google.com"
 <mark_hsieh@wistron.corp-partner.google.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>, "Chiang,
 Mac" <mac.chiang@intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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

PiA+IGEvc291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1hZGwtbWF0Y2guYw0K
PiA+IGIvc291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1hZGwtbWF0Y2guYw0K
PiA+IGluZGV4IDdjOGNkMDA0NTdmODEuLjNmNDA1MTkyNTBhOTAgMTAwNjQ0DQo+ID4gLS0tIGEv
c291bmQvc29jL2ludGVsL2NvbW1vbi9zb2MtYWNwaS1pbnRlbC1hZGwtbWF0Y2guYw0KPiA+ICsr
KyBiL3NvdW5kL3NvYy9pbnRlbC9jb21tb24vc29jLWFjcGktaW50ZWwtYWRsLW1hdGNoLmMNCj4g
PiBAQCAtMzg0LDYgKzM4NCwxNCBAQCBzdHJ1Y3Qgc25kX3NvY19hY3BpX21hY2gNCj4gc25kX3Nv
Y19hY3BpX2ludGVsX2FkbF9tYWNoaW5lc1tdID0gew0KPiA+ICAJCS5zb2ZfZndfZmlsZW5hbWUg
PSAic29mLWFkbC5yaSIsDQo+ID4gIAkJLnNvZl90cGxnX2ZpbGVuYW1lID0gInNvZi1hZGwtY3Mz
NWw0MS50cGxnIiwNCj4gPiAgCX0sDQo+ID4gKwl7DQo+ID4gKwkJLmlkID0gIjEwMTM0MjQyIiwN
Cj4gPiArCQkuZHJ2X25hbWUgPSAiYWRsX214OTgzNjBhX2NzNDI0MiIsDQo+ID4gKwkJLm1hY2hp
bmVfcXVpcmsgPSBzbmRfc29jX2FjcGlfY29kZWNfbGlzdCwNCj4gPiArCQkucXVpcmtfZGF0YSA9
ICZhZGxfbWF4OTgzNjBhX2FtcCwNCj4gPiArCQkuc29mX2Z3X2ZpbGVuYW1lID0gInNvZi1hZGwu
cmkiLA0KPiANCj4gbm8gbG9uZ2VyIG5lY2Vzc2FyeSwgYW5kIHByb2JhYmx5IHdpbGwgbm90IGNv
bXBpbGUuIHBsZWFzZSByZW1vdmUgdGhpcyBmaWVsZC4NCj4gDQo+ID4gKwkJLnNvZl90cGxnX2Zp
bGVuYW1lID0gInNvZi1hZGwtbWF4OTgzNjBhLXJ0NTY4Mi50cGxnIiwNCj4gDQo+IFdoeSB3b3Vs
ZCB5b3UgcmVmZXIgdG8gYSB0b3BvbG9neSB0aGF0IHVzZXMgYSBkaWZmZXJlbnQgY29kZWM/DQo+
IA0KDQpXZSBhc2tlZCBjaXJydXMgbG9naWMgdG8gc3VwcG9ydCBiY2xrIDIuNE1IeiwgNTBmcyBz
byBhbGwgdG9wb2xvZ2llcyBmb3IgYWxjNTY4MiBjb3VsZA0KYmUgdXNlZCBkaXJlY3RseS4NCg0K
QnJlbnQNCg0KDQoNCg==
