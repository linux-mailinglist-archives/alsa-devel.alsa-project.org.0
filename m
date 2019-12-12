Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C095A11C8E1
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 10:12:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A71D16B5;
	Thu, 12 Dec 2019 10:11:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A71D16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576141961;
	bh=Kbo/EdUkENOSMF830pe5TcDWF0bPSPdGt9iaRYFAEn0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rDfsIPY5X5U8yDW4bEO5uKAmsx8vzyReg0uryTMikJW3Wjm5tvNn9vlcZMLjCsR8K
	 d155NKX0XL57hWv6MZNZzWZFmf1tNGxvZJ+ZydzD88GyCGmjdmkCr444NUYI4dyX+c
	 v9tZ0eRAzk1B1ZnKUis9F4kx3RrxgGANq7wZy1Bs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B8DDF8020C;
	Thu, 12 Dec 2019 10:10:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F257EF8020C; Thu, 12 Dec 2019 10:10:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30099.outbound.protection.outlook.com [40.107.3.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1F04F80089
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 10:10:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1F04F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=toradex.com header.i=@toradex.com
 header.b="VhDO5ciV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVw/vq1gfUi47oaUWyGRLbnLyZXdnLK5XJq5RguoYDXFWr8kCPq4HwDE1mG424pU8p9nmbCbmKY0Fd5vxixgB0JmLmO+wTCWmDxLsPZ49mct8B7gJZKFcx0QJDxCvyRGloy0en0CB30bD8JJHDUcHZ//yhDu+O5TXw3HUrPiOSnVDoxm4bR+1QhPRFu4xoNot/8cjkZKECVvcj2Zv63Ou1LZKHzo9XYi9dw/G/60oggbzoHDWjRnSO64N1P78yhinLYx0eTQYl2ftO+11TSep0BwrwqTZrfJBrdIhyCB+LEMAWlWCViB8cIkrXIwP+2b3NXTshY8eoYqm3Cr3s5TSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0y8Pa9uORsh0RPEwbJpczbXKwXtEwSqAjAsLEoy9e8=;
 b=Ci67y78/DYusfIRj0g8qlfAqv38ddgEP6tlyXhSxq1FVhd2kJ5H0vp70OmT2n2Eag4j43DnP0BZpzB8CXcYJdbuyqHQqOnQYrEmPtTUphHWTP+3B64NHoigAU9z2lo032UcVUBO04iIcEXV/raqrtv7KhPe6E2mB6fAbLUhbOTkJONrkoGYk2+6hUdX7MbA/eLs94x83eyvHHx4rzhyRc2CG7mAzyKRft99B73dPL+4NZrhAX9a/dceW4JwlG0xTsaqrNGmbbmua2R1oafol0xVEpofggaFLc5QuP+9C9zBXLSrzza/zo1iQEXDQUOCxZ+mp0tUzc26hR7Ro2RfVIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0y8Pa9uORsh0RPEwbJpczbXKwXtEwSqAjAsLEoy9e8=;
 b=VhDO5ciVyMmkpSbhitE9YJJGc+5l0ZJ2wsKPVswZVAdYNRGBw4rSBvUP1afRmX/Kln1RtzdiuYfKa7p64u7agXbUbJxG9bkEbACNlTzTLV/zEUaJcileih9SwRNsfKZJEGoQpG9VzqVgsdQKg0lWjEgCh8+Vj9cC2M+QVDpPZfg=
Received: from AM6PR0502MB3702.eurprd05.prod.outlook.com (52.133.24.15) by
 AM6PR0502MB3621.eurprd05.prod.outlook.com (52.133.24.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.12; Thu, 12 Dec 2019 09:10:47 +0000
Received: from AM6PR0502MB3702.eurprd05.prod.outlook.com
 ([fe80::859e:e6e6:4de3:55a9]) by AM6PR0502MB3702.eurprd05.prod.outlook.com
 ([fe80::859e:e6e6:4de3:55a9%6]) with mapi id 15.20.2516.018; Thu, 12 Dec 2019
 09:10:47 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Alison Wang <alison.wang@nxp.com>
Thread-Topic: [PATCH] ASoC: sgtl5000: Revert "ASoC: sgtl5000: Fix of unmute
 outputs on probe"
Thread-Index: AQHVsLyIRDFbzLs7vEuxsFkXl6DgTKe2NokA
Date: Thu, 12 Dec 2019 09:10:47 +0000
Message-ID: <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
References: <20191212071847.45561-1-alison.wang@nxp.com>
In-Reply-To: <20191212071847.45561-1-alison.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR19CA0053.namprd19.prod.outlook.com
 (2603:10b6:208:19b::30) To AM6PR0502MB3702.eurprd05.prod.outlook.com
 (2603:10a6:209:10::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-gm-message-state: APjAAAVNclTtM4xHPDOkiXQ1TAKU0DktGfstw7zqJ4kuSzcmYOJgmS+6
 +7lNkTANVfMM2iVFEo9dhETtVD1xkgAAfBArqqI=
x-google-smtp-source: APXvYqyzVg7+1PTUxcDYjVqoyrAao9relVCwYl9IARni0AEDEndIKVBsEZrQ5c1+NfV4o3gCcEpkrZe/rTNNZ3sgGCs=
x-received: by 2002:a0c:9476:: with SMTP id i51mr7105296qvi.75.1576141843811; 
 Thu, 12 Dec 2019 01:10:43 -0800 (PST)
x-gmail-original-message-id: <CAGgjyvHHzPWjRTqxYmGCmk3qa6=kOezHywVDFomgD6UNj-zwpQ@mail.gmail.com>
x-originating-ip: [209.85.219.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca0a6afc-07d1-4040-4ab7-08d77ee32cc2
x-ms-traffictypediagnostic: AM6PR0502MB3621:
x-microsoft-antispam-prvs: <AM6PR0502MB3621DB1EF78F9399A40F13BFF9550@AM6PR0502MB3621.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0249EFCB0B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(199004)(189003)(81166006)(81156014)(2906002)(107886003)(6862004)(55446002)(71200400001)(8676002)(478600001)(8936002)(54906003)(4326008)(9686003)(316002)(6506007)(66946007)(66446008)(64756008)(66556008)(186003)(6486002)(5660300002)(53546011)(52116002)(55236004)(44832011)(6512007)(86362001)(26005)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR0502MB3621;
 H:AM6PR0502MB3702.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uLVgUsWXux8VcwdiPR3vsZI/7MEPYkurr6q5jjBm+9oiI4cVDpGWc65S1uzeJQ7YuRE3MmJgbNEnsyYC4nUTX4lTTVxaE54m2THINP6KWpr7nLELXl8Y6ITPiXc1WjSrrvp1XFk2gQa9l03DKApZnCx/uIusNImLwhkzPS+szYxLVu+htsEZG8KWwDW6OW2Ao6M5TkHHpvVwpUkQX2lHN4ZoHuSoTk1dLA/QcDCVCTGMBNFYjnaZuVT/3whMfJ05X4eGDTzKCXDecovC+peHByiQmlvXw/G9HnkAzNUGi5qp+151vmntABziCFPVJ5+h37jE6J+spZWZNXzB58hgFE19lCdGEvVxLliybNvfwW/c73BCU8l65gZ69MzFqz4OCZSSwaRxbj3RwlE993UkYGhOIv0vdR5qGoIpRh4YB+zYalT72wof5q2BKGZ/A5ya
x-ms-exchange-transport-forked: True
Content-ID: <157797D397B34B4BA1D988FB0394CE49@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca0a6afc-07d1-4040-4ab7-08d77ee32cc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2019 09:10:47.2399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0zDUtena5pxHDC1pNZ3qOnh7r0aIAju3tKz7jSDBg3UAxmw4JHrNkH5JixwQobiHxdqOc6/cA8GJctcrn6KW+LhuGDhS+zRWK5heGoet0+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0502MB3621
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: sgtl5000: Revert "ASoC: sgtl5000:
 Fix of unmute outputs on probe"
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Alison, could you please explain, what reason to revert this fix? All
these blocks have their own control and unmute on demand.
Why do you stand on unconditional unmuting of outputs and ADC on driver probing?

On Thu, Dec 12, 2019 at 9:20 AM Alison Wang <alison.wang@nxp.com> wrote:
>
> This reverts commit 631bc8f0134ae9620d86a96b8c5f9445d91a2dca.
>
> In commit 631bc8f0134a, snd_soc_component_update_bits is used instead of
> snd_soc_component_write. Although EN_HP_ZCD and EN_ADC_ZCD are enabled
> in ANA_CTRL register, MUTE_LO, MUTE_HP and MUTE_ADC bits are remained as
> the default value. It causes LO, HP and ADC are all muted after driver
> probe.
>
> The patch is to revert this commit, snd_soc_component_write is still
> used and MUTE_LO, MUTE_HP and MUTE_ADC are set as zero (unmuted).
>
> Signed-off-by: Alison Wang <alison.wang@nxp.com>
> ---
>  sound/soc/codecs/sgtl5000.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
> index aa1f963..0b35fca 100644
> --- a/sound/soc/codecs/sgtl5000.c
> +++ b/sound/soc/codecs/sgtl5000.c
> @@ -1458,7 +1458,6 @@ static int sgtl5000_probe(struct snd_soc_component *component)
>         int ret;
>         u16 reg;
>         struct sgtl5000_priv *sgtl5000 = snd_soc_component_get_drvdata(component);
> -       unsigned int zcd_mask = SGTL5000_HP_ZCD_EN | SGTL5000_ADC_ZCD_EN;
>
>         /* power up sgtl5000 */
>         ret = sgtl5000_set_power_regs(component);
> @@ -1486,8 +1485,9 @@ static int sgtl5000_probe(struct snd_soc_component *component)
>                0x1f);
>         snd_soc_component_write(component, SGTL5000_CHIP_PAD_STRENGTH, reg);
>
> -       snd_soc_component_update_bits(component, SGTL5000_CHIP_ANA_CTRL,
> -               zcd_mask, zcd_mask);
> +       snd_soc_component_write(component, SGTL5000_CHIP_ANA_CTRL,
> +                       SGTL5000_HP_ZCD_EN |
> +                       SGTL5000_ADC_ZCD_EN);
>
>         snd_soc_component_update_bits(component, SGTL5000_CHIP_MIC_CTRL,
>                         SGTL5000_BIAS_R_MASK,
> --
> 2.9.5
>


-- 
Best regards
Oleksandr Suvorov

Toradex AG
Altsagenstrasse 5 | 6048 Horw/Luzern | Switzerland | T: +41 41 500
4800 (main line)
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
