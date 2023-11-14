Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E3F7EB46E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Nov 2023 17:06:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A7F5BC0;
	Tue, 14 Nov 2023 17:05:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A7F5BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699978008;
	bh=NLU0Mzg/JlrBSYFhluIe9RKbZY2GVHJTyOt9k6LDOpU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=naOswgtiQEp4RQih5HkNrc5V5GqjI5em2BLRRnl+flmkysHQQDs0NRVT8cvukx/rX
	 6x5oGkNHgsAnzVhjtMX5tRfRDMRRMHbaJ5IgkBL634EVhMXnuK9Yqyi4LVaPHi/VWH
	 S/nTu5si22ZQxQLEf0ekV58xUhz/STFJSAe+843I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE813F8057F; Tue, 14 Nov 2023 17:05:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECAD7F8057C;
	Tue, 14 Nov 2023 17:05:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99686F801D5; Tue, 14 Nov 2023 14:32:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E243F80093
	for <alsa-devel@alsa-project.org>; Tue, 14 Nov 2023 14:32:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E243F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l/ev66YM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699968742; x=1731504742;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NLU0Mzg/JlrBSYFhluIe9RKbZY2GVHJTyOt9k6LDOpU=;
  b=l/ev66YM/GkvDO1jnRr4Xp77cY0kI9T37CokLBv8Ufj2fkf0G8OLuu5j
   yHo9lrdNwlT6fVUl9e+73S2kROJiNOVl3Re+ZMsZ5ZgefpMYR5if8Auq7
   7CA/+vSqR1tXFXt8e7Dc0LptCfb+WHrERDQJ1FIrE5YBsbLUIM8ZHgr5i
   vnFL/FC8xcIF3nJZA5BIR0JUPNCaVkYofWFnQEiPss82OuKvegdkdLhEo
   8ukioepjNxQ6GiuvcNzIeeZy/RRGEZ/sdKy1Lz+xh28mMV4Gq42mrGOS2
   aQyEzjcbEPBz2JnQBQEyDgAZizQRsT6UAGa1oo7HpvwbgrT1BsiPD1K4G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="457147958"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="457147958"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 05:31:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200";
   d="scan'208";a="6030429"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 05:31:29 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 05:31:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 05:31:28 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 05:31:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKl9NaXM0YXPnny0FMJafM0Brgbd3uasuixTLi9ENutsJjgG8Pr7ordsA/+OY38vzrBVZzpzQHEtDRXnET/JDkyMVhTK9QdgthR2ST+POiHhnEtb06b6/ONRf++XUa/CwYb71AMchNmUHM9stEidO4z+Z1lISEoROgpTCsf4yj2qKNAw6rbaQ0ze5wPEq7nXws9G3hehvy8wHLkpp88J0vEfmHF7tPhnpvr0wa2Sus1C8c7jI++41fRqqb0MzWe3FHSqhygl+OZUQdGQOVj6jF+vYnvTCuAVEkmNzWhXRA3Rn24zCKTRxSG1f083nZ+EGsiC4qeg/zwhgpn1GQVhnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLU0Mzg/JlrBSYFhluIe9RKbZY2GVHJTyOt9k6LDOpU=;
 b=R9zkEU6uyPOG6EKm9IcNKTgaSAwXEK0Oix2nHNip86dnoCapI8Y+E5vHTZXQrS5eRn1mOvUUQUf761HsNLRyEXjCGmRruXr5M99xeNboMnR9oN2liDl8FdkjLI+kvu+/1hJFABTpCpTCp1FM6DVuvEuEkHc/eVDv3dKdhWv9YiuuwoS6aLxWTV1cJtns6FN3R9i4/OJUjqF+IV1XsCG1H9FB5pXs+SsozXAiodbS6TSOQStj2u/SAScJCxAPwiYqexbiOG1+czub4iseZdsUNkIt1YBDJaMPwATKYZXB0mgQD6Ppy9r4ZB9JQxIB2m97eXeem2mNPc/K1fXeyPSlWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 CO6PR11MB5603.namprd11.prod.outlook.com (2603:10b6:5:35c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.31; Tue, 14 Nov 2023 13:31:26 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::a98b:5c7d:8396:267b]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::a98b:5c7d:8396:267b%4]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 13:31:26 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Jani Nikula
	<jani.nikula@linux.intel.com>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
	<ville.syrjala@linux.intel.com>
CC: Takashi Iwai <tiwai@suse.de>, "intel-gfx@lists.freedesktop.org"
	<intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "Kurmi, Suresh Kumar"
	<suresh.kumar.kurmi@intel.com>
Subject: RE: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move snd_hdac_i915_init
 to before probe_work.
Thread-Topic: [Intel-xe] [PATCH 11/14] ALSA: hda/intel: Move
 snd_hdac_i915_init to before probe_work.
Thread-Index: AQHZ9WguZUgFrVWu7Ue54sw5WZXYTbB56n6AgAAYtACAAA8vAIAAAGBQ
Date: Tue, 14 Nov 2023 13:31:25 +0000
Message-ID: 
 <DM8PR11MB5655518A6F21A2E4CA2E76D3E0B2A@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20231002193847.7134-1-maarten.lankhorst@linux.intel.com>
 <20231002193847.7134-11-maarten.lankhorst@linux.intel.com>
 <ZVNUxZzCGcxQzqJX@intel.com> <87bkbwsebl.fsf@intel.com>
 <569f8832-25f1-45be-bb60-50f5a76d8e44@linux.intel.com>
In-Reply-To: <569f8832-25f1-45be-bb60-50f5a76d8e44@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|CO6PR11MB5603:EE_
x-ms-office365-filtering-correlation-id: ef376cef-bccd-4afe-a049-08dbe5160004
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Vrz6prYhU9St56RhI//PsM0NE0jkMk32Ye1gGIY4kn3eLoNsACUvgCt734Si2uKvgsbf9fXk2lFgLK//i4gu8KcquH+j27b1cW/7l3TJP7ZXcGrqpFOOAOqr2TOWeVzums5xrwFUQ6ck6N33GKGAcjiHQraBHrUv9dQF+MiBPp2Q+FRkhDYzL0Z5ehhqKp2TzDRhrS5KA8lsU+3f4wNOvQecR2Q27KBLoNdzAUR2ioGInuWjIFXidTKaqycoWXm/6hbIP7HlxeFb84t5lIGPO2JC12wUCp6YTjwuBsqFRDbVQUnaBrlmSSbltsXdBAwJR4LZrwqRv/zFtRk6Wxe8L+hUgwx023X0sWmNa7GLeGxQhbdgC4MCCwpivvsLfcVI3j1sN8a8qbnYrzTu7hZONq3lfWPDUvw9WfpFgy7PnTNPOW0fKYI6o4KIcG0FPHruA4a22wdPLA5ZRfMqztAPboRdcp5bdv5nKmtKt6LiVsDggyXtFBO3wFe42LV6BhsLQQxC6qT7Cnk9AfRY+h7b+JiWECwwRfgdkc6o3s74qQTW0Xf5SN1bZnuqmho2c7k7qsIjc/bdD0MnP+SeVYf8tYDzYE+GD7dTkN0qzycSKGzdTZWjD6lFcUQRPXXMkTs5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5655.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(54906003)(66556008)(9686003)(66476007)(55016003)(66946007)(316002)(76116006)(83380400001)(38100700002)(64756008)(66446008)(110136005)(82960400001)(8676002)(8936002)(4326008)(4001150100001)(478600001)(122000001)(6506007)(7696005)(53546011)(52536014)(86362001)(5660300002)(71200400001)(38070700009)(2906002)(26005)(66574015)(33656002)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dytuL2ttNkR5anBBZDJ2WkMrS2tPQzJXM3FYSGZQeUVoTDZrUzlPUzQ4SklD?=
 =?utf-8?B?b21tNUFQa2FxYUwrYW5hRGM3eTFyQTZsbjEwbDVPVXYwTjludi9TRS9OM1Jw?=
 =?utf-8?B?NTFCK3k0QzJpMnBZTXY4WHdMeTVUNUI3MlpnRWJCcmtlNk5BcVlUSWR3VWVM?=
 =?utf-8?B?cnJFTGhMVmxnQnpYcHBmZWkzclBnSVFTaTljWFU0UEVCL0w2cTMrcnA2K0RD?=
 =?utf-8?B?TGN2UnpDTjMzVzFRbWVSVmVtQTltcFVFVUFkWVJjS3RIenUvNHpISHRwZEcx?=
 =?utf-8?B?RVIzMXgveUlzbU95QW9TK1JOeEtkdDhPbnBuNjR2TGd3YnpRTElNR2N6d3Az?=
 =?utf-8?B?dFd4eE5QbkZPSVhwY0R4R0JwTWVRVTRjZG14aWxtenV6R0tjaTZrWVBCeDYw?=
 =?utf-8?B?N0lUODBBUGxpeHpXeHh5bzA5bEU0dERTMEJuZnlQNm9wWmR0aU8wd3cxcGlY?=
 =?utf-8?B?Q3hvR1VDTnZBbnJEaWZ1V1A4WDdsdG9XaCtPR3RnaG0wN29qNGpCOVRONm1J?=
 =?utf-8?B?UjRLVUIwSWx0SCtBTk1za3Vwei8wMnFvR2NZZzA1dk5YRkhKaDJ2eDI4elNR?=
 =?utf-8?B?RGx3UERuc21MWSsxa3hzM2xDd004OTJ1Z3Erd2NOcjFWdW5oZUtRdmZpdW8x?=
 =?utf-8?B?L3F5cVQrd3NCTklUNlptRFJDT09qbGo4SHN1WndmN3pnQ1ZhdlhwMThCdTZh?=
 =?utf-8?B?bWFLRjMrV2s5Z0sxNW5Eelh2VUFwblZsQzhucE96V1BkR1FpcTgzbUh6QXpQ?=
 =?utf-8?B?cWJXVGkrZG5PR0FVcVY1WUZUREo4dTdRcmNZM0NrNDFiZUN2ZDlidjVXTXBE?=
 =?utf-8?B?and5RDRkcExYYWhycFlJOEo2V1F0NXhiclFpb3cxck5PYnliM2NCZWtaL0wz?=
 =?utf-8?B?dVA0TWIxellwckhBUllscjU4YTNtaDdjamhjS0EvM2FXR2N4OFNoVGp0TE1t?=
 =?utf-8?B?d0djR2REVjYwdDN3SHhENGVLSVFIYzZnVUo0UmM3WWljbjBvUmk1MTBES2g1?=
 =?utf-8?B?SGRNVmZCenlTTVFCSDRFNzhjdy9nOGxhYnBzZWU5cXJ5bkUwekVCcVVCLzFy?=
 =?utf-8?B?cWVKSE9VWUVOQlhKRExORnU5SXNuczFsSUxGTnhsaG5BLy9waVI4U3lTVGdV?=
 =?utf-8?B?QjdYQ0U5eXU5L284cHcxbVYxUVhmWU5NMlFsWHg4N04zNDl4aHpSZWtsN0U4?=
 =?utf-8?B?N3hpRk9FNkRMYTg0T1ZtSU5lYW02WGZJbTJ4RTdMbUVVRjdWUmlhOU1aUlpG?=
 =?utf-8?B?bVlEQlR4bDEwTWgwWWFpaGtVUUw5dG5ITlVvRTliODczQm52eTVNd3k0eTVP?=
 =?utf-8?B?QnpDT1VJSjh0a2I5cVNGYWVKNnBJWlF4MnN5UFRZUFJPR0QvcDhxTnAwN2M1?=
 =?utf-8?B?RVhFZS9udzQ1T2JJcmxJSW1teEhUcGJTVFhWRkoxSWhiV29ZcnVtamVPRXpw?=
 =?utf-8?B?L2E2WTllOFJiQ2NNTVZqNURXZEhCZEZoZ2NhNHVvYXkxQ2hGbzByT0VmcUtO?=
 =?utf-8?B?L0xqZWdqdlova0R5OFduaXR1eDdQZTlZNU5kbklLWmM3dUxpN056N1lkUUxp?=
 =?utf-8?B?RWIvRk5iRWFWdER3NjREL0NVQnBEcy9nazVteGRmNmY5ZERoV0xRQTJCQkd0?=
 =?utf-8?B?UzlDTENWSTJYWWtYUlY0WmRMQnBmVElDcnVKdVpla0JDY1lRUk16cWpQdlBZ?=
 =?utf-8?B?Q0d4YjYvSjljTjZNZTFXckEwa3BSaUgvd1duc0NFM2MrZUVkWnU4ZWprNTkx?=
 =?utf-8?B?K3B3dGtKcmdaY3RKMWwxUWMwUnJmYWtiLy9uRk9FTmFZZGNTaEdzUUV5Q1Er?=
 =?utf-8?B?bGNORDVJeU4zanY3WWFIRm9OVW50Z3dHc095NmVNNzJsWkZhbzBCMTNwb3Aw?=
 =?utf-8?B?QU5YZGN3eGdhRkt1cHUvK1BmZjBTdjNHVE4ySmgzVzQyL1l6QmxHWHpyc3Vs?=
 =?utf-8?B?WHhJY1VhV3VkUDhQN01jVkhMY20yMjVqeVY3RnVjbDRJa2MzdFNrSC9udHdj?=
 =?utf-8?B?bjI5eWo1LytaY2JCTURtY0V3ZGFLbGRkTEZqSDFCQXNOR2szYUZvNHZmNnpm?=
 =?utf-8?B?OW5FMk55Z1FtNFlmNWdEWStzYVlBTFhZbTBWdWVuWG5TaDVWRlNIREVMTGVq?=
 =?utf-8?Q?Hlv/qjkvyAfDhiwEGIB8LMaOb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ef376cef-bccd-4afe-a049-08dbe5160004
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2023 13:31:25.5260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 AtOufjCCsSQhUhE6WfsggewI3wdIP9065iKDuhx04MhjKQC9TXCCy344Fh8TgcKrQtz2pCGL34OGEIu91r6waw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5603
X-OriginatorOrg: intel.com
X-MailFrom: jani.saarinen@intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FLOJNXVYDNLGKKLHF7SJWBUHKUVW3KGH
X-Message-ID-Hash: FLOJNXVYDNLGKKLHF7SJWBUHKUVW3KGH
X-Mailman-Approved-At: Tue, 14 Nov 2023 16:05:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FLOJNXVYDNLGKKLHF7SJWBUHKUVW3KGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

SGksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5
LCBOb3ZlbWJlciAxNCwgMjAyMyAzOjMwIFBNDQo+IFRvOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAbGludXguaW50ZWwuY29tPjsgVmlsbGUgU3lyasOkbMOkDQo+IDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4NCj4gQ2M6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT47IGludGVs
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLQ0KPiB4ZUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IGFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZzsgU2FhcmluZW4sIEphbmkNCj4gPGph
bmkuc2FhcmluZW5AaW50ZWwuY29tPjsgS3VybWksIFN1cmVzaCBLdW1hcg0KPiA8c3VyZXNoLmt1
bWFyLmt1cm1pQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtJbnRlbC14ZV0gW1BBVENIIDEx
LzE0XSBBTFNBOiBoZGEvaW50ZWw6IE1vdmUgc25kX2hkYWNfaTkxNV9pbml0DQo+IHRvIGJlZm9y
ZSBwcm9iZV93b3JrLg0KPiANCj4gSGV5LA0KPiANCj4gRGVuIDIwMjMtMTEtMTQga2wuIDEzOjM1
LCBza3JldiBKYW5pIE5pa3VsYToNCj4gPiBPbiBUdWUsIDE0IE5vdiAyMDIzLCBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4gPj4gT24gTW9u
LCBPY3QgMDIsIDIwMjMgYXQgMDk6Mzg6NDRQTSArMDIwMCwNCj4gbWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tIHdyb3RlOg0KPiA+Pj4gRnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1h
YXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gPj4+DQo+ID4+PiBOb3cgdGhhdCB3
ZSBjYW4gdXNlIC1FUFJPQkVfREVGRVIsIGl0J3Mgbm8gbG9uZ2VyIHJlcXVpcmVkIHRvIHNwaW4N
Cj4gPj4+IG9mZiB0aGUgc25kX2hkYWNfaTkxNV9pbml0IGludG8gYSB3b3JrcXVldWUuDQo+ID4+
Pg0KPiA+Pj4gVXNlIHRoZSAtRVBST0JFX0RFRkVSIG1lY2hhbmlzbSBpbnN0ZWFkLCB3aGljaCBt
dXN0IGJlIHJldHVybmVkIGluDQo+ID4+PiB0aGUgcHJvYmUgZnVuY3Rpb24uDQo+ID4+IFRoaXMg
Y29tcGxldGVseSBicm9rZSBpOTE1IGF1ZGlvIQ0KPiA+Pg0KPiA+PiBJIGFsc28gY2FuJ3Qgc2Vl
IGFueSB0cmFjZSBvZiB0aGlzIHN0dWZmIGV2ZXIgYmVpbmcgcG9zdGVkIHRvDQo+ID4+IGludGVs
LWdmeCBzbyBpdCBuZXZlciB3ZW50IHRocm91Z2ggdGhlIENJLg0KPiA+Pg0KPiA+PiBQbGVhc2Ug
Zml4IG9yIHJldmVydCBBU0FQLg0KPiA+IENjOiBKYW5pLCBTdXJlc2gNCj4gPg0KPiA+IFZpbGxl
LCBwbGVhc2UgZmlsZSBhIGJ1ZyBhdCBnaXRsYWIgc28gd2UgY2FuIHRyYWNrIHRoaXMsIHRoYW5r
cy4NCj4gDQo+IEkndmUgb3JpZ2luYWxseSB0ZXN0ZWQgdGhpcyBvbiBUR0wgYW5kIERHMiwgc28g
Y2FuIHlvdSBiZSBtb3JlIHNwZWNpZmljIG9uIHdoYXQNCj4gYnJva2U/DQpXYXMgdGhpcyBzZXJp
ZXMgdGVzdGVkIG9uIENJICBldmVyIGFzIFZpbGxlIHNheWluZyBubz8gSG93IHRoaXMgZ290IG1l
cmdlZD8gDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IH5NYWFydGVuDQo+IA0KPiA+Pj4gU2lnbmVk
LW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVs
LmNvbT4NCj4gPj4+IFJldmlld2VkLWJ5OiBLYWkgVmVobWFuZW4gPGthaS52ZWhtYW5lbkBsaW51
eC5pbnRlbC5jb20+DQo+ID4+PiBSZXZpZXdlZC1ieTogUGllcnJlLUxvdWlzIEJvc3NhcnQNCj4g
Pj4+IDxwaWVycmUtbG91aXMuYm9zc2FydEBsaW51eC5pbnRlbC5jb20+DQo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4NCj4gPj4+IC0tLQ0K
PiA+Pj4gICBzb3VuZC9wY2kvaGRhL2hkYV9pbnRlbC5jIHwgNTQgKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRp
b25zKCspLCAyNyBkZWxldGlvbnMoLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvc291bmQv
cGNpL2hkYS9oZGFfaW50ZWwuYyBiL3NvdW5kL3BjaS9oZGEvaGRhX2ludGVsLmMNCj4gPj4+IGlu
ZGV4IGU0MmFkMGU4MTZlMS4uOWRhZDM2MDc1OTZhIDEwMDY0NA0KPiA+Pj4gLS0tIGEvc291bmQv
cGNpL2hkYS9oZGFfaW50ZWwuYw0KPiA+Pj4gKysrIGIvc291bmQvcGNpL2hkYS9oZGFfaW50ZWwu
Yw0KPiA+Pj4gQEAgLTIxMzUsNiArMjEzNSwzMyBAQCBzdGF0aWMgaW50IGF6eF9wcm9iZShzdHJ1
Y3QgcGNpX2RldiAqcGNpLA0KPiA+Pj4NCj4gPj4+ICAgCXBjaV9zZXRfZHJ2ZGF0YShwY2ksIGNh
cmQpOw0KPiA+Pj4NCj4gPj4+ICsjaWZkZWYgQ09ORklHX1NORF9IREFfSTkxNQ0KPiA+Pj4gKwkv
KiBiaW5kIHdpdGggaTkxNSBpZiBuZWVkZWQgKi8NCj4gPj4+ICsJaWYgKGNoaXAtPmRyaXZlcl9j
YXBzICYgQVpYX0RDQVBTX0k5MTVfQ09NUE9ORU5UKSB7DQo+ID4+PiArCQllcnIgPSBzbmRfaGRh
Y19pOTE1X2luaXQoYXp4X2J1cyhjaGlwKSwgZmFsc2UpOw0KPiA+Pj4gKwkJaWYgKGVyciA8IDAp
IHsNCj4gPj4+ICsJCQkvKiBpZiB0aGUgY29udHJvbGxlciBpcyBib3VuZCBvbmx5IHdpdGggSERN
SS9EUA0KPiA+Pj4gKwkJCSAqIChmb3IgSFNXIGFuZCBCRFcpLCB3ZSBuZWVkIHRvIGFib3J0IHRo
ZSBwcm9iZTsNCj4gPj4+ICsJCQkgKiBmb3Igb3RoZXIgY2hpcHMsIHN0aWxsIGNvbnRpbnVlIHBy
b2JpbmcgYXMgb3RoZXINCj4gPj4+ICsJCQkgKiBjb2RlY3MgY2FuIGJlIG9uIHRoZSBzYW1lIGxp
bmsuDQo+ID4+PiArCQkJICovDQo+ID4+PiArCQkJaWYgKEhEQV9DT05UUk9MTEVSX0lOX0dQVShw
Y2kpKSB7DQo+ID4+PiArCQkJCWdvdG8gb3V0X2ZyZWU7DQo+ID4+PiArCQkJfSBlbHNlIHsNCj4g
Pj4+ICsJCQkJLyogZG9uJ3QgYm90aGVyIGFueSBsb25nZXIgKi8NCj4gPj4+ICsJCQkJY2hpcC0+
ZHJpdmVyX2NhcHMgJj0NCj4gfkFaWF9EQ0FQU19JOTE1X0NPTVBPTkVOVDsNCj4gPj4+ICsJCQl9
DQo+ID4+PiArCQl9DQo+ID4+PiArDQo+ID4+PiArCQkvKiBIU1cvQkRXIGNvbnRyb2xsZXJzIG5l
ZWQgdGhpcyBwb3dlciAqLw0KPiA+Pj4gKwkJaWYgKEhEQV9DT05UUk9MTEVSX0lOX0dQVShwY2kp
KQ0KPiA+Pj4gKwkJCWhkYS0+bmVlZF9pOTE1X3Bvd2VyID0gdHJ1ZTsNCj4gPj4+ICsJfQ0KPiA+
Pj4gKyNlbHNlDQo+ID4+PiArCWlmIChIREFfQ09OVFJPTExFUl9JTl9HUFUocGNpKSkNCj4gPj4+
ICsJCWRldl9lcnIoY2FyZC0+ZGV2LCAiSGFzd2VsbC9Ccm9hZHdlbGwgSERNSS9EUCBtdXN0IGJ1
aWxkIGluDQo+ID4+PiArQ09ORklHX1NORF9IREFfSTkxNVxuIik7ICNlbmRpZg0KPiA+Pj4gKw0K
PiA+Pj4gICAJZXJyID0gcmVnaXN0ZXJfdmdhX3N3aXRjaGVyb28oY2hpcCk7DQo+ID4+PiAgIAlp
ZiAoZXJyIDwgMCkgew0KPiA+Pj4gICAJCWRldl9lcnIoY2FyZC0+ZGV2LCAiRXJyb3IgcmVnaXN0
ZXJpbmcgdmdhX3N3aXRjaGVyb28gY2xpZW50XG4iKTsNCj4gPj4+IEBAIC0yMTYyLDExICsyMTg5
LDYgQEAgc3RhdGljIGludCBhenhfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBjaSwNCj4gPj4+ICAg
CX0NCj4gPj4+ICAgI2VuZGlmIC8qIENPTkZJR19TTkRfSERBX1BBVENIX0xPQURFUiAqLw0KPiA+
Pj4NCj4gPj4+IC0jaWZuZGVmIENPTkZJR19TTkRfSERBX0k5MTUNCj4gPj4+IC0JaWYgKEhEQV9D
T05UUk9MTEVSX0lOX0dQVShwY2kpKQ0KPiA+Pj4gLQkJZGV2X2VycihjYXJkLT5kZXYsICJIYXN3
ZWxsL0Jyb2Fkd2VsbCBIRE1JL0RQIG11c3QgYnVpbGQgaW4NCj4gQ09ORklHX1NORF9IREFfSTkx
NVxuIik7DQo+ID4+PiAtI2VuZGlmDQo+ID4+PiAtDQo+ID4+PiAgIAlpZiAoc2NoZWR1bGVfcHJv
YmUpDQo+ID4+PiAgIAkJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZoZGEtPnByb2JlX3dvcmssIDAp
Ow0KPiA+Pj4NCj4gPj4+IEBAIC0yMjY0LDI4ICsyMjg2LDYgQEAgc3RhdGljIGludCBhenhfcHJv
YmVfY29udGludWUoc3RydWN0IGF6eCAqY2hpcCkNCj4gPj4+ICAgCXRvX2hkYV9idXMoYnVzKS0+
YnVzX3Byb2JpbmcgPSAxOw0KPiA+Pj4gICAJaGRhLT5wcm9iZV9jb250aW51ZWQgPSAxOw0KPiA+
Pj4NCj4gPj4+IC0JLyogYmluZCB3aXRoIGk5MTUgaWYgbmVlZGVkICovDQo+ID4+PiAtCWlmIChj
aGlwLT5kcml2ZXJfY2FwcyAmIEFaWF9EQ0FQU19JOTE1X0NPTVBPTkVOVCkgew0KPiA+Pj4gLQkJ
ZXJyID0gc25kX2hkYWNfaTkxNV9pbml0KGJ1cywgdHJ1ZSk7DQo+ID4+PiAtCQlpZiAoZXJyIDwg
MCkgew0KPiA+Pj4gLQkJCS8qIGlmIHRoZSBjb250cm9sbGVyIGlzIGJvdW5kIG9ubHkgd2l0aCBI
RE1JL0RQDQo+ID4+PiAtCQkJICogKGZvciBIU1cgYW5kIEJEVyksIHdlIG5lZWQgdG8gYWJvcnQg
dGhlIHByb2JlOw0KPiA+Pj4gLQkJCSAqIGZvciBvdGhlciBjaGlwcywgc3RpbGwgY29udGludWUg
cHJvYmluZyBhcyBvdGhlcg0KPiA+Pj4gLQkJCSAqIGNvZGVjcyBjYW4gYmUgb24gdGhlIHNhbWUg
bGluay4NCj4gPj4+IC0JCQkgKi8NCj4gPj4+IC0JCQlpZiAoSERBX0NPTlRST0xMRVJfSU5fR1BV
KHBjaSkpIHsNCj4gPj4+IC0JCQkJZ290byBvdXRfZnJlZTsNCj4gPj4+IC0JCQl9IGVsc2Ugew0K
PiA+Pj4gLQkJCQkvKiBkb24ndCBib3RoZXIgYW55IGxvbmdlciAqLw0KPiA+Pj4gLQkJCQljaGlw
LT5kcml2ZXJfY2FwcyAmPQ0KPiB+QVpYX0RDQVBTX0k5MTVfQ09NUE9ORU5UOw0KPiA+Pj4gLQkJ
CX0NCj4gPj4+IC0JCX0NCj4gPj4+IC0NCj4gPj4+IC0JCS8qIEhTVy9CRFcgY29udHJvbGxlcnMg
bmVlZCB0aGlzIHBvd2VyICovDQo+ID4+PiAtCQlpZiAoSERBX0NPTlRST0xMRVJfSU5fR1BVKHBj
aSkpDQo+ID4+PiAtCQkJaGRhLT5uZWVkX2k5MTVfcG93ZXIgPSB0cnVlOw0KPiA+Pj4gLQl9DQo+
ID4+PiAtDQo+ID4+PiAgIAkvKiBSZXF1ZXN0IGRpc3BsYXkgcG93ZXIgd2VsbCBmb3IgdGhlIEhE
QSBjb250cm9sbGVyIG9yIGNvZGVjLiBGb3INCj4gPj4+ICAgCSAqIEhhc3dlbGwvQnJvYWR3ZWxs
LCBib3RoIHRoZSBkaXNwbGF5IEhEQSBjb250cm9sbGVyIGFuZCBjb2RlYyBuZWVkDQo+ID4+PiAg
IAkgKiB0aGlzIHBvd2VyLiBGb3Igb3RoZXIgcGxhdGZvcm1zLCBsaWtlIEJheXRyYWlsL0JyYXN3
ZWxsLCBvbmx5DQo+ID4+PiB0aGUNCj4gPj4+IC0tDQo+ID4+PiAyLjQwLjENCg==
