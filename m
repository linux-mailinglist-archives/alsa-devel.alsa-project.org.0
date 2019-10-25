Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBCAE4F70
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 16:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3642183D;
	Fri, 25 Oct 2019 16:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3642183D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572014710;
	bh=l3Gt0t/zLoUsw1rto/whV3h3K43Kz2tRsSu6GGtZ8Tk=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AtSfVHYgwIzzTtnlzmHbOusFFdagapt9YwUxWQH5M3tQqX4JtQAwLDUw5znyG9W18
	 Nw1ygH4Co1zJSN1kXR9ADLq0vfjkQq0lQ63r1xcZt7DbSZPFTWV4SAE7RC1VOw097U
	 cogC1XeQc+73wJ1hoa8rMJvOgLjAaRtiY6WeMrcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5316CF80274;
	Fri, 25 Oct 2019 16:43:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0705CF80368; Fri, 25 Oct 2019 16:43:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EBC67F80274
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 16:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBC67F80274
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 07:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; d="scan'208";a="228921327"
Received: from pgsmsx107.gar.corp.intel.com ([10.221.44.105])
 by fmsmga002.fm.intel.com with ESMTP; 25 Oct 2019 07:43:14 -0700
Received: from pgsmsx108.gar.corp.intel.com ([169.254.8.51]) by
 PGSMSX107.gar.corp.intel.com ([169.254.7.221]) with mapi id 14.03.0439.000;
 Fri, 25 Oct 2019 22:43:13 +0800
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH] ASoC: eve: implement set_bias_level
 function for rt5514
Thread-Index: AQHVixSpuo5KyaaW0kmhCX7+/fo7hqdq3ikAgACJfMA=
Date: Fri, 25 Oct 2019 14:43:12 +0000
Message-ID: <CF33C36214C39B4496568E5578BE70C740320822@PGSMSX108.gar.corp.intel.com>
References: <1571994691-20199-1-git-send-email-brent.lu@intel.com>
 <3ce80285-ddb5-653d-cf60-febc9fd0bdee@linux.intel.com>
In-Reply-To: <3ce80285-ddb5-653d-cf60-febc9fd0bdee@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiM2M5NGUzY2ItYWE2Mi00M2I1LWE3ZTgtZGY4N2NjOWQ0N2NlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiYmw5bnFvdWdlOWk0RG9KZXN1SE9lZ0RjbUJ1R0IwTWo3M2djNU05dE1wd0w0OTlFNXcwZUF1UUdMNm9HdGt3NyJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>, "M,
 Naveen" <naveen.m@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: eve: implement set_bias_level
 function for rt5514
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

> On 10/25/19 4:11 AM, Brent Lu wrote:
> > The first DMIC capture always fail (zero sequence data from PCM port)
> > after using DSP hotwording function (i.e. Google assistant).
> 
> Can you clarify where the DSP hotwording is done? Intel DSP or rt5514?
> 
> Turning on the MCLK with the BIAS info might force the Intel DSP to remain
> on, which would impact power consumption if it was supposed to remain off.
> 

Hi Pierre,

It's done in rt5514's DSP and the interface is SPI instead of I2S for the voice wake 
up function.

There is a driver rt5514-spi.c which provides platform driver and DAI. User space 
application first uses the mixer to turn on the voice wake up function:

amixer -c0 cset name='DSP Voice Wake Up' on

Then open and read data from the PCM port which goes to the SPI platform and 
dai code. Finally it uses same mixer to turn off the function and return to normal 
codec mode. The DMIC recording (from I2S) and the voice wake on function should 
be mutually exclusive according to the driver design.

In the codec driver rt5514.c there is a rt5514_set_bias_level function. It's expected to 
turn on/off mclk here according to Realtek people's say but our ssp clock requires set 
rate function to be called in advance so I implement the code in machine driver.


Regards,
Brent
> > This rt5514 codec requires to control mclk directly in the
> > set_bias_level function. Implement this function in machine driver to
> > control the ssp1_mclk clock explicitly could fix this issue.
> >
> > Signed-off-by: Brent Lu <brent.lu@intel.com>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
