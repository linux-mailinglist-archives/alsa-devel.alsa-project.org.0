Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5D84242B7
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:32:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8E82846;
	Wed,  6 Oct 2021 18:31:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8E82846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633537960;
	bh=bEcO8O0N1DpzrV02x+GrOkvDv5x/OEmW3LmwPjUHRMI=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C7MAzz5r/9kLrijKnRRwp4rq2qn+lXhvuG0OxQ9NB7yY2sM1pMNKzBtBvv/xK0hmi
	 U1t30SXjL7vcrwTlFjKm4zMEeesYwKUgekZaZCJo26lQUDsYAkIFxO4BwFj6Fow1jH
	 gqRGTDB90ts9tmpVNJuSjoEvZpoqMLMcLlP04LE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BE2CF80229;
	Wed,  6 Oct 2021 18:31:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53473F80240; Wed,  6 Oct 2021 18:31:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58815F800FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58815F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="x30MlczL"
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="225929773"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="225929773"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:31:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="439955710"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 06 Oct 2021 09:31:13 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 6 Oct 2021 09:31:12 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 6 Oct 2021 09:31:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 6 Oct 2021 09:31:12 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 6 Oct 2021 09:31:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cn4qBDC1TUg0zDQenEoEUIirVfyOdyoEMM9Fb2fil+H8QOEXwvXGcwjF4Q8swl5IPWraDdTvDp38MEhPjfiV176oMFoNLMVEpc/Hh+nDhBqTbex+AUxWtcJ+wI2eUhWsceUilWCCX3HrMCJTUkBR1hndmep+TdrXiJVFRNzGcdzIyZar/B5k5xiC3nox4pPvFKgt4fXrviGCc8DW3NXi/G7NdhbrVagqMf/6rt42VvndcNdcdiKBJ+fBqI9924kOUayrAudAJKssfeSJ+NUY4TlP+98TEkjrvbA1QRfpduoa6tlbD66GJ70o8eAaJ9VR7kwn0ZR+/WK039/ZCk1trw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEcO8O0N1DpzrV02x+GrOkvDv5x/OEmW3LmwPjUHRMI=;
 b=V7UBZhfnUwKOt3s8nMR0p5Ju05WqqTiBAl/jL2czb3w+c8qLAyA/oK05/H76kJi+Pq5kPfd+R6K6TiZSCQjDdZOjGBmVIlkGMSzsIF6U8cBuZ6VhscllzgyDWgCOSt9nbhFFBzDtampYGYE+2fo77G9RoaCEwxDyOvemjdnsbKXwLeJMHoHVcDQC7o76rKQkME5LbF7MzWY8Qqr0YC1gohQ1UBPmDXj07Dq3BPyIswwvub+lIkbRuUAZ3CQf3xWS1DUiRdITN5I/XC0YIGmZoXcaVUFbzh5xp3/iRuPKIie3zWJykUborl/KOoCWi2mKw/iZ9L4lNIp6v05cOrhYcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEcO8O0N1DpzrV02x+GrOkvDv5x/OEmW3LmwPjUHRMI=;
 b=x30MlczL0SBRv2v7EFeROuBxy42wfbTQeQaGsRO3cFGSvx61ysG+pES4yb+sgplhX7gxOa4rYFU+IqT7hDZSrIil+lXzCc9TKi66/8O6X5/S3CGuOaoGUDA/SPNXLGIdc/tbxx0HuY7yhIECdQf9ipXyFiXCBJ2rrRxsMcEyhEM=
Received: from MWHPR11MB1919.namprd11.prod.outlook.com (2603:10b6:300:106::22)
 by CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 6 Oct
 2021 16:31:08 +0000
Received: from MWHPR11MB1919.namprd11.prod.outlook.com
 ([fe80::698e:991:9d18:3727]) by MWHPR11MB1919.namprd11.prod.outlook.com
 ([fe80::698e:991:9d18:3727%6]) with mapi id 15.20.4566.023; Wed, 6 Oct 2021
 16:31:08 +0000
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: soc-acpi: add alternative id field for machine
 driver matching
Thread-Topic: [PATCH] ASoC: soc-acpi: add alternative id field for machine
 driver matching
Thread-Index: AQHXuo6Jsfv23mpewUGsKfzrp7JMtqvF4zoAgABD6nA=
Date: Wed, 6 Oct 2021 16:31:08 +0000
Message-ID: <MWHPR11MB19193D5CA0A58CF4E73DB46C97B09@MWHPR11MB1919.namprd11.prod.outlook.com>
References: <20211006084351.438510-1-brent.lu@intel.com>
 <da650858-6523-4813-6433-438e974d060a@linux.intel.com>
In-Reply-To: <da650858-6523-4813-6433-438e974d060a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cb23f96-adcf-401e-edbf-08d988e6b3bb
x-ms-traffictypediagnostic: CO1PR11MB5026:
x-microsoft-antispam-prvs: <CO1PR11MB50264F6F9B162976B80819B497B09@CO1PR11MB5026.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9fF9oOogvUxbTR3xPEfrbEd9mECvpWFyOY4QREHFMPDs9LSvwXN6ROKWVpqz7zv0ilKZlK5pyI//+/EUiq4jXy3XD3PzhMLqBNlfhr9nTOHuFev/V4tfFIrauOaDLWpR/2sFD+4n9fO9mAAyXGqKW1fw39B+UiBZK6U60I30HUn2COIMPqoN0kqK+h1IkafzLpdoYwSw3/CM7E8Nh4BvKwF6g3ljw/RHR3SN8l5/80vQvuOyDWOwYRXkroFLAR+GNcE25/RJx2km7v65dl/DLgXjiiP+l0VsTnFfkiCJiei0N7gQav7oO4pOt0qbmN49kmTy43foAMe71S/zsbI62iNfiMXpxNhqGpHwWGVca4s2204oqbB/OW0220e5f6ksi0eOOJ9OMPGJL1e2FsdAxSmD3DNUqh7ycaKohu7hFNJOeN75pRMqyRW0ViMpLMZZkY6jNPeEBtqs66nRd3c7pz23vbUcc4qE5XHMMZfq8D2fKVf+Z9xy2I0D96kCZ9x81KI55YJqgss1fwBlnDSi88tsGwr/3Ki3CPn7y/pfrBl8uMK5NQdeA2qpN/z/3L9W/mXHVooShjq7nE6izT+UUxW02IxERudYRNV7+If5czBgUSGE+eTVGSVciNekByBZZ+YTCt6t3YWLNp5CQfc52P42jsiYAKB8YhGkWqG/0gsOBWADHiMyLujABoqB8L6KsgO2jdDXVJpKWgJzQO/OEXnsqh8HlQ2+ymstF2yoJs0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1919.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9686003)(76116006)(66446008)(55016002)(64756008)(5660300002)(71200400001)(66556008)(66476007)(6506007)(66946007)(26005)(186003)(54906003)(316002)(7696005)(86362001)(52536014)(33656002)(110136005)(38070700005)(8936002)(38100700002)(122000001)(4326008)(8676002)(508600001)(2906002)(11716005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVJVOGtxY05VWTAwY09qV29VZGhJS1lWcFlsaXU4L0FiM1lDeEpSWnd6UTNw?=
 =?utf-8?B?eTJBL2ZVa3VhUGpYRGd4RWZmK1FSMmlUazNGUmFOYkdQMUtoSnBqOENDZzB4?=
 =?utf-8?B?Wk4xMGVBNXFKRGl4bmtqNDlGeEwyVnpWUXlScGp1Qkg3SUo0SGZ6Mkk5Sm5Y?=
 =?utf-8?B?YnZ2WFJVK29XRW85dzMyaktZREdGOXE3dzJZQ1pKWkVFUUI2NDRTZTB4dUF1?=
 =?utf-8?B?R25yeHdoK0FPWEtVWHBrS0dZZHRnUnV5MVRTVDJISnZERzNSdU5zcEdpbExs?=
 =?utf-8?B?RWFlREltREUyY245OWFkUFkxejZSRGN3MzJpMStRdlVIV3NwanJXdjd5QzNq?=
 =?utf-8?B?U0hybUJNYW9WVUtrUXFOTk5xcGRjU1A5SGhtbE04VjFNSE5UeVRGekpHaHoz?=
 =?utf-8?B?NWVpOGE5bCtETDdDdXlrMnZnbE1qaVRaSWtJeklvQlB2SnBIcEsyU1I4YU40?=
 =?utf-8?B?OTlCelZCWUZ4a1NUZ1dBYTlyckN5a3prTGFqN1JLYWN1dmhNRW9UZkxiSGkw?=
 =?utf-8?B?RkNYNGIxakpRWDRiU240ckNwVmV3Z3R3bjlaTzZwZ0ZiL3JmNTdydldzUUV5?=
 =?utf-8?B?WjlPUWhDTkNpYk9OMi9rdHNCU09laDlxTVluSEZCRjVnZTIzQ2p0SEhmUUYv?=
 =?utf-8?B?ckRPSFZlWFBHdURPU0YvRnVybm1RbFRWT3dqSjZQeFZ4YzY0Q1pWd0lBbExX?=
 =?utf-8?B?L3pMYzNIUDFsR0RMTlhxVUNTenNFa1A5OE9QdVBCaStTTURKdm9PZjFLZ0d4?=
 =?utf-8?B?Mk5tRzVBVHArd3RmRkc4amJ4WE9MdXBWZnBMWUNwdGhvM0JRTmFSSElTUGY3?=
 =?utf-8?B?aXFRTDhwbXJNdVlIbk9OdERudS9UTE5uNDhRS1lneVhJdkZPNkp2MytRVVZH?=
 =?utf-8?B?QkN6eFk5RWlkQ0sreXR6RDNFNVBRbUd4WGlZY3dXYjRRMDJvSHFDVnNTOVdm?=
 =?utf-8?B?ZjVxWGJpNE9NVjZLOHVFQUxsT3pmaWk4cjlHalBLQ3I3QkFGdnBvRDhESG8r?=
 =?utf-8?B?dUtUR3F5ZnMvR1FiN3FxR2pLQlNiMlNPYlplTmRrQlhheEFsOTJ5RVVEZStI?=
 =?utf-8?B?Z3Z3bHZRNlJsUUVPaTJxUG9GZGxBM1hTWFhCME95cGVjN2ZKK01vTnhIOTFz?=
 =?utf-8?B?MVMvV0NiNmRTSjlSQ1Zham1oOWpnU1hSeWIreVducTRuT0Z5TGRhVGlZeDZt?=
 =?utf-8?B?MjRibFlQenBza1oraWwzczF3b0dPTDNMdGxGVjVJYWl4T2VlS0xDZXVkUDhY?=
 =?utf-8?B?TlhKVno4T2t6RVZQK3VNRmxYNjhaaTdzZUN0dnk3TjFYRzVCaFpNaWg0NklB?=
 =?utf-8?B?YTVpdlVkek83emNwVzJacjc4aUE4ZDdoeEpsUUFibkpVeS8yM09Qa3lqU0RF?=
 =?utf-8?B?L0YweE1CdFR4MlAyWXVJOVAyUG5rTHZSOTM3Qjlsa2w0aVRaN2J1VGNmWHRJ?=
 =?utf-8?B?SzdMUlUyQnBTSGFRVG92NHI0SGttQ3ovcFBIT2NyNFhyblpEMy9pVjdsY29h?=
 =?utf-8?B?Y2xsL3p0VG9SL25QeE13aG1LeHMrRjl3Ky9DQ0o4Vko1Lzh5MFUrbUQ5eTMz?=
 =?utf-8?B?Q3I3bWNLem9KUU44V1RlQWlRVHBnYmkyV1l2Um9mdDc2Q0tnOTFOK0d5U0h0?=
 =?utf-8?B?cFRnaHFsM1VvdE1hdmNiU3k1QlkwU1g2THlCcVlLUjl3WmpqR01VN3JkeFd0?=
 =?utf-8?B?SzZWMmtsVkhGd0dvNEtJL2t5NGtZRnlMZWxDV3htUGRtRmJ4c3I0UFNNM0tp?=
 =?utf-8?Q?e8x9OiAJ8nODtfxGl4=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb23f96-adcf-401e-edbf-08d988e6b3bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2021 16:31:08.8179 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFoom/c/V/ezbWH8wWiIObgg5gStA4AH6fRlDjiEux/fveBMLHs7O3cdZ3RkyQ/Yq2X/diDVz0qAGzHyqu5/0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5026
X-OriginatorOrg: intel.com
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

PiANCj4gSSBhbSBub3QgZm9sbG93aW5nIHlvdXIgc3VnZ2VzdGlvbi4gVGhlIG1hY2hpbmUgZHJp
dmVycyBmb3IgSTJTL1RETSBwbGF0Zm9ybXMNCj4gYXJlIHR5cGljYWxseSBiYXNlZCBvbiBzcGVj
aWZpYyBoZWFkcGhvbmUgY29kZWNzLCBhbmQgdGhleSB3ZSBhZGQgcG9zc2libGUNCj4gc3dhcHMg
Zm9yIGFtcGxpZmllcnMuIFRoZSBrZXkgdG8gZmluZCBhIG1hY2hpbmUgaXMgdHlwaWNhbGx5IHRo
ZSBoZWFkcGhvbmUgSElELg0KPiBFeGhpYml0IEEgZm9yIHRoaXMgaW4geW91ciBvd24gY29udHJp
YnV0aW9uIGluIHRoZSByZWNlbnQgd2Vla3Mgd2l0aCB0aGUNCj4gc29mX2NzNDJsNDIuYyBtYWNo
aW5lIGRyaXZlci4NCj4gDQo+IEFyZSB5b3Ugc3VnZ2VzdGluZyB3ZSB1bmlmeSBlLmcuIHNvZl9y
dDU2ODIuYyBhbmQgc29mX2NzNDJsNDIuYz8NCj4gDQo+IFRoZSBvdGhlciBwcm9ibGVtIGlzIHRo
YXQgdG9kYXkgd2UgaGF2ZSBvbmUgbWFpbiBISUQgYWxvbmcgd2l0aCAncXVpcmtfZGF0YScNCj4g
Zm9yIGFtcGxpZmllcnMuIElmIHdlIGhhdmUgYWx0ZXJuYXRlIEhJRHMsIHdoYXQgd291bGQgYmUg
dGhlIHJ1bGUgZm9yIHF1aXJrX2RhdGE/DQo+IENhbiB0aGUgcXVpcmtzIGFwcGx5IHRvIGFsbCBw
b3NzaWJsZSBhbHRlcm5hdGUgSElEcz8gT25seSBvbmUgb2YgdGhlbT8NCj4gDQo+IFdpdGhvdXQg
YW4gZXhhbXBsZSB3aGVyZSB0aGlzIG5ldyBhbHRlcm5hdGUgSUQgaXMgdXNlZCBpdCdzIGhhcmQg
dG8gc2VlIHdoYXQgdGhlDQo+IGFzayBhbmQgZGlyZWN0aW9ucyBtaWdodCBiZS4NCj4gDQoNCkkn
dmUgc2VudCB0aGUgcGF0Y2ggYWdhaW4gd2l0aCB0d28gZm9sbG93LXVwIHBhdGNoZXMgZm9yIHRo
ZSBjaGFuZ2VzIHRvIG1hY2hpbmUgZHJpdmVyDQphbmQgdGhlIGVudW1lcmF0aW9uLiBDdXJyZW50
bHkgdGhlIHNvZi1ydDU2ODIuYyBzdXBwb3J0cyB0d28gaGVhZHBob25lIGNvZGVjIGRyaXZlcnMs
DQpydDU2ODIgYW5kIHJ0NTY4MnMsIGVudW1lcmF0ZWQgYnkgZGlmZmVyZW50IEhJRC4gU28gd2Ug
bmVlZCB0byBkdXBsaWNhdGUgYWxsIHRoZSBlbnRyaWVzDQppbiBlbnVtZXJhdGlvbiB0YWJsZXMg
YW5kIGJvYXJkIGNvbmZpZ3MgaW4gbWFjaGluZSBkcml2ZXIgdG8gc3VwcG9ydCBydDU2ODJzLiBC
eSBhZGRpbmcNCmFuIGV4dHJhIGZpZWxkIGlkX2FsdCB0byB0aGUgZW51bWVyYXRpb24gdGFibGUs
IHdlIGp1c3QgbmVlZCB0byBtb2RpZnkgZXhpc3RpbmcgZW50cmllcw0KaW5zdGVhZCBvZiBjcmVh
dGluZyBuZXcgb25lcy4NCg0KRm9yIGFtcGxpZmllciwgSSB0aGluayB3ZSBjYW4gaW1wbGVtZW50
IGFuIG5ldyBtYWNoaW5lX3F1aXJrIGZ1bmN0aW9uIHRvIHN1cHBvcnQgbXVsdGlwbGUNCmFtcGxp
ZmllciBISUQuDQoNCg==
