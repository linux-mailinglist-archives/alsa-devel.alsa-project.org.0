Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87951BC790
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 14:08:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 175D0169A;
	Tue, 24 Sep 2019 14:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 175D0169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569326892;
	bh=BZIVSIHG+LOaY13IruXXXwWpqAuhbXH3GqDvjJCvyHU=;
	h=From:To:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=itJFy0RcMiaM7d2mHq+bKBKppPl1DJWla0DJ9sQ8soNG09GAOfGjCL0XBHZgkotYe
	 iRGdTFASBhcbQm8TnTyhAHboWOoy1F36kud1FaRH9f3bH3t4/O8Fmrk8bz1lyehvNn
	 Fv2uYAkiiARP9lDOikKk3opmCa9vPvsdBjEzSRDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89156F803F4;
	Tue, 24 Sep 2019 14:06:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44A3BF8045F; Tue, 24 Sep 2019 14:06:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C59EBF80213
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 14:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C59EBF80213
Received: from [67.219.250.198] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.us-west-2.aws.symcld.net id 61/1A-25696-3B60A8D5;
 Tue, 24 Sep 2019 12:06:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRWlGSWpSXmKPExsWSLveKXXcTW1e
 swaH/ahZXLh5isujc1c9q8ev/MyDr0xIWBxaPDZ+b2DzmnQz0aHmwld1j39tlbAEsUayZeUn5
 FQmsGZdfGxYs5q54c2QlewPjBO4uRi4OIYH/jBJ7Vqxh72LkBHJeMEqsneMNYe9llDi4NBLEZ
 hPQkJg/eyYLSIOIwAlGicV3rjCBJIQFsiQaFm5lBLFFBLIlns3ZxgRhG0n0dc9hAbFZBFQlPp
 ++A2bzClhKHLk8hxFicz+TxKqzh8EaOAVsJG4unMsGYjMKiEl8P7UGLM4sIC5x68l8MFtCQEB
 iyZ7zzBC2qMTLx/9YIWwFiRlvtwDVcADVa0qs36UP0aooMaX7ITvEXkGJkzOfsExgFJmFZOos
 hI5ZSDpmIelYwMiyitEiqSgzPaMkNzEzR9fQwEDX0NBI19DYRNfI2FQvsUo3Sa+0WLc8tbhE1
 0gvsbxYr7gyNzknRS8vtWQTIzDeUgraXu9gfH3ktd4hRkkOJiVR3kM/OmOF+JLyUyozEosz4o
 tKc1KLDzHKcHAoSfDOYuyKFRIsSk1PrUjLzAHGPkxagoNHSYT3FAtQmre4IDG3ODMdInWK0ZJ
 jwsu5i5g5Dh6dBySPzF26iFmIJS8/L1VKnNeEFahBAKQhozQPbhwsPV1ilJUS5mVkYGAQ4ilI
 LcrNLEGVf8UozsGoJMwrATKFJzOvBG7rK6CDmIAOUnbuBDmoJBEhJdXANEXxXn2WcldqhZs31
 /LLLYzPjprwvz/iv6Wrfd3jdaGCQi4/8wV2GXQtkT3lF3Jh1tpLh+budY1Y1/k+br27Md/mr5
 tP81sraMQ/vrfY78u10xv23nf/q3xKYzOvmWlITPPGtAKL58vfTnvG/UGpYVO62LFiF/lzf4x
 WturPLbnmn8gxK2/Fl6nTKzoezJ5Z8HaCgZHtfj/NBabrf0vmu12tXsmz5NUG+f0BkyY57wxY
 1xDI+sL84d/3p72yuLdEiWlMyb226XhGRV332zm7NJnrXpbxfLCe1iRjsl/8f8uB/uYJRx/OW
 sf0yflU/OUXq23T7Tf87/u5N7WotYxtUXn/z5zDNW83nD28Z7+GhoMSS3FGoqEWc1FxIgBukU
 NKygMAAA==
X-Env-Sender: mpearson@lenovo.com
X-Msg-Ref: server-3.tower-346.messagelabs.com!1569326767!5280!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1580 invoked from network); 24 Sep 2019 12:06:10 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.7)
 by server-3.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Sep 2019 12:06:10 -0000
Received: from reswpmail02.lenovo.com (unknown [10.62.32.21])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 80BE83A80B00B880C583;
 Tue, 24 Sep 2019 20:06:06 +0800 (CST)
Received: from reswpmail05.lenovo.com (10.62.32.4) by reswpmail02.lenovo.com
 (10.62.32.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1591.10; Tue, 24 Sep
 2019 05:06:04 -0700
Received: from reswpmail05.lenovo.com ([fe80::41c7:6219:84e5:c550]) by
 reswpmail05.lenovo.com ([fe80::41c7:6219:84e5:c550%13]) with mapi id
 15.01.1591.008; Tue, 24 Sep 2019 05:06:04 -0700
From: Mark Pearson <mpearson@lenovo.com>
To: Jaroslav Kysela <perex@perex.cz>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, Elimar Riesebieter <riesebie@lxtec.de>
Thread-Topic: [alsa-devel] [External] Re: alsa-lib: Add ucm support for
 whiskeylake sof-skl_hda_card audio
Thread-Index: AQHVcs63IhVkYJwriEqxgXSDgzZzXac6uilQ
Date: Tue, 24 Sep 2019 12:06:04 +0000
Message-ID: <153ba191eb3c4849b6e65db5fc8e8760@lenovo.com>
References: <20190919142329.35bsdnh5skuj7jl3@toy.home.lxtec.de>
 <853b3859-8c8e-1c52-becb-3807d351b8f1@linux.intel.com>
 <f11c5347d8504148a47fdbc48d920f59@lenovo.com>
 <98b99cea-9be1-f232-f62c-1f0b7a10e295@linux.intel.com>
 <38abcb71-3041-7015-e56a-43f628b2faf1@perex.cz>
In-Reply-To: <38abcb71-3041-7015-e56a-43f628b2faf1@perex.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.251]
MIME-Version: 1.0
Subject: Re: [alsa-devel] [External] Re: alsa-lib: Add ucm support for
 whiskeylake sof-skl_hda_card audio
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

> >
> > I think the first order would be to have the file cleaned-up, with its
> > Intel origin clearly stated with a signed-off-by tag.
> >
> > Then once this is done, the Debian package creation needs to be
> > handled (using either the ALSA repo or the cloned version on SOF
> > GitHub). I don't have any experience with Debian packages so can't
> > really comment on the effort it would take.
> 
> I did some cleanups here:
> 
> https://github.com/alsa-project/alsa-ucm-
> conf/commit/f796f0852a097e238fa9f5efb174e95b5ee6c8b7
> 
> Pierre, could you confirm the original source and are you ok with that?
> 
I got confirmation from Intel that they are the original source - they provided me with the files (as an aside in case it is important, originally they were working with Canonical on getting Ubuntu working on one of our (Lenovo) platforms). I was following up with Canonical to just check what they had done but haven't heard back yet.

Since Intel has provided the files to me directly - can I act as an original source confirmation?


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
