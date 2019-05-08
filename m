Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2D617A52
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 15:19:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C65FB1AA0;
	Wed,  8 May 2019 15:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C65FB1AA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557321593;
	bh=u7H/3S+7p7GnytdRzrA9TYAV9YaeYjkKHJCKTWw4Y/E=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nPH/zctI0q37U6qCIRvsCIzgLMOaPJ9NADEl0eokeylpPcS6ZfczoIDLggrbi10Ov
	 JdPqhzbCCVTcK/KB7F+HTuyoJJ3r+FBGezPPtEDJssrexjF3cXDxv2Iev0CpcbJpEz
	 oUtGAFYlJ0cnmPVoD+/gWdeNpDpmBJyOrOecb5ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9277F89705;
	Wed,  8 May 2019 15:18:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A00DF896F0; Wed,  8 May 2019 15:18:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FROM_EXCESS_BASE64,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5041FF807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 15:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5041FF807B5
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x48DHuch005816,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtitcasv02.realtek.com.tw[172.21.6.19])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x48DHuch005816
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 8 May 2019 21:17:57 +0800
Received: from RTITMBSVM07.realtek.com.tw ([fe80::a512:a803:bf1e:b23]) by
 RTITCASV02.realtek.com.tw ([::1]) with mapi id 14.03.0439.000; Wed, 8 May
 2019 21:17:56 +0800
From: =?utf-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
To: Mark Brown <broonie@kernel.org>
Thread-Topic: [PATCH] ASoC: rt1308: Add RT1308 amplifier driver
Thread-Index: AQHU8/tPQAgeauF2zUGmBO/aeAeg+qY+ZeAAgAGgD9D//+nuAIAJq9sAgBbJfoCAAM/mQA==
Date: Wed, 8 May 2019 13:17:54 +0000
Message-ID: <BC6F7617C38F3E4E8CA887E07B35B82805B1144E@RTITMBSVM07.realtek.com.tw>
References: <20190416022246.10121-1-derek.fang@realtek.com>
 <20190416153510.GE4834@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B8280116192E@RTITMBSVM07.realtek.com.tw>
 <20190417150518.GB5703@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B828011660AC@RTITEXDAG02.realtek.com.tw>
 <20190508064537.GN14916@sirena.org.uk>
In-Reply-To: <20190508064537.GN14916@sirena.org.uk>
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
> On Tue, Apr 23, 2019 at 01:39:59PM +0000, Derek wrote:
> 
> > > On Wed, Apr 17, 2019 at 11:40:28AM +0000, Derek wrote:
> 
> > > Please fix your mail client to word wrap within paragraphs at
> > > something substantially less than 80 columns.  Doing this makes your
> > > messages much easier to read and reply to.

Sorry for the neglect of mail format. I will pay attention.

> Please don't ignore review comments, people are generally making them for a
> reason and are likely to have the same concerns if issues remain 
> unaddressed.
> Having to repeat the same comments can get repetitive and make people
> question the value of time spent reviewing.  If you disagree with the review
> comments that's fine but you need to reply and discuss your concerns so that
> the reviewer can understand your decisions.
> 
> > > > > The ones here with comments look an awful lot like they're
> > > > > system specific config which should be left up to either
> > > > > platform data (or DT/ACPI configuration) or done at runtime
> > > > > (like gains).  Some of the others like the pads configuration might
> > > > > also fit into that.
> 
> > > > We don't open the DA gain setting for user at runtime, so have to
> > > > set a default level in the init list.
> 
> > > That's not the way Linux drivers generally work...  is there some
> > > technical reason for that or is it just some kind of policy decision?
> 
> > Maybe I could add a gain control for the user and set the gain to safety
> >  max level in init list for speaker protection.
> 
> The maximum volume can be limited with snd_soc_limit_volume() but if the
>  limit is for the speaker then that's machine dependent anyway.

The maximum volume setting is temporarily not machine dependent.
It avoids harming if any machine doesn't set the limit volume.


> ------Please consider the environment before printing this e-mail.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
