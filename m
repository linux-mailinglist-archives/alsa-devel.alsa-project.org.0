Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C9A69F1C4
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 10:32:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80040E83;
	Wed, 22 Feb 2023 10:31:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80040E83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677058333;
	bh=jrte3o1h+ZYTF7zukdl4AHD8+g8qbP1uxNr5r9GZVBc=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uTgnPpH4o6xllv2P5QT525CaelQ6TqYpRiNn2nwZkh5cNQLeVpfeBpBpQTgaHqA+B
	 kcvXB9Ju7XdIPKhvh/FjjiJjDAi/+qnRRfkbsJZzmVyIiuBVBZhylyAShGbOc/CPQP
	 FGaml15CwB00ugEKkTFrEQrGyg1JVFlnnFIDtPfs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B22AFF8025A;
	Wed, 22 Feb 2023 10:31:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C21DDF80266; Wed, 22 Feb 2023 10:31:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F543F80083
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 10:31:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F543F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=fPxQwhEQ;
	dkim=pass (1024-bit key,
 unprotected) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=RSY2O9XZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677058274; x=1708594274;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=jrte3o1h+ZYTF7zukdl4AHD8+g8qbP1uxNr5r9GZVBc=;
  b=fPxQwhEQayNGJ6vRJo7tWrSAE4dLRItFj6+NzV8TxXAzpTilS+09PHE5
   7KD2CzNWLrdwD7snC2nf+L8uGLUN9Tt8W94BT+08tXd5SBIoj0h2deQ9M
   YOQEv4IXkgfE/TDiXi4U0tr1+yclm50WxYArOwyImGk6ANi74MPzqKXbs
   DA3AtbiiTzOq6ythlWfmtfq6QS4xAYBmur/J8pYjatEcTXkiZcrzukAAX
   5cTH+8Q+vYRq/i2puzCpoq63Is/EwGEWFdZ84vZ7teVymkxGnJYXEwkeG
   FKwAM5+o2843j5yBlhOMFNYKcuZKZ6DK9oCysmVx1g1ubcGLM3uItm0pz
   A==;
X-IronPort-AV: E=Sophos;i="5.97,318,1669100400";
   d="scan'208";a="202049014"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Feb 2023 02:31:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 02:31:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Wed, 22 Feb 2023 02:31:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkm36o1xUKMYbENz0BKhyfVHVlTOndaXPhYrd7Cqz5nTT9cZfvcin3QeL2E7LXicHtSwY2wIDSvvYN1SNd5T0T1lHNKSH/Hfz5Q7atcALyiknsEmaa5bYJv6HHgGyIe3nez5oNXaT63mIaumHVAXk/goXx96GKO35h+s4ez5sfApH6CM3murYawA+sNyfepHWAIYuBg6+9SQ39m0ySiJCy/19lpp3bebcIdt/GD1iMzz1DqyATBYgEEpHuCBnnoBkXvIB5rUdB3N4RRjgVCwa24nnFgb8GBXFP6JWsJT9GM0eUNSDjdDFADULYp5xvZebTRZ0WJ6r+nMqY+3+rtDyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrte3o1h+ZYTF7zukdl4AHD8+g8qbP1uxNr5r9GZVBc=;
 b=K9qRL4nW06Wbkey7PlhwVLosArgmSwdynqjItNvF2mfjyIQGwivbuTNDJ/r5q3N631W/GHAKo/A0b4jKMFeLZm3dgBKlh4w18/o4iBrzTqPKbuEKpSjiSoYeo7gdjpMgXhYdSTyw3xD5+y2H9vYMkIm7GSNbaFZgAILp1AjlHrjYtKwdHrdJu2S2Fa4MrlToP2SNf8B1lw+DfxjXKowJ+X9Sr5cd/nuz21QHUpH1pJ4a92xAwfeM5Fl+FBWpvihbytvGHpaw97S4DTFFith0vU2ACZ9+nyWv2CbxT1qAQlhfdO73nVRgZQXVt7S14WrjZlUvFiwlbF6zsovMpGz1dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrte3o1h+ZYTF7zukdl4AHD8+g8qbP1uxNr5r9GZVBc=;
 b=RSY2O9XZANB5zbVEQYoW14hC6VGt+ZSDKK44h7xucpYxZaasVq18/CtqTWo8nXRVeF/ToV9jnrqY9Fh6t1Xa8sD2tIsUzWo3TSnYyWKqF/bhuDf3uV0NifOrsbxWS4KSI0+qMP6XPtqm7A78HlMpDVIRJcdfZIQA6Bk3vTJFqUk=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by DM4PR11MB8204.namprd11.prod.outlook.com (2603:10b6:8:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Wed, 22 Feb
 2023 09:31:07 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 09:31:07 +0000
From: <Claudiu.Beznea@microchip.com>
To: <alsa-devel@alsa-project.org>
Subject: Re: [PATCH V3 2/8] soundwire: amd: Add support for AMD Manager driver
Thread-Topic: [PATCH V3 2/8] soundwire: amd: Add support for AMD Manager
 driver
Thread-Index: AQHZRqBjnhItSZXrnEmhTBsxlQC4+w==
Date: Wed, 22 Feb 2023 09:31:06 +0000
Message-ID: <dfe01dbd-cdc5-a51e-a0cc-7fc352822a9d@microchip.com>
References: <20230220100418.76754-1-Vijendar.Mukunda@amd.com>
 <20230220100418.76754-3-Vijendar.Mukunda@amd.com>
In-Reply-To: <20230220100418.76754-3-Vijendar.Mukunda@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|DM4PR11MB8204:EE_
x-ms-office365-filtering-correlation-id: 8261cacd-e82d-4b77-a356-08db14b7866e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 k+bwvTZpChPvGdk3/Gl5NW3ivW0DgPt9ikew+DSFKczwKatTbnqoG8w59YmikobeFTgH5VSXJUtE8DJV7CFv28a+8MKxw7Yg/QUt+mXfrRIa3GE3JchZkGtnov2zLN1wik4RluX1ADQAjs9WfP8clpd64TdzzHkIlfCIoj+TvqqrNk6VF/bo5SDb3utEtvuiF13g4WzFgZVYVEt585QS+kIyAUu1YhqGqal7aOZQzzx841fz8SsmLX3a7DlvDTp7UTg59WUBhRAE52bSqXYop0Fg3QAGj9ftDoGS4rvJSHS5IGx6qfsxb8ZDHqkrxWMBZu7Jgs7Ym1NmEhgkeF5d0Jsn2F6mwh5qUhfvlhCmq7PyumkZNG4Uy+ixKnNrsWcCFoxYsaLlquk/uksJDmPxwctpPplUcLX7pgRMgEgB50Ce2t69kgcrOTHKBRlSt5/cPz/KRdp3cBzFJIKp9sk6X8pJUsO1v+ja3/rNzGooKatF8eHvgpQ/ZZxKB+FyHk+hFwrB0rij2nSGfuYcBQKN8O7ikrHYvo+L+tV9YNa9gfliWTCP2afyxxTLTNu8QdaWeiEYjbqwymcEzlAT+48m/8D6A29yRkaw4O1P6XjOAHD8JokALtZD1BJvh0x3U7zxQIkFZW7dNOMS8PWP9VhoLVxCJa1ATUJzfrHYncMcoGtep4czLZmMQvnXJ5b+maI5GRESmuSXh7xNPjCN/sRzT6bZ0xdfEOlFoeJhfuh5ktECh8JccGKgq4lJMN/DXj5Ta6OdykIT/GGKw+uVfFwr0w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199018)(5660300002)(8936002)(41300700001)(71200400001)(66946007)(83380400001)(316002)(36756003)(8676002)(6916009)(66556008)(66446008)(64756008)(76116006)(478600001)(66476007)(91956017)(53546011)(6512007)(6506007)(186003)(38070700005)(26005)(31686004)(2906002)(31696002)(122000001)(6486002)(86362001)(38100700002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UGtERnpUb1Z6QStKUEZhaURPTnA5VGhROHlYOHgzYW5DN291WGJkSkxGWGdu?=
 =?utf-8?B?eExrYzJCVnlIMG5vcE85QmE5eG5ZTTJOK0F1OFl3ZVpzUGhBaVBhYXJPdW1U?=
 =?utf-8?B?M3lRMms2dHV4NFVDR0tFVXlrL1VVdGE3aEVEM0g0QzliSngzcXo2cVcyOUhJ?=
 =?utf-8?B?NVoyNk1oWmVhZm14T1c4MzZnTFQ5MFc4N0NpT2lYK2lwd3cyeDlWWmllaUxq?=
 =?utf-8?B?ejhzZXVndGQyMkpURDZaSitIWDNEc2NFZkliMS9Jd1ZWNlh4VUlnTE5NRlZp?=
 =?utf-8?B?SVpqMFRWZ0xTdDlmVGdHaG1uT1ZUTGVHM3lKaG5hQ2dLUDVReDhWOFY4SWVL?=
 =?utf-8?B?UXZHK2x2NUF4UjFhemtFT0pqcGNLMUwzbFlaUXZyNHZNcER5WURKeWkyL2c4?=
 =?utf-8?B?TDY3eVRFLzRXcmR3SzE1NThqVmk4ZFJlcTA5ZjZEdFdqRklzSmM3MVZWZEhj?=
 =?utf-8?B?SEZMbFFLdHVVbFVGRGxoR2xPdy9BM05GRjhKcVkvWUJ4U2tWQnRPZWtmSmRw?=
 =?utf-8?B?djFteFNsMnJNRVVxdTNkWEIxSXpsdXZleUI2V2g4K290eWd3UktTdmJCUU90?=
 =?utf-8?B?TW5zdGVRVFNZRnBVcEJMUWsxTzZ2U2NMVGpvc0xzRlo1U0kxNVhKQVcveUdi?=
 =?utf-8?B?aGJxMEFFc0lmRlZUbDBVNEJYdzZhN0Ribk0rWDYxd0UwWlErY293N1NveVM2?=
 =?utf-8?B?VmhmczdVMUJmbXp0dE93dWMzcU5yditpRFRHRUtPNEJ3Y0EyZ2cvc1VlUUs2?=
 =?utf-8?B?U25oeVpaclI3bTdZSUhpNkZlWDlybTR5WGJOcCtuaG5LK0piTEp0NWlCRHUr?=
 =?utf-8?B?T1AvK2JnclJSTHUwcTFmRnpCS0I0R2N0R3U1UmEvblhGYnNySFJtRkYxc0xN?=
 =?utf-8?B?N3VWZ2VzSkhqQnF0SWhEemJEeUZUUXpwTWdCR3VnU2dJWTlPeTRtSmtGa0dY?=
 =?utf-8?B?Z01PanhaTFVoMFVEekNTMDdnWjFudEltQmd3S0pKQkVsYmxTMUZQZmVOVDBK?=
 =?utf-8?B?ZmtmQzB3alFZQ1NmaWtIeXFZSS9pL3JuZ0dMS3NmTytHMUFrL1pleXZDMSs4?=
 =?utf-8?B?OE8zcFVodEdsd0Y5aHgxSFMwM1Fsa3BzRll2Skd5MkxhVFB4YzJlNHdhNFRx?=
 =?utf-8?B?Q2wzZW45dU5rVU84dnhFb0JaODNjQnEwaEVyUDU3YzYwd3RCZ1lDRy9rcEhG?=
 =?utf-8?B?MTN4T05UOWt1SXp4bWhvRklrTE5IcWRUSXQ0YUcyYlgxMWxxRGp5U2RsbndE?=
 =?utf-8?B?N2ZjcGhqVi9ZcnNEaWhYR1htZTM2MnE1a1pHMlFDcjhVWlJVeVhJdFVRMVNQ?=
 =?utf-8?B?R0lJc1o1SFZDMnJGUjVvME1xRWxCc2R0bnE0NDRmQ3pnQzJGbU9tVlN2RDNE?=
 =?utf-8?B?NFcyRWFSaGFhUG9UY3I2NEV3VmJQbEZ0SkVaZnQ1a2tQVE5IVkJZRThPbzgw?=
 =?utf-8?B?NXlDSlkyUTV5ditCS3hhUkxFbGx4amJza1c2c25meDk2VDVjZm44OGVWUndk?=
 =?utf-8?B?QkExT3JoTXJSSXdMY2tlUVZjbFp4N2dRcXdTczdUQzdqa3YzcG5Ub1A4OTNJ?=
 =?utf-8?B?R2xiK1ZnV2hPMWVMNkQzdjdqWHdOT2Z0dXVqcGJ4alVsaUZ0VXFmZFhjdUJ3?=
 =?utf-8?B?dE16LzBhd01JQktMMjkwN1RjVGFmTzF1V1NJTW9TM0FnUEorUDNFQ3FxMThH?=
 =?utf-8?B?TGlmRXYreStZZXlyRVc3dmNndXRxbGFsMEx5dExNb3hKdjVYYmxZeHlEYVZL?=
 =?utf-8?B?c09VWDRwdEhwMDBmODhxdW45cW9pYmUxa1AxRnZLOWJVdWMyM0FNZjNuRmJm?=
 =?utf-8?B?UTk5bng3dFRUTzROOUFXanBiQS93OG0xdDNESGNvcW4xaVlZZW1FR0VwQlZV?=
 =?utf-8?B?U3l2N2IzSGk1ZXNaaERNMGlJc3lUYzFNK2VDNEVSMDlHRHhFa3d3YXBqVTBq?=
 =?utf-8?B?QjlUQmluWkkzZDQ1ZW5mNWp4ZmIwOER4czIwbUFoMElPdjZOb1lJZjNKRUxS?=
 =?utf-8?B?U2JZcFpldHhaZ05GV1NHdklaVC9WM3hGK29GV29oZ1ZkL0U5ZkxJWWhiTjdy?=
 =?utf-8?B?d00wWk9iT0E0MUJXMElvVFhDM2dHZUl4SmRxK1pxeld0cmU1VFNmdWNmUmt5?=
 =?utf-8?B?OVpwL0tDNHNsa1dnQTQ4OXgrd2lqeTVIUEZiOTJlZjNkUFRUVWZZT25jcGox?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE236D1380AC3F4592C20B4757CD0D4A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8261cacd-e82d-4b77-a356-08db14b7866e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 09:31:06.9713
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 v1CKGvGvoo64KhlCflvbiqWF5Oc1ytyt54797dnB7MRxGJsmRegQJp97O/0PjJHp2/osxa8qy33d2H97yGFilPHbx3bpiv+hndUOhEovXgc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8204
Message-ID-Hash: 74WPZBCAYU76435QJ2DDGE6WUO53KLUD
X-Message-ID-Hash: 74WPZBCAYU76435QJ2DDGE6WUO53KLUD
X-MailFrom: Claudiu.Beznea@microchip.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74WPZBCAYU76435QJ2DDGE6WUO53KLUD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

T24gMjAuMDIuMjAyMyAxMjowNCwgVmlqZW5kYXIgTXVrdW5kYSB3cm90ZToNCj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBTUQgQUNQKHY2LngpIElQIGJsb2NrIGhh
cyB0d28gU291bmRXaXJlIG1hbmFnZXIgZGV2aWNlcy4NCj4gQWRkIHN1cHBvcnQgZm9yDQo+ICAg
LSBNYW5hZ2VyIGRyaXZlciBwcm9iZSAmIHJlbW92ZSBzZXF1ZW5jZQ0KPiAgIC0gSGVscGVyIGZ1
bmN0aW9ucyB0byBlbmFibGUvZGlzYWJsZSBpbnRlcnJ1cHRzLCBJbml0aWFsaXplIHNkdyBtYW5h
Z2VyLA0KPiAgICAgZW5hYmxlIHNkdyBwYWRzDQo+ICAgLSBNYW5hZ2VyIGRyaXZlciBzZHdfbWFz
dGVyX29wcyAmIHBvcnRfb3BzIGNhbGxiYWNrcw0KPiANCj4gU2lnbmVkLW9mZi1ieTogVmlqZW5k
YXIgTXVrdW5kYSA8VmlqZW5kYXIuTXVrdW5kYUBhbWQuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMv
c291bmR3aXJlL2FtZF9tYW5hZ2VyLmMgICB8IDc2MSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gIGRyaXZlcnMvc291bmR3aXJlL2FtZF9tYW5hZ2VyLmggICB8IDI1MiArKysrKysr
KysrDQo+ICBpbmNsdWRlL2xpbnV4L3NvdW5kd2lyZS9zZHdfYW1kLmggfCAgNjcgKysrDQo+ICAz
IGZpbGVzIGNoYW5nZWQsIDEwODAgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvc291bmR3aXJlL2FtZF9tYW5hZ2VyLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL3NvdW5kd2lyZS9hbWRfbWFuYWdlci5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5j
bHVkZS9saW51eC9zb3VuZHdpcmUvc2R3X2FtZC5oDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zb3VuZHdpcmUvYW1kX21hbmFnZXIuYyBiL2RyaXZlcnMvc291bmR3aXJlL2FtZF9tYW5hZ2Vy
LmMNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iODIwZTA0
Y2EwOWYNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9kcml2ZXJzL3NvdW5kd2lyZS9hbWRfbWFu
YWdlci5jDQo+IEBAIC0wLDAgKzEsNzYxIEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMCsNCj4gKy8qDQo+ICsgKiBTb3VuZFdpcmUgQU1EIE1hbmFnZXIgZHJpdmVyDQo+
ICsgKg0KPiArICogQ29weXJpZ2h0IDIwMjMgQWR2YW5jZWQgTWljcm8gRGV2aWNlcywgSW5jLg0K
PiArICovDQo+ICsNCj4gKyNpbmNsdWRlIDxsaW51eC9jb21wbGV0aW9uLmg+DQo+ICsjaW5jbHVk
ZSA8bGludXgvZGV2aWNlLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4NCj4gKyNpbmNsdWRl
IDxsaW51eC9qaWZmaWVzLmg+DQo+ICsjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+ICsjaW5j
bHVkZSA8bGludXgvbW9kdWxlLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiArI2lu
Y2x1ZGUgPGxpbnV4L3NvdW5kd2lyZS9zZHcuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9zb3VuZHdp
cmUvc2R3X3JlZ2lzdGVycy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L3dhaXQuaD4NCj4gKyNpbmNs
dWRlIDxzb3VuZC9wY21fcGFyYW1zLmg+DQo+ICsjaW5jbHVkZSA8c291bmQvc29jLmg+DQo+ICsj
aW5jbHVkZSAiYnVzLmgiDQo+ICsjaW5jbHVkZSAiYW1kX21hbmFnZXIuaCINCj4gKw0KPiArI2Rl
ZmluZSBEUlZfTkFNRSAiYW1kX3Nkd19tYW5hZ2VyIg0KPiArDQo+ICsjZGVmaW5lIHRvX2FtZF9z
ZHcoYikgIGNvbnRhaW5lcl9vZihiLCBzdHJ1Y3QgYW1kX3Nkd19tYW5hZ2VyLCBidXMpDQo+ICsN
Cj4gK3N0YXRpYyB2b2lkIGFtZF9lbmFibGVfc2R3X3BhZHMoc3RydWN0IGFtZF9zZHdfbWFuYWdl
ciAqYW1kX21hbmFnZXIpDQo+ICt7DQo+ICsgICAgICAgdTMyIHN3X3BhZF9wdWxsZG93bl92YWw7
DQo+ICsgICAgICAgdTMyIHZhbDsNCj4gKw0KPiArICAgICAgIG11dGV4X2xvY2soYW1kX21hbmFn
ZXItPmFjcF9zZHdfbG9jayk7DQo+ICsgICAgICAgdmFsID0gYWNwX3JlZ19yZWFkbChhbWRfbWFu
YWdlci0+YWNwX21taW8gKyBBQ1BfU1dfUEFEX0tFRVBFUl9FTik7DQo+ICsgICAgICAgdmFsIHw9
IGFtZF9tYW5hZ2VyLT5yZWdfbWFzay0+c3dfcGFkX2VuYWJsZV9tYXNrOw0KPiArICAgICAgIGFj
cF9yZWdfd3JpdGVsKHZhbCwgYW1kX21hbmFnZXItPmFjcF9tbWlvICsgQUNQX1NXX1BBRF9LRUVQ
RVJfRU4pOw0KPiArICAgICAgIHVzbGVlcF9yYW5nZSgxMDAwLCAxNTAwKTsNCj4gKw0KPiArICAg
ICAgIHN3X3BhZF9wdWxsZG93bl92YWwgPSBhY3BfcmVnX3JlYWRsKGFtZF9tYW5hZ2VyLT5hY3Bf
bW1pbyArIEFDUF9QQURfUFVMTERPV05fQ1RSTCk7DQo+ICsgICAgICAgc3dfcGFkX3B1bGxkb3du
X3ZhbCAmPSBhbWRfbWFuYWdlci0+cmVnX21hc2stPnN3X3BhZF9wdWxsZG93bl9tYXNrOw0KPiAr
ICAgICAgIGFjcF9yZWdfd3JpdGVsKHN3X3BhZF9wdWxsZG93bl92YWwsIGFtZF9tYW5hZ2VyLT5h
Y3BfbW1pbyArIEFDUF9QQURfUFVMTERPV05fQ1RSTCk7DQo+ICsgICAgICAgbXV0ZXhfdW5sb2Nr
KGFtZF9tYW5hZ2VyLT5hY3Bfc2R3X2xvY2spOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW50IGFt
ZF9pbml0X3Nkd19tYW5hZ2VyKHN0cnVjdCBhbWRfc2R3X21hbmFnZXIgKmFtZF9tYW5hZ2VyKQ0K
PiArew0KPiArICAgICAgIHUzMiB2YWw7DQo+ICsgICAgICAgdTMyIHRpbWVvdXQgPSAwOw0KPiAr
ICAgICAgIHUzMiByZXRyeV9jb3VudCA9IDA7DQo+ICsNCj4gKyAgICAgICBhY3BfcmVnX3dyaXRl
bChBTURfU0RXX0VOQUJMRSwgYW1kX21hbmFnZXItPm1taW8gKyBBQ1BfU1dfRU4pOw0KPiArICAg
ICAgIGRvIHsNCj4gKyAgICAgICAgICAgICAgIHZhbCA9IGFjcF9yZWdfcmVhZGwoYW1kX21hbmFn
ZXItPm1taW8gKyBBQ1BfU1dfRU5fU1RBVFVTKTsNCj4gKyAgICAgICAgICAgICAgIGlmICh2YWwp
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPiArICAgICAgICAgICAgICAgdXNs
ZWVwX3JhbmdlKDEwLCA1MCk7DQo+ICsgICAgICAgfSB3aGlsZSAocmV0cnlfY291bnQrKyA8IEFN
RF9TRFdfU1RBVF9NQVhfUkVUUllfQ09VTlQpOw0KDQpDYW4ndCB0aGVzZSB0aW1lb3V0IGxvb3Bz
IGJlIGFkZHJlc3NlZCB3LyByZWFkX3BvbGxfdGltZW91dCgpPw0KDQpbIC4uLiBdDQo=
