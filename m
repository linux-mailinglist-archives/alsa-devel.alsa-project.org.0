Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2983D5FF26A
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Oct 2022 18:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 388986BF1;
	Fri, 14 Oct 2022 18:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 388986BF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665765757;
	bh=c1S1C3R0hDHsbRXQHKDYc2GWgBLs1i4lKDFkFa7+3j0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KAF3uWBH3SKfejIZ1l6AZwbxfnKJ0pLR7wrqPSKHnSF1uGTIJhDYTP8l8RbHgq6gH
	 RkbwJEZlD//PLXGcLPqy2C9syPCM7T0amBC8pK0ftBF844wHxC4yH08CBVuNMYmSC2
	 Wy4JR+UDq0gMKMsTuBdU+COFw01vVJ+H6jUGQiPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7AE7F801F5;
	Fri, 14 Oct 2022 18:41:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75F65F80224; Fri, 14 Oct 2022 18:41:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88EBAF80115
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 18:41:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88EBAF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="lPq/Vu8l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=r/tbf8YLBLkiTaCcrMweDTtijmuXJ5yHPYAh70dbWzI=; b=lPq/Vu8lkT8up4HXwqP0Ptbn2l
 X2XiI1xyGaJHtRBpTG4waKvIVNE/UywhkI/kGFqSD13+FF60e+WCsSaP+XjsLTcZoFugXiVMNwEJU
 1Hokpyu6DkhAuy+fr4zTYKvlRWl3gX1q2Ef3xbPhIlzMEEKsG/9lvXbONtNeMSsCZkqB9RLB5py2C
 lqSfAJ4yGZD7B2+YpWAkEa8fvKQE6sqW0/4uZzXH4Ee2GTBajlVlnO80VHiuJCiKXoW3vvO2Drvj/
 SzdlRQb0REAdZUCMvscOnSu49WX9G1HIg8BExUx8VpsRdUklaVOmM1L2asgj/5WlueNn4gaRfvqeP
 y/dWFHUQ==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <lars@metafoo.de>)
 id 1ojNke-000NSr-HN; Fri, 14 Oct 2022 18:41:36 +0200
Received: from [2001:a61:2a52:ad01:9e5c:8eff:fe01:8578]
 by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ojNke-000Bie-Ad; Fri, 14 Oct 2022 18:41:36 +0200
Message-ID: <e685eb93-d40b-3b8c-41f4-f29af8479d1b@metafoo.de>
Date: Fri, 14 Oct 2022 18:41:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: A2B codec chain implementation
Content-Language: en-US
To: =?UTF-8?Q?Th=c3=a9o_Lebrun?= <theo.lebrun@bootlin.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
References: <7fa7f0ac-eebf-2d91-bc25-882e94da83f6@bootlin.com>
From: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: <7fa7f0ac-eebf-2d91-bc25-882e94da83f6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.7/26689/Fri Oct 14 10:01:27 2022)
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

On 10/14/22 18:05, Théo Lebrun wrote:
> Hi,
>
> Automotive Audio Bus (A2B) is a bus that carries a clock, I2S/TDM, I2C,
> GPIO and mailboxes over a two wire connection that carries power as
> well. It has a leader-follower (master-slave in the spec) structure,
> with no obligation to have all samples going from or to the leader.
>
> Analog Devices sells transceivers, that can also decode PDM inputs.
> Their configuration is register based, with ways of accessing follower
> registers from the leader. Here is their technical reference:
> https://www.analog.com/media/en/technical-documentation/user-guides/AD242x_TRM_Rev1.1.pdf 
>
>
> The goal is to implement support for those, when the host is connected
> to the leader. The implementation would be done by registering a new
> bus_type and device_type, with a device for each functionality (on each
> bus node) provided by the bus. Two issues were faced though:
>
>  - At runtime, when an PCM stream is started, not only do the CPU and
>    codec need to be configured, but also the leader and follower need
>    some dynamic configuration based on hw_params. We have something
>    resembling a chain, and all 4 devices need to be configured
>    I2S-wise:
>    CPU <-I2S-> leader node <-A2B-> follower node <-I2S-> codec.
>    That does not fit the standard form of a DAI link that only has a CPU
>    and a codec. Is there a way to have a sound card that contains
>    multiple codecs, all actived?
>
>  - Clocks will have to be handled at the bus level and not at the
>    soundcard level, as the master clock is needed at all times for the
>    bus to be functional. Sadly it's probably not doable to use the
>    clocks provided by the I2S/TDM CPU codec (which would be ideal as
>    they are audio rate, which is what the bus expects), because they
>    only get enabled when a PCM stream is active. On the hardware used
>    for testing (SAMA7G54), we can't use an external (relative to the
>    CPU codec) clock as master clock and use the peripheral to generate
>    the bitclock, it doesn't support it; therefore both have to be
>    handled at the bus level using board specific clocks.
>
> So the first point is the main question: how could a codec chain be
> modeled?
>
> I was potentially thinking about a custom soundcard? That could surely
> help? Would it be the right solution? Any pointers would help.
>
> The clock aspect would have been an issue as a codec is either a clock
> provider or consumer but for this particular use it is not as we'll use
> the bus and not the soundcard to handle the clock management.
>
Hi,

Daniel, me and a few others have been working on A2B driver support. We 
are in the process of getting it ready for upstreaming. Currently public 
code is in 
https://github.com/analogdevicesinc/linux/commits/a2bupstream. ADI 
squashed the commit history. We need to restore that.

At the moment the remote devices are modeled as a codec2codec link with 
fixed rates. Its not ideal, but the best we can do in the current ALSA 
framework.

I did propose some changes that will allow dynamic hwparams domain and 
propagation through those domains a long long time ago. But that never 
got to the stage where I was able to work on the implementation. See 
http://metafoo.de/the_new_asoc.svg

- Lars

