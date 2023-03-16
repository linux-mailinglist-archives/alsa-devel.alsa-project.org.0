Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2616BCDAF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 12:12:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C12DF115D;
	Thu, 16 Mar 2023 12:12:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C12DF115D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678965173;
	bh=oQsQzj3WtQwAdAX3XENYoz9PYyU3EIhdNfeeDTpiXss=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=sAnBaoiatETm4A3NZhXPu3nAPDePDSkpKvnTsBjww+xlDmnlu4gpoSCrHgS9pUmBG
	 /oC2nIHa9aB2Xt/y5GVExAQ8i/GUSxLXnlKpuiX+Xu2NIoQRB34Pv6gC8e8R8jARmp
	 Zx9UEuZ34YgmInA8o+rZL8x34TbM1qFOnwM3KcPs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA5BEF8057C;
	Thu, 16 Mar 2023 12:10:31 +0100 (CET)
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 030/173] ASoC: atmel: mikroe-proto: Convert to platform
 remove callback returning void
Date: Thu, 16 Mar 2023 11:10:22 +0000
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-31-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-31-u.kleine-koenig@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVRK2LELMV2PCA6RONXUAFVTIV7GQPHN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167896503122.26.10974116217877877568@mailman-core.alsa-project.org>
From: "Claudiu.Beznea--- via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: Claudiu.Beznea@microchip.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F550F80578; Thu, 16 Mar 2023 12:10:28 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 448A2F8055A
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 12:10:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 448A2F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=DRvQuuMZ;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=smhPtEXc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678965026; x=1710501026;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2Hv5tDivlytSHg8aELrVVxJEeyrWCZEQyvv3DeBUpNM=;
  b=DRvQuuMZ4q0rmJgRkwh/svxItR1EhfIkO4Etj+xE4lTrutcpysfrxuk9
   MdXru1WE6ZBZflQ31L72ER6rTvqXc36M1VlIloBRz0la6yko0sbkM/zg7
   5H8KKFPYqdMwp+bGC4PR+iI1JfVklGS/h3AJGyrnr6wLyRGD/Ak8kct/D
   yTSbjlo8H46k5A/sR2ojSiTN1yNge/FnOKIAGnpShoITpqi4eHkLFldka
   cM9peRRyBbHbScLrjEoYGlidqjrMl6YcV/qj0Ma+3rGj+lN5BDvRuCpFj
   /OiSvNoRA0NA8jBEapNXy2iknJ8YZb5P25IQffyU8/t97k0b3ebVosKya
   w==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673938800";
   d="scan'208";a="201944501"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2023 04:10:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 04:10:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 16 Mar 2023 04:10:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaQHlH3S5oOgNaNstXwUkJlLzUJ4fOpANZXVO4cnaz4wLXum5MfINfh5QnG+YBZJRQGDjqUThmxse8HR8Wfw+pT8M/iZObe3NQKPkZHAykd0EwQHktt7gLa4kTT04C9NgxVCkUXtXdCqGMWhJhrJtV27Cf/xlInfMhCqrN46o+iKcZYa/KKhGp7SbhjQ/YgMnGTxl+5EXYPpgI3Z290OAm1EJPUQg520pFbuCAaTWV1+hnj3Q2fiFYMRkBf/GpHt8z0SHuyDN7V1ptLO9BA4Apl+q3gKCa7c1tm3QuEeCHmRaeLBD9rSrAwhfmTcC9cx5hy+yP0lRZaXJ9TaHu+StA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Hv5tDivlytSHg8aELrVVxJEeyrWCZEQyvv3DeBUpNM=;
 b=WHeut34P3XaOHBdBcjLv5XSzXVox+7ZSoLK02aDw50TXZ6pAiEhGWQ9HBo5AGDNEUuRt3Kd3qEi4ZCHihexkvoNSTP3PivVW/lXi5sm3ZDUgkDxmlf7j8bplGLEQxRiC36v0jTt0xzv6FQ5bv1Mqq/uZ97C1izbvNvG5eFQCipWqpeB2M3Wwk5h7Ubk+1QDWPU9VZF5Bnfqe1S4KWnazYIe+A1lzVtq6X6D+WOHceFGpYvAzM7pLoAEpxYph3T+NobeiBOLv+COsWfaC8shpL9W7XupGm2IizKsWGpXVjC4M3Ra3PqPIEL2/yJin8bHsWERhuboB5J9uWLYqetRvkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Hv5tDivlytSHg8aELrVVxJEeyrWCZEQyvv3DeBUpNM=;
 b=smhPtEXcYpbenhEXgxfDGxWIluJNBjnltFXAf5DaDZpbUyFUKMOO74aDtufvR8Z8qtJcWhpcMKIvKdpGEBRAlO7oVExK4gTxGFV4yxefewUG2NzQnFhisd6FVxoHaik46z7ToD0HMV/XhDqEKVKy+Rkg+56s2ngjxBiYurK0Df4=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 11:10:22 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:10:22 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 030/173] ASoC: atmel: mikroe-proto: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 030/173] ASoC: atmel: mikroe-proto: Convert to platform
 remove callback returning void
Thread-Index: AQHZV/fmWEJ51ErlM0SEfGIeQMw+pw==
Date: Thu, 16 Mar 2023 11:10:22 +0000
Message-ID: <7b2cfd7c-c2e3-01d6-5b97-5253e8563759@microchip.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-31-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-31-u.kleine-koenig@pengutronix.de>
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
x-ms-office365-filtering-correlation-id: 92d53cc5-f40f-4ae5-6650-08db260f0916
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DYyoQUg21NDXggDp5SN2iAoXTXb9+0fHrpVH08Z+zbIMJdEWioTVXTXUjsbBhDmbENGOLoauWVkZk6Ufr2qh0prNiZthGvo6UxyJrBfXbmoneMhe6obafuFEl4chRYDKE2ZLyVIDKEVckPq+LmkZOzvHFQQRHOCO6QL5fqSGO+YTztQoDIUFmkAvbKLC/4diBntd3Qkg2debXl120uDd23sr+1DSoUCgH8tXtuKeIkHl1YkKg66hJlJmjYoXbyyDLZFDQwZNruL3FCg0WRB0PVeNDG7IBlbeWit4WuKjkyiyhAacE+igGb3u6zbW3nGDIlSjzwceEK69qHOWYa/78rcHYKpBfFCP7GHE19P6EM7g6EwfY+JPftfeZj6rQlFv14W7mVnKlLAOHJQGi1QdJ7Ta1hld8639nppYpBZO6k8FeqgT8BJvQzGSOrEFqSsk4cPyQL/QEHe0DvZoOBX3kzpx0v84uzr9wfSa1HJ64AXY9ITFNc6UsvnPygE6i3M2HJJcPfpx+Xk70bM/0DfayQtzfV/5WS8I1v763bgOtQRuaYFUnKIjLI+aLhh5m+UyG9mpxJ1SFbm4OjsDgsPoNnH1EUQgV9MNI/EdHQUs42yWv6rdGt3MbL9vS+qsx7lFqrKEg8ufhRT90zvjQrmXxZ3+IhL2IIrSHkkMb3mjU+jhLcHCwmhgjvQFuPPJvqVUg43YQL67h33CBbwkzvyZFdCVxwgF4ac12STlHrhmko7tPtAeEqGQ4kWXsaVDAPZQpP5y2z3Zxa36BCHGMRxYnw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(31686004)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(38070700005)(31696002)(36756003)(122000001)(86362001)(71200400001)(66946007)(66556008)(66446008)(76116006)(66476007)(6486002)(91956017)(64756008)(110136005)(8676002)(4326008)(2616005)(478600001)(6512007)(83380400001)(26005)(6506007)(54906003)(316002)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bXA1UGZDVjRzR1RhWkp2dmZ5Q1ZEeUlEY2RtOFdqdTlwdnUvODljd3F0MkMy?=
 =?utf-8?B?QVcvckZoamFnNnBjbU1jZ1lQa1dXTXN4NmprSGlTNFlsWHdKQ2VtaWlVcWN4?=
 =?utf-8?B?Y1p5cHQwMTlkaVJyZlhsTGhoZWoyNGx6eFppMEJVWUY1V3MxeG5BeUFkLzUv?=
 =?utf-8?B?T2dMaU4rWDVJK2JobmxjSWFhVFYybXJFVDhHK0UyU1FuUUFZb1U2ZGlMNERG?=
 =?utf-8?B?V0V3MjNncUZKM1NPaU1TVW54Z3JHMjlLWXQ0Mkd2c3UzQWd2UUhKRkF4eDFq?=
 =?utf-8?B?T0dYQnZGc0o1SWdvYjhGdHV4TTByUkJVaUJ0M25KVE5CSWV0SjMrVG8xdUxI?=
 =?utf-8?B?d0w4b3ZxbklHYlZaRWwyUGpMcVFGRnFhc2ZRWnFpenIxZEhCdTE2K3ltbzQ4?=
 =?utf-8?B?RUc3dit4K1p2dklEYmgzejYwd0lIUkpSSlFxV1lIcGJWcXFieFdqUVhJOC8v?=
 =?utf-8?B?OVIwcWpNd0tiUVJ2RWlFcVZjUXJOMEJwcVI5dEMwdGFpdmIwc1hVSU5qbHRk?=
 =?utf-8?B?NGhXSFFBNmFZeWFyTTJUS1g4cC8reUorMVl1RkZYdEN5K0RZVUFBT2E5T0xq?=
 =?utf-8?B?K0Z0akZzZGtnemRUSFJGaFdSTUpOVlhvZlJoRHNLMXI3RjJ2dTN5bzRKSHcz?=
 =?utf-8?B?YU1YNHFZTmdIT2JZY2YraFdTbCt4a0o2UnhUVzdaOXBkNFkyOVVJUE5CNS9a?=
 =?utf-8?B?T2Q4L3c1bUY4a1hWMW9LTmROMTBsMkZXbjNmcUh5akpDV2tZZ2dWVVN2REE0?=
 =?utf-8?B?bmZ6b0dCK2VJVWphOTltdlZ5dk03N2pPcXlTV2w3SWo1UTlzNk5DRytRMGRn?=
 =?utf-8?B?Q1lpSXlGeExQSnBadVZNTGUwdHhWZnJkaTRFY3pNOVg5Q3kxRXgzTWkwZ25q?=
 =?utf-8?B?dEIydG92UnREbFJuc2JGYUcxL25kZUg0ZFVpNUp1U2I2djNnUW9KZlFCbEln?=
 =?utf-8?B?VXRqYm1aZXRVUUZ3cm1oaTZacC9XQStsMEhleG9vRCttTU1Tc1d3cHNOYTBL?=
 =?utf-8?B?VEJubTNJcWxwZ29MYkhRZVJYc0Ixd2FleHlXMkhNRjhWa1dJV0l3MXZVYlhq?=
 =?utf-8?B?bEcycENCTXNnYVJYYm5LM1dDdTJsRGRtTWR5RjBnV1ppaSt5cEs4Z2RIOThW?=
 =?utf-8?B?dERNUXBjMG5CVFNUd3liSVh1N1d5Y0lqWnNVSWhkeDlhSHMvZ1lLS1ZXQWtm?=
 =?utf-8?B?eGNESmw5dGFjclQ4cjMwWnVwMG9VTm9oUFc2RFBhZEVZRG16aUNUQXNTUVJ0?=
 =?utf-8?B?U1hYbWw0S2Q3T3NLdER0VGxiZmoxZ1U4RzBwT3NSWUFCbklWVUR4c3JzNlJU?=
 =?utf-8?B?STFFWVJ5TmtVWlZtRU9udk0xbjMrYjB1QjBqTUNTUzRkVGNIeU1DOU5ySVNX?=
 =?utf-8?B?bUVOY3ExQnFOYnRXRUF5Szh4WEY3VURMaUdvWjlWRGdTZVMwWGtYVTYvcmU5?=
 =?utf-8?B?SmlvR3FzRHJTSm5wdW9PSmhwb3MwNks5U1hNOXE4RGcrZ1pjbkJ4RmJ3WmtX?=
 =?utf-8?B?eWhReTkwSFBOdE1LVnpKSWlPZVowOTlSczNrZFFTY21QY0xibGRHbDdCTm4v?=
 =?utf-8?B?dWNjNXJlbzJMNnB4ZHVaTmJQQlpsbGFPQWpjSzlqT3BNdEZ3SUk5Y3l4MUlF?=
 =?utf-8?B?aWFZSTJONWwxQ1RnRlJ4VmRwQ3NYR2NtZnVoKzBua3lxVnZrcWxlV3pCalNr?=
 =?utf-8?B?ZnBoZ1R3Tmp0WnI4NGNmQXc2Nll2d3ZLcUxLTVQvRE9rVEZrYVkzdzBUNk83?=
 =?utf-8?B?bXptUDB4QlpHaUZTa296akdZaS9QSThvTDJjcjBLS3RpOU9sWEM1SGJvNEo1?=
 =?utf-8?B?Q2ZzMXhGY0xoU25qdzROanRXYzJneTVNeTQ3cDRUUVRSSGVHU2w2bDJINGZ5?=
 =?utf-8?B?Q3U3VEtMMHppM3Arc2U5T0ZZRVdLWFJsK25OcUtrbkprSlcyemRYeDlZU1ky?=
 =?utf-8?B?N2JDYklud2xBNk9ZbG5MaGpRMmRWamR6NzNDQlZNdzdTajFEdFVoSlNaV05i?=
 =?utf-8?B?OHFET3c1S2J1QmU3dFBraklQSktPTHFUYTRqT0FUZm1SZTNpYlQvV2N4SXJP?=
 =?utf-8?B?VDQ4dHFmYlRGcWRmdGlzdGd0UjdOVGk5Z054SnljQ3c0citIdExnWFBjdXlT?=
 =?utf-8?B?QlFjVVBSejEwSDRPRjcvVkdBMDZWekI4WnE2dWJKSnd5d2hZMDFPYThZMUdo?=
 =?utf-8?B?aGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F18A1EF7826DF046AC675648F13BADE5@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 92d53cc5-f40f-4ae5-6650-08db260f0916
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:10:22.1260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 kz2gbonYsA8QiyipOTtw78+Uvwbi0PiexFF0Cvs2aegzC07Vi4dl14AQxNBiRZoCqL0/LSulLyOfKJeEkCBTRSosvWDa1oKmO+PnyIRbZfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
Message-ID-Hash: SVRK2LELMV2PCA6RONXUAFVTIV7GQPHN
X-Message-ID-Hash: SVRK2LELMV2PCA6RONXUAFVTIV7GQPHN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SVRK2LELMV2PCA6RONXUAFVTIV7GQPHN/>
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
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgc291bmQvc29jL2F0bWVsL21pa3JvZS1wcm90by5jIHwgNiAr
Ky0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvc291bmQvc29jL2F0bWVsL21pa3JvZS1wcm90by5jIGIvc291
bmQvc29jL2F0bWVsL21pa3JvZS1wcm90by5jDQo+IGluZGV4IDk1NDQ2MDcxOWFhMy4uMzBjODdj
MmMxYjBiIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvYXRtZWwvbWlrcm9lLXByb3RvLmMNCj4g
KysrIGIvc291bmQvc29jL2F0bWVsL21pa3JvZS1wcm90by5jDQo+IEBAIC0xNTUsMTEgKzE1NSw5
IEBAIHN0YXRpYyBpbnQgc25kX3Byb3RvX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+ICAgICAgICAgcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgaW50IHNuZF9w
cm90b19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3N0YXRpYyB2b2lk
IHNuZF9wcm90b19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4g
ICAgICAgICBzbmRfc29jX3VucmVnaXN0ZXJfY2FyZCgmc25kX3Byb3RvKTsNCj4gLQ0KPiAtICAg
ICAgIHJldHVybiAwOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkIHNuZF9wcm90b19vZl9tYXRjaFtdID0gew0KPiBAQCAtMTc0LDcgKzE3Miw3IEBAIHN0YXRp
YyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHNuZF9wcm90b19kcml2ZXIgPSB7DQo+ICAgICAgICAg
ICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBzbmRfcHJvdG9fb2ZfbWF0Y2gsDQo+ICAgICAgICAg
fSwNCj4gICAgICAgICAucHJvYmUgICAgPSBzbmRfcHJvdG9fcHJvYmUsDQo+IC0gICAgICAgLnJl
bW92ZSAgPSBzbmRfcHJvdG9fcmVtb3ZlLA0KPiArICAgICAgIC5yZW1vdmVfbmV3ICAgICAgPSBz
bmRfcHJvdG9fcmVtb3ZlLA0KPiAgfTsNCj4gDQo+ICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHNu
ZF9wcm90b19kcml2ZXIpOw0KPiAtLQ0KPiAyLjM5LjINCj4gDQoNCg==
