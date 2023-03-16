Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE876BCDB4
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 12:13:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABD481153;
	Thu, 16 Mar 2023 12:12:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABD481153
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678965224;
	bh=/jGZOikUzENscAOBjEi3Sr8Vh+rkAGgeiUa1n+SWLa0=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=jcRcfy5ZHZBW1AbzDU21sYIUs1BUo7RVEfQcyv+DvMg5Hy0nEObBP2/lbK5WMBzLz
	 //C8xH3kkTlYUy2TWwkFMMqEbo7/Qr3BQiuoi1hEkuASocYIRsGM2glfoWCxlAPlTe
	 H6t9JJoKBbXf/I8NvMv6DUf6tWlhEW/1Vz4J/cT0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DA375F80520;
	Thu, 16 Mar 2023 12:11:45 +0100 (CET)
To: <u.kleine-koenig@pengutronix.de>, <peda@axentia.se>,
	<codrin.ciubotariu@microchip.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 033/173] ASoC: atmel: tse850-pcm5142: Convert to platform
 remove callback returning void
Date: Thu, 16 Mar 2023 11:11:34 +0000
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-34-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-34-u.kleine-koenig@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QAAUDAGIIA5ZDU5YM4O5FV33JKHUXQY2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: <167896510478.26.470996530741116857@mailman-core.alsa-project.org>
From: "Claudiu.Beznea--- via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: Claudiu.Beznea@microchip.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B6A0F80529; Thu, 16 Mar 2023 12:11:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74E41F804FE
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 12:11:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74E41F804FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=SCe3+YhB;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=JD0uUot5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678965100; x=1710501100;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=k56BlAFD0fRST0geJVs6VzSCYNu6MKCw0IhdEv3QzzI=;
  b=SCe3+YhBfxPtb0ShsaS2MzEU23To3zTOgX9S7HIdZRmSW7B96xp+EStO
   7zhKMPOMXhlTV5+XfrWCF4HrAwATr/y0Bx0UB5hReQcMKRl5WaWt5K3tC
   2haPSuZlQ+8IcA63NBPDeRUeQffvYubIxLz5wIBC360EtWllsLBYz8xhA
   Ip575VE9AKV5IOrBxhWvhr0YvMXVk/nM8czHawBPc17BoInAG7REKpHOp
   a7Eua0//cTQrNPODsYYBruTg0qSQtvLDa3SrXaZu5FNQiDEyEX63DKfeO
   e7qNRJFl3ktVjO25IT5kybp/Njv3Wut5sp1zUJE5pDBJrD9VWm+a8K1CV
   w==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673938800";
   d="scan'208";a="142358605"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2023 04:11:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 04:11:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 16 Mar 2023 04:11:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iATDOISn0T2jr5C7ghM4vTlFZWDqzTPwWtSP7KuzyTVsYeEscUxfyyHiwXx7AzqoLRETtUHbeZdcfTmp9KDaZ3xfXRe9MOZqaGv5DP6ADAg39N6hVVFQLqtBXW6pnD+8EdfQQjv/OwdBmlgy0hrIHVgIkdSeisTlQdAQtIl343ilzv6FpTZb7dWkLmbMmOYFuRd1b5dGPCceaPvZJUgb4z/I+ZUzrDgfc/2LYausz5BuIx1z+MP/DsO017CdPV9N+UDPvnpwDFf1E8lf9BmKzmf+hK3KXgWd6J/5IRmZr1ES3jt6s9wj1tgkLYqri3dy2vx/KPFo1o0bDkWnXCdu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k56BlAFD0fRST0geJVs6VzSCYNu6MKCw0IhdEv3QzzI=;
 b=iLDb9sWO4SmZYVZkwQVn5cDmBFQvID9EQ7EcOAt48pg/O+VkJ/5qz/ObFe+xTgiUUlyLZHlsywCxpH9gGxZWRCpqbGwavYKu+C3Wot+cht2ylTDNhgf3+3J3yTbHsDSJ1LtkiaSqk/oGGrRyIygbiRvjKW9EiyFa4hvRNYo36+3cu3UbNv36gQbPvCkG+oacAi4oYd0SQTw+Lpr63EcZuhsm1QBm0TOjHJmJCxl5dRdwT+GfejwvScMgUfV5Onym0D+jat/pQugNQ0uuzc7gO+1zAGvNIX1KcP2ChKlF8wOXamSi9EDm/lYqQtmtNAwtvKzdaOvFQ3ie0pYyaQ/36g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k56BlAFD0fRST0geJVs6VzSCYNu6MKCw0IhdEv3QzzI=;
 b=JD0uUot5cPqrcHc9R/Lclkb+ZaWvj9NIfPbjlOxb3oa///AnD3JLJBFuMALh/sMA4u++hCrMcW6nO0Zw99zpjKRhqZSouWllyVUFr9+yC2M2waaOvlpqYPdAgWMO57DdU/jrlbKmKqKUtrYj1YSjYP0wopvDeHF4VS9MY/w7k3o=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 11:11:34 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:11:34 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <peda@axentia.se>,
	<codrin.ciubotariu@microchip.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
	<Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 033/173] ASoC: atmel: tse850-pcm5142: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 033/173] ASoC: atmel: tse850-pcm5142: Convert to platform
 remove callback returning void
Thread-Index: AQHZV/gRQD/IuDBi/0u1b3QcdfAaiA==
Date: Thu, 16 Mar 2023 11:11:34 +0000
Message-ID: <2a245d1f-a087-6770-a5bc-2a0fd030c350@microchip.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-34-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-34-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|DM6PR11MB4595:EE_
x-ms-office365-filtering-correlation-id: 59ba3241-fb57-4996-184f-08db260f33f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /NvoQk3Ae7jlL9aY4WhBTKBJaeNGv/OAjchRGtkD4mZPqqIqTXwko+2M9g+WI4Y/XwXME4oELjE2pSj+oYrhA+STQjSgUoZahNkTt56EwqXCe2uMo+Lyk27NCSHOIwdGOO7KM9oD1ZGChjNhVKq2vl7fTZmBAV0bRjrwreVsFDJBfs8Xv71u5SwiKunyAaj8qgGDsvtziCBw5mcl+S0gAbv9peqy2e5mgLfw3EdOzL36ZmrdKATTJOpP6dmrWgqnusYy6MWuyAZ9I/DttZRhnb9rTZfENNFqb9MZm74gqgzwpzRH44hBgkZLuixf4EK2Do+vobRTNoVfPrCGfP9eeQ/LENISt3afThzaIiQjAqqnuw6Liy8UEtP5Zw3uXzvFMcaqPvEDUE3BOJCdLLtsfvJANDJHJxU0O9ocDPBBBjDvVUIc2lCNpa8w61/zvyG/LhyB+klTJemqgmsz2pVhCgXvWnJTVSjzluToEdk7AeGKb6SvJlps6a95ucM/sjh0Hgcvy0j+XzPcAOO58tDJ/W0/Uh4UV6n3WusRXRsEt3lCvCNO4XMyMsQjsyXV8Kz7FuoQn9mQYbnfSEVxB5nagZ+Z4LRwVDthOariD0kQmccSNZ5QaIU2QHYGvSXgxdOs3bXyZPwEBaYgd+x7fD8bbDKwK6KOvd/mtWB1vKT6+U1I4sDtSP72Tw1rAR0+2KpftJSyMYhcgeKJ4G55PyHPJd4aHZ6k3GvVXsLAMHQSVXp21lv7RY7MABPKmV3qdf0y
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(31686004)(41300700001)(8936002)(7416002)(5660300002)(2906002)(38100700002)(38070700005)(31696002)(36756003)(122000001)(86362001)(71200400001)(66946007)(66556008)(66446008)(76116006)(66476007)(6486002)(91956017)(966005)(64756008)(110136005)(8676002)(4326008)(2616005)(478600001)(6512007)(83380400001)(26005)(6506007)(54906003)(316002)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dmhXRHU3b2RsOHF1T2xoM0V4TXlHV1o3QkhQSU0wOTBZZmJXVExuRllsZEtS?=
 =?utf-8?B?b2hZdUVTWVd4bEJsM0Vib3RjWkJmdlRxZFhYWERRUkF4dHFpM2VFbDRzOXZp?=
 =?utf-8?B?S3N5U01kZ3d2cVVKWmNvUXVadnRuTW4rUDNLQ1RYYkxwMkpzOXVVbVE4U0t0?=
 =?utf-8?B?aEZIK2h0b09Ea3J3NWRySFdXc2lRUERwRFRtL1BUR3BkdmEzN29QQWw4US9q?=
 =?utf-8?B?cXA0dDBxb095SUJVeFJoa25Rd2pLS25LVFkwb3lxYTZiRHVwdkE4S21UVUVY?=
 =?utf-8?B?S3dJR3FHaHhwS2hoQ3VpcTByK2QwRXJhRlJmYkdlS1BUb1VtVWVKaTV4dllL?=
 =?utf-8?B?NVg0dWMxNERYMEFnNVp2bkdIcE1EZDArYkdhMDBMZGlFR0tRbEhOQVdPaGlx?=
 =?utf-8?B?YVBaL0d6NHpuUjUzb29jbmlCWkljSWdaRDErQmFUWWxvMHRXdm96Z1dpVm1B?=
 =?utf-8?B?MUVYSzQzS3ZDT29veXBRLzI3VitLYXRCbUJTdFlyalVjWDZLL1JpOTBlSGdp?=
 =?utf-8?B?Nk4rbEFMTGliU05EY3lld3NPMnlORlY1SlN5OFJ4cEFXTGRyM3QwUzM2Zmpy?=
 =?utf-8?B?bEJKWmhSVFlxekJ1S2I4RGdYVWpVSWR3ODJBdWtUdVE2RVNyeFFVWmhlY01u?=
 =?utf-8?B?VlhENHRJMXQxcEp5SGNnZGJRRWRrVUJUeG02bE9wM2xaZHZTNEM0Y0hzU1cx?=
 =?utf-8?B?dlZSb0huVVcwRnQ1QkVXMjhBZ3dIaGZGQXBZYVJObk5QNk5MUnMwaTZhZnpu?=
 =?utf-8?B?KzRLL2tpeVFvS0o1UWZFN0tNeUh6K2czcG1iM1BEd1ZMUjRyYnBPSllWcDdH?=
 =?utf-8?B?UnlEcnMwWWphMHNUTERtOExEa3c0Z1FDUTg5YTdUYUxtdThLeFdKRHY2OW8r?=
 =?utf-8?B?UWJ5S1kyMW5rRDZENWhPM0g0cWcvcTFvanlHajBqYmhkclRtZ3lPUXhrMjFq?=
 =?utf-8?B?SldFbUlpS1ROK25teU5FUVd3UC9YWmsrekdFZ2xEZUJFbmVWZmMvT0t0eHV1?=
 =?utf-8?B?WUNGeXJJM2hHMU9JR0p4RVdWTXJ0Y2FNQ2l4VzFyaVBsZEg1OE5FMVo4eklE?=
 =?utf-8?B?VVc1c2VPRVdENk5IeUN5dnRVdmI1a0p2VU43TE5LQ0FXQXdLTnVidmptbUM0?=
 =?utf-8?B?R1AvNmJsNGFsdzgwMmkvTGxmcGt3ZnFSdGlRdkVQNEFqNmxTMFBkOE9JaWlY?=
 =?utf-8?B?Uk5QZlE4OE9BNG5UbysyZ2JaSnFvbmE3KzhJTkJkYzlXdjQwc1ZGZGtod1NF?=
 =?utf-8?B?TjBIZURIYzVmWTRZZ0E0clViRytlNWl0U0RteSswdFRKZVl5NWNHZHltakRm?=
 =?utf-8?B?TmZyVU1YUjdWcEpEVFZUb0VPd3NxMk01Sjhwa2lQbnAzZnBTelRFbGhpYWk1?=
 =?utf-8?B?dVVMWjF1aWk1OVlrN0N4ZEp0UEFkcDdmZWIwbXIwUFdablZ1aTFrN25sQThP?=
 =?utf-8?B?RnRRa2I4ZnYzT0p3ZVBOVHZwL3lWWUZ5QlN1N3A5c2JJWkovbkVPUU1wUXQ2?=
 =?utf-8?B?MDg1S283WTZVT2NXM0QzMm9xL0FRQlJjTjdaM09pT2R4WGVoa0dNTnlZMlBE?=
 =?utf-8?B?S3lmQ0VxR1N4Z2VJdklJajNtdVdiNGJpMG50KzA1eDl3Q09sMmpid3hqMjVk?=
 =?utf-8?B?UFRGcHlwdlBuRnZGL2ZhVjRkYjc3am16TjFSMHBLZGhCRGRYMk5aTmVlVmZZ?=
 =?utf-8?B?elZKVFVKbGhHV0QyaHZ5Vzc3YUZhY0lTZ3huRVpWVzVPamFpZEFKeXg5cE1E?=
 =?utf-8?B?Q2pYdXgvWno0QnBnRlh3a1NKRFVGSEREVVU4NFYzRUc0TUFqSzBnT0x1b09C?=
 =?utf-8?B?MTgzb3h1YTQrWGxuZ0g1dmQ3RHR5SlBrd21UQlE2TzhRY2g4eFVvYXZ3SHJl?=
 =?utf-8?B?ZXhrZDVUaldFS2xqTXFYTHpIV3ViVEhaOXdpL2ZwY1dBVGNUVUExM0tERm1Z?=
 =?utf-8?B?ejdVMWpQQ0hOQkNFcGk0Y1A1V2JtTjQ0OGxJYlJRdGZyMTAvcXlBa0FQMExS?=
 =?utf-8?B?cThjWHRpVWhZb0JKVEpQTGxUNkp3dXdjcmFXODhsdmtCMm1HSjlZUmJLdS9J?=
 =?utf-8?B?eFlXZWJHOGNnblNBdVpDL2hlcmdNckhYU2RPSHRPaTd4NDRMWUp2bWtEY1VJ?=
 =?utf-8?B?Zk5nUEZLZ2xtbUtpbWl1dTU0RlpVWm5UZzlUOTQrekxtSG9rZmVoZXVpUXd1?=
 =?utf-8?B?QUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B8DBF7808DB09A40B922BF5C4E517F9B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 59ba3241-fb57-4996-184f-08db260f33f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:11:34.0744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 pLByiCHzIFjJztT1LIe7Ejzc6cCss63XqMnf2XgfDkbutstFXm9xyhKWv1eTwrDb/3RqPiHZR/ndoBXJ/FbYgjH/ZOZI5J9zhzFFW1v4tZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
Message-ID-Hash: QAAUDAGIIA5ZDU5YM4O5FV33JKHUXQY2
X-Message-ID-Hash: QAAUDAGIIA5ZDU5YM4O5FV33JKHUXQY2
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QAAUDAGIIA5ZDU5YM4O5FV33JKHUXQY2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMTUuMDMuMjAyMyAxNzowNSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBm
b3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMNCj4gbWFueSBk
cml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhh
bmRsaW5nIGJ5DQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1ZSBy
ZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkDQo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRz
IGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQ0KPiBxdWVzdCB0
byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJzdCBzdGVw
IG9mIHRoaXMNCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25l
dygpIHdoaWNoIGFscmVhZHkgcmV0dXJucw0KPiB2b2lkLg0KPiANCj4gVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQ0K
PiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
DQoNClJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlw
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgc291bmQvc29jL2F0bWVsL3RzZTg1MC1wY201MTQyLmMgfCA2
ICsrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvYXRtZWwvdHNlODUwLXBjbTUxNDIuYyBi
L3NvdW5kL3NvYy9hdG1lbC90c2U4NTAtcGNtNTE0Mi5jDQo+IGluZGV4IGVmNTM3ZGU3NzE5Yy4u
ZWZlYWQyNzJkOTJiIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvYXRtZWwvdHNlODUwLXBjbTUx
NDIuYw0KPiArKysgYi9zb3VuZC9zb2MvYXRtZWwvdHNlODUwLXBjbTUxNDIuYw0KPiBAQCAtNDEy
LDE1ICs0MTIsMTMgQEAgc3RhdGljIGludCB0c2U4NTBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gICAgICAgICByZXR1cm4gcmV0Ow0KPiAgfQ0KPiANCj4gLXN0YXRpYyBp
bnQgdHNlODUwX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArc3RhdGlj
IHZvaWQgdHNlODUwX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0K
PiAgICAgICAgIHN0cnVjdCBzbmRfc29jX2NhcmQgKmNhcmQgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0
YShwZGV2KTsNCj4gICAgICAgICBzdHJ1Y3QgdHNlODUwX3ByaXYgKnRzZTg1MCA9IHNuZF9zb2Nf
Y2FyZF9nZXRfZHJ2ZGF0YShjYXJkKTsNCj4gDQo+ICAgICAgICAgc25kX3NvY191bnJlZ2lzdGVy
X2NhcmQoY2FyZCk7DQo+ICAgICAgICAgcmVndWxhdG9yX2Rpc2FibGUodHNlODUwLT5hbmEpOw0K
PiAtDQo+IC0gICAgICAgcmV0dXJuIDA7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVj
dCBvZl9kZXZpY2VfaWQgdHNlODUwX2R0X2lkc1tdID0gew0KPiBAQCAtNDM1LDcgKzQzMyw3IEBA
IHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHRzZTg1MF9kcml2ZXIgPSB7DQo+ICAgICAg
ICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIodHNlODUwX2R0X2lkcyks
DQo+ICAgICAgICAgfSwNCj4gICAgICAgICAucHJvYmUgPSB0c2U4NTBfcHJvYmUsDQo+IC0gICAg
ICAgLnJlbW92ZSA9IHRzZTg1MF9yZW1vdmUsDQo+ICsgICAgICAgLnJlbW92ZV9uZXcgPSB0c2U4
NTBfcmVtb3ZlLA0KPiAgfTsNCj4gDQo+ICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHRzZTg1MF9k
cml2ZXIpOw0KPiAtLQ0KPiAyLjM5LjINCj4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlz
dA0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsDQoNCg==
