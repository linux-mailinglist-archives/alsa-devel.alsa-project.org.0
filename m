Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3496BCDB2
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 12:13:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E88D1134;
	Thu, 16 Mar 2023 12:12:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E88D1134
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678965203;
	bh=CYvQIqrpLx3eiyJIxSGd7XLEplshUxCremew9mTOmo0=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=KAzQ9zyQxjpUZO8jmqdCI1ZZnb4euKe88ji0k9aO7qb8QeLzprWhcVUzbL78fZokh
	 Jpz76lZox4jt4O+xSNxuxEbq+/HZ4OGUmu/Yxp5CU/PgUfFDF1Lt7HqvOsQzM3vpyB
	 m4JMoqTJXywclV39J3ukXsjUheYcy/kLVAXqr10M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC427F80580;
	Thu, 16 Mar 2023 12:10:55 +0100 (CET)
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 031/173] ASoC: atmel: sam9g20_wm8731: Convert to platform
 remove callback returning void
Date: Thu, 16 Mar 2023 11:10:30 +0000
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-32-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-32-u.kleine-koenig@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F7ZJOXRY5FIDKE7V3BEB2LSRVKRZCG3T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167896505525.26.8096062743114668277@mailman-core.alsa-project.org>
From: "Claudiu.Beznea--- via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: Claudiu.Beznea@microchip.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9ABB2F8051B; Thu, 16 Mar 2023 12:10:49 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id B390BF8016C
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 12:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B390BF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=VFp2xT2Y;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=sw+fMFko
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678965046; x=1710501046;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=6rmmr6QHnlWrX0jmVAOOvQjfvjmDBg2qCObqiX+6X1M=;
  b=VFp2xT2Yq0z45HCmen2igN7NM++zwW8XeqsHnBx7gOMj0T0XLfamBfcs
   7okYBV3UnD9pnWaRlrdVtglZ0+2JmLQEcnzPdf7iV3I2US7eps2k6GRwT
   qaZH+U1E1Cx/Ou3gUsak+p/QCSgrg/VSu54XA56i5XOY1WLnEUmrksBZq
   JUySxrR+AtIU0Q1HSf25bxMhjhQzfq91ZAZELByGNLYU/UujdkaDGZed1
   6wBZW3Jmvrt1Q4jNZwzdxjDP1Wl9kc7CLQza4s/EXh47GA25NMXg+WEqy
   PAQazy0CENuSBrTMpIGVz4yBiyYmp0Nz+bhkc5XQG+xxjc6ueKcSAFS1z
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673938800";
   d="scan'208";a="142358389"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2023 04:10:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 04:10:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 16 Mar 2023 04:10:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8Eoo9AAZym7Mh1A+R00eP5WUSxv8Pht+WmzmJ6hFMzEvOdl5sycjMCcOFSQk29dsA1uQG3lEtYM43a2oDwWlRNNoYEMT4jH++7gR/1CV0mEIZs8xmIgzA5JBxXu4cu6AByqWeTOFgds9e4yX4/kEU/0flrnxwU1P30trh2F10AOqJwaxOji1bFr0et3VPwTrZHYdOI9OJAtmAuBiiCSrtqLxVMGfHHKXHrFELv5lW1pJCkGOg3WCtHYyxDMunK/0FrKW2cN+qWoJPDIY3ckSlzpa41rrICne7wzEr8azGUe4T303fTP5F/NJUOiGs7n/40aUK4FFjMu7EzVnw2FXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rmmr6QHnlWrX0jmVAOOvQjfvjmDBg2qCObqiX+6X1M=;
 b=CpSUJegGKv/eCNfMJvzfeSTOqSilh1xtAHaNvZCZQEIg/+wR111DYh3MK6WRvl+bbFNfSe9zsHQQOsuxwAKJGkx2Fe6efsj1XVqLd/hx+rEae/K+KzxZ0LCmTYJ79wKI1lMox8SmigzqfFqhXiHbzF1LamYetXGuSlvOBd75AiAR62aDwDzHRZ5rgnEabtt/Yxa0XowrSZA44tH03+xv7gHEqwSdBXvlRu/aaa2N2RRGhpPTuRr/iBrvuii7OdBGnz1+4J7IbNQUyVjiblkpIKFndl8fNlv8a/OEmtfZc1zxAQZe/JqmHRzd3NjnfI4Y+htGpVGwfEjeEgdRuGCy5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rmmr6QHnlWrX0jmVAOOvQjfvjmDBg2qCObqiX+6X1M=;
 b=sw+fMFkoA1Zc7a791fNYBjlIjJvt3Qof4A9trEESl+i28uHE4JHEBmG6oNl4qgf0lG0+Er/g2dwi3J9rVTR51v2qdfKcZh95dyFp8Au3nyfUHavPlyfgI6NeFICpiVTsTUnupAhKjUys5cuSNpGTC9LUsVrVPD3bELbkw5+7wTE=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 11:10:31 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:10:31 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 031/173] ASoC: atmel: sam9g20_wm8731: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 031/173] ASoC: atmel: sam9g20_wm8731: Convert to platform
 remove callback returning void
Thread-Index: AQHZV/frIWgL/P9Z/UepyxpdNLisSw==
Date: Thu, 16 Mar 2023 11:10:30 +0000
Message-ID: <b1476ef9-9b39-8bb4-292e-bc51cc54d4d9@microchip.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-32-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-32-u.kleine-koenig@pengutronix.de>
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
x-ms-office365-filtering-correlation-id: 5ae61d8b-625f-4d5d-d78b-08db260f0e4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +IAkrLSHZAbgeIo0Ao+mlySiezqV3ClNSiOsYOGABI85sBSUQCQlLJtTRn6N3t5Uxfe/WIz6r5cZCKNRnIplt0oif+qaWkskgU8BZ51hbZUnpEX5ICkdIlf5pbaUzDCCJS96j3YxpcPggrHIuFXgsGpZ+KTDpNwSb/rOT7Ijz35ei7wn52De0CyfSGpmYN1FRlHfpY7Otuj9cjS9Uj9pItC/pi9eZlRG4TY/Iy3aBYe3XqSx+U5uUvWNdbL1PWO+cLXdYgDRelIf+bxZl2hOs7nYHppRrz8wLRp/y4v2XjOlgeKfvKPNxBAfE8v4BFWpnpt2NFYH7X2xGwsYKr9yJFGj1H9WKtJ91GtVw1478LcwGEx1YaF2P+FIEifKjk0ETCZm2PFRRjw5WSGUNYhAZoNnbljbUUojr0Vw327GnLw1rAuCowWGIazTlcOxUpj+WgsJolR/++8HNdos2VNVQRkNQ350ZOnkEdes8LzmJqHQfUV0VjJUown8IllpaP/GVxMmkiDCSCpfwYPtMvT4vk7CuUVY0YSI0U9WUr5xUAIGZlqK1IS8//eaiLLJWc+qeEhLNctWgQ430vuWT/Eye5gl98OxXGvWFRbkv6cRMsno/oy3j2dqGXxWcWl/NhQ8Hk4GPM5ObE//zFQfpx+Mg+PoOY3Gv6N0MfpwDjc5NCLkEjLeyTQqI2pdYTX8TWYizCQxH6+zp+TXWeofZ5eSZEbmDJJeenJxPEDrzFvIITIXzh/d1YROdD4zWFDuZZgCYdA7XN44TuL4+j5SosyZeQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(31686004)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(38070700005)(31696002)(36756003)(122000001)(86362001)(71200400001)(66946007)(66556008)(66446008)(76116006)(66476007)(6486002)(91956017)(64756008)(110136005)(8676002)(4326008)(2616005)(478600001)(6512007)(83380400001)(26005)(6506007)(54906003)(316002)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U3Nzbm8zVGVleFJkQ2ZSSDZEMHNyVXk1K1hGL1FXOW00bGMxZ2lDK2lqQ1FR?=
 =?utf-8?B?ejJvYi9TTW1mWVEvZmlFVFRNNDFtUzR4Vmo5OUI4UUliTkFnWmlMYU81S0Fn?=
 =?utf-8?B?c1lNaU9GeG9PSE0wMDhEVURBUGhmeCt4aHpaL0lhR0Y5MGJxeThPRy9pT2Nj?=
 =?utf-8?B?MHFoN0ZmYnY3bmFlVmhxRXF6bHk4Z01uSjU5NTRtdWNlelhBZlRNVzI3d0d0?=
 =?utf-8?B?c1B5Mm8zSDhxTUUxZUFPL2c4NzE2SGhSUVhTTE1UMUN4amZkZkRRRnBkeXpY?=
 =?utf-8?B?dkNKOW02WW9MWmtpTzR6c0hUNEdqYTdvTXh3QUVvWXoya0p1ME1IdlVodnJV?=
 =?utf-8?B?TFZ4SWxDR2ZIRnpZNFZaczJ2Q3Zid2hId243L2NCVzNQWEdRS1FDUjJ3Qlpn?=
 =?utf-8?B?RVRKMGxBRXNlaVlOdGloQS9pcEZhUFIvSTBIcUpvbGd3ckpJdDl5a0lyekxU?=
 =?utf-8?B?T2RzQ3FlaC9nYk9VM25XWVRwK3FtU2dYZVNUOHNKRGRSWTFabmNMcllJa1dN?=
 =?utf-8?B?bXgza3JRY0lUd2ZKa1JwN29XT085blBOdlNQY2tzNTRqSUNjMGhDb1lTb05r?=
 =?utf-8?B?Rm5ZVUFNeGliSzg0NjlOVmhVL0MvZFFNR094UXEyZDBtNFJYMERYcHNhcHNC?=
 =?utf-8?B?NzJEQUlWUjRCdU5FOWo4TThIZWZXSXBpYWdFdzRUNTBSdWpiQjBZclAzc2tD?=
 =?utf-8?B?WHEvVVk2bTE4cmpoVUtieWNZWkNORHdmbStJWE5WL1c4alhGbGNmZmNJaXVE?=
 =?utf-8?B?VWxEdkZGU2RTOXFxMy9yQ1hGekxqRDRHZmN4YU8xM21KOXNUTjcydjMzc1FC?=
 =?utf-8?B?bzV6Q1NxMjgvL1JpRi93dXRGbW1xaVVXNVhqYlg4L0ZjdU0vQURVVDBDcmds?=
 =?utf-8?B?cWRzVXRzeHR3R0tFc3hvU2RrTksrVytxV3kzeHNJSmY4ZE5FR0FOblNNNTNH?=
 =?utf-8?B?RDRxM1hRL3ZhcnZ5Q2FNOEhrLzVjOHduc3lwZCszRjlObGF4RGxoYzB2YXNk?=
 =?utf-8?B?TkhSRjFSK1BkTGdkRHZHR045MHBPSXhsYjBteVlRbXl2OTE3QlBzbUtFMnR2?=
 =?utf-8?B?UjhxL3hhZHpSSmMwd0ZHQmhvUWtJR3R6bnlrYzA3bE9mMU1yTTZ1djlWa0Jv?=
 =?utf-8?B?Zm1RSWpiakN6Uk9BZTV0QzVSZ1ZSK3BEMk9rSkxZaVJicjVEdGhrbndkQUo2?=
 =?utf-8?B?ZDNwUGpMQUtHYjVyN1pIdU9JVExBS1RzTVhibmJSaldKVUhlcm1nZ2lDV21m?=
 =?utf-8?B?Z0prd2VYVEdkRXdiNno5WW9MMVBPbjBUK1p1ME1ULytuT2o2dVYyLyt6Unhz?=
 =?utf-8?B?cDhtYU81VHpKRlVpU2VFa2ZzZy9MWUR5cytCV3NhZDdlN1U2Ym0xempZMmwr?=
 =?utf-8?B?Z2xIY05TOEdGcDRwQ2ZxZnVoZVJ0VlJ3Uzh4QWg1Q1VvYU90K1U5T085dWtF?=
 =?utf-8?B?QXBiSzd5bDB6bW9ZWmZvdWZZNFpHWE43akU5Y1FTNEMybkVIaGF2ak83aWdu?=
 =?utf-8?B?b2c2VUVXY0xsR3pDQkE2RVpjZnJ5aTlnQUdSTUpxL0NEWkE2b1B1L0MvNVRC?=
 =?utf-8?B?eXRzWlRXaU16akZoRkJ5N1dMZVkvdU1lZ0x5TUM3SFFvT3lacXFIL1NVSytX?=
 =?utf-8?B?ZnU0V2pMTCtWY2Z0d01HNUpLdmJxc1llSVkvcEg2QWJsemhlZFhFK1IyRGhD?=
 =?utf-8?B?Y09BUnljWGx3eVlrNG5RVmZsTjg4aElKR01wb2NhODJhNFpOUXJDLy9oYnd5?=
 =?utf-8?B?c21uTml3cFk1N29XeTYrSldtN0Z5WW05TXBRcFRNbEJGb0pMQkxTSDJiRjlX?=
 =?utf-8?B?WVNKdmU5QnNnTGtINnhqQUc1YzZaMFpLcC9Qa3VxcE1JUGlkL1NHSU5kYzRQ?=
 =?utf-8?B?WjR2VDc3alhlK2h4aXUzNGlHUm9qOTUwOER5aktWVDcvOXVINTQ1QUNQTXFH?=
 =?utf-8?B?VVhsTmZMQWQ5azdRb2h4SHRKVjVZbk9EUGF0VnVIbm8xQUZhbFBmMlVpMUhB?=
 =?utf-8?B?UjV4TXlRQWVmWHJ4M25CZCs3Vjhxc1pyRy9xd2Q3OUVHTUpiT1dhL2hyb2sv?=
 =?utf-8?B?RjBEalB6MGR0Nm9sQlExd1JlaWFLejBSeTJrVS84Y2YrWnFmcjZyMHhKVlFx?=
 =?utf-8?B?ZHRwcHRIVUhZMnl3RXNEVFZFVmdseW5NeGpPK0lsSitIZkNnaUJheTF2WkxP?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B6671C447EF7B4DB1A3B52374FB5370@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5ae61d8b-625f-4d5d-d78b-08db260f0e4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:10:30.9223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Yg1PEene0J8qzHxTs/mj5jAB3GuvLWNTkAh1X5fKGghyYgaOCBWCKgUgnTAlooPYbi/8/oTLBKczSUezJ+2SrmTkEY7s7BhRDbxdnV0T4p0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
Message-ID-Hash: F7ZJOXRY5FIDKE7V3BEB2LSRVKRZCG3T
X-Message-ID-Hash: F7ZJOXRY5FIDKE7V3BEB2LSRVKRZCG3T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F7ZJOXRY5FIDKE7V3BEB2LSRVKRZCG3T/>
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
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgc291bmQvc29jL2F0bWVsL3NhbTlnMjBfd204NzMxLmMgfCA2
ICsrLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9zb3VuZC9zb2MvYXRtZWwvc2FtOWcyMF93bTg3MzEuYyBi
L3NvdW5kL3NvYy9hdG1lbC9zYW05ZzIwX3dtODczMS5jDQo+IGluZGV4IDc4NWI5ZDAxZDhhZi4u
YmFmMzg5NjRiNDkxIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvYXRtZWwvc2FtOWcyMF93bTg3
MzEuYw0KPiArKysgYi9zb3VuZC9zb2MvYXRtZWwvc2FtOWcyMF93bTg3MzEuYw0KPiBAQCAtMTg2
LDE0ICsxODYsMTIgQEAgc3RhdGljIGludCBhdDkxc2FtOWcyMGVrX2F1ZGlvX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAgcmV0dXJuIHJldDsNCj4gIH0NCj4g
DQo+IC1zdGF0aWMgaW50IGF0OTFzYW05ZzIwZWtfYXVkaW9fcmVtb3ZlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgdm9pZCBhdDkxc2FtOWcyMGVrX2F1ZGlvX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAgICAgICAgIHN0cnVjdCBz
bmRfc29jX2NhcmQgKmNhcmQgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsNCj4gDQo+ICAg
ICAgICAgc25kX3NvY191bnJlZ2lzdGVyX2NhcmQoY2FyZCk7DQo+ICAgICAgICAgYXRtZWxfc3Nj
X3B1dF9hdWRpbygwKTsNCj4gLQ0KPiAtICAgICAgIHJldHVybiAwOw0KPiAgfQ0KPiANCj4gICNp
ZmRlZiBDT05GSUdfT0YNCj4gQEAgLTIxMCw3ICsyMDgsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRm
b3JtX2RyaXZlciBhdDkxc2FtOWcyMGVrX2F1ZGlvX2RyaXZlciA9IHsNCj4gICAgICAgICAgICAg
ICAgIC5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihhdDkxc2FtOWcyMGVrX3dtODczMV9k
dF9pZHMpLA0KPiAgICAgICAgIH0sDQo+ICAgICAgICAgLnByb2JlICA9IGF0OTFzYW05ZzIwZWtf
YXVkaW9fcHJvYmUsDQo+IC0gICAgICAgLnJlbW92ZSA9IGF0OTFzYW05ZzIwZWtfYXVkaW9fcmVt
b3ZlLA0KPiArICAgICAgIC5yZW1vdmVfbmV3ID0gYXQ5MXNhbTlnMjBla19hdWRpb19yZW1vdmUs
DQo+ICB9Ow0KPiANCj4gIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoYXQ5MXNhbTlnMjBla19hdWRp
b19kcml2ZXIpOw0KPiAtLQ0KPiAyLjM5LjINCj4gDQoNCg==
