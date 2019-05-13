Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 554C21B781
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 15:56:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3FB216C4;
	Mon, 13 May 2019 15:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3FB216C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557755771;
	bh=Z+OhP7fyeRvZomT/d7zkUgpFrRLiQ7KBkzqcwGbADqs=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TDuAVtaDRfOMHVdV737TfL/tDoLOn9Z0/nHSffkAKJwjsDCm+tiQsmt2R9iuJKiog
	 ug8+/FPHf/6Hiy3IqRcgMWuMzi9hCEXddZXbZS4wIhqww+1JWVLBs7zCfpwn4IoQOb
	 7vHsdsQp1yFjhJHIrha3OH8rBp7R1yLJ5Zc5sdt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02791F80733;
	Mon, 13 May 2019 15:54:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07846F89633; Mon, 13 May 2019 15:54:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FROM_EXCESS_BASE64,
 RCVD_IN_DNSWL_BLOCKED,SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C852F80733
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 15:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C852F80733
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x4DDsAQ5024402,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcasv01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x4DDsAQ5024402
 (version=TLSv1 cipher=AES256-SHA bits=256 verify=NOT);
 Mon, 13 May 2019 21:54:10 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCASV01.realtek.com.tw ([::1]) with mapi id 14.03.0415.000; Mon, 13 May
 2019 21:54:09 +0800
From: =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH] ASoC: rt1308: Add RT1308 amplifier driver
Thread-Index: AQHU8/tPQAgeauF2zUGmBO/aeAeg+qY+ZeAAgAGgD9D//+nuAIAJq9sAgBbJfoCAAM/mQIAFj/yAgAJ0bhA=
Date: Mon, 13 May 2019 13:54:08 +0000
Message-ID: <BC6F7617C38F3E4E8CA887E07B35B82805B13EE2@RTITMBSVM07.realtek.com.tw>
References: <20190416022246.10121-1-derek.fang@realtek.com>
 <20190416153510.GE4834@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B8280116192E@RTITMBSVM07.realtek.com.tw>
 <20190417150518.GB5703@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B828011660AC@RTITEXDAG02.realtek.com.tw>
 <20190508064537.GN14916@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B1144E@RTITMBSVM07.realtek.com.tw>
 <20190512080621.GH21483@sirena.org.uk>
In-Reply-To: <20190512080621.GH21483@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.141]
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Albert Chen <albertchen@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1308: Add RT1308 amplifier driver
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

> Subject: Re: [PATCH] ASoC: rt1308: Add RT1308 amplifier driver
> 
> On Wed, May 08, 2019 at 01:17:54PM +0000, Derek wrote:
> 
> > > The maximum volume can be limited with snd_soc_limit_volume() but if the
> > >  limit is for the speaker then that's machine dependent anyway.
> 
> > The maximum volume setting is temporarily not machine dependent.
> > It avoids harming if any machine doesn't set the limit volume.
> 
> I'm confused about what this limit is - is it just some arbatrary limit
> imposed in case some board has problems or is it an actual limit that
> comes from the chip?  If it's a "just in case" limit then the board
> should be the one doing the limiting, yes people can break things but
> it's difficult to get decision like that done sensibly in the CODEC
> driver in a way that works for everything and the general expectation is
> that this is all for use by system integrators rather than end users.

It is an actual limit that comes from the chip.

> 
> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
