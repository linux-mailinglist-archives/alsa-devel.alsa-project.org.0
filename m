Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E27C12D9CAA
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 17:28:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C3A1177C;
	Mon, 14 Dec 2020 17:27:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C3A1177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607963326;
	bh=KvW17/oTLQ1g9eBPDam8Iy0tCS/Mw8iCsJlALOB2PPU=;
	h=From:To:Subject:Date:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SE76mM3KBZlE+LYfMJYA5VcrfwGskJg8yJwJE+EaEfAQb5zUhEPhk5Nobbd+DeKnJ
	 4/0u3QD/pel+y/FroMzrtd8+O7F9xzxw/Sb540j+LaM+kxstmORY5v0O1I8sagOgDC
	 jRaSviAjXGbmKvYkwhzlvArFB1Ww5y9vBUToJViw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B481CF80240;
	Mon, 14 Dec 2020 17:27:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 836F9F801F7; Mon, 14 Dec 2020 17:27:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC975F800ED
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 17:27:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC975F800ED
IronPort-SDR: ekom9xdIvVmgQgTDLa2Gi93FJo2dYS8m92MRonIYNhsWHZPC/fjuEgwXfny5CML5N+y0t9ol6/
 6xxKbjkhgVJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="162483501"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="162483501"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 08:26:57 -0800
IronPort-SDR: oPI1I5+5B6J/IWOa+vudSW7fdslTjcnCnsCT94JuJ/GrpKaaCOzSkMix/DVof7boIEfqe70o5c
 ynVqe1rU0Q7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="351403450"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by orsmga002.jf.intel.com with ESMTP; 14 Dec 2020 08:26:55 -0800
Received: from irsmsx601.ger.corp.intel.com (163.33.146.7) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 14 Dec 2020 16:26:55 +0000
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7]) by
 irsmsx601.ger.corp.intel.com ([163.33.146.7]) with mapi id 15.01.1713.004;
 Mon, 14 Dec 2020 16:26:55 +0000
From: "Rojewski, Cezary" <cezary.rojewski@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v1] catpt: Switch to use list_entry_is_head() helper
Thread-Topic: [PATCH v1] catpt: Switch to use list_entry_is_head() helper
Thread-Index: AQHWzUyfPxOhODz4j0quXnboN7DkTan2WAcwgABrb4CAAAytQA==
Date: Mon, 14 Dec 2020 16:26:55 +0000
Message-ID: <221cc8d271dd41acbea2696261c5ab26@intel.com>
References: <20201208102637.1168-1-andriy.shevchenko@linux.intel.com>
 <7b7ad24505604110aeeebb2a0b30e573@intel.com>
 <20201214153729.GK4077@smile.fi.intel.com>
In-Reply-To: <20201214153729.GK4077@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [163.33.253.164]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
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

On 2020-12-14 4:37 PM, Andy Shevchenko wrote:
> On Mon, Dec 14, 2020 at 09:14:13AM +0000, Rojewski, Cezary wrote:
>> On 2020-12-08 11:26 AM, Andy Shevchenko wrote:
>>> Since we got list_entry_is_head() helper in the generic header,
>>> we may switch catpt to use it. It removes the need in additional variab=
le.
>>
>> Thanks for the patch, Andy. One nitpick below.

...

>>>    	struct catpt_dev *cdev =3D dev_get_drvdata(dai->dev);
>>>    	struct snd_soc_component *component =3D dai->component;
>>> -	struct snd_kcontrol *pos, *kctl =3D NULL;
>>>    	const char *name;
>>>    	int ret;
>>>    	u32 id =3D stream->info.stream_hw_id;
>>> +	struct snd_kcontrol *pos;
>>
>> Shouldn't structs be declared before any primitive-types?
>=20
> Good question. I consider the length of the line is more important
> (to keep reversed xmas tree order).
>=20
> If you think we should leave as is tell me, I'll send v2.
>=20

I'm not in favor or against either of options: it comes down to the
coding style of the project - sticking to same one makes code
cohesive (by project I mean Linux-kernel).

However, to switch entire catpt to reversed xmas tree, more code changes
are required (even this very function is an example of that). Leaving as
is in this update while considering the subject in other series might be
the better outcome.

Czarek

