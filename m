Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EB076E234
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Aug 2023 09:56:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06CB63E7;
	Thu,  3 Aug 2023 09:55:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06CB63E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691049407;
	bh=u7gSJ4G5kOxGe4A8IiJ44tCJoQUBLBaaLZwlKwfXh8Y=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZCfbfpJUFcrcCAauk/ZI8Xag77DDMCaMEDTvEyY783PkLdujsd3GB0tCKkzN2EdVk
	 iFlpsRx0ZXEBdv5ciFi1I06ZjcihegDzK1WgvQXZqn/P4XMA669n2jFf1S0dpTVccS
	 nOlo0Q/irhoCVtIbsoFKUo/ZFs/TwnrLUaIBbCDw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 135B5F8015B; Thu,  3 Aug 2023 09:55:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A0A8F801D5;
	Thu,  3 Aug 2023 09:55:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FA3DF8025A; Thu,  3 Aug 2023 09:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFC2FF8015B
	for <alsa-devel@alsa-project.org>; Thu,  3 Aug 2023 09:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFC2FF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=F5BTIUgl;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com
 header.b=j8oL+X67
X-UUID: 251b442c31d311ee9cb5633481061a41-20230803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From;
 bh=u7gSJ4G5kOxGe4A8IiJ44tCJoQUBLBaaLZwlKwfXh8Y=;
	b=F5BTIUgltl4t5Dr32V2LACR4cg+P7UQd2hKp8a/4CA4oWTZiQlaPFRen8wxEmR/S3Heh55fM/rHeV6aGZhsHzsN4+ow3qGpr3/ksjczlku4z28Ru3UK70srBB6PR6YSBTmeHvTyxtvJuZtWj3x+LBZSg3wZ/8pWbUbuO7vJRqZo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:30e43227-4f19-454b-9c42-b9682f953fde,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.30,REQID:30e43227-4f19-454b-9c42-b9682f953fde,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:1fcc6f8,CLOUDID:b31dd8a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:230803155543Z0K0PRN5,BulkQuantity:0,Recheck:0,SF:17|19|48|38|29|28|1
	02,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,C
	OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 251b442c31d311ee9cb5633481061a41-20230803
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1323868053; Thu, 03 Aug 2023 15:55:42 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 3 Aug 2023 15:55:41 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 3 Aug 2023 15:55:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdRsb4tu0RjiDUHJubY0blhlUpLSePV/eg9UdONld7Qg3uAbBgvFEHEWh7D/QwO8hZ6SgYO/POyvX9qunNBXX+nrA2/JrgbDbIIgx+qxn0WSYSnHmNM0mgpAzcUpljvNK89eyauvSDqVt0HTlTWpIDMJYNt8Y3fvTHj7uHv+5GDKEnFv5Mzcs8FMkYk3prr/7uIyIrO/gLCD3A/1OhV2yztBFFY6G78uwt5+gIqHtllaLQmcamPU+IWO26jUxJq/BpKqR1W6J06A9PHP6k6Ds7za0bqwE1UQhxL3zQ0dt8XEVClNE17iFK7vCQh0fzoEglRbiVtz11XrVX2P0YnlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7gSJ4G5kOxGe4A8IiJ44tCJoQUBLBaaLZwlKwfXh8Y=;
 b=YxXz/cCfozMBeM1n+HsFoJ9CZoRsaO8iYntz+nPnmGdPc9uWw3mVgxVf3d+4/2RouKkf3QFJPdsSAinnm4k6CIlWUeHPuMNYQy/YtdKKA+x1utEI/dUJTA3VGwnH4mC2KE8r+NCYsnIjaSGmp3qXpx961l5uM6AO1Y+6wPf2baQP2CfHW1PR85GhthRHGYGUL0whtXVX5hJyoDLRh8MPHL7jLNGxJs5CBJXYz5HTRacwdoCikGDCU7dgqbZTbvi02kQUafeqX1W/kNt/6VYsHOCK02Pk22pgtX0rTIXfjpcOkfmQunF/XZHbvp3qemu4L4Kd/VKJR2i9tMceDuYH/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7gSJ4G5kOxGe4A8IiJ44tCJoQUBLBaaLZwlKwfXh8Y=;
 b=j8oL+X67NJb2BroMTtkNKi5pnugk3ygasLynFXvtlLir6xjVJx5xYh9o1oK/WNj3GlnNVWWkBuvv4DbXTfNCd0jasvWKN9bfgNJNPbyxTpjWSTPNxttfcmDbBtfYao3J+oeqixAVQrEZF+zfF/DM8VUiLZa1fEn9P0mX8+Q6oSU=
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com (2603:1096:4:1e9::14)
 by SEYPR03MB7561.apcprd03.prod.outlook.com (2603:1096:101:147::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 07:55:37 +0000
Received: from SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::a88d:fbad:5956:fd1a]) by SI2PR03MB6686.apcprd03.prod.outlook.com
 ([fe80::a88d:fbad:5956:fd1a%2]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 07:55:36 +0000
From: =?utf-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>
To: "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>, "broonie@kernel.org"
	<broonie@kernel.org>
CC: =?utf-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
	<Allen-KH.Cheng@mediatek.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "tiwai@suse.de" <tiwai@suse.de>,
	=?utf-8?B?WUMgSHVuZyAo5rSq5aCv5L+KKQ==?= <yc.hung@mediatek.com>
Subject: Re: [PATCH 6/6] ASoC: SOF: mediatek: mt8186 modify dram type as
 non-cache
Thread-Topic: [PATCH 6/6] ASoC: SOF: mediatek: mt8186 modify dram type as
 non-cache
Thread-Index: AQHZw/aqImenwcsPEEyjJbN5cT77fK/UZm4AgAPRaAA=
Date: Thu, 3 Aug 2023 07:55:36 +0000
Message-ID: <b48379cf404fd67dd2ee9df6f8a0fac5f89bd217.camel@mediatek.com>
References: <20230731213242.434594-1-pierre-louis.bossart@linux.intel.com>
	 <20230731213242.434594-7-pierre-louis.bossart@linux.intel.com>
	 <db547382-40f8-4dd9-962c-deedd7fdd50a@sirena.org.uk>
In-Reply-To: <db547382-40f8-4dd9-962c-deedd7fdd50a@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6686:EE_|SEYPR03MB7561:EE_
x-ms-office365-filtering-correlation-id: 93ed34b6-c4a7-49be-23d2-08db93f705e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 T2mTqBEDDt7BKK9NR7ojuDAJSJCTy0ux5M9blefgJxbZyQK0EnpbJSfQhls7GCBRswagYaqAm1FEK1pmMfNTzMSrERmuvRRwYyf+bfVKP+3hNeI3iJyHSLaPSjku8wT0V636zT3LB3ZWxup7iU7IUPUukqU2D+aPsFZGO3CTKSqsFDYvziJTjd63P31wqDRvmzg1hZxAHQdrGttqWD72LSmdmCmhJ4GXquNQf4QgMfgdkWeFts+gjL/HpY6HZACudbO7Yko5XoavjQlXt/Cq05ZU13coAqkSwsEn9WqlZh73RXG1AU4lXiG354b0hLjjsxnctPeVFd3+4Cz9D/Hwlt25Aqj0g05a5wy5IrLj2GowsqM8FCYx10W8SaSh2AbGzg/aqqK04wZZFh5Nh1LsdfYtZNNc1QdVcrwr2Rwin5cGkp+tpsdMf+0atGN+Z8ASfYcCz5V3kScvogUi3VO1x8jg8RrGnUNGa8ba2SkVObY/w/yCxC02y9HQwAQAUZT2bz7ev8oqn4d0/Fbpc5LJjZ4J3m7FYuM0A8vK8omzEBuX7gTyKOPJTKp2sbrRlVsNqAx/cgoKoCjer2fjEycXsubqjXlP7IynsIeyqI1tbsuDWakReIyfPXQzV23SPOvuWS0mqDBYjh/I/zYOQLV/VpY78peuJ0fxnmxYGEBBH0D9YQ9gI1gef1a3Sslq7UmZ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6686.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(122000001)(6506007)(26005)(38100700002)(186003)(38070700005)(107886003)(2616005)(83380400001)(2906002)(85182001)(36756003)(4744005)(5660300002)(478600001)(8936002)(8676002)(110136005)(54906003)(86362001)(6512007)(71200400001)(6486002)(41300700001)(316002)(91956017)(64756008)(66446008)(66476007)(76116006)(66946007)(66556008)(4326008)(99106002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZWxVNFpLS2U4OFdOSzVVd3ZhYi85UHpXbEcvbU5mbmRzdExJWTM0a0ZuQWJK?=
 =?utf-8?B?Mkp1ZmNLZ1cyeERDN0thcytnM01xQ2cvRUx3SStVSWN1djZ4QWRmNkFPYXls?=
 =?utf-8?B?Z0ZsY2VBeXhTRHlvT0t6ZzVCYlRMblM5UlBzdUJiQ2J4K1hnRE44UzF3N0Uw?=
 =?utf-8?B?QUwxZFdxUnAyWE1LOFBqUzQ1MnBnRHdhOWxRQ3N5VGZBcW9GaG8za2crZStV?=
 =?utf-8?B?eGdyVS9JKzQzTFhMaGVHc1Q0UW9ZVFFjb3Zrd1Qxd0ZLQmVlWHVlcDhyNEg2?=
 =?utf-8?B?cVVCdkRUM1U1cDhld0ttT1lnOFlVd1paREhvRWJLWlVBUlRaRVN1MjBZRHo0?=
 =?utf-8?B?aE9GNFJDNksycU1qdDA3WXRyV1N6ZjFEUzJIbW40WitJS0tpQXY1aVdmTThV?=
 =?utf-8?B?azI0Tm85ZGNMTGY5ZHNMb1RNN0QrU0kwZkxXa3FVU2lUUHBLdVVSWlNWYnJy?=
 =?utf-8?B?ZU95MmwyNUlTK0FFVXg3WEhJQVdwL2ZmWnNmakdTcXFPK3c3R01tMWwwdFB5?=
 =?utf-8?B?SnZXMndGRWdqd2pobitsdXhidnVnMEtOVUc5V2RFNHVjVDgrUjJ5Q1ErcDRF?=
 =?utf-8?B?NER5QVg3OThjcFowcmxpODlNY0NRRzJ3bnRWQ1RmdTB1by9pQkpESXQ3T1dr?=
 =?utf-8?B?em1IZWtuU2dBbi9INFBmcml1NXJWdGpiM0crWVRLek8xZVlHUUJYS3NWMDU2?=
 =?utf-8?B?dTRYMFZDN0JPOEtodS8xdFE1MFRrbnRodkUzZUNxbUpwa3pPLzY5SXhld2Yy?=
 =?utf-8?B?STJ4Zy9vWkJpS0V5eFlPUGhNTkcza3RzY0d1eUtSRVVPMWpVUldLbkNnOEtp?=
 =?utf-8?B?S0pBemR1VzZiREVneVZkMWdGUEtHclRrSDI0VENVMkQyKytIZmY5OEx0NkY2?=
 =?utf-8?B?ZFl2dWRGbGJaZ28zbG1WdlhaM3A5WkNHZ2NjZkp3VCtVRVNkVmYvZFNhNVR1?=
 =?utf-8?B?S0hlcmdjOEFpSHNxbG1udk0zckxBaEtvcUZuMXZnQnRyNzlDWXVTbUdsazEy?=
 =?utf-8?B?Wncxdi9CcDNwcVZLRDVGWTk0MWQ4SkxFU3JkMStvcWRQQ29KVXJ2UVFpVDgx?=
 =?utf-8?B?RnF2YVF5V3hQVzFiV3ZxNkt6Zmt1WHFPQ1REaCsxcG56cWlONm9oQXdIU1lk?=
 =?utf-8?B?eWtDeTVRWUdIa3F0QndYemc4c2M2azFSQVluQXA5cHJKa04rWjJBTFlZa3Fp?=
 =?utf-8?B?TGxldEg5YUw2cUJWbHBObkozTzdBMG5JOGxUQ2F4ZTVjK3UrUUp3cEVOSEpF?=
 =?utf-8?B?U0tQbDRDdktrNUZTcVNyZUE3TENPWDFzdTZpZUw0UkFEczlVSzV6Nm9lM1dG?=
 =?utf-8?B?Q3RVSzJ6Y3hpbTdVM2ozZ2hXY1FSZ25UTFFMNGxTbkV0SzZGR3hIN2JaU2pq?=
 =?utf-8?B?QjZZSlFYeS85YldzQXpSRlNubUlXYS90OXBSQkpLZWUxbWRpYWNZR3c5Zkhq?=
 =?utf-8?B?Ykx5dUJOdjd6RERxK0JWMDFnUEhNSVF5ODRKY2s5LzlSTTBZMUd0L1BNSDVC?=
 =?utf-8?B?OTd0K1AvSlE5QU55eU5NSEFFRE1yOENucEhJQmhNOFdhS3R6R0VOTWVubWtP?=
 =?utf-8?B?aU1lV1paQW5Wam1wUGdNSWFTTGJpZ0dOOFhxUU90MTUxUUJQVXI2ZEVXTzRH?=
 =?utf-8?B?WnBBYnFzMTg0NXhrZXEybmlCTnFFSHdia3BEeGpLcVp0VTBOTnlUQzczWTVv?=
 =?utf-8?B?ZGZqR1lMSDlmR0RTdGVxbGR2OUN2eERXV0dyK25aR3JZakwwQVZ5N0YvN2c5?=
 =?utf-8?B?VzBVeW1sV0w4RHVFUlV4b09jNmp1L09uTnRxY0N3cmxTSnRZQWtwT0Z4VVk1?=
 =?utf-8?B?OS9aeGNBcHYvaXdPQVd6dXFwaVMwT1NZencvMFVKWk83VEhVZHQ1aHdoR3BU?=
 =?utf-8?B?elMxQ05TbU1mdnNteXJvWlFFcDBtUEx4cmROampPMTdENzlmdUxsN1htcXkw?=
 =?utf-8?B?QjNkS2NuNW1RSTcyTDl6My8rT3k5aWo3b01oR2ZuenFWT1BJVWhBY2o4T1lq?=
 =?utf-8?B?QTh2WGpNMm5oeTZsYW5zZzVkOEtseFNOWTlEQXpKc1lRR096VUI2NEE4MUla?=
 =?utf-8?B?a29zeUxnb2ovbFJyOWpwZXFhaDJyQ0ZPOUhOSGtIM2Y0YXdUZjZvTTJZM1Uw?=
 =?utf-8?B?L1VjdEV5QWV2N3QvNFZPZ2tCRmxWYUlzVXJST095Z0hranY1RFF1QUFJM3l0?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E6315E36CFED2409B7BDCF7F7DF3EAD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6686.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 93ed34b6-c4a7-49be-23d2-08db93f705e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 07:55:36.8105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 P/9+mgCCegDXpHx9Wh7/fKhL6A+oKikPEILRUlzP6qPAkLqD7z50wwvLaqaa9oWvkCrLOUA08Ai+Reju8sQVDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7561
X-MTK: N
Message-ID-Hash: S34LSLAGBXDIVWFH7DIVJDUI2WDVTKES
X-Message-ID-Hash: S34LSLAGBXDIVWFH7DIVJDUI2WDVTKES
X-MailFrom: trevor.wu@mediatek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S34LSLAGBXDIVWFH7DIVJDUI2WDVTKES/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gTW9uLCAyMDIzLTA3LTMxIGF0IDIyOjM3ICswMTAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBNb24sIEp1bCAzMSwgMjAyMyBhdCAwNDozMjo0MlBNIC0wNTAwLCBQaWVycmUtTG91aXMgQm9z
c2FydCB3cm90ZToNCj4gPiBGcm9tOiBUcmV2b3IgV3UgPHRyZXZvci53dUBtZWRpYXRlay5jb20+
DQo+ID4gDQo+ID4gVG8gcHJldmVudCBpbmNvcnJlY3QgYWNjZXNzIGJldHdlZW4gdGhlIGhvc3Qg
YW5kIERTUCBzaWRlcywgd2UgbmVlZA0KPiA+IHRvDQo+ID4gbW9kaWZ5IERSQU0gYXMgYSBub24t
Y2FjaGUgbWVtb3J5IHR5cGUuIEFkZGl0aW9uYWxseSwgd2UgY2FuDQo+ID4gcmV0cmlldmUNCj4g
PiB0aGUgc2l6ZSBvZiBzaGFyZWQgRE1BIGZyb20gdGhlIGRldmljZSB0cmVlLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IFRyZXZvciBXdSA8dHJldm9yLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiBS
ZXZpZXdlZC1ieTogWWFvY2h1biBIdW5nIDx5Yy5odW5nQG1lZGlhdGVrLmNvbT4NCj4gPiBSZXZp
ZXdlZC1ieTogS3Vhbi1Ic3VuIENoZW5nIDxBbGxlbi1LSC5DaGVuZ0BtZWRpYXRlay5jb20+DQo+
ID4gLS0tDQo+IA0KPiANCj4gWW91J3ZlIG5vdCBwcm92aWRlZCBhIFNpZ25lZC1vZmYtYnkgZm9y
IHRoaXMgc28gSSBjYW4ndCBkbyBhbnl0aGluZw0KPiB3aXRoDQo+IGl0LCBwbGVhc2Ugc2VlIERv
Y3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0IGZvcg0KPiBkZXRhaWxz
DQo+IG9uIHdoYXQgdGhpcyBpcyBhbmQgd2h5IGl0J3MgaW1wb3J0YW50Lg0KDQpIaSBQaWVycmUs
DQoNClRoYW5rcyBmb3IgeW91ciBoZWxwLg0KSSBoYXZlIHNlbnQgdGhpcyBwYXRjaCwgc28gdGhl
cmUgaXMgbm8gbmVlZCBmb3IgeW91IHRvIHJlc2VuZCBpdC4NCg0KVGhhbmtzLA0KVHJldm9yDQo=
