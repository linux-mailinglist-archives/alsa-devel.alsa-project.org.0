Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3D61D48AD
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 10:40:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A771165E;
	Fri, 15 May 2020 10:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A771165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589532009;
	bh=Qf1EfqpWvg+aa7mLP9+ytXeZiYt/4McZC3d86c8X7xs=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ea8pLw9ItqabasRf+L8jiolkczvjtbGRQaJHgUw5UEQirdzD95PqACp4M45RHzP/U
	 NLBSVcCkCY3ddv1vQAvay0cIMUKe65H6KUjFitXTfw6sXcKuL4MYy7OXXM9ZcZNtnP
	 UeBG6eOZNa80zFe2D7ADe+qJybFrpQOnBmKDEfP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7530BF800B8;
	Fri, 15 May 2020 10:38:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71469F80247; Fri, 15 May 2020 10:38:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B29FF80101
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 10:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B29FF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="DuKkMusu"
IronPort-SDR: IOWoGrhKwY99GAUZaHfyJ07rM3/8OeMdC6YA+uGkHY+30PufXx7z3qtqAi7tMrSq6hw9NNO6jA
 zLhSDNsNdaLw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 01:38:11 -0700
IronPort-SDR: 2YqOIerSg55OExo1jW1ULMwWnCVn1QRDNlrbDKBorwqIAcJC4VecGOTz8ezeDBJY5ZicRMVttY
 2rCbFO50nkvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,394,1583222400"; d="scan'208";a="464835696"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
 by fmsmga006.fm.intel.com with ESMTP; 15 May 2020 01:38:08 -0700
Received: from orsmsx152.amr.corp.intel.com (10.22.226.39) by
 ORSMSX104.amr.corp.intel.com (10.22.225.131) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 15 May 2020 01:38:07 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX152.amr.corp.intel.com (10.22.226.39) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 15 May 2020 01:38:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 15 May 2020 01:38:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfD2P2Gk22Kgu9GytI8P23BeLbhAqssSH5Ad+QvMDAPrUACw4YTP1PpxWlZe5gKBhcvF578CO+ittEBfzAB3abWEzoml0qYiNnP6LLxz4A0U9HbL+saGF4yvTa2uU8ihEojdC2/jz/LDeuB/Qis/ZFi6dQNu0x0X5GEl3HcroiFw6vu41sBAsB8sH6W7Cw+xpw3yO58gIy2EJme0yGwr5eAX1ueBsq71hveJgeJTYgyC0sRgJE9Powvpcp+9/HPKhhVcb2Cj8+jqAHyngIHs/HmL1L92FENyg9S57pKySJcDSqzxqCiPDEEks+ss06OROknw7dXG+uxS8QytbfqbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKhFQK/8BZjF9HETH1brfz4/zhxiTWCBbIz+mFIP2ik=;
 b=R9F0AB4PFtLCuBl1ynQ0ulmvUaXZPv+3zvHkNamqww+L1JTIlFx29C+eEnn7Zfhe7VkSQcnj+uGRy0F8oKxrR756Nkge0oPIm7ytjJHTCsfxg6XD15yaz9FJvScKNuqhbIZwDs/ujsT5eHwM28ddOSLH/AaWeRUNNEbSxdmMl46B5NF3aQOYZWkby/scV0FZ9yqEOT7t1eJvLhuNPLZvPY4QRitY+BdbHpRLfkGShxIdlc3qymb8tGmSrtKGJLaeiCOsaQ13ElTd2lRVXB7sbUKTtU6aktUG1/mJsFrXJBdE/596QrtDYlxbSEjm2R4ogK+XkneEXTN7K3FZhOxZbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKhFQK/8BZjF9HETH1brfz4/zhxiTWCBbIz+mFIP2ik=;
 b=DuKkMusu75NAVkCBjfQFK7yFiUiS2lZdj44N63QdE/XASA2yOwYEZmw33VXPmhwrXLxfW8D2s1x/AV/fJ/tlCBfVMK7YWAqzfXgvmtwJzfIJPhIZ24Kgy77V+8j3/DmbzU6jJ3jM0LBGlFIp1pKDbA2gn6pyPNdbqRTnk6O0ORQ=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by BN6PR11MB1602.namprd11.prod.outlook.com (2603:10b6:405:c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.34; Fri, 15 May
 2020 08:38:05 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855%12]) with mapi id 15.20.3000.022; Fri, 15 May
 2020 08:38:05 +0000
From: "Sia, Jee Heng" <jee.heng.sia@intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH 4/4] dt-bindings: sound: Add documentation for KeemBay
 sound card and i2s
Thread-Topic: [PATCH 4/4] dt-bindings: sound: Add documentation for KeemBay
 sound card and i2s
Thread-Index: AQHWJ4gqMPvByTKRG0WKHYWGRlHug6io2KSQ
Date: Fri, 15 May 2020 08:38:05 +0000
Message-ID: <BN6PR11MB1953CEF2090D6D6553650223DABD0@BN6PR11MB1953.namprd11.prod.outlook.com>
References: <1589166964-8985-1-git-send-email-jee.heng.sia@intel.com>
 <1589166964-8985-5-git-send-email-jee.heng.sia@intel.com>
 <20200511113409.GF8216@sirena.org.uk>
In-Reply-To: <20200511113409.GF8216@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.2.0.6
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.208]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22ba3d47-76b2-4d7d-97c6-08d7f8ab49c2
x-ms-traffictypediagnostic: BN6PR11MB1602:
x-microsoft-antispam-prvs: <BN6PR11MB1602B14BFF8DE1CAD81DDC70DABD0@BN6PR11MB1602.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 04041A2886
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qvr8nd63iagbk+O8vrQqScVwffaXwyYGe7mo/jNQE2BfjEAwRwK9QfCPonss9hNPUvQyJe5l53MY34XdpcbSiPzQtbKAVvsya+4o47UZXvbg+SjZ3UzxwovccWr5jX9PRmsABLdfnxzz03jLFtxbSbQoDvgo/uWD6fOLOLLFEtpgIXuPyTQoMH+Z/m9hDDwDFaJmhLM1z46ug9GogTowYctgVkWaUlpulvnQ1/BeX9Ri1xWCpLKk8T1jthO2hmTjwigKZvMrKF/ZfrCqjcxIBfksraFOoJ1OUmwDWUEZPp9QSS+pmwMn/qhz7ZQSa19oF8uNkLjnh7JwpnbRhEfZyGrNdX27o9Tt3Reme4rU6FX7QSDScP57SYuITg7VLQFH3mLtL5ouf/WYAO++4y5f9J1lTF6PJE+STNN+sy8gKT6PwFsTWtm6m0dhMGoPsveq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(396003)(346002)(39860400002)(376002)(366004)(4744005)(4326008)(54906003)(6916009)(53546011)(71200400001)(5660300002)(66946007)(86362001)(76116006)(7696005)(8936002)(9686003)(6506007)(8676002)(66476007)(26005)(52536014)(316002)(55016002)(478600001)(66446008)(64756008)(66556008)(2906002)(186003)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: qPmKmgDANhQ20uK/UTOTurrS7+A6YN8TVbuvIFcp9cxjb1KzC7enlqz7ToZZ7hQp5L8n/rH9TfU8CnD4L43dlNs8/YqLMKEmb71rZB2D0KOfDTwTguPaP4jaVWNqksHM3wEoMYcb/FTeQcpJjrd17VgXmINv8CRdE3uluXr2mrT/j9c0PYJTfQYqSufTPMKAAketzTRjna9XhudM06fl9EOSy4MKLlrDRlM2VvqRu0c8ejfkSvBo6QO1x8XH8cxxFgv7wpjNSS5+XCDmjiDzjotAsnoTeomqs55AtvXZO1mXjPr6Lak6n9QYY32t3u0ZLijr6gC4yk/v7I3DkCaz8y5Q6+x2pee1V34n23rE5BAegFP8uWE0mPhk/MxB+TaRXe4NBhP9qJvEcXCzuDDTsdAgRz+gkKzm2j2+4RXQHS4E5WE2AHdfvytS15VCFndwqCTTeFr4/TXj7OF+56k2dF70rFjZskhCDcC19scpechOJHbf99h57cNEZT32t3lh
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ba3d47-76b2-4d7d-97c6-08d7f8ab49c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2020 08:38:05.4791 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vcoqS6ukIvU0SGkrzva0KTnqgWXYpnsJGgbPYRnsFG3oKEMbBXmYF81pTsZNe/3g1xbtpK1B+k/lKdEPRuG3hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1602
X-OriginatorOrg: intel.com
Cc: "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
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



-----Original Message-----
From: Mark Brown <broonie@kernel.org>=20
Sent: Monday, May 11, 2020 7:34 PM
To: Sia, Jee Heng <jee.heng.sia@intel.com>
Cc: alsa-devel@alsa-project.org; tiwai@suse.com; pierre-louis.bossart@linux=
.intel.com; liam.r.girdwood@linux.intel.com
Subject: Re: [PATCH 4/4] dt-bindings: sound: Add documentation for KeemBay =
sound card and i2s

On Mon, May 11, 2020 at 11:16:04AM +0800, Sia Jee Heng wrote:

> +description: |
> + Intel KeemBay I2S
> +
> +properties:
> +  compatible:
> +    enum:
> +      - snps,designware-i2s

If this is the DesignWare I2S controller we already have a driver for that =
with existing DT bindings, anything that needs to be added should be added =
to that.  We can't have multiple sets of bindings for the same device.
[>>] Sorry for the confusion, I meant intel,keembay-i2s. Shall submit the f=
ix.
