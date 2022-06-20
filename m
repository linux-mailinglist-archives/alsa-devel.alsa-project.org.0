Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 082BA550F83
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 06:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A35018C3;
	Mon, 20 Jun 2022 06:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A35018C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655700565;
	bh=TpmGaGM9bs8Vzq3tZUvksjS6nl/VyQbLc9ArNazRZuQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c0ja0HqKp9CPoVTg2MseC3z2cAGxmzmkIlWgthsfN+LAQrwiaMtMlOaSMn+RDWhtc
	 ux22rR3r4laM5qSU7E6HYRFBB+jowq6t0Wj25+aWBdgnOarvydR/ShDuBzQTXW3fR0
	 exuClrWD5HWts4YD8ANnc3gdyG4N5dB+JyAaILOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0A3FF804D8;
	Mon, 20 Jun 2022 06:48:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B7DAF800E3; Mon, 20 Jun 2022 06:48:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODYSUB_1,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1C8AF800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 06:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1C8AF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ANCy6o13"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="c0OEfiEH"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 4197A32003C0;
 Mon, 20 Jun 2022 00:48:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 20 Jun 2022 00:48:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1655700493; x=1655786893; bh=WA
 mQP7tq/coq2Dd7+ZhgiHvG1tXBO8j/fPD7/3AmdRU=; b=ANCy6o13voIdEpUmtp
 G8d/fDFjrJmTSRXUJ8xOEEkm22xPJnpQJlYGniJdaNrNanRIBEl0e+SOfOrhcgTa
 you/r6Pcn8QLIZMeUUU42IWt1V71b4LdTExK7BWFhs4JhX3AkP4kPxgVM03ZvaAK
 gVbJ8MxZSgiAy8ZxseEUItilqxOq+PyNVBt5BVlz32acL7TCQ6mUOjGKk9zvRVNE
 lqKugj5ngvgYM0icUXnVfhFNKQnp/t9yyBRusyNBP/4J6u/g7RB2flNbGS99yK33
 XGSy/sYPHTduvNA6vExaXVVkZ27d7eB+H9KF5M/tJTpnuFyl0dDmS7nNMRyQAzEl
 ewoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655700493; x=1655786893; bh=WAmQP7tq/coq2Dd7+ZhgiHvG1tXB
 O8j/fPD7/3AmdRU=; b=c0OEfiEHEcH6vGOPYSQZMW2YEW7XFcGAlxFB5s/pLX68
 t2ogtz3y8jtRXr590Uh8wy2/Kvo/grrvI9R9EvmNxKULtdNFz+0sD+usIuu5yeRF
 O8kZQF4iW7n9Fn1sYGdyLp2o7iDq4BiuEk7M53L6V2xy2MWVRQgplgmjwCzDP60R
 7XekhBbuN0i4oDVZ2q2AWGTCZ7wO4xqoG0DRZyH93YlqXPxv8HEvola3Y3P8vs2J
 cOCNDCWJl9kKJSzPCMhslKjsCOL9VjVv38FJeXz4PemFtrtQlpap25CI2clNsTF4
 iPcuVgtqFK67x9Qg6yLq+dpbddp6DkztSS0Bgx4lrA==
X-ME-Sender: <xms:DfyvYqwRc_-pI9yzMbOQciRihGVyIGoF_rjhM6C7rtpruRc-jAs0cg>
 <xme:DfyvYmQqZeA-tR1IfrRg0ogwQzT43fKrIYJJ0EN1-8L6UgfHxBiLgutxMP0YSxXbI
 Bx-PLsneybEdWT-U6A>
X-ME-Received: <xmr:DfyvYsU8uTIjyPKkXMX3xHnFLdfyH5e9Ix9dK3DZZ50NzX4Y3E7BM5DjmxOqQTzDhkKrGi_qhxZfvMiWdpzqxt7casqUske0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeftddgledtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuggftrfgrthhtvghrnhepveeilefhudekffehkeffudduvedvfeduleelfeeg
 ieeljeehjeeuvdeghfetvedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghs
 hhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:DfyvYghK9yWokIsSpwESdPrVxg7pPiM--k_zCErrrEV41zaHadLteQ>
 <xmx:DfyvYsB5ccI4XKLUMIMcsAu9R86c7DVWNcg5R2B8gx9mZ9JLtmJQgw>
 <xmx:DfyvYhLzmfsrwfCEmLe8eY8K6J8PZ6b2U5_zCSImqtoQ9eGX0c2-_A>
 <xmx:DfyvYnpNZeL2ch9_ErseOCVsJ1-tTLvlNPR7MDCNYKwrP3fDZMfgLg>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jun 2022 00:48:12 -0400 (EDT)
Date: Mon, 20 Jun 2022 13:48:07 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: Re: Enabling tstamp in proc status file externally
Message-ID: <Yq/8B2irsdNm4tdP@workstation>
Mail-Followup-To: Pavel Hofman <pavel.hofman@ivitera.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <9892a324-a549-c411-9d2c-0a10c580422d@ivitera.com>
 <Yq47ISgw2fWTELwi@workstation>
 <f576bbc3-a556-6af8-520c-9eba7892c326@ivitera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f576bbc3-a556-6af8-520c-9eba7892c326@ivitera.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

On Sun, Jun 19, 2022 at 10:03:24AM +0200, Pavel Hofman wrote:
> Hi Takashi,
> 
> Dne 18. 06. 22 v 22:52 Takashi Sakamoto napsal(a):
> > Hi Pavel,
> > 
> > On Thu, Jun 09, 2022 at 02:38:58PM +0200, Pavel Hofman wrote:
> > > Hi,
> > > 
> > > Please is there any way to enable the tstamp in stream status without
> > > modifying the client calling the alsa-lib API? I wanted to measure
> > > samplerate ratio between soundcards using data in their status proc files
> > > (comparing advancement of tstamp vs. hw_ptr). The method seems to work quite
> > > good, but some clients enable the stream status tstamp (e.g. pulseaudio) and
> > > some don't (e.g. sox, aplay), resulting in zeros in the status proc file.
> > > 
> > > Thanks a lot for any help or hint.
> > 
> > One night sleep after posting my comment to your patch for aplay[1] brings
> > me an idea to use tracepoints events for your purpose (it's 5:00 am at
> > UTC+07:00).
> > 
> > ALSA PCM core supports some kinds of tracepoints events[2]. They are
> > categorized to two parts; the history of hwptr/applptr and hardware
> > parameters of PCM substream. I think the former category of tracepoints
> > events are available for your work to invent diagnostics tools since all
> > of tracepoints events can be retrieved by user space application with
> > system time stamp. I think the type of time stamp is selectable by
> > options when retrieving records of tracepoints events. Furthermore the
> > time stamp is essentially the same as the ones of trigger/current/driver
> > time stamps in ALSA PCM interface.
> > 
> > I did not add enough description about the category of tracepoints when
> > committed to document [2], but roughly describe here:
> > 
> > - hwptr
> >   - the position for audio frame transmission (e.g. DMA).
> > - applptr
> >   - the position for user space application to read/write audio frame
> >     except for operations over mmapped buffer (but depending on audio
> >     hardware)
> > 
> > This is call graph when operating the procfs node:
> > 
> > (sound/core/pcm.c)
> > ->snd_pcm_substream_proc_status_read()
> >    (sound/core/pcm_native.c)
> >    ->snd_pcm_status64()
> >      (sound/core/pcm_lib.c)
> >      ->snd_pcm_update_hw_ptr()
> >        (sound/core/pcm_trace.h)
> >        ->trace_hwptr()
> > 
> > You can see hwptr event is triggered as well. Actually, trace_hwptr() is
> > called more frequently by usual ALSA PCM applications; e.g. ioctl(2)
> > with PCM hwptr request.
> > 
> > We have some ways to retrieve the tracepoints events in user space:
> >   - tracefs
> >   - perf system call
> >   - bpf
> 
> 
> Thanks a lot for your detailed explanation. Please correct me if I am wrong
> but IIUC the snd_pcm_update_hw_ptr does not update the timestamp if it's not
> enabled. I already have access to the timestamp via the procfs status file,
> but if the client does not enable the timestamp specifically, the struct
> field will not be updated. That's why I added the timestamp-enable code to
> the alsa clients aplay/axfer.
> 
> Can the tracepoints modify the status struct and enable the timestamping
> from aside?

The configuration of runtime of PCM bustream is immutable from
tracepoints, thus we have no way to enable it unless changing code of
PCM application.

In my understanding, your aim is to estimate samplerate ratio by
computing the history of hw_ptr with time stamp in running PCM substream.
Both of them are provided by the tracepoints events, In the case, Linux
tracepoints framework record time stamp. I think the time stamp is mostly
equivalent to the time stamp which ALSA PCM core put into the structure
and expose to user space, since both of them are sampled from system time
within atomic context. The clock_id is selectable; e.g. perf_event_open
system call receive 'struct perf_event_attr' which includes clockid field
since Linux kernel 4.1 or later[1].


[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=34f439278cef

Regards

Takashi Sakamoto
