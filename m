Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A596A1F7341
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 07:00:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 349D51682;
	Fri, 12 Jun 2020 06:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 349D51682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591938049;
	bh=bGhAvxqs2LBSpgJRXrplPU47SViMOIDjMHbzQRAoOLA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qUA3hNSTxHGp+nw9Nufji8aafcXutYkhOR7YG995paXIorf2Km25gGEJzHj2omZ1s
	 dYArsE+uq+qnGJfaGDMeFeDjh5I/zdPqEpb1/qiASSHvi5hxT/XkKUkBGKf+EHPVmu
	 pHRcaLf5a/4vOhvTH6+pjWxDq0sUqqyw3gvnqbjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16407F801F7;
	Fri, 12 Jun 2020 06:59:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A72C6F8021C; Fri, 12 Jun 2020 06:59:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1E38F800C7
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 06:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1E38F800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="g6TUENI8"
IronPort-SDR: jrPbFygNx24NVUvTLwASElbPBAak74P3axwRhmsZ2zTr11LzE1puCoD7S3JgTKdGJFSax92PQQ
 w8o8tVIfdIbA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 21:58:56 -0700
IronPort-SDR: id3/765zWPmRIAAWH1d+G8x/6Uz7jdm7qDuF7clZWFsHgT5gD82y5mJlLYY7OiUePXYTZKFHn+
 Q1ufJrWLAznQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,501,1583222400"; 
 d="scan'208,217";a="275597069"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
 by orsmga006.jf.intel.com with ESMTP; 11 Jun 2020 21:58:56 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
 ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 11 Jun 2020 21:58:56 -0700
Received: from ORSEDG001.ED.cps.intel.com (10.7.248.4) by
 ORSMSX153.amr.corp.intel.com (10.22.226.247) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 11 Jun 2020 21:58:55 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.55) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 11 Jun 2020 21:58:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/ct66kF8ge59aBTL0QcU/RAroDEuT+08dF8/tPcF6Hnk5zQXpojfK372olqma+8Fn6Bf6H1kOqfb+1WkNi6Ns68yEa0zsd3lPxbsprHf20gRRRgF6/dtrdCE3/0jpVA1J2S3mVCUsOCvxa0SeH4FsQG+sJUyval+qtPYuqE1oErcy9NPHyOdRTDA/nu8JhqdwtVxAmWvZKIvTXgQt8wuWhKOd1yWCqmpC59O5Xam30n7/RQDENjGYPpF/i5rTd+UOANBgD+9u/hs/V9ESzJ5yrIZd34HEnPgiRHbiQFCoHLiXbgBecBnONfE3KluwxCn8BkZF4PDFxsENDGSOdMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kuTbrUjpgIZOxIZVT+7PxNnj7tnS+28Z/khsUlp+vk=;
 b=NmnOE5hzTSRuCpDSxY057faP2wBXrqzgejyFUTNohtDIkM5OAmOAsIxpJzuHbES7TsSzA1RPcLpPVSAsuf+jk/hi4XoTOj1UKg2PGi8pgWHAwcMnSUEm6sEYj4EdOMGe+xdpokzj9gU8SzAK0lMAiX6cXYGIwAI4uwoKd6p9LnjfvsXCXA1xAM+Dbi9zaN/j22t0Gsq8FYZM5xB2doRGa3WnCKcyX9Ek82eFkpdqLftB8lRiTdbM9siPnMjyD0oLHENM14QKKvCSJHJr4o6zvr3JXy8sMDBqfC9gSwzxLMgtxq58TsG7DuIyOhMuDuQOk9BjANS8o7CwehWIlRsY1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kuTbrUjpgIZOxIZVT+7PxNnj7tnS+28Z/khsUlp+vk=;
 b=g6TUENI8SNvjYtDGMyPlgOZHITvsyV5VbiH01LPkM+2q92C7dIlufd9jXFTLMLXjstQ3GsCX8EqbxvK5T58oguuZtZ2EzELdVds/wKQkeaRLpw5AEasJa6bbWabdHZXSzc3y0pJpaH4zFmhYOCRtRgPz0Vf+IbrA1f5YJTiNu1Y=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by BN6PR11MB1377.namprd11.prod.outlook.com (2603:10b6:404:49::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 12 Jun
 2020 04:58:52 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::55f9:3fed:cc3e:3855%12]) with mapi id 15.20.3088.022; Fri, 12 Jun
 2020 04:58:52 +0000
From: "Sia, Jee Heng" <jee.heng.sia@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: Re: [PATCH v5 0/3] ASoC: Intel: Add KeemBay ASoC platform driver
Thread-Topic: Re: [PATCH v5 0/3] ASoC: Intel: Add KeemBay ASoC platform driver
Thread-Index: AQHWQHT+UVTZqL/xV02EU10s2v24hA==
Date: Fri, 12 Jun 2020 04:58:52 +0000
Message-ID: <BN6PR11MB1953913840E37CCE88392A29DA810@BN6PR11MB1953.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: alsa-project.org; dkim=none (message not signed)
 header.d=none; alsa-project.org; dmarc=none action=none header.from=intel.com; 
x-originating-ip: [192.198.146.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d9dd230-49d9-464b-c99e-08d80e8d4d3d
x-ms-traffictypediagnostic: BN6PR11MB1377:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB137776B8FA2E9391382F66A2DA810@BN6PR11MB1377.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K8btCeJ1wizgsu5Yt+L7iL7FX3wwIrG4QaYhQ1ZqMKwt11EbS+tSGlY2fq8JLQHxaIXmx3V2XUi+JRYKI6yhTwXrqx7nChFWlPr35ISx1o1n6gntZc/slDse2U8s0i4O3/txfHsfh6/9Gt2bIbRk6x3+SJPjFS6XY63fLM7pnbvkCH2GcEnR7u2GPEc//MwkS9fOP17TgLuNgvkFBlXyPL5v9Cp0bnedtaIGP3IhOWK4y53KsOuM1t3b3yoSfrhTThhnC7cxhz1VeMjCDMmILssDlWbxl877nNKSek5YLr7VCid+JDMnksH4P88F2jQN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB1953.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(376002)(366004)(39860400002)(346002)(396003)(91956017)(66556008)(4326008)(52536014)(26005)(66476007)(64756008)(8936002)(5660300002)(66446008)(66946007)(76116006)(186003)(558084003)(7696005)(6916009)(9686003)(8676002)(33656002)(316002)(9326002)(55016002)(2906002)(71200400001)(6506007)(86362001)(4270600006)(478600001)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Q34sQyjm+hY59rxsI1a/cXmsUSoUDUyQQ2GCwabnN0SdyIA9wu3N2jElsXgiY6z89AIAtXPMN2si+E3gU2z0qe58hdQAuOoyveKIwSPnJ6eqNQKCzlJRAua4HtK7IKicSw1czwzseTgpleMa59iWJPQ2O/+opjTWDsLpgq3chmMzQMISCghGWULkhqXKCvZGo8UBbHhZptZHCYTAWBUQb/OoHhEATcgNcaY/0u2G+IR8RgisnAvAWtY4sncMb9im46xW06vkvvAS7pImcx3taY6wF14CTWjh8utDTQF8RCWtdUrE22MNVptEk7CScvVCXHYEb8hB6a7fMMT/5MEdR2xuHIQn9+nOmiUMrALgNqEkbzgaVwaG6CrGUx8H4PB55PSAnISt4YbDKj4DHdyCzDzSLhF/9i1nRdDN9RAlCqxJdgFYGqbTxkAohRuGO7bkzK7O7IUs2c/vAwsZ48w+nqobGUSNZ5o72q+P6iv6LfA=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9dd230-49d9-464b-c99e-08d80e8d4d3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 04:58:52.1436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ubf0iS076J8i8ZZJ5bc6eu7TXTA+Wuxso2nkN+IFVvnOHLLVMuIdumsupGeQDuPiRQhjWCbRPCm7Ic6yhfSNfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1377
X-OriginatorOrg: intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>,
 "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Please merge the patches if there is no further comments.

Thanks
Regards
Jee Heng


