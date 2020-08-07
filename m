Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3E223E92B
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 10:38:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8D621607;
	Fri,  7 Aug 2020 10:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8D621607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596789503;
	bh=x2cbSZ/rN/8v5jDg6srzcOeAE9w69ncQcUaoBHJwcY4=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ILWpa7PGdwbmVfP8ZMSLKxSsovc24z6P4u/zuXNUtWCbb3x/LxwypS0j39PRVn9r6
	 OZ6uM6XdQDNBBUk1YRuTCIl+Ogv/wAzyTIUAOG+W9aFoFZcUMJbvk38HqDQEHJw9q5
	 osDgCsu33wKrQAZtVowrEDWFomJ0PeJwB+EJQKq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD2FBF80234;
	Fri,  7 Aug 2020 10:36:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F98DF80218; Fri,  7 Aug 2020 10:36:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5126EF801F7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 10:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5126EF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="U74yHgFA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0bQkz9nWxLugjO1k0I7XbUZrvYuj6ZI+yE6u6aVEKsTROxxaIqxBZ++UsgKvFtfgWK0yCaUneBnql53q/k/cgmCiL7ZdtjEB1ryoaA5In1hTykpaPXkwLD+9XghXJGPz2IHg6R0cjeHnj/+Ihmk16GGp1FX43bHSKfgIGYDDIn7EGYO/TsJXAFDcGujAanyK+wICMgoRyrnxwJQHk7M/bA64MAC+Xc4QGk0uvnMYeyZ4l51xj2Lf48H+kS9vLjsqsPL9jJb5AReE2Zp5PbZjIk9CBQo8SfbvTatWzoy5i5UCMDJSq2Hqh0IWlLRemzhSBHPwD9ABOC3SvKooo0+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2cbSZ/rN/8v5jDg6srzcOeAE9w69ncQcUaoBHJwcY4=;
 b=XiyRMmqaYRElxE5u2htcN0I0j7sUz2pSr2SxWJ3CPyI7RaNLELkrBYuJVgA73uS+1GuB8UdkZkCkbC6HZ8I5emPeDc0tlEeuKYcXXOeJEwfeEVoIO1iDPEkU0pJcWkzcP/zEbyy20HAKXWJlJPEkAvuokc/0JRrbqj1zf/vOb0DnwpZdjjb3tyxrMNobERqvbvx+JmMcQuennNYNHv1QR9RUrIOJTBKZUSbSLLhBoqd8E3BLT8pgAM/31N41h7+ljU4FaxVPB2xtDECnqPM+qjh/s1qndMGbKcLM5WwNjIGttGDoeJRAj/kcgeYwN9vTToeg8q9dedZgJOvU/lMBFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2cbSZ/rN/8v5jDg6srzcOeAE9w69ncQcUaoBHJwcY4=;
 b=U74yHgFA6Ovn6IcZcIr6W378Ebf6OVIOgSEZKQ7QeMSGZWuf/P8cw2sLehEYwyndeMXvxNvRUBIm1lfOdTiO6UBzVdC/aMrOV7buM1Cy5KZX+Kx+OG594gnXPVe1BjBR4ZftrZnyxqhyc9R4E67auJM35zcZYgRX7vRWRBsd4ic=
Received: from BY5PR12MB4292.namprd12.prod.outlook.com (2603:10b6:a03:212::12)
 by BYAPR12MB3511.namprd12.prod.outlook.com (2603:10b6:a03:132::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Fri, 7 Aug
 2020 08:36:25 +0000
Received: from BY5PR12MB4292.namprd12.prod.outlook.com
 ([fe80::31da:c8c6:10f7:3181]) by BY5PR12MB4292.namprd12.prod.outlook.com
 ([fe80::31da:c8c6:10f7:3181%5]) with mapi id 15.20.3261.019; Fri, 7 Aug 2020
 08:36:25 +0000
From: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH] ASoC: amd: Replacing component->name with codec_dai->name
Thread-Topic: [PATCH] ASoC: amd: Replacing component->name with codec_dai->name
Thread-Index: AQHWa9sxjTkuG6r2KEqc7oVyF8d+LKkq8baAgAFhu5A=
Date: Fri, 7 Aug 2020 08:36:25 +0000
Message-ID: <BY5PR12MB429286C315F66F7E2E5EA501E7490@BY5PR12MB4292.namprd12.prod.outlook.com>
References: <20200806101451.7918-1-Vishnuvardhanrao.Ravulapati@amd.com>
 <20200806112831.GA6442@sirena.org.uk>
In-Reply-To: <20200806112831.GA6442@sirena.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.159.242]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 031b1ea5-05d3-4f73-cd79-08d83aacf901
x-ms-traffictypediagnostic: BYAPR12MB3511:
x-microsoft-antispam-prvs: <BYAPR12MB351116DD67333F2FE12CC56EE7490@BYAPR12MB3511.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p9Get5WBCzT6gWS3lOA2hvXE1TN3aDUpQFVVxzwArOR7+o6SNTwatv5vsRMkRuhT6yrfNm7RjlcoVyHHTxkpVq+OA4JuAxi8u8GRpoaj00zoS9n7rW+FJUqC2wip771RZzzBrseQjxvKZ6d0FZa2CPBV5e4tNFJOhNJBftLSD3ESh4zUW9lbTmMIm3rg8bRvU4AJJSp0H4BuF7kGjecaE9tJicyTEG1Knbky92hwVpSVg03Prlz+9fWCUplVw3bEaahgEnBGOuKBRHXz5HmWc8BUAmIuHVvXP8irGTnfwzqO16OOlujDNaiJOlYoycHI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4292.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(4326008)(5660300002)(4744005)(52536014)(316002)(54906003)(76116006)(66446008)(66476007)(66556008)(64756008)(478600001)(9686003)(66946007)(55016002)(8936002)(8676002)(186003)(2906002)(26005)(33656002)(6506007)(6916009)(71200400001)(86362001)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: bxGg2FvrxBz7eONoSWM3ZfnyixS5FwQ0jCBOTvJDdThS4ogcPuIn7wbhyRBGJvTFxcAM7wADzpnE7Svsow0aWp7ymDIRKk1L6kRl34K5zkpda7rnKaj9GVBC8gwhClzQglzo9DRZisR2DU6YfDqDpSTPX+Yv+cgDtMHcQl/nN//EG9IJMs5Lc2pHdIxEDUsgCW84dS6xxaBzHYi6S/bXX1mghhwe+/KvSURZzSXsMmWlKILhR0unI//OoJb1wF3v6SohF222zo2Fep3ZNoPSmE3viKyejRkOERtFg6wYFNGtqgIItD+15skz0KUMJHFOLKDvesNecQ6b5q+UuQnC3I8bVrxyTcriQpJB7IF4L9OBL8TpRAJF7/nyFoYX4uV5id+TKQmYas6fI5IlGGGQFPKKjAv19O+VR81E+IuLkQxSIE3LrroAfPKJauOoHP7Eh79W3sc/spuVGLtgwjdouoeP0/tgl5FPA9PJzdaDssbbg67pg9CaUaxbvQvNDckQDco9q13KB3anjm9E333fA+UAZQJdm9SlZzfG3Iab7v8atz84M8PElATW7bqY1dhom/M4UjnrhA5MqhzQ/PGv43e1RqT0othvjWBelDc+PCcTtIPaEJ//wDWQ1tQ/7TsL1byadGKbIoV96eNVpOZ7ww==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4292.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031b1ea5-05d3-4f73-cd79-08d83aacf901
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2020 08:36:25.7235 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9xWFj1bPjK0m2nsyRJDi42bvfGL4X7Cry6LAi3Zg5A0IlCjWw/sVdNzP20y6AZNbwlCMMjhQFPuqo0C4HnUBnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3511
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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



On Thu, Aug 06, 2020 at 03:44:12PM +0530, Ravulapati Vishnu vardhan rao wro=
te:

> Replacing string compare with codec_dai->name instead of comparing=20
> with codec_dai->component->name in hw_params.

>Why?

Here the component name for codec RT1015 is "i2c-10EC1015:00" and will neve=
r be "rt1015-aif1"
As it is codec-dai->name so the strcmp always compares and fails to set the=
 sysclk,pll,bratio of expected codec-dai

Thanks,
Vishnu
