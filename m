Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FF91C77C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2019 13:12:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 449C9168C;
	Tue, 14 May 2019 13:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 449C9168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557832379;
	bh=OSzw6XMUk2X0i8YhdZJzUjn420wz6gF0vIZKMpqxWrc=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X7mzNrN5UgU9koOhZGQSxAj1Lda+lbR/jHSnCKXlou3cFPduU8Z62+oj4SKZeTEh7
	 3I79m8oyUMTB9Q9u5cvfxBJO/3hQKDKVyn6CWA10sG5FfcYLJoQI9nSduwO/LSdWNj
	 y4VN43KA4qKRoOzskO0gM7aeAF3Qo54Ub5+czSac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2681F89693;
	Tue, 14 May 2019 13:11:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00C1BF89693; Tue, 14 May 2019 13:11:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FROM_EXCESS_BASE64,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 230BEF806E5
 for <alsa-devel@alsa-project.org>; Tue, 14 May 2019 13:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 230BEF806E5
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x4EBB05E020616,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcas12.realtek.com.tw[172.21.6.16])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x4EBB05E020616
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 14 May 2019 19:11:00 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCAS12.realtek.com.tw ([::1]) with mapi id 14.03.0439.000; Tue, 14 May
 2019 19:10:59 +0800
From: =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH] ASoC: rt1308: Add RT1308 amplifier driver
Thread-Index: AQHU8/tPQAgeauF2zUGmBO/aeAeg+qY+ZeAAgAGgD9D//+nuAIAJq9sAgBbJfoCAAM/mQIAFj/yAgAJ0bhD//5BlAIABxHoQ
Date: Tue, 14 May 2019 11:10:58 +0000
Message-ID: <BC6F7617C38F3E4E8CA887E07B35B82805B14BFF@RTITMBSVM07.realtek.com.tw>
References: <20190416022246.10121-1-derek.fang@realtek.com>
 <20190416153510.GE4834@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B8280116192E@RTITMBSVM07.realtek.com.tw>
 <20190417150518.GB5703@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B828011660AC@RTITEXDAG02.realtek.com.tw>
 <20190508064537.GN14916@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B1144E@RTITMBSVM07.realtek.com.tw>
 <20190512080621.GH21483@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B13EE2@RTITMBSVM07.realtek.com.tw>
 <20190513145608.GA5168@sirena.org.uk>
In-Reply-To: <20190513145608.GA5168@sirena.org.uk>
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
> On Mon, May 13, 2019 at 01:54:08PM +0000, Derek wrote:
> 
> > > I'm confused about what this limit is - is it just some arbatrary limit
> > > imposed in case some board has problems or is it an actual limit that
> > > comes from the chip?  If it's a "just in case" limit then the board
> > > should be the one doing the limiting, yes people can break things but
> > > it's difficult to get decision like that done sensibly in the CODEC
> > > driver in a way that works for everything and the general expectation is
> > > that this is all for use by system integrators rather than end users.
> 
> > It is an actual limit that comes from the chip.
> 
> If there is an actual limit in the chip the driver just shouldn't expose
> anything beyond what that limit is - the original thing I was calling
> out was that you're just hard coding a value for this setting into the
> driver, that just means that the expectation is that the values should
> be user settable within whatever the chip can support.  If there's
> settings that can't be supported at all the driver doesn't need to
> pretend to offer them.

I could remove comment for the limit setting in register patch/init list
to avoid users or integrators have any expectation.
And also there will not be any support at all the driver according to the
limit setting.
 
> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
