Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A05E2D329D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 20:28:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0027C1697;
	Tue,  8 Dec 2020 20:27:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0027C1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607455704;
	bh=wfToEIyma1xsoikxBS43ywFQNhwEXd84jZv3VmkXwXM=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dQ2c06ccp+7vOCEdSwr4oHkKHUxECMZSqCTtAswgT5bxmKctUgV129H/WMPs0G7EA
	 i49MBRRF1P5o3uqbSyc4UI3U7W0wKGdL+FDsVZ99Y+I2PMme7iRS6MMXS1kyTqdPHi
	 LLKIQB1N7jhVeixzkmEa/g1uD7MMm7VM8In3lfPw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 420E0F80218;
	Tue,  8 Dec 2020 20:26:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 313DCF8010A; Tue,  8 Dec 2020 20:26:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from esa6.microchip.iphmx.com (esa6.microchip.iphmx.com
 [216.71.154.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5E99F8010A
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 20:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5E99F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="Mxk6dZeD"; 
 dkim=pass (1024-bit key) header.d=microchiptechnology.onmicrosoft.com
 header.i=@microchiptechnology.onmicrosoft.com header.b="VnqFDnqI"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607455605; x=1638991605;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wfToEIyma1xsoikxBS43ywFQNhwEXd84jZv3VmkXwXM=;
 b=Mxk6dZeDLFbjAVhM0od0HomL75CRNaY5s2sd2JBeFgtMOpJrIOqu2iyO
 v6DwjrJrAyVBCsWIfBDVZnlrETXCZybjXKWywJ1wcTB/4UYaaGy4WJcgM
 dl49Ug36lDmQ9TFYDDNRYn/P6++xWdta5W/SHlp8vDvvRxy2XgPi1keKT
 8JUHxlzKa+ag571JyaxeK9tgHi665reE0fntDFQVVVkXBKbSXBMA7lxDE
 KFzJjwWMSmxT0hGFcJLvGCRWY49pQb+OLTjLSEPnanD6I31x4bXRuWNLF
 AAQK40JOqWDpqYiOJgmtdu3INDTLbM/sDwfq/kIvOFZgMIhKhOUCXyoM/ Q==;
IronPort-SDR: EMv7h8YooBazDRvrv6omfrcAf/kho93sO772eLysMRZG+JwMMNeXChW7ia87FdE5w2c1pJB0+L
 ZzFiL1NFNtywEp2PKY8SyL8puH6icjK0Top4U2/JEyMcOOZ6PJ9ouB2fTwY+pekLdWvnjVbx1z
 +zSmd/E4e1j5DAaGbnMviqitc/qO2tRYTyuzoos+/eyDrUfTPnYAQVjHpNBEodZQr6NvkAcTZS
 aZAGE/1M7wSRs145vfo0zZsxvkvlotk5m9G5laXEgvjQ1ka/gptImBi7zKbI4KNAkLGNwyf0oc
 er4=
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; d="scan'208";a="36638219"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Dec 2020 12:26:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 8 Dec 2020 12:26:37 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 8 Dec 2020 12:26:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqrDbfF4qD11rWEms+GOmGh7fhguDby7/mzzOzywq2AF6nNfCvJ1OCT02kl3L3dIDKG3/4+H6VTFHduewkqg+wcjis4rG0xu5+bD/YU4FwaT/PVGTifMlbbmZGzEi2gdzYjAKSo2ShXdsFHN9LiyOcNNMmWWPBgs0cE4MCGGWsWclXmvea+7bHrYmJ+JI5xqomtephwVcmYMyySPe9Xg/5gndZ0mgX8STFPgyrmhibi/1HY2iFzCtk8QjhXu2fDCdzgW1sNy3Ox3z4HTMB37f9b/VEqqkauLnsoZsxoVBnnZpMlJhTeK+WU9YJLfsi1aFEIshj4R56Y0GYyFbrVEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hlUL17APVpAWZ9YQr8nVy81bCrQwg+OwlrdGiGVd7E=;
 b=OmMrUFcn83h5sSWE0VLQnd8hej6AC67LLeZc+vpQ9CTTJKFVEpMY1pEcYH4ZOIlQ3sTydaaNdBWycctZLvDteCOIwUCAifnGgyrL9Ksuc9hUPUHa/gZMepaGcSO4xmnJMNeo133Aevbhmrmw1UT8tEgZS9TAV09HPq1a/MurdgQNd97OLa9oWbzb/4x4C0y/1aDYO9UnM4imsWPsSooXUwtwaJEt+cygbwXGU8wYAirmWXANF4m+shpZmY27CcXQD68xd2gzLsAJH9OXvyPas+wN+8kwGJW+FBQJo///QMVleyky4nhLG2Z5aiVeSN4ItogJAWQowf1Gb6PfGkNjTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hlUL17APVpAWZ9YQr8nVy81bCrQwg+OwlrdGiGVd7E=;
 b=VnqFDnqIdOxNDoy45LsLHnDwaetsAV5or+e/Vc7Jo8HADfY9OG8hVkFXTF8Jeq9EeKqKgRWa1uU3xO+SUfj6OFy41RdbBo9VaRymddvd6/EDO7LVjVB77Rtf80g5EIVpiYFODngCDLKoMgrylpbG8qLZuPaXy+VDJLt/dfBdZY8=
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 (2603:10b6:903:b1::22) by CY4PR1101MB2150.namprd11.prod.outlook.com
 (2603:10b6:910:18::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Tue, 8 Dec
 2020 19:26:36 +0000
Received: from CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::a52e:2a1b:e5d9:4fdb]) by CY4PR1101MB2341.namprd11.prod.outlook.com
 ([fe80::a52e:2a1b:e5d9:4fdb%5]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 19:26:35 +0000
From: <Codrin.Ciubotariu@microchip.com>
To: <broonie@kernel.org>
Subject: Re: [RFC PATCH] ASoC: pcm_dmaengine: Add support for BE DAIs
Thread-Topic: [RFC PATCH] ASoC: pcm_dmaengine: Add support for BE DAIs
Thread-Index: AQHWyIlnegE5Pu9PHUSDAnO+LsRx/6ntd0YAgAAnuwA=
Date: Tue, 8 Dec 2020 19:26:35 +0000
Message-ID: <7ab6bffa-f88e-3e2b-287a-89eee2c01819@microchip.com>
References: <20201202085838.1779525-1-codrin.ciubotariu@microchip.com>
 <20201208170422.GG6686@sirena.org.uk>
In-Reply-To: <20201208170422.GG6686@sirena.org.uk>
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
x-ms-office365-filtering-correlation-id: 9d84e3c9-20b4-4372-4507-08d89baf2d9b
x-ms-traffictypediagnostic: CY4PR1101MB2150:
x-microsoft-antispam-prvs: <CY4PR1101MB21502030F7C83C9143FF775AE7CD0@CY4PR1101MB2150.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7qlgFJRtf+YCs7pdiBjNHB2+00nDY1pRk/MqDYEEFEtYXnJ4sKz7Go9aySyUWv/W2DYnPow8dnG4cmO4PVbyxzIcUXclJ56iYncHky2LfgYaAWNWLxG/CuC2WmQ5MNJBICNAWq/Y19RuNO51On0usJ8DcGGEleoZV4tBIN50GAlJYYh9o3jNRK+8Q0DujEAqboIiL8K5yGIGpLRe4CoQ6CizPz/gv3Und/o70/0KRgf7XvwbVnTwH3lGyv30qDGrso9QMIiukSE018HKJajWKFh3FVlmTBZlHq+R45THVjX8DQB+MGxcwTX+QnHGCbz0+tLDDzHcr7KiOcROIRBqxa5B0mY273uzaqPL1mRg2x1jat36V9WyRDjRSOnYwxm2CYY4d93AqRivkRHJbvpU8P2qulvVOBZb8LvgH77njJI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1101MB2341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(136003)(66446008)(186003)(66946007)(64756008)(31686004)(53546011)(8676002)(2616005)(66476007)(31696002)(6486002)(66556008)(8936002)(6512007)(26005)(76116006)(91956017)(6506007)(5660300002)(54906003)(4326008)(86362001)(36756003)(508600001)(2906002)(71200400001)(6916009)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?hWX+FG6WYhI1a7WU4349TNwiw5Z6MBWzv2AjuoaEw4IttpIYDo/uK6NR?=
 =?Windows-1252?Q?WqOp5nBKJZzC+cJKFwh6LNG5I9F8p5aTNXasgPl+oa970JHByK6WJBXb?=
 =?Windows-1252?Q?CGlK5rWF0QsVpZRXARE7suoT96WbsRy4vaQnAbBde0E/JCjMlwsigXmI?=
 =?Windows-1252?Q?mdX6B1mFr2dSX90AdXR4bkg9afCqbvs2bCkMUzUH91iBa7l9OC/chO3n?=
 =?Windows-1252?Q?DyIBQNnzw+ibU+rIqRBm6stIHRZeCX9hn2Ot7NnkRUqVYqntjRPZdkpE?=
 =?Windows-1252?Q?ddWsbrHy3hfLTnlGkbgn3ll/yZRUC5ICB2mEA14P6zxfWlONH+XgQsnY?=
 =?Windows-1252?Q?sBzh6UwihSUkcjT8cbmkcDVIpr3kJxz2pCOOKb305diBOPXRczOlVANN?=
 =?Windows-1252?Q?lTBUwOnOcy8uYpRJBeFC1omwLBsaE4STCqhQoqPP1rfcrCIYDbOOUwV+?=
 =?Windows-1252?Q?CURTnaoaWUHIV/pnUt0WHbPySWJhkAMzjuU0urw7RmV48U7hKZTW/azf?=
 =?Windows-1252?Q?wqszf1ugZwQNEIcIHIznmgkZihbxQ3W30lL3olWOEABJ4LETlbFduIov?=
 =?Windows-1252?Q?3X42wyGbEVn5Pl7qFxMhGASlalSMDg+xvzDro6d1zK1J1gtQui7s3H7n?=
 =?Windows-1252?Q?TqenrjVmrnR3jAVOlQQa7i/GyLj/1n/fgm0+Ke3EbCpnTEH/EO4TwvvF?=
 =?Windows-1252?Q?kRLtbeF6plePH+ZqedJw56g19thQhPfEwEFblt1JkCBal2JRcTx8Gv3d?=
 =?Windows-1252?Q?lL+yKZdrqDEvUVuD1eWX1qsCi+8FIXACq6XocaYtDIeUCk8xCffJJYb8?=
 =?Windows-1252?Q?DjgRaXNc5a+brR0J6UJ5J0Vl+gYPPEg91lEkNkSxbDiiaFLzVlWwHQ5j?=
 =?Windows-1252?Q?AYuFm3q5I+2gpzrrCfSdWxuN4VR5DkKCKJHlEmn8mSDcxftg2vklmeg0?=
 =?Windows-1252?Q?gabhV39/jLKjPeV+Z/eD5CceI2kdYi/bnrnKeVxjGAzW+L4Qx9/B/i/T?=
 =?Windows-1252?Q?+m9Yu78di5rwiIpGZDT8MoEjH5XFL+CKAEEv2DlmnhyRMBro4ug=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <DBE4DD639E19B845B438BBFEA456B370@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1101MB2341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d84e3c9-20b4-4372-4507-08d89baf2d9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 19:26:35.8388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ughp3aMjc6+bfMISkDNHKIuHR5DuKYMIzXOi8AOxIog9zQ+MTCyRTjM7yXJemANaFK1JvFss+2TWE3Df0hyFVnmhOjTFQVe2VerQvK3szHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2150
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

On 08.12.2020 19:04, Mark Brown wrote:
> On Wed, Dec 02, 2020 at 10:58:38AM +0200, Codrin Ciubotariu wrote:
>=20
>> This patch is more or less incomplete for the described scenario. This
>> is because DMAengine's pcm->config is ignored for the BE DAI link, so
>> runtime->hw is not updated. Also, since pcm_construct/destruct are not
>> called, the DMA channels are allocated only if DT is used.
>> Underrun/overrun support would also be a nice to have for the transfers
>> involving the buffer allocated for the BE.
>> One way to hold trach of these would be to use a substream_be->runtime
>> different than the one used for the FE.
>=20
>> Please share your thoughts.
>=20
> I have a hard time getting enthusiastic about this but I think that's
> more DPCM than anything else.  Otherwise this looks sensible as far as
> it goes.  I don't have particular thoughts on exposing errors for the
> BEs - we could do a dummy PCM, TBH that bodge was used in the past for
> CODEC<->CODEC links but it's obviously inelegant and messy so I'm not
> sure it'd help more than just doing something like log the messages in
> the kernel.  It certainly doesn't seem good to introduce anything that
> is visible to userspace but is DPCM specific.
>=20

It is DPCM indeed. Well, the first scenario (PCM1) is.
I do not intend to create a PCM for the DAI link, when it is a BE. What=20
I meant to say with the runtime->hw is that is mustn't be touched by the=20
BE's platform, but there should be something similar (placed elsewhere)=20
to consider pcm->config.
The thing is that, in my case, exactly the same DAI link (same cpu,=20
codec, platform components) can be a normal DAI link or a BE DAI link. I=20
hope to register both PCMs (dynamic with FE and normal), to be able to=20
skip the FE DAI link if it's not needed and use the normal PCM variant,=20
with the same DAI components used in the BE DAI link. For this, I need a=20
platform driver that is not interacting with substream->runtime when is=20
part of a BE DAI link. I don't think anyone else is using the SOC=20
generic dmaengine as a DAI platform component in a BE.
I do not know too much about the dummy PCM. It seems like it is creating=20
a card without DPCM links and fakes a buffer, which is not quite what I=20
need. I will investigate more.

Thank you for your sharing your ideas!

Best regards,
Codrin
