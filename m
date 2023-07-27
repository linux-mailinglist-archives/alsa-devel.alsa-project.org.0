Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE177643C1
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jul 2023 04:22:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B30E084A;
	Thu, 27 Jul 2023 04:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B30E084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690424539;
	bh=EIoK3QJ8KANDndDjpWj9AP3OLohq3XuKEBaydI5sVcs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Be8f2FgH7zcqEaO+McMQGixdlTAXiXRHB7LovY38dCMzivoQOjDwuFGNcudLhf6CI
	 bGgz9rj+yE2ryh34lq6Aaxi0Lf9O9ijtPZ40hSF6GqMU8wxQqwOKP0BDXjjI+nY4bL
	 IolLvhkdkv479x4dSszFTPOCEzz5UqtRZvo9oz4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E28FAF8055B; Thu, 27 Jul 2023 04:21:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4BA1F80548;
	Thu, 27 Jul 2023 04:21:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CB80F8019B; Thu, 27 Jul 2023 04:14:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F112EF80149
	for <alsa-devel@alsa-project.org>; Thu, 27 Jul 2023 04:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F112EF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jFC6ZiHt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690424074; x=1721960074;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EIoK3QJ8KANDndDjpWj9AP3OLohq3XuKEBaydI5sVcs=;
  b=jFC6ZiHtk9yE3oyy1Q1Cew6DfUWLVcU9XAzaLP9lz1EzZarr60I6AxiW
   Gs0li7HMwpjxYC/elCndrwQ+5bsNAmdox1/5hL+GSHd7EYVEHayySpQcb
   PvmrimdN/cdwIU93yZygzjyo3vFkQH68X8UOw9pNP6jVmB+7re7AHvuK4
   84Esx2ZCKAfq7DGxA7SzpfCt9BIYTcjHSW9yptb9QUufSmsdMCi15ETxL
   xK+kfPvtVfh3Yi6827Wfohr+GwSgjyRjQ1HT7CkbBofS/EPqLvnEm/5t2
   Unib0j6ybOph8D2ORynVoQddkekczZ0nolbFSaBNcJdfZV8pqQzI7BRdR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="399121696"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200";
   d="scan'208";a="399121696"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 19:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="756458953"
X-IronPort-AV: E=Sophos;i="6.01,233,1684825200";
   d="scan'208";a="756458953"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 26 Jul 2023 19:14:27 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 19:14:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 19:14:26 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 19:14:26 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 19:14:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeioH4EpBiPknAAmKo77Uma9A/+MINPk2u6zY7GRwdxqWPJHCTfY8hPM5ZibQ7gLADEzTgFMVcpBeDoMKbBxkOiWGMp8ROXeP04LsHY27eQ0qrX6Y3MPWBaQLBtMHkVrE/gIjugxgRzJafptGve7Tu/W3vMjCX4j2GRkja1k49Ig1Fchla+PoAgINEt9QwXLs4jKkGYbs8ppq5QbC69gsESCHIJAG7Q6cIubVSEG2EmQ5/TQevSHP3s/OMsJlNC9r2NJ15TumF3wrCauQFU9cVRCjQbJwJ0eT4ppstoYOL+UuRGgPA/CnCgVZNIGMvsiGEL+JAs6QfyKauFLeLINPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIoK3QJ8KANDndDjpWj9AP3OLohq3XuKEBaydI5sVcs=;
 b=eo3Z9t83KQMC5utLwenJNdM7tWUbIWJozfNAabj87YXOy9Topg1SjLBCaomdHZuFe06yKbAS+7d7DnR+qJPEPQz1nwu1TRqBBHkBjs3NgD6LmJyS+r1/OLPdp39w72wSdnXap9AUhYpJyi0cMc1i/jDQge5z2j2bbBhveDs/EPq/6Xlm8EULYZ38rZCduDoo1c0NVcslZKHqiA1JzWCzyIX49A1ywmC4DWAmlU4YVC3xjajji3yACqowRG6agR8u6MZUP5ZEjfHyeyINnLK0wLFDEg3Rq3srnCru2CyKv3lwGWttM4JFYZY+iigLaTKmXjLvXZTFvecaCs5kGEl9Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 by CH3PR11MB8775.namprd11.prod.outlook.com (2603:10b6:610:1c7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 02:14:24 +0000
Received: from CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::12c9:6f97:4016:eabb]) by CY5PR11MB6257.namprd11.prod.outlook.com
 ([fe80::12c9:6f97:4016:eabb%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 02:14:24 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: "Liao, Bard" <yung-chuan.liao@linux.intel.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
CC: "Rojewski, Cezary" <cezary.rojewski@intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhi, Yong"
	<yong.zhi@intel.com>, Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	"Bhat, Uday M" <uday.m.bhat@intel.com>, Terry Cheong <htcheong@chromium.org>,
	"Chiang, Mac" <mac.chiang@intel.com>, "R, Dharageswari"
	<dharageswari.r@intel.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>
Subject: RE: [PATCH 1/2] ASoC: Intel: maxim-common: get codec number from ACPI
Thread-Topic: [PATCH 1/2] ASoC: Intel: maxim-common: get codec number from
 ACPI
Thread-Index: AQHZuqoaXCiyShA7oEmUALJNRLZwbK/LxlqAgAEjn+A=
Date: Thu, 27 Jul 2023 02:14:24 +0000
Message-ID: 
 <CY5PR11MB6257FF6D92D524D389B734C19701A@CY5PR11MB6257.namprd11.prod.outlook.com>
References: <20230720092628.758834-1-brent.lu@intel.com>
 <20230720092628.758834-2-brent.lu@intel.com>
 <ff55e63f-1c17-12ef-57e6-144a5bea4480@linux.intel.com>
In-Reply-To: <ff55e63f-1c17-12ef-57e6-144a5bea4480@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6257:EE_|CH3PR11MB8775:EE_
x-ms-office365-filtering-correlation-id: 26ddf46b-9de5-4c06-4a89-08db8e47328c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 1wL6IytWQLcnNH0x/3gmzjir0W3Nle3ICEOYAw/biiTBzgCoFH52FgNbudKMSTRtm4a/Dvf5ygdQC62aPy5Nid2dv6aZHY760OMsXQnQHUYcwMcmLIVkqIkOUCEGHjCI42KtyeiJDgzUuwBbXVSOMtPoTN/VjGVbeE6RXoX8GMb/LjIbx3zCM63bx4gfzAk49OSUA0IUOSDIBLm+StFxqgJMzN4P7jA1NyRXRD7KDEVePmLBjKLTXbfa265C5ysrQPUlg3eBuDeYvLlNx7N9WU00llcTqAz6Iv9kF8+V3e6LGB/w+noJNGh+74/jZ7tlp6bPHRAKrAhRQUR5UmOghi7tnLYAwYQ35yfghSk+aBOcUMD0pFhB2hnX8+M4yKODncaeyauR07bf3RRPHDdiqg5x8mI4qberlUcFY6OL7kgM3rhIG11H2joBV9elL9JB+LWHSJMhmWKpYcjhfWH8a2kie6ZJ411vgqGI5ZFvd9IbYgFReU15/ceT4xD9DqSLnhUuTTV0WhwgHEN4Ocvr9bsKadPvnL6EJE2WoVhMu3Qu6gYkvo9Iat8Knu6jJ53vGLOhlt5WOjQeC/FKwLcl8d6EQCRW7LLPp6jKbQIYO9wSKZ9DecYXgQe1VdR9R6ps
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6257.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199021)(2906002)(71200400001)(6506007)(186003)(4744005)(26005)(316002)(122000001)(38100700002)(83380400001)(52536014)(5660300002)(41300700001)(33656002)(66476007)(66556008)(66946007)(76116006)(66446008)(8676002)(8936002)(7416002)(86362001)(55016003)(64756008)(4326008)(38070700005)(82960400001)(54906003)(7696005)(110136005)(478600001)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TjNCTWFwMURGckhrNHIwMjFiOU9uSVQyMFdpa1F1V0JGcGs2VHpwV0RySkZI?=
 =?utf-8?B?cmNYT3VsNXhtTGZkN1Jqb1RGTnRUYXpXV2dYM2hmOFh2dUZ3eEJKa3Roc0JO?=
 =?utf-8?B?M2x4cDBEYzRFOGdKWU5wTHhmS1FqZVAwQllPZXlheUxHd3RMKzhGOTNaZnNO?=
 =?utf-8?B?N1h1bzdkQnU0S2NqcUgzd1ZrYlkzU2o0bURyc0ljc1VUZnhBMkdCL1hzMndV?=
 =?utf-8?B?VGR5eXdSZHZhd21pUWVNMVhpWDBBMnNudnRhLzY2d1NUZENBa0o3dzRoQlNt?=
 =?utf-8?B?TFcxSzFKeWU0WkNGMlRPcWNvODF0eENPOVdySytXK2J1UDNTaFN0WnVJcXVy?=
 =?utf-8?B?ZzA2NGdXYXRFSlNzZ1Z6TDFBSWR0QWQ5aXFBUDVRRVc4NTRKS0xPQk9RTUFv?=
 =?utf-8?B?Sjc5WE5adHBGK2xhbXdpeE5oTGtkRzlDUENGSlM5dlBLMENoVHRiaGF6NndY?=
 =?utf-8?B?citHbWRnYmZ1dE92YlRnRjNYa1ZqYmxoWmZDVjBMNitMc1RUQTRWdHdhOGk0?=
 =?utf-8?B?b1VpWXhtMlM5T3ZRdW0vWmJQZ3FYQTNRSThFeVpIazN4ZDk5NzJCSGVickJO?=
 =?utf-8?B?UkUyOGtkL3RrKzM0TEVXNmhpeEU0dnpHUzVjNWwrUWVsWFlTVjMxYUY1cStL?=
 =?utf-8?B?ZmxtWlB0L1FORXFzU1NuYVRvdUxQSXhmREo0MWRGVUlHTXdwdUVnVk1aMEdi?=
 =?utf-8?B?cW1GT0FaRCs2WUw3b0svQmJmQVVGTDFXQmp1bXNlV1F2YkhueXFkOHd4ODFh?=
 =?utf-8?B?N0V0K2o4cXMyOGpTcmkxdnlSVUFtS1QrZW1hTDNWdWdaWjlFUkY4RDN2dk5S?=
 =?utf-8?B?U1E0em9Gc0dOUEVzbWk4c2NxOGZLcGZZN2lFWkhvbnh4NFdNVk9QQmZLN2F6?=
 =?utf-8?B?YlYrOXVIZTlYYzJ3TzcvQzVDUUFDTEYzZXA5R2xkOTRaZGxWSlBsMGtCUlQ0?=
 =?utf-8?B?TnVmVmk1QU5iVUlGS1VySEt5ZjhXOFdjODM3SFlpTzZocnlUWEpYS1hONEhh?=
 =?utf-8?B?Z2xkM0g5aUpZN3czTkJ4UXBPSElTUU1qdjJhTHNYVFJWV3VsK2pOcEtMOXlG?=
 =?utf-8?B?Ukd0cGYxak40eVhMRkdjRy9taVowRmxWQ3dnQm55MGIxbTUvdlF4VlViQlNW?=
 =?utf-8?B?b1FpTXR6VE9DZWJZbTI2K2t5eWRtV242enFKTWJDYUNtUXZTUEMxSlFleGEy?=
 =?utf-8?B?TGhnOTRiT0JRcHBrS1JWekp1OWhMbkRKV1hWVnhqYWlNMEliUWdOcWZ6SWJK?=
 =?utf-8?B?cmdCdE1tS0hnNmg3N2ZsTjJJZk44ODNCUmR6WnJjT2ZHeU1tMmZVWjc2dXpv?=
 =?utf-8?B?d3docEduMXAxcmhxLzRYcHMzdC9NbkxvWDFvb2NUY0lsVDdPRFdVaWJCcS9k?=
 =?utf-8?B?U1dnRStOUnVaSjFjUEVIcm41QktXNk5HMVZjWS9qWFdwTlRlTWxFdEpqdi9s?=
 =?utf-8?B?MVMrVFZMSDkvdnNZUkR2V2lISHltQm14c2plV00vaXdKOTJwTDZNZzV6aU9K?=
 =?utf-8?B?Wmt6dHJDdEFCNGIrYVRMR05KWEh4emM3S0NyYVdKV3VIcW9OVW4yUkZhSzAr?=
 =?utf-8?B?Q09CSnE1OFJWRG5OSS9acnA2YUNxMHlESXAvQytHbHN3Z3h0Z05qSCszWEdD?=
 =?utf-8?B?cXRtM2JJWThxbTRmYm1Ydjk4eHp4Z0F3TS9SZFlxTHpRTDB3N0kwaVZNQi9k?=
 =?utf-8?B?SXA1VUhCNW5YODFpU1ZIUDFkWXQrdnM5K3RwY0hzalRuWU9lb1NmQktLZTlv?=
 =?utf-8?B?YXZhZE9CWHdkYWFRd2tIWmFLYlVXeTNLUFRtQ0o5dXJ1bng4RDB4Mm1RQlgw?=
 =?utf-8?B?bWM3dGVBOHQrZmhyajYzM3V4Nno5elFrRFF1bzd4SUFjeTREd25kSUNzZzk1?=
 =?utf-8?B?VXloWFhIWEJtbG5PVUsvWWpVOXU0Wk8zb25pZHlpazhQZHVRSXlIQzVRRjFG?=
 =?utf-8?B?RXhYUSs5WGJLSHJIbGt0Qm44M0FYby9vS2NBb2kxVkNLdlQwQlU3WWZMT2t2?=
 =?utf-8?B?dU0vY05OZ21MWlNMdHNtR0Z1QlBnVUx0REk2ek5rR2s4MkJIV2YrUDR4a2pO?=
 =?utf-8?B?VWx5UEFXaDBIUGhSMklDQk4rNFVMUFlVcWpFc3hqOCtaUktydnNOZkowd2h0?=
 =?utf-8?Q?CtWk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 26ddf46b-9de5-4c06-4a89-08db8e47328c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 02:14:24.4933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 8N4E1aE9bwXMhjU8gG43NCSPcB8eMrbU5VMkazXrez2JnTeUk2oc+sDO5bC+gMtoZX0e7xXQ09ONlOeOPHT+WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8775
X-OriginatorOrg: intel.com
Message-ID-Hash: I3GOZ6SU54MKEQVQOWR3XJTLQ2DBDMWW
X-Message-ID-Hash: I3GOZ6SU54MKEQVQOWR3XJTLQ2DBDMWW
X-MailFrom: brent.lu@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3GOZ6SU54MKEQVQOWR3XJTLQ2DBDMWW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

PiANCj4gDQo+IG1heF85ODM5MF9jb21wb25lbnRzW10gYW5kIG1heF85ODM5MF80c3BrX2NvbXBv
bmVudHNbXSBhcmUgc3RpbGwgdXNlZA0KPiANCj4gYnkgc29mX3J0NTY4Mi5jLCB3ZSBzaG91bGQg
cmVtb3ZlIHRoZW0gaW4gdGhlIHNhbWUgcGF0Y2guDQo+IA0KPiBNYXliZSBjb21iaW5lIHRoZSAy
IHBhdGNoZXMgdG9nZXRoZXI/DQo+IA0KPiANCg0KSSd2ZSBnb3QgeW91ciBwb2ludCBidXQgdGhl
c2UgdHdvIHBhdGNoZXMgYXJlIGRvaW5nIHR3byB0aGluZ3M6IG9uZSBpcyByZWZhY3RvciB0aGUN
CmNvZGUgYW5kIGFkZCBhIGRldGVjdGlvbiBmZWF0dXJlLCB0aGUgb3RoZXIgb25lIGlzIHJlbW92
aW5nIHRoZSBxdWlyay4gTm90IHN1cmUgaWYNCml0J3MgcHJvcGVyIHRvIG1lcmdlIHRoZW0uDQoN
ClJlZ2FyZHMsDQpCcmVudA0K
