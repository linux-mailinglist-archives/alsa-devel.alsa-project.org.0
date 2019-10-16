Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 517AAD8632
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 05:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C66AC15E0;
	Wed, 16 Oct 2019 05:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C66AC15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571195233;
	bh=5Hvukn8ne+Fd1BAUCChyeTzQOI2WjJWJxTXePqQ98gY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dt3ULJTVdmCh+vBGoLCAmQzuF2j+NTDwgm6KSkiaguYY+J4WIBNFNL/yo7P5YvQ1J
	 8Ur+D3XDO/RN5Txf/UNMbjZZB6B6czedOs+BhvmaNj0dC+/Q8Z9v82twVpftR9ujQR
	 KnGkkAX2Uc9t4OuzDnHjCed2RwtYWRrNT08/Cnds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05133F80362;
	Wed, 16 Oct 2019 05:05:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B09B3F80362; Wed, 16 Oct 2019 05:05:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,PRX_BODY_135,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70080.outbound.protection.outlook.com [40.107.7.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD81AF8011F
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 05:05:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD81AF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="oKwERHv0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kgBgWcYNiS2JRkIjycVwzLlz8gUjoKJcqPXiMNBChza15OJ82frPUiw38CJ1+wqJYymDR7nZlI79QiiS2/AvZLnhtYbG0QmO4LIJQSEUuYEpZuKO0wDu99TZvIeRpA+r6LfDEO3+lNgbcG/eBAeoKZszHtbOqUwTzTAkCMdUUDxi1F+q/l05EJUb0a6Uzn+0RGHlGswC9lvDCgnr9WGulUOBS1KbvjvY3O/TeaCSgxOMzOJzCacxkWH79i2ZGL3omwmSC0XDqXnddasUhb4VU8Mtx2No1pZkuSyJjpX65fyf0coQ/OLrsFurmORJubWShZ+j3KY1lxVk9bYipIKoDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIBrbhOKJD2m0AJdwVcU1f2A5UibnopLz0RHiVuUBHk=;
 b=RUMTH/iQ3zaHpClKf/797ql+oSUEXI19C6IUuRl+mllSlWjfna9vYGXbNBnFLYm1uJeUPTChkHTD4AOOP1iJP/qaWBqvRIRIKCBUFk1bwgEifFBhJiAqXEnh3O9Bn9kkOFvcgLrh9GdTHaEhRsLrFYkk03U2ipH99lyLODLkRnw+cXEac3eHa6IP+itvayFJ255IkB8J2geWKTUTNVC5NYl80jIhCNlZWFIqEwOu7Jm+k7OChOodG7wVVbzLFiEEnkF0nblt9RfMSR5YbozBC6rjaT1hiUlf51EfpYfIPPEw9Y6vVaY78HCyMg+di87vWaswJyw+wMFMBC/gqgdB0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nIBrbhOKJD2m0AJdwVcU1f2A5UibnopLz0RHiVuUBHk=;
 b=oKwERHv0qR6toYKaFpXx9mawsInNc3m6vksmGR23hmdf5aVM+wkD5Ko61BMg1nBx0RUP37GVzb0UAABzAMam7ANQ54xCWqglhhprmVOnEZRCV8Ec0sRvEr0rMH1OxPK3GFVJt7HPF2aAw0vv4Nxe3P5sjpKZdItts0y238KFK3I=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.232.225) by
 VE1PR04MB6589.eurprd04.prod.outlook.com (20.179.235.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Wed, 16 Oct 2019 03:05:16 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::e052:9278:76a3:27c%6]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 03:05:16 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "jiada_wang@mentor.com" <jiada_wang@mentor.com>, "broonie@kernel.org"
 <broonie@kernel.org>
Thread-Topic: Question about "957ce0c6b8a1 ASoC: soc-pcm: check symmetry after
 hw_params"
Thread-Index: AdWDzUVy/0m9KNAaShGMg8lV0wkwGQ==
Date: Wed, 16 Oct 2019 03:05:16 +0000
Message-ID: <VE1PR04MB647977B69BF05FA82CAC7D10E3920@VE1PR04MB6479.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3278611b-5a31-4b49-37ce-08d751e5abd7
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VE1PR04MB6589:
x-microsoft-antispam-prvs: <VE1PR04MB65894FC3FD5B279F8C8D95E3E3920@VE1PR04MB6589.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-forefront-prvs: 0192E812EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(199004)(189003)(2906002)(33656002)(316002)(2501003)(81156014)(102836004)(81166006)(26005)(14454004)(256004)(14444005)(8936002)(7696005)(5660300002)(6506007)(790700001)(71200400001)(6116002)(25786009)(71190400001)(8676002)(99286004)(52536014)(3846002)(186003)(66446008)(66476007)(86362001)(66556008)(64756008)(66066001)(76116006)(2201001)(9686003)(6436002)(478600001)(110136005)(55016002)(66946007)(7736002)(54896002)(74316002)(476003)(486006)(6306002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6589;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YC0ZW2teZ2J5YZNJRQqUBBmlXjQDZ6FAqgHdYCoqKYFEsM6fnFgNQ/CC4Zd/bBl9QIG4R3DMTAgC5QPu+s4y1un6BBdFDjaCFbty1SgdoKd4Zqx9WcF96w8y389ZzQwBoRNkyhAkd7XG6ETxnqA5Ri8W0WCfNdGWl62yxdemO4t8LXEYJ4bDrtvK2tBrBDeBrp7cEWl+GmXVrqRA5gUgqAq72JDdObVy++2A6RjRDxHG83qJPydnDG0vhIJKpP4ZzHjWMOgUycwFDvA/Eo1nTStXK+v7/ZcqodACKmVDGHfenTjPN00oOqOJSpoeJl02f4gCPDYkU2kjIRKH9m6QZ2BeONU2Ab99mbxGCgYH1O1CFm7swCWGfVsEbuU9lOypvPYGn96pi/ER4m+TVTDMYyTAHxnV3eXcXZj9Au8YKPo=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3278611b-5a31-4b49-37ce-08d751e5abd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2019 03:05:16.6844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mQOOr8pv33SLgfHMdNEYAJyDOaCLJgkSlN56l/zt94B9bSEeEbfEeLdcfgoKUTmBUJ/Q9yrTsAJQfYHnNphy9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6589
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Question about "957ce0c6b8a1 ASoC: soc-pcm: check
 symmetry after hw_params"
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

Hi Jiada, Mark

     After this commit

     "957ce0c6b8a1 ASoC: soc-pcm: check symmetry after hw_params"

     The soc_pcm_params_symmetry can't take effect, because its position
is after the change of cpu_dai->rate.

     The code of soc_pcm_params_symmetry is:

static int soc_pcm_params_symmetry(struct snd_pcm_substream *substream,
                                struct snd_pcm_hw_params *params)
{
...
        if (symmetry && cpu_dai->rate && cpu_dai->rate != rate) {
                dev_err(rtd->dev, "ASoC: unmatched rate symmetry: %d - %d\n",
                                cpu_dai->rate, rate);
                return -EINVAL;
        }

...
}

     This code soc_pcm_hw_params  of is:

static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
                                struct snd_pcm_hw_params *params)
{

...
        /* store the parameters for each DAIs */
        cpu_dai->rate = params_rate(params);
        cpu_dai->channels = params_channels(params);
        cpu_dai->sample_bits =
                snd_pcm_format_physical_width(params_format(params));

        snd_soc_dapm_update_dai(substream, params, cpu_dai);

...
        ret = soc_pcm_params_symmetry(substream, params);
        if (ret)
                goto component_err;

...
}

   Is this an issue?

Best regards
Wang shengjiu


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
