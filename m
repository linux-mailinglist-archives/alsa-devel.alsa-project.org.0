Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CA73A22A5
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Jun 2021 05:16:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8E2D1671;
	Thu, 10 Jun 2021 05:15:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8E2D1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623294991;
	bh=wlyPyXAeVQYHxXQdYSvYP78PRZXV5UEMcJOvD7o0Ymw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ueBPfmMUu9Y+yHT0OIe9tIcXCDgtOwdtlUvPPsaBK5vDUmG46OxhTdOA6oJiGm/jF
	 3d2xAz9bopHvyfM2GN6juNIH4X/B3A1Sdm7iENx+xDgk9H1cOHKiCzQi6cVEyOIWBh
	 sfj9UyEK4hS7j/3S1Tyv8b3d3rn3HFoZmvnkPc4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31822F801EC;
	Thu, 10 Jun 2021 05:15:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0608EF80218; Thu, 10 Jun 2021 05:15:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 245E1F80149
 for <alsa-devel@alsa-project.org>; Thu, 10 Jun 2021 05:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 245E1F80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="2Fb939B4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="BpbhlU4E"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id E9DC05C01A5;
 Wed,  9 Jun 2021 23:14:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 09 Jun 2021 23:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=jz8NgmdbfpiT78FJMt4VTeaVp9v
 scgv8jebtDwUG6Qc=; b=2Fb939B47m3swCKWfmR2kCkY72I5sQlJodhL1HJh0gn
 UUI9Zgi35Iubdp6MNG+QErDx4hg2fzArAGP6+kslsTkrvAlKpogiVL0+pjLUXil+
 NIgIlatDUQk7k5r5JfKZH3151apPiSnKyS8UpXUzX0kQxk1ISMlBj+fkcg1IPC0/
 G57ee9Npn05F41Nab0iHOJMHqoanHR9KdunM6d9I7zY0AEVo3uFH0QSoqLlS/I6J
 wq4HydSpRyGUT0lTArKANs4cCcXohX+41LC6Ol8ldPT4P1DNglsagRJDgvrPHo25
 JPR0VaARryjlDwERodNdqW8q+FpRa3p2fhvRiGBN8kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jz8Ngm
 dbfpiT78FJMt4VTeaVp9vscgv8jebtDwUG6Qc=; b=BpbhlU4EoZXx130mPnnU4c
 7Ai9+AzfSOoWXzR2Ydtt6X9B16bjp06eVXfHzXxrFDXJNSu3UPAArH3/8fEd3uWf
 BDTHLSQdixv5Wwq8r0sPxUaYxMTxlJn+pZkCWKum8t8jjSE6/NMvM7M5RTA6CrIf
 7f33DFKhg4dQMDdVlFn4nk5wAoYCSxsb8Jb38fKZAoMsLPSH35jWILfBslRvZ6HX
 5ugG69gIlm9KUjjj5yE6w8YKa2SN2JCtqkA42x/xIK2mxnARM7VEhynItUg8lnBV
 BdS7IjeOWt3RruhgSkrcYF89GmjJVOc7S7Mpdj+jQwSOpjCk/FhUv2wvBOWrB4Qg
 ==
X-ME-Sender: <xms:qYPBYNS8tZHAw3dVF_4wnFrahmSs-pBLuPhac3XqdfZBPnqBwk0HzQ>
 <xme:qYPBYGz6bYWHScExmleaWKbsKsg2Xm2Ijk3mYsFVeW-9bOPX1ySMlj45-bOSTJd1z
 0A46YnJvOO-q0qno5k>
X-ME-Received: <xmr:qYPBYC0AwRk3R1stgKpwezWmvGVoNKDJFsE-QcEF1MGd0ycbY6FUpSDqco6N2G3RrvVlEVIelS_BHdJc54XmUpQ_JQZfgPuCHQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduvddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepjeegieefue
 evueefieeggeejledvgfejgeffjefgvdekleehgfdtfeetjeelkeejnecuffhomhgrihhn
 pehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:qYPBYFDttNEyhFHABGqOWKD-ctUJ5njKn0vIvstHDS0Plq2Sgnc_VQ>
 <xmx:qYPBYGivQjl0etsh24sB6nIqHYg1NHTJ7Xw2_p2jSkwbO3Ah0WRZTA>
 <xmx:qYPBYJq7wq_VXd7OAZdJu29WdSywIX6u7-u8k1Hxb7EZMYKsa2FNwg>
 <xmx:qYPBYKZSnn-lYQkf5n6t2osOcJtmqKbCrZhid3yYHrYKpQgKAk3ssg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 23:14:48 -0400 (EDT)
Date: Thu, 10 Jun 2021 12:14:45 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: Re: [PATCH v3 0/3] ALSA: pcm: add snd_pcm_period_elapsed() variant
 without acquiring lock of PCM substream
Message-ID: <20210610031445.GA51001@workstation>
Mail-Followup-To: tiwai@suse.de, alsa-devel@alsa-project.org,
 clemens@ladisch.de
References: <20210609232230.5963-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210609232230.5963-1-o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

On Thu, Jun 10, 2021 at 08:22:27AM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> This patchset is revised version of my previous one:
>  * https://lore.kernel.org/alsa-devel/20210609143145.146680-1-o-takashi@sakamocchi.jp/
> 
> All of drivers in ALSA firewire stack have two chances to process
> isochronous packets of any isochronous context; in software IRQ context
> for 1394 OHCI, and in process context of ALSA PCM application.
> 
> In the process context, callbacks of .pointer and .ack are utilized. The
> callbacks are done by ALSA PCM core under acquiring lock of PCM substream,
> 
> In design of ALSA PCM core, call of snd_pcm_period_elapsed() is used for
> drivers to awaken user processes from waiting for available frames. The
> function voluntarily acquires lock of PCM substream, therefore it is not
> called in the process context since it causes dead lock. As a workaround
> to avoid the dead lock, all of drivers in ALSA firewire stack use workqueue
> to delegate the call.
> 
> This patchset is my attempt for the issue. A variant of 
> 'snd_pcm_period_elapsed()' without lock acquisition is going to be added,
> named 'snd_pcm_period_elapsed_under_stream_lock()'. The call is available
> in callbacks of .pointer and .ack of snd_pcm_ops structure.
> 
> Changes from v2:
>  * delete context section from kernel API documentation
> 
> Takashi Sakamoto (3):
>   ALSA: pcm: add snd_pcm_period_elapsed() variant without acquiring lock
>     of PCM substream
>   ALSA: firewire-lib: operate for period elapse event in process context
>   ALSA: firewire-lib: obsolete workqueue for period update
> 
>  include/sound/pcm.h           |  1 +
>  sound/core/pcm_lib.c          | 64 +++++++++++++++++++++++++++--------
>  sound/firewire/amdtp-stream.c | 46 ++++++++-----------------
>  sound/firewire/amdtp-stream.h |  1 -
>  4 files changed, 64 insertions(+), 48 deletions(-)
> 
> -- 
> 2.27.0

Mmm. 4 hours past but the rest of patchset is not delivered. I'll resend
them again just in case...


Regards

Takashi Sakamoto
