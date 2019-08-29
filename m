Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BD0A1D7B
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:46:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A110516D2;
	Thu, 29 Aug 2019 16:45:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A110516D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089964;
	bh=AEj9Pr0kFkTAXsYehxkP7EgUj4CLXD0uCJBtsf+drrs=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VjaxPCls7ljhbAVz02o0DgtfrbBe14iI0gMv/9eJHj0Y17aQJm3GjKzsKiPzIVQAq
	 M/fcbEpc6zAwcaXVWc7NJuaqbtog9mKCi0/yQQRc4VeT6G6GxtY3x4Hyqjl8cPz0vD
	 tPhKSanvSklLHL7S3Rov72mb47fgbj4GZdVDrwQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9DDEF89833;
	Thu, 29 Aug 2019 07:54:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6C55F89830; Thu, 29 Aug 2019 07:54:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC3C1F89824
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 07:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC3C1F89824
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x7T5s21T018587,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x7T5s21T018587
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 29 Aug 2019 13:54:02 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCASV01.realtek.com.tw ([::1]) with mapi id 14.03.0468.000; Thu, 29 Aug
 2019 13:54:01 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: "'Mark Brown'" <broonie@kernel.org>
Thread-Topic: [PATCH 2/2] ASoC: rt1011: ADCDAT pin config modification
Thread-Index: AQHVW+zXqlFjaiKMr0ijMI7Wmp8aHacP3p0AgACGr2D//6OWgIABVD1g
Date: Thu, 29 Aug 2019 05:54:00 +0000
Message-ID: <10317AB43303BA4884D7AF9C2EBCFF4002BE6083@RTITMBSVM07.realtek.com.tw>
References: <20190826090120.1937-1-shumingf@realtek.com>
 <20190828104938.GF4298@sirena.co.uk>
 <10317AB43303BA4884D7AF9C2EBCFF4002BE5727@RTITMBSVM07.realtek.com.tw>
 <20190828132055.GJ4298@sirena.co.uk>
In-Reply-To: <20190828132055.GJ4298@sirena.co.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.102.105]
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "cychiang@google.com" <cychiang@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "sathya.prakash.m.r@intel.com" <sathya.prakash.m.r@intel.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: rt1011: ADCDAT pin config
	modification
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

> > > > ADCDAT pin config sets to output mode in default.
> > > > And the driver creates the kcontrol to control ADCDAT pin configuration.
> 
> > > Why would this change at runtime?  I'd expect this to be controlled
> > > by the machine driver or a DT property.
> 
> > It will not change at runtime in the normal case.
> > I think we may use it to test the feedback signal in factory mode.
> 
> So really this is setting up a loopback for testing?

We would not like to change ADCDAT pin to input mode in normal case.
That's why the driver enables ADCDAT pin to the output mode in default.
The rt1011 supports the feedback signal which could be playback data or I/V data, etc.
If the system wants the AEC reference data, rt1011 could feedback the playback data.

The product could connect 2/4/6/8 rt1011 chips on the same I2S bus.
In a test or debug mode, we could toggle ADCDAT pin to input mode that also
helps HW engineer check the slot of feedback signal for each rt1011.

> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
