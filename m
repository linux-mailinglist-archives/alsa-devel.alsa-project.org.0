Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 058073DE731
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Aug 2021 09:28:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CFD6170F;
	Tue,  3 Aug 2021 09:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CFD6170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627975706;
	bh=X5MfVVrr88WYnpKfHmnygmM4ORmeOC9UlO368c2RfYE=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WdbgY02y7e032O1cyucuElbiOVoAY5N2Bou6cSIDKgYcXJ2gKwFc1LxdqX9iP2ILI
	 BE1Z7CjNSYJ9gmQxPl1ttGUUTBamy/ElB9Zp7K/E3mqzmWPf9HJOgXtRex9rM9MWFa
	 Y2zDFm+WOmTeE70Hf/DjNvLVnlLixQ+SvUHpAX1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7136F80082;
	Tue,  3 Aug 2021 09:26:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E8D6F802E8; Tue,  3 Aug 2021 09:26:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10063.outbound.protection.outlook.com [40.107.1.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE512F80082
 for <alsa-devel@alsa-project.org>; Tue,  3 Aug 2021 09:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE512F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=artgroupspa.onmicrosoft.com
 header.i=@artgroupspa.onmicrosoft.com header.b="m4/SnCYt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvXzlqUv0jzkfdru5DmOYBiMFOqj+YNL2ygV26I/sGpvsOJSK6NnTWWVxeWhqD57jbrC2X9/4VTDE2UXIkENXiG7KpsZTbYMDEziM3TqceaRNK62dunm8FI6zBHIfQvBvPz4h58ixPVtx/P1x6/lH49+uNS1rR9xTODI0a+5SCEhY3g53YXtZJZWSxKHu7arM1zMY8vAt8+SBnzIt0uMxlePAcGGC4pbYesUqyT7P/ijHZ4sHzibr5r8n4CdG3E3SuROuG4ygNZIkRozdZ6qCcXHPX7lj6RZWIZsHdb6+VTYMOBkFHKEXgpIPC0t4hI2gEv73yYn+Uv7EShrjuIAXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIoICsfPQCtEUOVEJ3kjGAkoh2SVLUxTwuXPX6Hwhhk=;
 b=GuBlmlhQsrRWZ325mqqjSh6oZvrEyBLMf9tWCXJ9dbiTpPHiYDp7Ym/IIR8l6MRJep4NTMsFLMH+qCK6fq3/fdIuEzhr81qukIR61Lhrs2RLH/3TbOjQKGOTavyzb/9FmMcygPbBDjQTOn2+uF5fPnpfvQsCUZWa0YRF61AAnx/hMRcF80eFzYS2DjS86/Q/NLZi3juLmHQmPNay9KUy0e6QgCwzHQJp4XmphtyqZXAdO2Ooeg6XiGlSSqEi2vv9M7cSE2Ex3y+lKtSHp1QNk2myxPPHxerLrKBo2EwkbD9CEFVw+Vbpm36DoGqCtmdSmH7yXzBTTbaimC66sDaN3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=artgroup-spa.com; dmarc=pass action=none
 header.from=artgroup-spa.com; dkim=pass header.d=artgroup-spa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=artgroupspa.onmicrosoft.com; s=selector2-artgroupspa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIoICsfPQCtEUOVEJ3kjGAkoh2SVLUxTwuXPX6Hwhhk=;
 b=m4/SnCYt6UkhxejTO9HnTWZUW2+YQAoh3TxjHzmbtZogjvqS0XIn16nZs5ciTjIZpt/Ui6wMoShxj/1vX/835HcYKKOnb52RxKwvgGfobPhTvSsdmYK4fZL3fOZSuEfcx9T0HopAhYWYlwAvkXatT4XmwDriW7Rx/T/ZLb1IMz0=
Received: from DB9P192MB1321.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:29c::16)
 by DBAP192MB1116.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:1c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Tue, 3 Aug
 2021 07:26:39 +0000
Received: from DB9P192MB1321.EURP192.PROD.OUTLOOK.COM
 ([fe80::2d11:9df6:34e7:8606]) by DB9P192MB1321.EURP192.PROD.OUTLOOK.COM
 ([fe80::2d11:9df6:34e7:8606%7]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 07:26:39 +0000
From: Giuliano Zannetti - ART S.p.A. <giuliano.zannetti@artgroup-spa.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: I: dmix optimization
Thread-Topic: dmix optimization
Thread-Index: AdeHepPbTCxO7/X0TQGx9cJLXOflrgAvZmYQ
Date: Tue, 3 Aug 2021 07:26:38 +0000
Message-ID: <DB9P192MB132136A569299BDE4E11AB90C5F09@DB9P192MB1321.EURP192.PROD.OUTLOOK.COM>
References: <DB9P192MB132193EF1C0E9DFA5161A298C5EF9@DB9P192MB1321.EURP192.PROD.OUTLOOK.COM>
In-Reply-To: <DB9P192MB132193EF1C0E9DFA5161A298C5EF9@DB9P192MB1321.EURP192.PROD.OUTLOOK.COM>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=none action=none
 header.from=artgroup-spa.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 972711fe-eba7-4212-5452-08d956500896
x-ms-traffictypediagnostic: DBAP192MB1116:
x-microsoft-antispam-prvs: <DBAP192MB1116B195A35DDB7C0AD43A67C5F09@DBAP192MB1116.EURP192.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vyiyKXJhjor/G1THNfgpVOXa7JIiOLqvH63iOTIU1nK6QsYYC1LBGSRSxITer3tr7nb8ZdBE0bwd/REmFin/poUpX2rqN97oex40FwjM0Y+agDUR7eVUDYleNbFKBKIqcr97Bv+MLgnGi28P+72yFgz5evek3u9oijf7S8Bl1h8dhr6FrmS5dZnUsHyTVwwvX4dzVJrj55uRqyWyTUszbKOpM98vLdYp82dP/F+ofqLKPETuNRFacoY2g1qv4j2z7e3B8OMIzGv61DTdCaGZpahv8EUAuZv6Wuj8xetE4As6E1UTQq0wkVj5mK08Kh7A3kZIrL4aYCRRTkcK/WYnLd3OzwFvmG+aLc75F4ivmmIP3MP0+6SsqZlJNQPMaUSpceZP1PpunzkNNWqPLD5bn6yOHrJE30CijnsjDm42XKLDICsnVapCSzWuJs5aMsxawy6bLjjFFpFaIUj36sMALQFsbvCiyx3lzDpzYrClmWv6e7tjULd6lyW7kNjXYxkp9SLNO/KFjsb/MEixxS4A/GE2PUERbIiMClkGgYfktf+B3NT45HduQYcSZ1a7+dKhqRNHdfPoFgCdiV7ZtA+bid8H4hPOLqUmnKht2KwRe6vRTBJpwrKG1St3yxhBq3FQjaj8b7UUiEn0ZNGKyusWACnlMvVV2o4hEKXroZsy0r47Usm/xwbf5gm3hE9VqCsLhcBQHOW+9t7zSj3t2SLErNa9KxzDN+4+rbMomNhlJZPzwVlKDS39BOCGWUBApnJbMZw9U12IkSgib+W7AC1xX+3XW72iThxA/aIlSXyVbrk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9P192MB1321.EURP192.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(39830400003)(136003)(55016002)(38070700005)(71200400001)(8936002)(66446008)(86362001)(64756008)(66556008)(8676002)(38100700002)(9686003)(66476007)(9326002)(33656002)(4326008)(122000001)(166002)(7696005)(5660300002)(316002)(52536014)(2906002)(66946007)(54906003)(26005)(6506007)(76116006)(6916009)(478600001)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zRjchXlbMdgkqGVAQ6Xdy3ZloJDzJ76YWU4I2AE/0ja5nBPD+ETncnikr/JO?=
 =?us-ascii?Q?lztbihX6DRNX7Kp8oMo+IRmmeWr+/coX4vRMlZgmzlVyJfogf8D5V3cihqyC?=
 =?us-ascii?Q?+Db9OXGDKVMXZBlv+v4wp1F+IyGxTySBRIqHv6cHU3g4t5ujBBaH8sTNasWj?=
 =?us-ascii?Q?6Jpr4dcQaEsOjz3J9689uzPbv/3vt1QOuYyP0EbbZiYmOmRvxtD9s4+RGzDj?=
 =?us-ascii?Q?mEPH6DEAsTMh1Iwgg1UXpMsSEfzZ1A+mKEh1qTYll0s/BePptgJwMt168LLS?=
 =?us-ascii?Q?MdKZXuVxuigdQdZOYkGM2VFguIZuuyM++QUut6ynCk2uF72ZOAOtLZNOirTm?=
 =?us-ascii?Q?yLv0bekNT1gJF5M8FaMNkrmkzLFtfgFJGF6ssLG2LGY+hrQVt5IO/FbDsPir?=
 =?us-ascii?Q?OQE2Vhdh/FltLTi9px2VkA0G+BQ/7GrO2EkLaeHQ2K7EW6nIUUtTa9O7R/yS?=
 =?us-ascii?Q?dqQ67kjt4M0RtSZb4PNdOoRc0sAEACv9axB3Ibk/Iyjr/zRuXg3EO0BaUH4c?=
 =?us-ascii?Q?/SvT4PMVoAgQgOIgfDzABbUHrzvl0ZQdD+1nH5cZXOAdxDUIAV7WY83cx9N8?=
 =?us-ascii?Q?U+5s5tPW42Mylex/H7nJQqu/IXjCs6dm5AmB65SdwrjbVDHqFkNCpJmoiCCN?=
 =?us-ascii?Q?+xwXdJQJkoPRZWBMVCzzyi4W7zwfOU9rdP1C9hMO0Ymfni7cCpphvCcDmR5b?=
 =?us-ascii?Q?jm2/tzLOLIdBQ5dpqjnDsBUqKpFCW17H25T4Zx3lvuei8dACpB6qblpvm3za?=
 =?us-ascii?Q?Rc15AJwH3VUjT8qzytFES1R00E+AftIS0huXdtc/n3euEKhxBtkNAgKjacod?=
 =?us-ascii?Q?KUfnbBX5bVO+bi1Cfqiw83QOQZTU0jiPDaeN0E3bU2m0obrN2dx30n9E4llf?=
 =?us-ascii?Q?bisaDBiAD3s8m/B5N4pQl+mz9faG/apxUK1iLaJjUQmjoz0pSnrA9vYKqiiv?=
 =?us-ascii?Q?dbyUaUmTrLF5QkbR+JFrPl0isnwtqIi8FGv3/ISyi6NyNFo4REgkiDP0DdJP?=
 =?us-ascii?Q?ie5BHiqlzG9rlakaKkM398oLOAVNdpUGk1CH+BmBKY4RmtiouHxC36qt7R/C?=
 =?us-ascii?Q?EQuZ4QpE5y3Brvi43uZ7jtqX5qfkmzRn05op4LlpGhrJrcCojP6o4q3GfMGe?=
 =?us-ascii?Q?D2FrLVlPEzA9i/ozNtL356ji2578vv6BA5SmUT78ECdmeViHF8AMmo4TGfqZ?=
 =?us-ascii?Q?Mw49JPCy+UGSKFO5LMbn3eD7GzkHcSVKPnXTaEr9YvPrIqdcXy1y37yU/ODD?=
 =?us-ascii?Q?uoe0wqSoBdcxs2YleQGw8a3vPQCbTdwIrTpL4nd1U9JY7nFZHlaa6NJY/OlC?=
 =?us-ascii?Q?FQ4=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: artgroup-spa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9P192MB1321.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 972711fe-eba7-4212-5452-08d956500896
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2021 07:26:38.9236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53c55efc-dafd-4709-9ce8-f76299277497
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J1IqlabYIOF33Y1ziditpADmbHxwNR/On+4CzMoC/QGHcAh43rMGbefdqQoY/wW63SzmyuklN9kdXWNr4ja8TEbhRhkGa8EG0QuFeBtic4IfhZfgYf2d0iWjj8x/pjTQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP192MB1116
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "tiwai@suse.com" <tiwai@suse.com>
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
