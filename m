Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D67D76BCDB1
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 12:13:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB278111E;
	Thu, 16 Mar 2023 12:12:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB278111E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678965191;
	bh=6f0d0IRwQ0JiL8HxWaIBSeuo4ZWFtoRtP7kzAjDm+FA=;
	h=To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=pyGdRCv0MuVhMAwiCsajySJAHFk2XD380NDVs1OvxUju6+WO0Cf+oJHIz3mDL60WG
	 kY0GhxP1/s4zu2QyFbF4XTe8ph3HmzbhEW67aDdTDUyTBxbnfkK6Kcgmoi1TiUjl4S
	 621qSQGuJ6l5R310CWwWBvr5mT4r/epvYpj3nhrE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28D7FF8016C;
	Thu, 16 Mar 2023 12:10:51 +0100 (CET)
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 032/173] ASoC: atmel: sam9x5_wm8731: Convert to platform
 remove callback returning void
Date: Thu, 16 Mar 2023 11:10:38 +0000
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-33-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-33-u.kleine-koenig@pengutronix.de>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WW2Q4ZDZSKG5P5WLNXX2LG577C4YP5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167896505078.26.14032561956896627589@mailman-core.alsa-project.org>
From: "Claudiu.Beznea--- via Alsa-devel" <alsa-devel@alsa-project.org>
Reply-To: Claudiu.Beznea@microchip.com
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D8C3F8057E; Thu, 16 Mar 2023 12:10:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D4F7F800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 12:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D4F7F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=On9wcEhw;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=O3RSSR/j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678965046; x=1710501046;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=h81WdLezsv/QPWVijo2I/AIVPpA1lVap7dXgp5GRpB0=;
  b=On9wcEhwzjx47ekbRQBQH9k1LpCf+FvnjLf1T7acgOSmhNqpREJBNf+n
   lU9mj/MY+2cbbihjEvU/WIHjFa9c7bYyC/qN9LD30VdEVOJ07elsammBi
   ZpEIb/zgfoQZAoRTvx1wlIfftZzK2pOFYBuk335/aE5BUzHHLM8oFxr+O
   qA+9V0XOQcSMuNB0hlfVdSHcGDLie3/A2jAcPK5pDiLcraNvi0MHgzoW0
   blkopIYIpoxWXvjW91QZCzGyXiAICpCbpMGZKuJpT03ZSfCVrqYIDOVv2
   0CdwOUa22BX908t8sW7Nh68npnojlc74vYncMrFkc+N3+lRojrgYgyTAm
   g==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673938800";
   d="scan'208";a="205027075"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Mar 2023 04:10:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 16 Mar 2023 04:10:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 16 Mar 2023 04:10:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmI+dJiWrJQ73M4YsFjSLdoMhkzcOx6zWmPcEgT0Fi/93BaeADjyj3hcqyVQu2kPxfqYKoKStb8V1f88uudok5Kj5xsea4+QjqMNmPbqNGSEpgSz+9PxsysGvevwS1bEma/cUU2yH9cciyJ10u5SoRCibjjFnwsNR/jXqshPu6ekUXp5EsZvX/A98/1Xr/ObkWVA1awqlD3xGPpT5/+1FsdKuUL7mIMB71nSK6Wgj4JvAmVeThQfYbig1PRiIhiosVMGryKLzWDBE7oLKyt3qHuhn2E9aPl+5mGf6f9CNASbSh6TE+fsyhaZhi/fO7hYNHEHOST7OCnH5ROyp3aKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h81WdLezsv/QPWVijo2I/AIVPpA1lVap7dXgp5GRpB0=;
 b=NqS78ce9OgA+YWWGYQ+zAgoFmGbojtniN07pFhKdEuPEmVhsC2JNA69VquahkUDoP2lDba8HelO+W3t7xTGNIsr9kn9kbpXl+Qc279aBRrbqZhBoXRMtTxKZ25o17ihl5OcFi4MdBY/KPk/gCtFIRTkrOtpzwbvThkj7gWNQY2RuN/bXpdixJIXVANufQflVEH8k5Lri4SMfZx4SibB7fyeE+JZ77tulWvTLZv7TMkvSkSsr4shpa5rYeYp9D8UTyQvu+zfTCP7ynuwWCTnTXDuLGoJWXe2JBaCPLV+ut/3QdbOt2hI5VXJkM9cd49saN4LacU9SqyfuxDRoOY9a6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h81WdLezsv/QPWVijo2I/AIVPpA1lVap7dXgp5GRpB0=;
 b=O3RSSR/jXc2evV7WPTLq5iK0x3+nRAC037PAvq4P21zas8a6o3yxPnBp+RIH28EjCpSYTswO524/R6J0Le8PB7jrXhqjGhBvb/vMz7118kizAnIIvUesBpEvmb0v84WDwoxlbV0jza8rg305MGTTutQ8SyExPjUTyy+mu5YTkO4=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Thu, 16 Mar
 2023 11:10:38 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 11:10:38 +0000
From: <Claudiu.Beznea@microchip.com>
To: <u.kleine-koenig@pengutronix.de>, <codrin.ciubotariu@microchip.com>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 032/173] ASoC: atmel: sam9x5_wm8731: Convert to platform
 remove callback returning void
Thread-Topic: [PATCH 032/173] ASoC: atmel: sam9x5_wm8731: Convert to platform
 remove callback returning void
Thread-Index: AQHZV/fwOyiHvgHpPkKJg+wPNGsJNA==
Date: Thu, 16 Mar 2023 11:10:38 +0000
Message-ID: <41f770fd-4463-1c1b-0738-33bd065f47dd@microchip.com>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
 <20230315150745.67084-33-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-33-u.kleine-koenig@pengutronix.de>
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
x-ms-office365-filtering-correlation-id: 0003af9f-8dbe-4bc6-5266-08db260f12ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 d+xy3cHqqyUbQ53gCIaSc5VV9xWoAV0MAAPp77OUoyuOZF3KdqPO5KfO7eXp6X1i7/v1NJLijHjwtl7dHA+hebMyC1B0Pmn4FDeV8Vh3hNcjj1KdXHOnkXiZ0I9Q95L37mGN8AmvG9FoVlAC5PPsVIC7zzN9q7JiBIjaSeBvNGeme++cnM4mDtsc7iH9+CQsmj62t0EKb3Uyn4aoDdYTlf5ZdtQGzRCZHnqcEby8R5nPKJhTWCVZRNZV0GKrHQCOX+gaHL1NXyx5QivWKqPY+BGTaNHqgw+ROz/JzJwd1MXR3AAHSQzVwmMj9oxRUEKYSH2MsCQnRfy5FOK+3BY1OpvCmmG5CYl2BRP/AITv2WUPL+9ix9QMNtFjZJSvZlc0seTXfpgLXdGzdGOAoQEzDje1bKxzj9c2tR/iHvQJ6ENWji1xV5MwfYd5pAibR75giAAZpri/5gRbCN0AbtBnCPv7luMeICnhPZ3KLc36GXRwuCgQK+BVjQqOAiGNBQcLWhCdOGSS/rHDwN+4pQFMS1D4n6NHv/O/KlNlWvFo3tSbDcL0TA8hqieEboWr2mejjrN8KcMF1dvhFUe7coLyd2Nxk3RIMcuawWoy2bOos/MWp8XDdRvXn9znZnHogvlc6Jnt8Oj1LN1Om9VWMcCQ27cDLtsawj8O28B2MNGy2crRLaucse17tTVDCG6ncqFHxZXA2UDbOcL6JsWKa62sa/UTCsU+IyDaksM7F1bkzZWWSvT3stW8eGQCIkuJ5lOJZO0l1wL7x41shpttrMUMaw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199018)(31686004)(41300700001)(8936002)(5660300002)(2906002)(38100700002)(38070700005)(31696002)(36756003)(122000001)(86362001)(71200400001)(66946007)(66556008)(66446008)(76116006)(66476007)(6486002)(91956017)(64756008)(110136005)(8676002)(4326008)(2616005)(478600001)(6512007)(83380400001)(26005)(6506007)(54906003)(316002)(186003)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MmIrOXdrbEkrZ0l6RnRqMU83ZVNYWml3ait6TmZrR1duSXFYRlh5WE8wMnIx?=
 =?utf-8?B?aVdQSUJxNVNQWnZGdnF6YjhyeTZxckxualBtTml5T0VML1ZZRW9tRjlhckM0?=
 =?utf-8?B?MHZlVkJQOWp3TzdPOEUwTTYrSDFWOS93TU5teExkMDhLY3I0ckYveXV5Um5z?=
 =?utf-8?B?ZnVVN21DWkxHdy9DUEtmc2doYUJSVEhhNm16QnhlUU1VenRVL3pxeWNLNmhm?=
 =?utf-8?B?NGtmVWRxbnlZUlpoaVFRMlpQSnRRdDJxZ1VQcTVmcXB4QTdkRnV3TXBwdC9C?=
 =?utf-8?B?UTFKUTBrRTM0eGdBbDgySVVkZjJaSldvWW5GcUhSWW1tSnpuMnhpVVNvQlpy?=
 =?utf-8?B?NjJTWnVERU83NGFRQ2UrbU4rV1JZeTc5aENoMTVoaTcrbVBhU0NsZzYxNHAr?=
 =?utf-8?B?SXpvT2FWNThjM3FCb1prU0xlN2oxeVFLd0N4dGpXUEZDcFNUK2lCeHFjUHJh?=
 =?utf-8?B?SlJnZEFjaHFyb0Y0SG5LV2JGdTNqMjlzYlNVQ0lxa2ZreGZLaWFtaStoRlV2?=
 =?utf-8?B?MGFobHZ0c3VCWGZYQ01xeDFIeXpRb1pEUmwyTXBzTHZ6YVpsczUxak1tdldz?=
 =?utf-8?B?MGE1bXFJd1FGbFpNQm9pZ3pGcDVETm5RekZhRkJhT0ZGSWhoSk1DL3hCMWdW?=
 =?utf-8?B?ZkFHd1JCMEdFbDVQRmdrK3QycWpNajFCYjNERHgvdHdhcGZBYS9VaXdwWnZR?=
 =?utf-8?B?Y0ppZ005REN6dk9Gd1JjalZVcEZFb0RsWlZ5dU1VczhyL0JucDJ1d01udThM?=
 =?utf-8?B?Nk12ZSs3MVRaQjVveWZpaGhRT2RSQ29ja3lQbU9SeEtCcnBtc0tLaDRIUEth?=
 =?utf-8?B?SmVTM09Fc3poN0E0cjhoajJKODNKS0hUVmYxV21sY2JSTXRxYXZKM1lWSUw0?=
 =?utf-8?B?UWJNRWtkUllyQlJ1cTVOZ01lUDkzT2ZBS2M2SmgxWEpjUEhVNHlNOUsyMFhU?=
 =?utf-8?B?cnNONVM0NHp2VmxGeTN0bEhPcTZoMnMyQkZXbFNNYW1pUnBaWUZhOUhmdFlN?=
 =?utf-8?B?UGlRcHZjNWZpT0loSUNnZnorSmVGR2Z0KzAzMVJueGU3dXljNFRkMk1BbjdL?=
 =?utf-8?B?WEIzV29HMlp6SFJpQXdWdzZsSFFHeFp6RTA0RUpoSURPd3VqbGVZNFdtekc1?=
 =?utf-8?B?Tm1MMWh2dG5aSFVwb29MeEs0dnRUK1lOM0dQbXpydktsUWMrQXRnVTNmdlpT?=
 =?utf-8?B?T2tNNUxnT3NPY29ISkxkaEZQK1RmY2lKQWxkNkp4K09NcldINTR2Sm10cWt3?=
 =?utf-8?B?RGZBWmVhZ2FtdjM2ZHRWME1nRyt4UEFQdG5YTTJjODJJYmpFQ05PUTB2UUM1?=
 =?utf-8?B?M2o4WTlzcFEyZ3VTQVJaSDZMbzZxWjd3akQxYlowMzVtK1hEZ01vSUdaTHJO?=
 =?utf-8?B?d0hydE50VjV5bVl2OGNLYlY2Q05KbHVrVzV0MCsxT01UUUliOTVEZGs5RVhB?=
 =?utf-8?B?ZllETDhWZ1NQRnByb2s3MHRrMWZzU3VMZmRRTWhPMlF0cjQvOERTTVBSeVdC?=
 =?utf-8?B?VWlCTTZPRit0Vm1lWFpBZk42UENSczM4ak9yNGowRndES0MxVE1OQVVQU1cr?=
 =?utf-8?B?OVo5ajdmMFpDSVZnOHRQelpyVVRCd3AyWlZTQkVEWVVuRDJPQ0Q1cS9CS3hH?=
 =?utf-8?B?YlBjclJRWjZXSjF5TFRYTGZ3VHQvZEdMRDNnY2ZxU1hISDJTNkRTNWhWZ1da?=
 =?utf-8?B?aEVuNlFNZHVwNmFKanl0ZDdUNkdhdjVJR3k4ekxVQzhlZFB5UStPWEs0MHkz?=
 =?utf-8?B?aElLSVRGSHpHamVyT3d0TmhGTEl2TnZtUHExc3hZWGN2YVo5QXZwaXIwNHE5?=
 =?utf-8?B?NExoeUZhcjV3RFdvdHpjNkhLN3JOTElPN0ZER0NqUytvNWZTN0k3TnlDTG84?=
 =?utf-8?B?blNhTWRQV2Q3b05NdkNpdTBmZE9wY1M3QXFvT3BMZFlZTDFML0hhY2x0OUtE?=
 =?utf-8?B?ellRelhhQ3RJZlE2eit5MXZpUmloaE5XOVE4SCsvbjFPVEJhUE84MjY2bjJz?=
 =?utf-8?B?NE55UHdFRkI2bk9vaDk1TXVncXVDM1hvNlVMdnNoYy9MWk5ycXYyNmQ2N3VC?=
 =?utf-8?B?MndkSEdsaWFnL0NGYzk4Zlh1eGQ2RCtuRE1ZOEszeVY2UVhTRFBJYnRLeVFN?=
 =?utf-8?B?ZktUemtJQllic3lrbFhtNHV3WEJzQnBDS2c1VDJ5Y3NyNXdHdTgrV0xHZjJI?=
 =?utf-8?B?RUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80F064E78D807240BB7D5AE3AC5C4C3A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0003af9f-8dbe-4bc6-5266-08db260f12ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 11:10:38.6874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 UUQoxFqtxhfZxGhwmL8v/FE3UhsQsGC2V+4nTy0vAMpQLcxV+bPd1F7fi/IY+3V1n8CbrZnEUnFawiS9dWZ9bXLirsF7Hp3RsRonFpXj/ic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
Message-ID-Hash: 6WW2Q4ZDZSKG5P5WLNXX2LG577C4YP5S
X-Message-ID-Hash: 6WW2Q4ZDZSKG5P5WLNXX2LG577C4YP5S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WW2Q4ZDZSKG5P5WLNXX2LG577C4YP5S/>
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
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgc291bmQvc29jL2F0bWVsL3NhbTl4NV93bTg3MzEuYyB8IDYg
KystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9hdG1lbC9zYW05eDVfd204NzMxLmMgYi9z
b3VuZC9zb2MvYXRtZWwvc2FtOXg1X3dtODczMS5jDQo+IGluZGV4IDk5MzEwZTQwZTdhNi4uY2Qx
ZDU5YTkwZTAyIDEwMDY0NA0KPiAtLS0gYS9zb3VuZC9zb2MvYXRtZWwvc2FtOXg1X3dtODczMS5j
DQo+ICsrKyBiL3NvdW5kL3NvYy9hdG1lbC9zYW05eDVfd204NzMxLmMNCj4gQEAgLTE3NiwxNCAr
MTc2LDEyIEBAIHN0YXRpYyBpbnQgc2FtOXg1X3dtODczMV9kcml2ZXJfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICByZXR1cm4gcmV0Ow0KPiAgfQ0KPiANCj4g
LXN0YXRpYyBpbnQgc2FtOXg1X3dtODczMV9kcml2ZXJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ICtzdGF0aWMgdm9pZCBzYW05eDVfd204NzMxX2RyaXZlcl9yZW1vdmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gICAgICAgICBzdHJ1Y3Qgc25k
X3NvY19jYXJkICpjYXJkID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7DQo+ICAgICAgICAg
c3RydWN0IHNhbTl4NV9kcnZkYXRhICpwcml2ID0gY2FyZC0+ZHJ2ZGF0YTsNCj4gDQo+ICAgICAg
ICAgYXRtZWxfc3NjX3B1dF9hdWRpbyhwcml2LT5zc2NfaWQpOw0KPiAtDQo+IC0gICAgICAgcmV0
dXJuIDA7DQo+ICB9DQo+IA0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgc2Ft
OXg1X3dtODczMV9vZl9tYXRjaFtdID0gew0KPiBAQCAtMTk4LDcgKzE5Niw3IEBAIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHNhbTl4NV93bTg3MzFfZHJpdmVyID0gew0KPiAgICAgICAg
ICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKHNhbTl4NV93bTg3MzFfb2Zf
bWF0Y2gpLA0KPiAgICAgICAgIH0sDQo+ICAgICAgICAgLnByb2JlID0gc2FtOXg1X3dtODczMV9k
cml2ZXJfcHJvYmUsDQo+IC0gICAgICAgLnJlbW92ZSA9IHNhbTl4NV93bTg3MzFfZHJpdmVyX3Jl
bW92ZSwNCj4gKyAgICAgICAucmVtb3ZlX25ldyA9IHNhbTl4NV93bTg3MzFfZHJpdmVyX3JlbW92
ZSwNCj4gIH07DQo+ICBtb2R1bGVfcGxhdGZvcm1fZHJpdmVyKHNhbTl4NV93bTg3MzFfZHJpdmVy
KTsNCj4gDQo+IC0tDQo+IDIuMzkuMg0KPiANCg0K
