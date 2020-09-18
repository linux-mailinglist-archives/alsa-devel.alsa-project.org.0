Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D8826FC27
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 14:12:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42C3D16DE;
	Fri, 18 Sep 2020 14:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42C3D16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600431131;
	bh=Pa8mALZHKhIHdgxv0vF2rMJW7AoOvuW0oEiDAzvJdzk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MpQGqPicaB9XGXaboP9iW547hY9wNTD3uHBC+eWkOlcWGrC62jjY/Pv5L7qwKqo8Q
	 ZvPRhwAkR2JOjpy7ms9h9bdIjkSs/AHpZ5kHiDsj6OYrcjx6hE7rMlXyoyGHP+VY2b
	 1q0oKRx71Uw5neXipbuLbmW94YBcLQFh8AN9mzrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64FE2F8015C;
	Fri, 18 Sep 2020 14:10:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72F95F8015A; Fri, 18 Sep 2020 14:10:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,PRX_BODY_135,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65B34F8013A
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 14:10:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65B34F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.i=@intel.onmicrosoft.com header.b="BiMVjqqG"
IronPort-SDR: F3WjsB1WhRXcApO6DPJrl+Tvvw06k562+KPS5xHZYJmDxwk3q6HeGr36cjRtSC1onflsu71R6D
 a+OH3Fv31X0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9747"; a="159972997"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
 d="scan'208,217";a="159972997"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 05:10:10 -0700
IronPort-SDR: tAE8raIm3ysV0vN66pVgqhTC0HTc7LD65fkJSfzYW+KDAhGxbNAQgNIrztRH1yEYXgHQmDpH+4
 OGPISsTGqpmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; 
 d="scan'208,217";a="344724338"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 18 Sep 2020 05:10:09 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 18 Sep 2020 05:10:09 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 18 Sep 2020 05:10:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 18 Sep 2020 05:10:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 18 Sep 2020 05:10:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDGovuQsjEKKCbAwtG5iCw4XRhJSqGdbr4r7I7+h4lIc3nVQumJov9MRY/nQK+H1aQN92vwS+8QncmUGbIw/sr7b9K7+dntq9BKWfrhEiuldScQy/miOokIJqddABdOJhwHCK0Kf46vlA1W8OKouTJb1E+qz7E71BUxTqLliDmZWp9kpl1tSaJi9EbR5ZyEktM1+IdOvmcvoTt5oLfQGgJPx5HQ8ovI06XniNS9ZyM7l9u7tPP1ycDbBf16TK6eebCaLfqwS+0s+NXmgBU6k06Z7AHLmobqBzhJoGZghs7DSOHo8QMHoGeFC+rh8/p7R87IpKBlVRUKKIYKZpjbpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cal+dpB+24SjpSb/idXU0flwE8nLk5i1pVqF86AbnLA=;
 b=XUvQYDf6dVraFUR+qkRLY6w+wFLaWbuv/P6fsqk6eawq91SffhT9bEgC1TcAlWgP/UIVrJx27zG5ct4Pj1Oip8bnh06g1ZPUc2AmGIBB40xsFMi08vLxJb/6jHW3xWKHp1E7tkPlfBCIXIYRiGavN2HelwAxbhl+iyPUpfYBagPtQgvixhYvfcfb1wYlWB7VLJPzIb6VduOd6gDJtr4fJ/P42yKcGXUMc+iZT9e25ftJQyF/sqWfzOlggM3BLv95lFAXkRdhndS3cEPwNOlW5Jdbe3oRknhuyjEK9f+T0yIgXKTMjqx09LKhfjrkENJtsC1qZASruht91Kr08ozaRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cal+dpB+24SjpSb/idXU0flwE8nLk5i1pVqF86AbnLA=;
 b=BiMVjqqGTQXAxt4ZflkIn5rWaEfgKdF6BFTL6jNtSeSnfhRYrbdKhh6XVUVUbnFyUFgaiWTXtsdvJ3KKWzZ2sAatzDRhlYi+f8Y1NVejlcRLLOYZKrBdzgungQW+O83mbCShcbJt726ra1DJp0OW1yRwYx/Sm8zcYPsIg26utRE=
Received: from DM6PR11MB4074.namprd11.prod.outlook.com (2603:10b6:5:5::11) by
 DM6PR11MB3801.namprd11.prod.outlook.com (2603:10b6:5:136::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16; Fri, 18 Sep 2020 12:10:06 +0000
Received: from DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::a061:bd5e:c46a:fa40]) by DM6PR11MB4074.namprd11.prod.outlook.com
 ([fe80::a061:bd5e:c46a:fa40%3]) with mapi id 15.20.3348.018; Fri, 18 Sep 2020
 12:10:05 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Vinod Koul <vkoul@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 0/2] soundwire: use {u32|u16}p_replace_bits
Thread-Topic: Re: [PATCH v2 0/2] soundwire: use {u32|u16}p_replace_bits
Thread-Index: AdaNtJxhNRDk9At5TiCufxTLBBYecg==
Date: Fri, 18 Sep 2020 12:10:05 +0000
Message-ID: <DM6PR11MB40749F64E911CF7E430C740EFF3F0@DM6PR11MB4074.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [220.133.4.96]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25ed9ac4-98ad-4917-e2e8-08d85bcbc7b2
x-ms-traffictypediagnostic: DM6PR11MB3801:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3801DA2A1267DB6CB8E4DFBCFF3F0@DM6PR11MB3801.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 26+tEvRJCxlQ/z9whUm72w86n3qBhrsIJnk7HqEMznp6V0zDPu0tKRP5uMe7ypUuxPNX3TP0ek84kLKK00Pu1x3ouR0nuMIAIIsi0C5IzNM65pAxHFRkRWSr6kFkoF1N1uG8TPmEQZZ3vrblKcs2dfscntuw5/lpb5yjLilssUEe9RJg0x+R8o1Km1/yXKCu9u0l/tmH7AXvJCdtnj1T3LVkgeYrO+J/hPjLSCycFdTc8bBcJp9uyXKYcn+tZZGiSgDtSMjCd5pxSYk92LoHL1xWU2BU+UrN0f8ThYsBiFQVrOqZ7wEW1ZmMs0kDftvybAHmHQI+bl1Vfd3qOVxEC/vjm5u1oDItl0DbvTm+kfRaO7JT4rwUqgnSV9wnRjS3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4074.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(8936002)(2906002)(55016002)(26005)(186003)(316002)(52536014)(4326008)(478600001)(83380400001)(9686003)(66446008)(6506007)(86362001)(8676002)(66946007)(53546011)(5660300002)(64756008)(7696005)(76116006)(66476007)(54906003)(33656002)(110136005)(4744005)(66556008)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: LKiE3b/tTFzSpIzdlVvFIzffraMi6vkbeLSbmKQO3R7zCnJgVHGjhf4w50oQuhL56Pw2kjGwTDh5YXyHBQi9PAUx8pGc3iInMRi3MPUoRsGUBeu/GEpaxQ01X167lbV96ntEZ/SQ+OhZnQKlNa5C87MJ9UcVGIwAzKx0NBQe45NPjBMTUStwT6Yhk8cfS5/wQg3REakcJ/5Cy3kohFjn1UzNZTYn7AEJ6/NfN4tmdiQLthvvc2xKeE/oZE8JcggNz7QQBUTTt+LgMgKLgqYS9cN4IzXCKJkpHb55sS67CkBcFuDv5ljU12iYLsXWtcwxSHru5L4YCDb40gG6PbOsicGCNUY1CjjUuD6EdogEHsLxZW7pTS08QFHcOLBd6WF2Eesg4lOHiOqNBh4M/z91h4yQyYQxqQ3L+fXX0vvCjBzER7qfukv9SGvIO2OeCGgQ7eg2MD7yvhMDNHIX2VcPQxf4tos2SC2q0T5sgvkb7x3Wp4hnN78Jp2YLWi/pr/Nl52+NgqDiCVGpz+x7OfK4fQnNIeYtbBaKUcEtUOCbLxYt2dZL+j5bdbEaPw4ni4w1SNBbOJ17fTPioFe5Q1LK1xYgquCyCX4fffQxUNpVto32uGUy8Ta98hCtArwdLZO+C0IqIIyxTFbcwfO+APpRQQ==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4074.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ed9ac4-98ad-4917-e2e8-08d85bcbc7b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 12:10:05.9173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dPrQNXPzqY3rjoV8NTXhuj3gInLaiz7qj2KEy2uYrOO6aLZM6PyEmR0L131fmkXV/VwjrKG4kS/HXo4andPckg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3801
X-OriginatorOrg: intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "Kale, Sanyog R" <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Liao,
 Bard" <bard.liao@intel.com>
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


On 9/17/2020 8:01 PM, Vinod Koul wrote:
> This is v2 of the series to fix usage of FIELD_PREP and use
> {u32|u16}p_replace_bits.
>
> v1 used u32_replace_bits but looks like it might be removed so use the
> {u32|u16}p_replace_bits() instead. Also this helped to find that one
> instance in intel driver should have used u16p_replace_bits() so that is
> fixed too
>
> Vinod Koul (2):
> soundwire: cadence: use u32p_replace_bits
> soundwire: intel: use {u32|u16}p_replace_bits
>
> drivers/soundwire/cadence_master.c | 21 ++++++++++-----------
> drivers/soundwire/intel.c | 14 +++++++-------
> 2 files changed, 17 insertions(+), 18 deletions(-)

Tested it on a Intel platform. So

Tested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
