Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D319A2D7D87
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 19:02:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72CEE174F;
	Fri, 11 Dec 2020 19:01:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72CEE174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607709762;
	bh=391OhTFCQV5aDaqOygJBt+TzOdsFo0Ssz7YY/YcalcA=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oTsZU5c74acaNGROlCo0k1NYutQy9Vt6jbybODUGTNLrZPMpeqkO4hpPOeSZPE0Gy
	 pUXI8i/JAcrSsboeOmwrbUxW6MOKXrVatiIIEXyM9y4Wv6N2LRyJkoVr3QAPgfsmCy
	 1e/EP9niPJ6OQNFkf1mgomu4i9IZfTPD3UnOA/x0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C11D1F80217;
	Fri, 11 Dec 2020 19:01:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1BAFF8020D; Fri, 11 Dec 2020 19:01:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C8C6F8014E
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 19:00:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C8C6F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="XaA5+cXs"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="nGVcVNdB"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607709660; x=1639245660;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=391OhTFCQV5aDaqOygJBt+TzOdsFo0Ssz7YY/YcalcA=;
 b=XaA5+cXsaBtOICFafxxoZ8iVmxDAdVQkL2CL/rxmEvD/55rqmz+z+Dks
 N+f7k9+eBRg1GaB0R/JSkI7ENMaHqAsoz3hH+pY8Jdw6K3AS0z3q90jtM
 Y1rmyP6100IwS4X2TtmKXW4urG04MH/nnTek7Vx9NMiG14kw6cMuyTlSx
 JndLboHpUWIwmFvclaqHMZgGX7q5+3+NXEQj625+3tcFJTxfkwEdzPMjp
 hVQADs0yOjZ9f7/s9a59oPDX+W4dMEB4RDYrKDuklUmM5KYDPacO6SgA6
 7LyRQ2pDliMvX8Asdd3eQGduAuPbhOa9+a/CxkEHM1Zd2Shrpmf2fdhW4 g==;
IronPort-SDR: NHMgtiCYTlbyttHHBVfRRiQBkdeLSraMHkS7NseCB03JETmv7qpFoqrjpOyuYSUG+ppZr1cEJm
 qHH5SfD3NEa1/tL2Dy/KHwVn8Fy+CizwOHJ/KiDFLM6gq+RLH02OoS6fHQ3mbYvRMv6CCgnUfx
 Xi8Y/zYnH47Iz1CN2vtlDQPt5dZCcUu65S54JAbIXSZL3wyWlKCgvEcvtenwUOzOTy7DsWNY16
 XdDp7/w7HbTD+GgLpVIrbraeJVm0S2AiVOs34loMbSoBVSfjsdK9Lre3cLyxU/JQAhF1J2tp6v
 nlM=
X-IronPort-AV: E=Sophos;i="5.78,412,1599548400"; d="scan'208";a="102455404"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Dec 2020 11:00:56 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 11 Dec 2020 11:00:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Fri, 11 Dec 2020 11:00:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVpmWXCaq+w04tH5m3K8uEIzKDzoqUXLkUW66Dy3dW/k3LvXHyeJEtZEEeDtIq3HTQGMa8q/8SBv7QgGyRANDoiU+ZO3P/QAN8+PgkOYxJbs5DCW7fAg7+Xtk02VyWWmr0HOysypm+vFUeHUKYcnDrIokNcREWeSqPJbU4uCAXrmapfBKQnkC6TuzO0WRTDCavf1xUmfAnSaaDI7FQAS+TUWNi2VDQaa25CvSvNxcuUTWgbJARcCy/g6AjiRwylLHSMb0k2VVuwRxz3fFBIdjhOArWFP8Dn11UUzO3GEgJP0npxEPHDcNL2gif+hZv29VSYRxo+QL4kcl/F8OPfd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=391OhTFCQV5aDaqOygJBt+TzOdsFo0Ssz7YY/YcalcA=;
 b=Dfo1lRt330s2PM0mlfQK98WpekMm1xF2/m0o1F4cM9DlBFRwAtIWhe0zGVsaNV0Qrw5AxgQvM4P4D0tqk9/07YwLYfwXEzaGM5bc+PfT9UjxxoM8Wo2n6IPhhakjLSJEN/f0FvBhcGKeZj+u0mfN9gjeGlbDVRMzBHaS8HDQjI+CnPYblCy5iIsktDVDV4T564bFhUNa6OAZefsa690vVskaiaWv34MZC6ODc+lVXO7abs00yhdGUx3zmrNKir/no8QKCScE+dUlSbF7ArTIFHbR8DmIWlHOuNop49wtsGqwgMsjycsuAIoKMq50LG/o4ctroq12Gkg9oaD8rCqOVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=391OhTFCQV5aDaqOygJBt+TzOdsFo0Ssz7YY/YcalcA=;
 b=nGVcVNdBGkLZtJ0iRiYikHufTphSREdJZdg3UG0Eug0mytTG8wAff2ClWri1hG+Wk7uRf1ymuF9hwhAaUUs+BJm/2hqbDoX1uolnF8PgTnGBg6GyJ3TS7S4trCxuJWCT2xAQioAKTK2IQ/jlf1HZidFomBAjhm/JyGzbO5iGBgM=
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 (2603:10b6:903:b1::22) by CY4PR1101MB2149.namprd11.prod.outlook.com
 (2603:10b6:910:1a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Fri, 11 Dec
 2020 18:00:55 +0000
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::a52e:2a1b:e5d9:4fdb]) by CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::a52e:2a1b:e5d9:4fdb%5]) with mapi id 15.20.3654.018; Fri, 11 Dec 2020
 18:00:55 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <broonie@kernel.org>
Subject: Re: [RFC PATCH] ASoC: pcm_dmaengine: Add support for BE DAIs
Thread-Topic: [RFC PATCH] ASoC: pcm_dmaengine: Add support for BE DAIs
Thread-Index: AQHWyIlnegE5Pu9PHUSDAnO+LsRx/6ntd0YAgAAnuwCAAAF/AIAEnZAA
Date: Fri, 11 Dec 2020 18:00:55 +0000
Message-ID: <b98d9b89-268b-5a4f-57bc-b7f95d6c81a4@microchip.com>
References: <20201202085838.1779525-1-codrin.ciubotariu@microchip.com>
 <20201208170422.GG6686@sirena.org.uk>
 <7ab6bffa-f88e-3e2b-287a-89eee2c01819@microchip.com>
 <20201208193156.GJ6686@sirena.org.uk>
In-Reply-To: <20201208193156.GJ6686@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [188.27.102.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9df1139-01c7-4327-3c7f-08d89dfeb4aa
x-ms-traffictypediagnostic: CY4PR1101MB2149:
x-microsoft-antispam-prvs: <CY4PR1101MB2149B2B8956D8340ED774E25E7CA0@CY4PR1101MB2149.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u5iFgKZmiuT5FIZNOyvvXiUIzgNepOKJ0QSvaKXGsen38oCuhdzfE8czv7JZOmRRKVBluEPmH5FcnEi3HryjuiNWGD9DccdS/ijnogDU5sIWLOx/fTvghB9UxBdej0OAPbKjqGMYcsJB2W1KqYVBvCozhd6qQIpvucWARzQKmA8z6pSuG45FrkEVtuVgayEcqvDN3OdYPiSQzhbxVdm/7MG3Z0vykaGhobpDNfLLUMxCMYvPObpo5Y39QKt3K/WmtqZ507+8wqBRboZFCxtm8bjZT8UFl2mCFXw++kAn7RtbrbsU65q+PtHmBmSVlW5jP1tmSagHgC4DQ/Uv1LXnJIxBkXbnGTp4WMb+SH6kQ1FiVc4R/C6wrMivXQuPfHZ3Vh1DUiuSnfdIrhQAqsKjoqNW7OpaxaGL/gLsO+wcWcs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(136003)(346002)(31696002)(86362001)(66446008)(83380400001)(71200400001)(2616005)(53546011)(4744005)(6506007)(6512007)(36756003)(186003)(6486002)(4326008)(66946007)(31686004)(8936002)(8676002)(5660300002)(26005)(66556008)(54906003)(6916009)(2906002)(64756008)(76116006)(66476007)(91956017)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?91rRfwuHMRlqUoKC1AJNUH4zI+35WBRvsfqx3bz6VGw5gKVOvpB5aWdZ?=
 =?Windows-1252?Q?emCnKXwAvIkliRywdNb1XWGMhMPqIH+am8khvRieGHVYTfO654NR6xSl?=
 =?Windows-1252?Q?YvD4yj8B+aez3ZQrkWBcJhb6KB+9kW7KurBvFE83R9C5OPdow0LkZYsF?=
 =?Windows-1252?Q?5NJ54ax12aeUXmza0VK4BXbQrB89OhNVk+VAAs8rpXerm6+6CcENEk5V?=
 =?Windows-1252?Q?gBpe4JrsO/wXqgtQx16dcRruiY29pR/0NvGe5B6tfe+VPxQyfvX5IFM6?=
 =?Windows-1252?Q?L6AmFB29K0WAb16qySWsfh9dd/S9LXojVmNfUJSwSGh7zH1/7Qo7ievJ?=
 =?Windows-1252?Q?NgdC+QgqAfyDz/r2keJlOwpySoinSgFmBnwOQk4HHLatyKfPXqVpbfEt?=
 =?Windows-1252?Q?WHswLtw0T3qG6XvSD+bANcSzUglaLFs9uvFLEhb6WcMPwk54H5qJCDOi?=
 =?Windows-1252?Q?4xjUAIXBFfV6DNmK/sV49XQuBchVp1Jx0/FQmUVP7e3fDtKwQNtaSuLB?=
 =?Windows-1252?Q?5SttrVPCy/D3Y5ILk/i+T5JwlhhHhLjwwb5JhowND7/RA9CMRVsdyxNE?=
 =?Windows-1252?Q?rU3dKWLi1qB4OqfXPuKVlCeeA1XSFmdroqU0Hw/qyp6FBwvXE8Y5Cch8?=
 =?Windows-1252?Q?cTqwnVGwM5t+3TrPE+Vk8mSUeKiB79CR5gQo0AeL5JvqiyOtHLmkvkO+?=
 =?Windows-1252?Q?PnEbO1reWL+v36nhBKTKDl29QK3przKpvI10+bYToqlenIJRS9KxLDk/?=
 =?Windows-1252?Q?breasZWBlyL2ezElzO9MSDS+RzYQMl0QaQdd+TaskDiTPyRis82dt88Q?=
 =?Windows-1252?Q?QMb1tTE/w203QFIKcLfbS+NuDhQYHgqBuUCMcQj+Gi28L8jR0bN6D6SI?=
 =?Windows-1252?Q?7qU9+WZXWsWQh6wzpQ8xa+zv+GT4GUZXH0VreV0h4JT3vNYkjzY8qgpB?=
 =?Windows-1252?Q?s3RGfG3nFuM6XD3hgSP1ZY/hLcUuhl9S8cLwO/K7ass7cUwjRVVJbI3n?=
 =?Windows-1252?Q?n5BGI6GjcGt0MQvWuSORiyfKZbNOz04t51kF8wUinGPy1aJqsck=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <63D86EE64798F847BB071DFA3938D47A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9df1139-01c7-4327-3c7f-08d89dfeb4aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 18:00:55.0475 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H4WacNLkmFQ50ceEC/N4DYWD91rqPbIRhW3g2cMZpoa2d8GQIQF180bQAgvm0cBFJ5dIn5xZY/h3PG80510ub5YTFBKLybOgrFRJRqwWZlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2149
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com
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

On 08.12.2020 21:31, Mark Brown wrote:
> On Tue, Dec 08, 2020 at 07:26:35PM +0000, Codrin.Ciubotariu@microchip.com=
 wrote:
>=20
>> I do not know too much about the dummy PCM. It seems like it is creating
>> a card without DPCM links and fakes a buffer, which is not quite what I
>> need. I will investigate more.
>=20
> Right, that's what I was imagining the second runtime you proposed
> looking like.
>=20

I don't need the whole struct snd_pcm_runtime, only struct=20
snd_pcm_hardware, at least for now. I looked some more and a suitable=20
place would be struct snd_soc_dpcm, since it is created at runtime and=20
used anyway to characterize a FE <-> BE link. What do you think?

Also, I noticed that the HW constraints added by a DAI driver (a codec=20
for example) are added to PCM's runtime->hw_constraints, even if the DAI=20
driver is part of a BE. Shouldn't these constraints be applied only to=20
BE and eventually merge them to FE (struct snd_pcm_hardware) if=20
dai_link->dpcm_merged_* are set?

Best regards,
Codrin
