Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4A7195E6B
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 20:15:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0B851674;
	Fri, 27 Mar 2020 20:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0B851674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585336542;
	bh=i98oBrDHDFMBs5Jqb6KqTCY8GuwMHbCSW8BdCZu/r1M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oykanz/AqulnjwF78epovqjXX68My0oDzXeqaXK1Mo+DCBR501ncLWp3j08j6YPZ9
	 z2tlrkjrdvR2/BKl63YaHjXMMpg8pLglF/eQoKJ6MtWruR+IZZsW/JeATxWCMb9blB
	 st5SrRGJsL/ob4ztxjGWZBuYwe8qpTsEqiDvSGLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B052AF80147;
	Fri, 27 Mar 2020 20:14:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4955F80158; Fri, 27 Mar 2020 20:13:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from resqmta-po-02v.sys.comcast.net (resqmta-po-02v.sys.comcast.net
 [IPv6:2001:558:fe16:19:96:114:154:161])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FAF9F8011E
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 20:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FAF9F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=comcastmailservice.net
 header.i=@comcastmailservice.net header.b="YLYYe93N"
Received: from resomta-po-02v.sys.comcast.net ([96.114.154.226])
 by resqmta-po-02v.sys.comcast.net with ESMTP
 id Htwrjis1JWJ0PHuQNjJBgv; Fri, 27 Mar 2020 19:13:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comcastmailservice.net; s=20180828_2048; t=1585336427;
 bh=QD274ntNtBxwYXXfn7bhqDewx9j5owkFgeeAbhPYsCk=;
 h=Received:Received:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type;
 b=YLYYe93N6H/vYmmJtyRgyL+nC/zRFKjLhSPZ8XwYUl+zhR1oivRhRpzTsrGUzGqKd
 wOFaS+Dq/stilo6sV2OvH9fnFYh6lOeV3bbZToPSuPsj5jVszIG15TvM6ScsHfr/6w
 cwQxiRFClw563/vaPm+vj4twTkbngMzgXDVz9+mJh7IEq9EKSCtKg7OvJ1vglZlVst
 Bla/hbQsQD4xWdJR9lXo7u+icTusgfZRt9vM6+ZpYRM0FcgCNRNKn+6aO8bQCOMwC4
 enXhygasNcLbluLPB9oFbct57YqJ7H2UeaU+htpOwa/uursWvXMQa4M2fkeiwfWgIX
 oLtRJPcT4WIKA==
Received: from moe ([76.21.90.186])
 by resomta-po-02v.sys.comcast.net with ESMTPA
 id HuQKjntgLeRQLHuQLjH1Gu; Fri, 27 Mar 2020 19:13:47 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedugedrudehledguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucevohhmtggrshhtqdftvghsihdpqfgfvfdppffquffrtefokffrnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepufhtvghvvgcuofhorhhrihhsuceomhhorhhrihhssegsuhhinhgvrgdrtghomheqnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvggtthdrohhrghenucfkphepjeeirddvuddrledtrddukeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghlohepmhhovgdpihhnvghtpeejiedrvddurdeltddrudekiedpmhgrihhlfhhrohhmpehmohhrrhhishessghuihhnvggrrdgtohhmpdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrghdprhgtphhtthhopegtlhgvmhgvnhhssehlrgguihhstghhrdguvgdprhgtphhtthhopehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhrtghpthhtohepthhifigrihesshhushgvrdguvg
X-Xfinity-VMeta: sc=-100.00;st=legit
Received: by moe (Postfix, from userid 1000)
 id 764AC2012F; Fri, 27 Mar 2020 12:13:44 -0700 (PDT)
Date: Fri, 27 Mar 2020 12:13:44 -0700
From: Steve Morris <morris@buinea.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] [PATCH 1/3] ALSA: bebob: expand sleep just after
 breaking connections for protocol version 1
Message-ID: <20200327191344.gbmcyunw75xs6ugm@buinea.com>
References: <20191101131323.17300-1-o-takashi@sakamocchi.jp>
 <20191101131323.17300-2-o-takashi@sakamocchi.jp>
 <20200326214722.7xg2ffrzqrzq7edg@buinea.com>
 <s5h7dz6fawt.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h7dz6fawt.wl-tiwai@suse.de>
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

On Fri, Mar 27, 2020 at 09:40:34AM +0100, Takashi Iwai wrote:
> On Thu, 26 Mar 2020 22:47:22 +0100,
> Steve Morris wrote:
> > 
> > On Fri, Nov 01, 2019 at 10:13:21PM +0900, Takashi Sakamoto wrote:
> > > As long as I investigated, some devices with BeBoB protocol version 1
> > > can be freezed during several hundreds milliseconds after breaking
> > > connections. When accessing during the freezed time, any transaction
> > > is corrupted. In the worst case, the device is going to reboot.
> > > 
> > > I can see this issue in:
> > >  * Roland FA-66
> > >  * M-Audio FireWire Solo
> > > 
> > > This commit expands sleep just after breaking connections to avoid
> > > the freezed time as much as possible. I note that the freeze/reboot
> > > behaviour is similar to below models:
> > >  * Focusrite Saffire Pro 10 I/O
> > >  * Focusrite Saffire Pro 26 I/O
> > > 
> > > The above models certainly reboot after breaking connections.
> > > 
> > > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > > ---
> > >  sound/firewire/bebob/bebob_stream.c | 11 ++++++-----
> > >  1 file changed, 6 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
> > > index f7f0db5aa811..1b264d0d63eb 100644
> > > --- a/sound/firewire/bebob/bebob_stream.c
> > > +++ b/sound/firewire/bebob/bebob_stream.c
> > > @@ -415,15 +415,16 @@ static int make_both_connections(struct snd_bebob *bebob)
> > >  	return 0;
> > >  }
> > >  
> > > -static void
> > > -break_both_connections(struct snd_bebob *bebob)
> > > +static void break_both_connections(struct snd_bebob *bebob)
> > >  {
> > >  	cmp_connection_break(&bebob->in_conn);
> > >  	cmp_connection_break(&bebob->out_conn);
> > >  
> > > -	/* These models seems to be in transition state for a longer time. */
> > > -	if (bebob->maudio_special_quirk != NULL)
> > > -		msleep(200);
> > > +	// These models seem to be in transition state for a longer time. When
> > > +	// accessing in the state, any transactions is corrupted. In the worst
> > > +	// case, the device is going to reboot.
> > > +	if (bebob->version < 2)
> > > +		msleep(600);
> > >  }
> > >  
> > >  static int
> > > -- 
> > > 2.20.1
> > > 
> > > _______________________________________________
> > > Alsa-devel mailing list
> > > Alsa-devel@alsa-project.org
> > > https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> > 
> > This patch causes a reboot when I power on my Edirol FA-101. This is
> > consistent behavior with kernels 5.5.1 - 5.5.11.
> > 
> > I've changed msleep(600) back to msleep(200) and rebuilt the module and
> > I am once again able to power on and use the interface.
> > 
> > I am running Arch linux with 5.5.11-arch1-1 #1 SMP PREEMPT Sun, 22 Mar 2020 16:33:15 +0000 x86_64 GNU/Linux.
> > 
> > 
> > I had previously posted to the list on Feb 19, 2020 with the subject:
> > 
> > sytem reboots when initializing Edirol FA-101 firewire audio interface
> > 
> > Please forgive any lapses in reporting protocol as I generally don't
> > work at the kernel level. Hopefully this more specific report will help
> > fix the issue.
> 
> This is weird.  If just changing the msleep value from 600 to 200
> "fixes" the problem, it means that something is already fundamentally
> broken...
> 
> 
> Takashi

It appears that 'fixed' was too strong a word. While I have managed to
get it to work a couple of times, generally it is still broken.

I'm happy to help debug, but this is outside my scope.

Back to the LTS kernel for the moment.

Steve

