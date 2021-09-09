Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F26405A59
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 17:45:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60CD716AF;
	Thu,  9 Sep 2021 17:44:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60CD716AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631202314;
	bh=hMxkwKuhIYDJJEmQ7gD6Q6Ii/gYbmY4S0IMGXK2g78k=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I8EmIBqmS/V9Kg3cc6gFaf2NThJMFZx3V0rIYglVL+wbLKGMGTXhZkhloE4/Dl4oi
	 5X65ffKBOMGa8dgtAMcgV2xF1sMl3JQjJjK8fZ1eDoATIbZaXyAELKfofNBsT7ixRL
	 6Bux7Wsu4LyhzXM2p52LXGnxO/m2bXtWnzuzntMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA68BF800C7;
	Thu,  9 Sep 2021 17:43:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1722BF80224; Thu,  9 Sep 2021 17:43:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A68FF800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 17:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A68FF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="yYgATV2k"
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="207932780"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="207932780"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 08:43:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; d="scan'208";a="539680732"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by FMSMGA003.fm.intel.com with ESMTP; 09 Sep 2021 08:43:48 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 08:43:47 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 08:43:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 08:43:47 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 9 Sep 2021 08:43:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/tdIoqiv9SG2+509pNGx/9JUBygYpTq3piyMQsSmFajJUWtBjb/qvtcTPnsO4EGFXJWFygLxXBQ29OTEgOHJNpod0o5M/s7MgG0UhzeCyJj5r0NAeIpllBCj2zs/ufHtj7OGvsGg8YW1iIaheNJet3udH+rVBTO3bNiLM0mM5izsMuIBmGiYchgv4DkbrQz6wxEG2BOZJAorzlyLw7O7I2yumcm+58a8wPttVSOe1BykaiifFt3bJH1IwOv/eM5GZmu/ZVu+twIeAHfBF/9EUOgJHgmeaFvMwxdi7dqcpa1dCpupvmQ3OCONllsQJkSvtsZFASPy33f8SxSSJkl4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=hMxkwKuhIYDJJEmQ7gD6Q6Ii/gYbmY4S0IMGXK2g78k=;
 b=DwcoKW0tdXV+D/j1fZYanRkY/u1Xf4/nK0WteoebFaro62RkAB6zdSDXfqElgrbawic2uYrKwV+sR7Uyh914GuQQac5De8jOaZfF2mS7eOroMl5jmm71OmlgxCQtwTvGqUdIJcancfFKBmeNkRgrLroieA5ouu1nwGCfUwArqD6oGAlIj/lI3sYMGk2MugUBPv8W6BgsOKYEYBbzJsimDwe7QX0bdTvlCXZ/gMTciswPklGvk3HgTHCGTo5htcv1NsS3i6qn7NdZCpjGI+rq5p+4095PFV7voM+g1OcQUBZ7Rh5pSVb2YZ0ceGJvL/47XDA27HUm8y3G135stf3VFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMxkwKuhIYDJJEmQ7gD6Q6Ii/gYbmY4S0IMGXK2g78k=;
 b=yYgATV2kOL+BRCJRlZgkyaynPAJ2mF8xhRUJd6c4phAAhVWKzrE02/WKagV7hm+MSq8o5ageXMQc/2dVJSMlzoL1wq1D49XPAyQk6w/SX/xoYxxppqVpLmU5+5+e56qFkTeK6D4waOCUqdr0/JvSVdYyMMmrBfay2D0q4mse6jQ=
Received: from DM5PR1101MB2091.namprd11.prod.outlook.com (2603:10b6:4:57::20)
 by DM6PR11MB3273.namprd11.prod.outlook.com (2603:10b6:5:56::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Thu, 9 Sep
 2021 15:43:45 +0000
Received: from DM5PR1101MB2091.namprd11.prod.outlook.com
 ([fe80::797a:a2b0:bddb:d391]) by DM5PR1101MB2091.namprd11.prod.outlook.com
 ([fe80::797a:a2b0:bddb:d391%11]) with mapi id 15.20.4478.026; Thu, 9 Sep 2021
 15:43:45 +0000
From: "Chiang, Mac" <mac.chiang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: RE: [PATCH] ASoC: Intel: boards: add max98390 2/4 speakers support
Thread-Topic: [PATCH] ASoC: Intel: boards: add max98390 2/4 speakers support
Thread-Index: AQHXo8tqUOrszxSrMkSsFXchFUyRYKuYtYyAgAEWgqCAAHlEAIABhvEQ
Date: Thu, 9 Sep 2021 15:43:45 +0000
Message-ID: <DM5PR1101MB209174C2C06989622CAD683384D59@DM5PR1101MB2091.namprd11.prod.outlook.com>
References: <20210907093329.10742-1-mac.chiang@intel.com>
 <cef537cd-5568-83e9-e0a7-f6457250696f@linux.intel.com>
 <DM5PR1101MB2091C61F02F44088D526106084D49@DM5PR1101MB2091.namprd11.prod.outlook.com>
 <26efdc5f-9948-12d3-7eff-a0e8f8c2e4e0@linux.intel.com>
In-Reply-To: <26efdc5f-9948-12d3-7eff-a0e8f8c2e4e0@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39059f6f-76a6-4bef-6177-08d973a89c03
x-ms-traffictypediagnostic: DM6PR11MB3273:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB32736DD854DFCCEF6DD4A8D484D59@DM6PR11MB3273.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qJ7TDWH7u0rSR/ds/Mg+MugkFbcrszGF6dXa5oFIaNneTFQP6krJ77UHLTcpjfhVIwGLnlr83wqJN3x5AqlMT1oeUiNlPJ0oQSV/NQeX84t6WKHcAzBOsKO/YGoJmRDY3ClQqNDXFNU4S9G7zapbFQIZhpTKVgCBY5F15qifThe00LJ9hlKDG1zS7zpb6jzwCqZ4YWks/S/4sgU21wuxea3W2zaNqRTXx8ndxv8BeJLgktAkINGEEVagaKBKgJotjSw28s/Su8TxL2l57WPrhWMVUzwzaY6HmoA8Zae43h+KKbHqBuAr8n3GEQTR+Me9UcUloJTLDxv/8Z3nuS3DCzcAx5ts+E+8HuCA/XyEoygU1J0lI3+vg4crber1bVlglXMtl3U7QjfSKgTyh8EG1gUdSuAzq3t5I60rZ5V5NOU3fJyzXXfB/WL1xVUSNYqATjjchcx3mv7BPaq6xiQ9W2KtgZsFmI3SqgMxUVmEX7znPjHzIEUt/mLvCcanG/k+YRTayi1qyZCgCmbZh6vaEn4xTD/KDRP2GRWENspEhPS0ysokAxMrTjmTefxIQaacvWlSW8uS6g1EroDFWqCyDq3aO44y6If01SEGUHpLBrKdpGNlwkcKAJ6hc1hfE9bJmahPi0RUlWMqfmOaxPRQqrK6lW0jnXMmdcBuL2wupLuAzA5Rl3V/dO6i4iHL0w/jSdQeVos+1Eh3XzlpsX5oww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR1101MB2091.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(66946007)(86362001)(8936002)(38070700005)(5660300002)(316002)(4326008)(9686003)(55016002)(53546011)(6506007)(38100700002)(66446008)(7696005)(76116006)(54906003)(66476007)(478600001)(52536014)(33656002)(186003)(64756008)(71200400001)(2906002)(122000001)(26005)(66556008)(8676002)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWxQWTN3RnpUV1BHUERYaVBEcTlONVVSc3hXekdhbVlJNlg2YUVnWkhxQUxT?=
 =?utf-8?B?WkR1SjQrNHo2MTZ2bW80bmZqMi9XbVI4TzRLaXR0ZVd2TTMrMzBHZGsvT2U3?=
 =?utf-8?B?UU96N0drQ3pzTXZxQWh2K2lnY1VGVk1xdjZkZHJxM1ZkSnlkVW5xYms1OE1U?=
 =?utf-8?B?Zmg2eHJ1WTh1MzFoa1RNT1JmcSswd1p3K0dWcmE3aVFHVnAyRnZYZ0ROL1p4?=
 =?utf-8?B?RFJyMXoyRVo5L3NNN09EN2RqOFRBTStCVmZVVWVVWW1vVXVkMmphNUlZSHNU?=
 =?utf-8?B?S2NhSytkRmVmRHlhVmw5bnZ6MlhCVldMMGFlNzNpTTFRUHBuNVNwQnd1Zkk3?=
 =?utf-8?B?ZnZoVnZ0RUJPbEYxSzFLdEpSeGkwRXFPUHY2bjB2WHlvRTdwUjVGOGp5N2ZO?=
 =?utf-8?B?Q2txTXlveGR6MnNMdlFRMTAwMUhCNnZTM1UybitIdE9KQWJuelVOUHRud09m?=
 =?utf-8?B?ZHg3cElrVnJWMnNaTlZBWitHeSs0ZFZHWjBnRS93eUtiRUc5Yy80dnhLbGRh?=
 =?utf-8?B?Y1VBbVJyNnZtRWxsRFRnSG44UTlueVZES1ZhZlU2VnNYZGt1eWplekhEbEtn?=
 =?utf-8?B?bDJHV056ampkbDZERnVkd3NGZXBSSnhha2dVRU9CUUhtS2VEUmp2dHBoTElr?=
 =?utf-8?B?RGFLWW9hTE1TbXR6VnZKK1YvYlJ1ejNQWTZSNWZoeXdJcXlTbG5CVEI0ajJS?=
 =?utf-8?B?dzFXTENoS1gxQ2g1elEwbG5aRnFZbnFYUlJ6YXFtYW4zY1JUZC9YSVBRQld5?=
 =?utf-8?B?NklaelZCMDQrVFVONkFVOTFJVFg1aEhWekVrek96YjRPdldZV0ZwT1drUGpS?=
 =?utf-8?B?dXErT01RYmxPcUJSaGcrS3RadCtPSkRjQzBSck5rMnJlT0VFKzE5UU9SaHIw?=
 =?utf-8?B?UXNmcXgyRHpnQStXZ0NTWXZuYy9wY2pDTGF5dFFPL3cvOUFZb2pOQU9HSTRj?=
 =?utf-8?B?MEM5TGF1L1Jmc2xOeWxvSCtPY3E1ZXdyc0dJak9pREt6ZlZZZDZUc0grY0ha?=
 =?utf-8?B?RTU5cHlWMUFPR3JyeWh6c3ZwdDEwRTJ3KzlaVTMyRUExaFl1UkFGSXpIaEwy?=
 =?utf-8?B?amNIT1FnTDdZM2lQT0paNEI5d0dmajRyS3Z1QmxraUU3anVOSVBBSXdYMk1x?=
 =?utf-8?B?WjUzeTJYazRSaWI2SHZHTUxReFhXejlLa1M5N0dlRk0yYWVVNUFWNkg0WjYr?=
 =?utf-8?B?MGQ4Q2FBejBsS3pHZ285ekRzaDQyR2pEeEZqSWJyN0VCSy80dDRqYmVQM2Jh?=
 =?utf-8?B?ZHJiNXFNSU1XMGM0c3VjUVU4YWZIRnFHSUdONEF2K1BIdnhkcWZqbll0Y2Fz?=
 =?utf-8?B?SVkxdVVLajN1OVlLRklRUks1aU5Gd2dIcUUwQnRLbXlvS0h4aDkwQit4Y2Iw?=
 =?utf-8?B?Y21HK1pGU05zUGdlclVYZnk3WVQ4ZkthcFJSQTQvSi9nV3poMENEOWdtMEg5?=
 =?utf-8?B?R3p1YUtnNitQeVZxK3cwOFRQaU14bXNucDk3T3EyUExiSWtFRGhjS0ZYRE13?=
 =?utf-8?B?Rkc1SHBBOEVlYmRHRENYUDhNbFZBYWljNFdZekE5ZGhNT3lxblBiWmsvc2Vl?=
 =?utf-8?B?VW9vejdVQVkzM1g3VHlOMWRJS3VmSnNDbE5MSDA5UVVjTTNwSzJxbU5UU1N4?=
 =?utf-8?B?cWJIWjdQdnpscUUzem9KWHZJN0xKNkZ1WnBYUGxTWmMrQ3RRbjRCd3B0SWkv?=
 =?utf-8?B?dXNlV0dkU0VaMk1ENlN1Rm5ZUDlhY1ZwcFM5U1oyT0QrUSt6U2NHWWJvSlp4?=
 =?utf-8?Q?wTOrNI9IBam8iWnbBM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR1101MB2091.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39059f6f-76a6-4bef-6177-08d973a89c03
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 15:43:45.7683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GeWj3BNTI7DuwnOhLWWgk8WlFExAekPnrR3WoGzdCU2Qobc0RwSDzq8oDZs0p8G+TpG8gcGhvvM3Dk6E1neNmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3273
X-OriginatorOrg: intel.com
Cc: "Arava, Jairaj" <jairaj.arava@intel.com>,
 "mark_hsieh@wistron.com" <mark_hsieh@wistron.com>, "Cheng,
 Keith" <keith.tzeng@quantatw.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "Nujella, Sathyanarayana" <sathyanarayana.nujella@intel.com>, "Liao,
 Bard" <bard.liao@intel.com>
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

PiBPbiA5LzgvMjEgODozOSBBTSwgQ2hpYW5nLCBNYWMgd3JvdGU6DQo+ID4+IEZpeGVkIEJhcmQn
cyBhZGRyZXNzLg0KPiA+Pg0KPiA+PiBRdWlrIHN1bW1hcnk6IHRoZXJlIGFyZSBtdWx0aXBsZSBp
c3N1ZXMgYmVsb3cgd2l0aCByYXRoZXIgdW5jbGVhcg0KPiA+PiBoYW5kbGluZyBvZiB0d28gc2Vw
YXJhdGUgY29uZmlndXJhdGlvbnMuDQo+ID4gVGhlcmUgYXJlIDMgaHcgYm9hcmRzIHN1cHBvcnQs
IEkgc3VtbWFyaXplIGFzIGJlbG93Og0KPiA+IDEuIFNTUDIgY29ubmVjdHMgOTgzOTAsIHdpdGgg
MiBzcGVha2Vycy4NCj4gPiAyLiBTU1AxIGNvbm5lY3RzIDk4MzkwLCB3aXRoIDIgc3BlYWtlcnMg
b3IgNCBzcGVha2Vycy4NCj4gPiBUaGFua3MgUGllcmUuIFBsZWFzZSByZXZpZXcgbXkgY29tbWVu
dHMgaWYgSSBtaXN1bmRlcnN0YW5kLg0KPiANCj4gUGxlYXNlIGNsZWFybHkgaWRlbnRpZnkgdGhl
c2UgY29uZmlndXJhdGlvbnMgaW4gdGhlIG5leHQgcmV2aXNpb24sIHRoYW5rcyENCk9rLg0KPiAN
Cj4gDQo+ID4+PiAraW50IG1heF85ODM5MF9zcGtfY29kZWNfaW5pdChzdHJ1Y3Qgc25kX3NvY19w
Y21fcnVudGltZSAqcnRkKSB7DQo+ID4+PiArCXN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQgPSBy
dGQtPmNhcmQ7DQo+ID4+PiArCWludCByZXQ7DQo+ID4+PiArDQo+ID4+PiArCXJldCA9IHNuZF9z
b2NfZGFwbV9uZXdfY29udHJvbHMoJmNhcmQtPmRhcG0sDQo+ID4+IG1heF85ODM5MF90dF9kYXBt
X3dpZGdldHMsDQo+ID4+PiArDQo+ID4+IAlBUlJBWV9TSVpFKG1heF85ODM5MF90dF9kYXBtX3dp
ZGdldHMpKTsNCj4gPj4+ICsJaWYgKHJldCkgew0KPiA+Pj4gKwkJZGV2X2VycihydGQtPmRldiwg
InVuYWJsZSB0byBhZGQgZGFwbSBjb250cm9scywgcmV0ICVkXG4iLA0KPiA+PiByZXQpOw0KPiA+
Pj4gKwkJLyogRG9uJ3QgbmVlZCB0byBhZGQgcm91dGVzIGlmIHdpZGdldCBhZGRpdGlvbiBmYWls
ZWQgKi8NCj4gPj4+ICsJCXJldHVybiByZXQ7DQo+ID4+PiArCX0NCj4gPj4+ICsNCj4gPj4+ICsJ
cmV0ID0gc25kX3NvY19hZGRfY2FyZF9jb250cm9scyhjYXJkLCBtYXhfOTgzOTBfdHRfa2NvbnRy
b2xzLA0KPiA+Pj4gKw0KPiA+PiAJQVJSQVlfU0laRShtYXhfOTgzOTBfdHRfa2NvbnRyb2xzKSk7
DQo+ID4+PiArCWlmIChyZXQpIHsNCj4gPj4+ICsJCWRldl9lcnIocnRkLT5kZXYsICJ1bmFibGUg
dG8gYWRkIGNhcmQgY29udHJvbHMsIHJldCAlZFxuIiwNCj4gPj4gcmV0KTsNCj4gPj4+ICsJCXJl
dHVybiByZXQ7DQo+ID4+PiArCX0NCj4gPj4+ICsNCj4gPj4+ICsJcmV0ID0gc25kX3NvY19kYXBt
X2FkZF9yb3V0ZXMoJmNhcmQtPmRhcG0sDQo+ID4+IG1heF85ODM3M19kYXBtX3JvdXRlcywNCj4g
Pj4+ICsNCj4gPj4gCUFSUkFZX1NJWkUobWF4Xzk4MzczX2RhcG1fcm91dGVzKSk7DQo+ID4+PiAr
CWlmIChyZXQpIHsNCj4gPj4+ICsJCWRldl9lcnIocnRkLT5kZXYsICJTcGVha2VyIExlZnQsIFJp
Z2h0ICBtYXAgYWRkaXRpb24gZmFpbGVkOg0KPiA+PiAlZFxuIiwgcmV0KTsNCj4gPj4+ICsJCXJl
dHVybiByZXQ7DQo+ID4+PiArCX0NCj4gPj4+ICsNCj4gPj4+ICsJcmV0ID0gc25kX3NvY19kYXBt
X2FkZF9yb3V0ZXMoJmNhcmQtPmRhcG0sDQo+ID4+IG1heF85ODM5MF90dF9kYXBtX3JvdXRlcywN
Cj4gPj4+ICsNCj4gPj4gCUFSUkFZX1NJWkUobWF4Xzk4MzkwX3R0X2RhcG1fcm91dGVzKSk7DQo+
ID4+PiArCWlmIChyZXQpDQo+ID4+PiArCQlkZXZfZXJyKHJ0ZC0+ZGV2LCAiVHdlZXRlciBTcGVh
a2VyIExlZnQsIFJpZ2h0IG1hcCBhZGRpdGlvbg0KPiA+PiBmYWlsZWQ6DQo+ID4+PiArJWRcbiIs
IHJldCk7DQo+ID4+PiArDQo+ID4+PiArCXJldHVybiByZXQ7DQo+ID4+PiArfQ0KPiA+Pj4gK0VY
UE9SVF9TWU1CT0xfTlMobWF4Xzk4MzkwX3Nwa19jb2RlY19pbml0LA0KPiA+Pj4gK1NORF9TT0Nf
SU5URUxfU09GX01BWElNX0NPTU1PTik7DQo+ID4+DQo+ID4+IGFnYWluIHdoYXQgaGFwcGVucyBp
ZiB5b3UgZG9uJ3QgaGF2ZSB0d2VldGVycyBpbiB0aGUgY29uZmlndXJhdGlvbj8NCj4gPj4gV2h5
IHdvdWxkIHlvdSBhZGQgREFQTSByb3V0ZXMgdG8gYSBub24tZXhpc3RlbnQgY29kZWM/DQo+ID4g
V2l0aG91dCB0d2VldGVyIHF1aXJrLCBpdCBnb2VzIHRvIGFwcGx5IG1heF85ODM5MF9jb2RlY19j
b25mIGZyb20NCj4gPiBtYXhfOTgzOTBfc2V0X2NvZGVjX2NvbmYoKSBXaXRoIHR3ZWV0ZXIgcXVp
cmssIGl0IGdvZXMgdG8gYXBwbHkNCj4gPiBtYXhfOTgzOTBfNHNwa19jb2RlY19jb25mIGZyb20g
bWF4Xzk4MzkwX3NldF9jb2RlY19jb25mKCkNCj4gDQo+IHdoYXQgSSBtZWFudCBoZXJlIGlzIHRo
YXQgeW91IHdpbGwgYWRkIHRoZSBtYXhfOTgzOTBfdHRfZGFwbV9yb3V0ZXMgZXZlbg0KPiBpbiB0
aGUgdHdvIHNwZWFrZXIgY2FzZS4gVGhhdCBkb2Vzbid0IHNlZW0gcmlnaHQ/DQptYXhfOTgzOTBf
dHRfZGFwbV9yb3V0ZXMgd2lsbCBiZSBhcHBseSBvbmx5IHdoZW4gNFNQSyBxdWlyay4gSW4gdHdv
IHNwZWFrZXJzIHF1aXJrLiB0aGUgLmluaXQgcmV1c2UgdGhlIG1heF85ODM3M19zcGtfY29kZWNf
aW5pdCwgc28gaXQgYWRkZWQgdGhlIG1heF85ODM3M19kYXBtX3JvdXRlcyAgIkxlZnQvUmlnaHQg
U3BrIiBhbG9uZS4gICANCg==
