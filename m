Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 065E92E2958
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Dec 2020 02:01:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 836E9180E;
	Fri, 25 Dec 2020 02:01:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 836E9180E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608858111;
	bh=9ok1QqrMTlKhme16WjIhReUtyMscPuYMuK8jZsOIpHE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cof/r8cHJRdHLpVPbjGQqxjZP3FIBa+mh0w94/mupDJZE1MZQyqax0Xv6leAiJc7Y
	 Uez5dptq8ip7dlZLVo7OzJ2vuirIeVrs8goYXkRbGZZy1LRn6Fp8XhKFqgPJyTPawd
	 riOOoP2Az7tkkzUSF8PTFlzBKoQnSvOuoodR5KX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5C42F80232;
	Fri, 25 Dec 2020 02:00:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0205F80224; Fri, 25 Dec 2020 02:00:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2960F800BC
 for <alsa-devel@alsa-project.org>; Fri, 25 Dec 2020 02:00:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2960F800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="bAILL6w/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="qw/MUtQk"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C3C1850C;
 Thu, 24 Dec 2020 19:59:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 24 Dec 2020 19:59:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=RkwuP0pyzfxjQmEOQiOYmHmA3aO
 1RuDV1FqJqVamqyo=; b=bAILL6w/iR6XLBtUkxbcIuVqGxyzSX0MhLNISuFgihF
 v2e7+M64L/Lz76/r0+At/blio9Q6jm982VtWxUIAQW56z6/aozO8lbDZ4YZSYj9+
 RDFNXsVCvoixmvbidYxJB9HjfYhbL1jLLOeSyLN2vqeNCTfskqDHemkvDDf++A6D
 q03HUeCy+L5Bxn9dtKYPrNOICr0/YGe5uvQLMdIaMtD3bqGSYdy/qtS2rzTbilqh
 becjXV/GkRp3VgZtH+awX+rbrY9RXjmeGYAFpf8ev74V+3idH+3Px5iBuvCP2rwM
 OIGdLBkuBzBjDfv3Q2HR3W6fSu4ovLoi68ldUHBsyCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RkwuP0
 pyzfxjQmEOQiOYmHmA3aO1RuDV1FqJqVamqyo=; b=qw/MUtQkP94WX4ZIvzfmyw
 PYlI4gCsBzIPdxHuCAP407v5lpwJyFFUbzQJWBaz7rJdn2C0gvZ0h81swAlr4q1e
 eGipvoEUJR3c2SYzg0KJ+eKUcddG4ucyV3j316iSNyaymItLoXPg2b+297mTahg4
 h5ScxXI6eGeZLYj5enTLyVRZgyynuFApW8xrX9CcsVn12WmGAiHkIjcAQBHmUGjT
 M9uG6/jFJVnj8/hK9ucof0vPLjMae8GPokYOCdCG7fublce0w6CivdrWMk6W/nDJ
 ZHKXUkeSSqqA2yTxRfbAj4c9OpJs526pcuMk0++wtrICfaAg6MmmE86nw3yH6ZsA
 ==
X-ME-Sender: <xms:jTnlX-aapXxwEqEHqDEiC9SrGylNOgYlClqIflntakEO6ir7x49gog>
 <xme:jTnlXxa0q2PgFgQootc1YS1P1m5Tom9C2Th9ZAMH_GCu3_jiwP0IEO57xlAiTado3
 C_6IryOb1RzdHz4_l4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddutddgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeegtdefgfehvdefgfehudevhfffleeigfeuiefgkeeg
 jeekgeeiheehgedutdduvdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgrmhgrii
 honhgrfihsrdgtohhmpdhgihhthhhusgdrtghomhdpphgrrhhsvgdrphihnecukfhppedu
 udekrddvgeefrdejkedrheeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:jTnlX4_Jj8MnrHhXSv6gE_iYYNFojrqp8Y-iE2grV-sLx9VXIBmNpw>
 <xmx:jTnlXwq4Boo8m6SX1RH_NLk0DnUjS6RXCucnfJvVwMtqc1w4znloNg>
 <xmx:jTnlX5ocsV_tfcmU56B9jERdg8sLch4PnLEg6LP_XPe7Gswo6AQjbw>
 <xmx:jjnlX4TpsJ71JUcxewUQz4T13gzXsqyXhUUccBVfG20IrQ4OYrQhaw>
Received: from workstation (y078058.dynamic.ppp.asahi-net.or.jp
 [118.243.78.58])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1BD7B24005D;
 Thu, 24 Dec 2020 19:59:55 -0500 (EST)
Date: Fri, 25 Dec 2020 09:59:53 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Bert Schiettecatte <bert@bertschiettecatte.com>,
 Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: question about alsa tracepoints and alsa debugging
Message-ID: <20201225005953.GA162573@workstation>
Mail-Followup-To: Bert Schiettecatte <bert@bertschiettecatte.com>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org
References: <CALd3UbSrAqYFe5Z-S6NMKGaVMvOZx7C4zV5O7CwtTKPmV+UeVQ@mail.gmail.com>
 <CALd3UbS6MtKQEdhXQXH2GmU1EvZgS52XcTPihZ5wjb=4FaiYXA@mail.gmail.com>
 <CALd3UbQuDU6asvTkQTP48ct4hT9euUGUoenD5TW2ZD7gbuHPag@mail.gmail.com>
 <8fc2a9ae-c87a-03cd-4349-81d0ea3380d3@metafoo.de>
 <CALd3UbQEJBqUqwx2ua9Sx1P3xr3uf221AVJUV7erp6MF0JegRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALd3UbQEJBqUqwx2ua9Sx1P3xr3uf221AVJUV7erp6MF0JegRg@mail.gmail.com>
Cc: alsa-devel@alsa-project.org
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

> commands used for starting playback / trace capture and for recording -
> ./perf record -F 99 -g -e snd_pcm:* -e sched:sched_switch -e
> sched:sched_wakeup -e irq:* speaker-test -D
> hw:CARD=ak4458ak5558aud,DEV=0 -c8 -r192000 -FS32_LE -tsine &
> arecord -Dhw:CARD=ak4458ak5558aud,DEV=1 -fS32_LE -c16 -r192000
> /mnt/ramdisk/rec.wav
>
> I enabled the kernel options as described at
> https://www.kernel.org/doc/html/v5.9/sound/designs/tracepoints.html
> and have used perf to record a trace, which can be access here -
> https://kernel-debugging.s3-us-west-1.amazonaws.com/perf.data.script.211220202054.txt
> (exported using "perf script")
>
> The trace file shows "lockdep_recursion" at some point so I am
> wondering if my problem has to do with a deadlock somehow being
> caused.

According to the log, speaker-test starts PCM substream for playback
direction with below parameters:

 - bits per sample: 32 bit
 - samples per frame: 8
 - frames per second: 192000
 - frames per period: 4096
 - frames per buffer: 16384
 - ...

By calculation with the above parameters, the hardware of I2S interface
should be configured to generate harware interrupt every 21.3 msec.

I wrote a Python 3 script to check the period of interrupt with a focus
on the record including call of 'snd_pcm_period_elapsed' in its backtrace:
https://gist.github.com/takaswie/af2b93b58a1154903d6fbe1a6bee3c69

```
$ ./parse.py /tmp/perf.data.script.211220202054.txt | \
  grep -B 3 -A 3 unexpected
73.2000 0.02132900 expected
73.2213 0.02133500 expected
73.2426 0.02135300 expected
110.0207 36.77807000 unexpected
110.0420 0.02133000 expected
110.0634 0.02133400 expected
110.0847 0.02132400 expected
```

I can find around 37 second gap in timestamp 110.0207. It means that the
I2S driver failed to control RK3288 I2S interface for periodical hardware
interrupt.

Furthermore, I can see following records after the gap. It means that
speaker-test process successfully detected XRUN of the PCM substream,
then recoverd it to continue processing PCM frames for playback
expectedly. Thus the I2S driver seems to have few problems about
dead-lock issue.

With records of tracepoints events for capture PCM substream
which Bert's SDIO driver handles as well as for the playback PCM
substream which speaker-test starts, we can get more details of
runtimes.

P.S. diagrams for the case:

```
+-----------+       +----+          +------+         +-------+
|AK5558 x 2 |<-(?)->|FPGA|          |RK3288|         | AK4458|
| (ADC)     |<-(?)->|    |<-(SDIO)->|      |<-(I2S)->| (DAC) |
+-----------+       +----+          +------+         +-------+
```


Regards

Takashi Sakamoto
