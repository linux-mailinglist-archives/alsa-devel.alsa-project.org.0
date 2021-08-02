Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C49853DD2EF
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 11:27:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A77217A3;
	Mon,  2 Aug 2021 11:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A77217A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627896436;
	bh=X5MfVVrr88WYnpKfHmnygmM4ORmeOC9UlO368c2RfYE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YAb9RAb4+n3uNPf2GZmRV7Nbeh9fGPDQSy5FNfOg8NE68Yc17cRy3l0Tqq3eKvSTK
	 Ss+DLF0SdFMQlEaVR5K1TeD+Zbq81yJZvrA7P0dQUfEVdI52c2ZUFNDmGHz5+CCU9z
	 sMaT6fNsZehFVr96lfUO2pAUARJK+S7d/ZvdP7cc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5A31F80268;
	Mon,  2 Aug 2021 11:25:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FC64F8025F; Mon,  2 Aug 2021 11:25:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,PRX_BODY_135,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10064.outbound.protection.outlook.com [40.107.1.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF785F80095
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 11:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF785F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=artgroupspa.onmicrosoft.com
 header.i=@artgroupspa.onmicrosoft.com header.b="HDm2+lU7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8OqIruFWzKBLId1l1ypwaZhJK6TpxHuOqB2ciuwgDt71ibvCGUyRXnf9JRCxtVyeBTW6cBLrnW+N+S2mkTxkNk3VOIP8fm5ikrP1IUni4PyB9y+UZLzJZ7B57h8UwpaY1++5bWidS78WY467hzHb0azp+0W6uB8KvQWC+3ClKgQgQ7Kp8MGy6yIGpQsWGh191StGfNRRYM3eETchgOK8/rgUTtDyd4xD/HE4JTQh+tsJD+iz5J9tvLmMX9hCFMxvrf1KNt304y/gRIvTvnz3HLrSpqSFxjYYKcmRL3lE5D80GaFtOuImcb/K9diGcSptvBWioljxduGM/QnWBFsdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SY2U2ruOSWRWObPG2KSVTKKWgrgpntvnROc0C6PHXI=;
 b=dKieJDWL+deOxegs5JDR2uOpDUSPlK242hyxdotTPS37zGSnzc3Gr/pQ8n3lJFLnW9Z9/KyS4hB6wwucTVK4Fw9aXr60wp5JErFZ6asK2LaPSDVZdhSIlq5vXwtpMzCtn72fj/fHdxfxhzOkpjGG9QXwH7jH1O3GsbhVtPQkHouSeNzJO3+tj/brdenCtk+RNzUrlgVNbVc9lbySEwsZrmN0E/+29MnFoXMpTPVt+ealASYP5RJVws8rTg6i1mFNVExH5t5q45XrSKpZkexw+GNK3jTHS4EdTl1/49CV+1qhtKlG0X2MI1q5BH+SEK+DouEQUlMJQ6C86CSN0isIdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=artgroup-spa.com; dmarc=pass action=none
 header.from=artgroup-spa.com; dkim=pass header.d=artgroup-spa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=artgroupspa.onmicrosoft.com; s=selector2-artgroupspa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SY2U2ruOSWRWObPG2KSVTKKWgrgpntvnROc0C6PHXI=;
 b=HDm2+lU73SptcO7S4qYupOG031jAhnnlkkmbybORbhEz5D9voIEfZIfzGifRuur+eWrWHkncIrqgRPhsGMQ1Pl88RS5UnS0pEreGJqhPbO5OjDpqIqHjgSbIY92nCkyPkX6FOEgWD8UpodlcFaXlZacwyVySL854D7GP9M1VpGQ=
Received: from DB9P192MB1321.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:29c::16)
 by DB7P192MB0266.EURP192.PROD.OUTLOOK.COM (2603:10a6:5:10::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.24; Mon, 2 Aug 2021 09:25:38 +0000
Received: from DB9P192MB1321.EURP192.PROD.OUTLOOK.COM
 ([fe80::2d11:9df6:34e7:8606]) by DB9P192MB1321.EURP192.PROD.OUTLOOK.COM
 ([fe80::2d11:9df6:34e7:8606%7]) with mapi id 15.20.4373.026; Mon, 2 Aug 2021
 09:25:38 +0000
From: Giuliano Zannetti - ART S.p.A. <giuliano.zannetti@artgroup-spa.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: dmix optimization
Thread-Topic: dmix optimization
Thread-Index: AdeHepPbTCxO7/X0TQGx9cJLXOflrg==
Date: Mon, 2 Aug 2021 09:25:38 +0000
Message-ID: <DB9P192MB132193EF1C0E9DFA5161A298C5EF9@DB9P192MB1321.EURP192.PROD.OUTLOOK.COM>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=artgroup-spa.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2cb9709-0fc3-4708-9bb6-08d955977da2
x-ms-traffictypediagnostic: DB7P192MB0266:
x-microsoft-antispam-prvs: <DB7P192MB0266309025D6225A5566B016C5EF9@DB7P192MB0266.EURP192.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u/hvV3yshgAD2kxf2VF2mCu5776VRAXe1qXBxFk/c0iLBH3uSVATl9CcjJZGxamXWckNcSa3nkzSJXEBDjVYu4CmZpD5b7lndrresc84EAn5iP3qWVou84PAGEIzH1jiNYsMcHTVRoyNkAq8/+h4n+XoIdd6sxMv2Zxs0Xex3Jm6Ak4Nz5TtKdtqSEDz5Dy/Y7O75Z+eokyZJIO1hgCP7ye+W8tlo/NaxJfl2l7TQLidKw5N6DOah7KwHN8+ItLJWvHvMlxhvtDnlNFpNOqaYU8Xrk4YJ9sSGcaWSPiZ/0PhOoA/sG/kP9Fx9LL/Ui9fWhCyvFTZt0+SAhILwvClZDTXKjlLsIuk9lzfUhU33CYh7g09u7b1pmVg+iDQ+SUDYfS7ai/4K8Q/E88+hmvBSLy/qJbexCp1kqbieUdcwbWT8JCgTAhpeWSJT+92iYWvuJCwcJiQDQUeN5Tz+sCOZdr778JsBva0JgC6G0f7+ZQENlowwM0CYRMEE8BjLt9m7RFbPskcZhaTUK3knhvIv42m5bRCaMi/jNwUbPMANup8KOxt8ooEluOOOQ2gLcHWQfviMTF0Y4KCvMb/r3MIzGTxYhf6UNeV+QkPDtTwzOQi8JKwsdKbTyLnWLwF+FXMuqufN3liYiHEWSLwv+1FnK6usLZJN+XznXHLWUDfOvylmElK0QamkGhpb82Zdwx4MZmouMLpGuyxHuXSp4C9djsRABbaGBjZ0iDXd922sh14r91LINzmxEfFz3x8bxvkbWkET3f1vDmb7TNgcBTcyb19YbTDzGiu51+vAdvoFWk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P192MB1321.EURP192.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39840400004)(366004)(376002)(396003)(9326002)(86362001)(66446008)(52536014)(8936002)(38070700005)(6506007)(71200400001)(64756008)(3480700007)(122000001)(7696005)(33656002)(7116003)(38100700002)(166002)(19627235002)(316002)(8676002)(186003)(6916009)(26005)(5660300002)(2906002)(66476007)(9686003)(478600001)(66556008)(55016002)(76116006)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZJB4o/ZhKVfijunnwBjQT+slWkN1hIGgTZKctU4ADo953V27ATHmDMp/Nt0X?=
 =?us-ascii?Q?T4NXlqUQaXKNFFkossgRVSMTN/cH0Cbnq/vO2uwjJY4WOn51F8BX+Tp96eGD?=
 =?us-ascii?Q?zLn82glfqyJbSY0RdDvI1FpKIqgWXYeGL22ZmuR29bV5Oy3yX4URAbb5+Gzd?=
 =?us-ascii?Q?QmEiM51i5JU5oQRQLEc+GW0j53Ix9UwRjFsHuv11npc6w1su3nmGjVI43388?=
 =?us-ascii?Q?0qY3dwu0W3Ufiz3m4z6DxcV24AHpwLf0FogRdclBl6y2DcsvEoNRbIZhCysz?=
 =?us-ascii?Q?SWpZi8AGO/YNrL4ZNRCQX4KPmUZY9ecfNEVX7l5ackI5ehHFaYyItHp2Xqjv?=
 =?us-ascii?Q?lnUj/X/1EtIWq5I+TsRcxT5/TCuUpTjRdESPTbIAnLsSqpMrGenol8t+B7w+?=
 =?us-ascii?Q?h4KH+0eNTGwQuC70N70+Z2RVMzl3rU6HQIEUXHJdhFRejEl1XjsL7RKDKkL6?=
 =?us-ascii?Q?Uam/rVYZoBV+wucnWE5+1m/vr5TM03cwa+s+1S593wS9et8EssDNjGB+nVed?=
 =?us-ascii?Q?7YRRwwwdfFW6E9XT+uGoQtmghgfxF6h6cwUAIziPjsLZ8JrR3yLAX/jIxJi7?=
 =?us-ascii?Q?1IDilhjiC4oGLHIhbsaH3Yz3xfJNOimD/sgb4wI6PkizZo3fLGfthk7IbJEd?=
 =?us-ascii?Q?3CVHnU5FnWy989RNtEqtL02ud/GwLGaciLxAbhdy9f28rHkKDiSbWuaC1Xvq?=
 =?us-ascii?Q?KNWtvaR1c495NASsAJP6Z3FNMPoZRvwJPtJEwIaSa5pk9D+WpcGtDSwZJ/7l?=
 =?us-ascii?Q?z2HIhGnPFRaXfXY2MCoFOZJ2HgGK5kPMsut7zUhDK0w/0rforp9duu/PCvgm?=
 =?us-ascii?Q?+OteymMTBRqVSZvZTjJ6ncSnTv/YJMtDYVtj5aXtxoarNfshQz15q9Hov7Hz?=
 =?us-ascii?Q?ED3s998ZeHz+nRCxHJG4lVklr+AuwvypBMUxf8fhJNv4uOmRpC4iWFBFNZRX?=
 =?us-ascii?Q?br4DM5WOC63DaW66EYO46lMWdet+r6UqdUwyVn8EiKhV9SKTGiijaPIYae/V?=
 =?us-ascii?Q?eMD0eSubptUPmPwKPBFl9B2RARpM971cQUaxkNfRIaOs3q1VLVhml/kGUfoh?=
 =?us-ascii?Q?rTbAulm0dpBCA/FmoUmVW2EKtO4vgHHWwKHixRklPYF64WNwBCN29TM30CJK?=
 =?us-ascii?Q?CcWdjpC8U1Enk83b7zhnJqKWuwsRG9B4hFm4jcU59SC8NJ9iY5cI+bO1NVoN?=
 =?us-ascii?Q?Zi3qvuA1NcOTm1hBqWGQ5xE6Mh6lo+PXASr9JstY+GWs4rhI4HhlFilVCIAx?=
 =?us-ascii?Q?RJEwHGewEDoj0AWZKTdZs9LRVDmPBWzL+EikMOVTFHhzJ62vpbgaTXXx0nKU?=
 =?us-ascii?Q?wJA=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: artgroup-spa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB1321.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b2cb9709-0fc3-4708-9bb6-08d955977da2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2021 09:25:38.3766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53c55efc-dafd-4709-9ce8-f76299277497
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gNOyc449CTa6wLtGyHZC0pkttVCnYLPOIYgcxfejaUQsN4M6cHWxAH4yqzoJqmiXTO+VX2QbRczvaD1LrbFAM83iPkCAUlDiAZlW4DtGZEuz4iAQWV16xRPk+R9gy3O1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P192MB0266
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi,

I'm trying to optimize the dmix because I'm working with a big number of ch=
annels (up to 16) and in this case the dmix has not a negligible impact on =
performance.

I'm working with ALSA 1.1.9. I gave my first look to the generic_mix_areas_=
16_native function (https://github.com/alsa-project/alsa-lib/blob/v1.1.9/sr=
c/pcm/pcm_dmix_generic.c#L130).

I would ask you if I can avoid to check, for each loop iteration, if the cu=
rrent dst sample is not 0.

    for (;;) {
        sample =3D *src;
        if (! *dst) {
            *sum =3D sample;
            *dst =3D *src;
        } else {
            sample +=3D *sum;
            *sum =3D sample;
            if (sample > 0x7fff)
                sample =3D 0x7fff;
            else if (sample < -0x8000)
                sample =3D -0x8000;
            *dst =3D sample;
        }
        if (!--size)
            return;
        src =3D (signed short *) ((char *)src + src_step);
        dst =3D (signed short *) ((char *)dst + dst_step);
        sum =3D (signed int *)   ((char *)sum + sum_step);
    }

Could it be possible check for the first sample of the period only, as repo=
rted in the code below? My assumption is that if dst[0] is 0 also dst[1] ..=
. dst[period-1] will be 0, and I don't need to check every time. This is al=
ready an optimization, but it could be also a starting point for other opti=
mization based on my HW. But, first of all, I would ask to you if my assump=
tion is right.

    if (! *dst) {
        for (;;) {
            sample =3D *src;
            *sum =3D sample;
            *dst =3D *src;

            if (!--size)
                return;

            src =3D (signed short *) ((char *)src + src_step);
            dst =3D (signed short *) ((char *)dst + dst_step);
            sum =3D (signed int *)   ((char *)sum + sum_step);
        }

    } else {
        for (;;) {
            sample =3D *src;
            sample +=3D *sum;
            *sum =3D sample;

            if (sample > 0x7fff)
                sample =3D 0x7fff;
            else if (sample < -0x8000)
                sample =3D -0x8000;
            *dst =3D sample;

            if (!--size)
                return;

            src =3D (signed short *) ((char *)src + src_step);
            dst =3D (signed short *) ((char *)dst + dst_step);
            sum =3D (signed int *)   ((char *)sum + sum_step);
        }
    }

Thank you!

Best Regards,
Giuliano
