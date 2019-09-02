Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DF1A4EA9
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 06:36:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 566911688;
	Mon,  2 Sep 2019 06:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 566911688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567398971;
	bh=pmNuYPRz3+ya1L3HqnlXuO1MB1eN98qXh6gcomAWItg=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FjqMkzt9Ob3f2cjjg1a2CiqNb7ul+j2u/k9iTvwo8jqtUeBUmyrg+JVa5YvHRqWjc
	 bHB7Rs4sFePOxF+A3lFDK+6qG10KP0kMZ8mCtRGmhUeR5oK6kgI27SdNscuV7yElbk
	 5s5+NnlDzzr77rbJbDHyEyrQnlvV5vF6ill0+8CQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CFB5F803D0;
	Mon,  2 Sep 2019 06:34:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39918F803D0; Mon,  2 Sep 2019 06:34:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CCF8F8011E
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 06:34:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CCF8F8011E
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x824Y6HK014729,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x824Y6HK014729
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 2 Sep 2019 12:34:06 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCAS11.realtek.com.tw ([fe80::7c6d:ced5:c4ff:8297%15]) with mapi id
 14.03.0468.000; Mon, 2 Sep 2019 12:34:05 +0800
From: =?utf-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>
To: "'Mark Brown'" <broonie@kernel.org>
Thread-Topic: [PATCH 2/2] ASoC: rt1011: ADCDAT pin config modification
Thread-Index: AdVhR6YYXfnBqF7USQCuxOA9PK1jjA==
Date: Mon, 2 Sep 2019 04:34:05 +0000
Message-ID: <10317AB43303BA4884D7AF9C2EBCFF4002BE9C67@RTITMBSVM07.realtek.com.tw>
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

> > > So really this is setting up a loopback for testing?
> 
> > We would not like to change ADCDAT pin to input mode in normal case.
> > That's why the driver enables ADCDAT pin to the output mode in default.
> > The rt1011 supports the feedback signal which could be playback data or I/V
> data, etc.
> > If the system wants the AEC reference data, rt1011 could feedback the
> playback data.
> 
> > The product could connect 2/4/6/8 rt1011 chips on the same I2S bus.
> > In a test or debug mode, we could toggle ADCDAT pin to input mode that
> > also helps HW engineer check the slot of feedback signal for each rt1011.
> 
> I think this needs more than just a straight userspace control on one device,
> these use cases make sense but they'll need to be configured over multiple
> chips simultaneously otherwise there's some possibility of hardware damage
> (eg, if two chips try to drive the signal at the same time).  If this really can be
> usefully varied at runtime then the driver bit of this should probably be an API
> that the machine driver can call, the machine driver can then expose a control
> that sets all the chips involved up together.

I understand your concerns and comments.
In a design-in project, we will provide the proper control settings
to arrange the slot location of ADCDAT signal for each rt1011.
HW engineer will confirm the ADCDAT signal, too.
So, the customer should not make two chips drive the signal
at the same slot and at the same time.
But, there is a chance to happen if the customer sets the wrong control settings.
We will take your suggestion to make it as API call.
The machine driver knows how many rt1011 chips connect and
make pin config change together.
Thanks.

> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
