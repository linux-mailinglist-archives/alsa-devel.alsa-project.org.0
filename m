Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1EA194AF0
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 22:49:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 759C3166F;
	Thu, 26 Mar 2020 22:48:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 759C3166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585259361;
	bh=RGXVk3tKAmJoZ2Mu/3sCb83jKUXZtzmylwC5AtstNro=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AGVJisYvOWqnj+1OE/MPcD339zwryy9QwVa6KXjPmvJr6yeuBMCiFv/NO7rnXVJuR
	 S03C8BjmCoodOAaY7CYTRSdUFYEE0we3Qh2VDExGu/hw4P1ql/ogjvbyGyFek84Yr3
	 5+XwWjEeZR9kxHtR+ooyrBHNmjfLITJ3IxcgTboQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EB97F80095;
	Thu, 26 Mar 2020 22:47:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7F98F80227; Thu, 26 Mar 2020 22:47:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from resdmta-po-02v.sys.comcast.net (resdmta-po-02v.sys.comcast.net
 [IPv6:2001:558:fe16:19:96:114:154:210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B713F8011E
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 22:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B713F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=comcastmailservice.net
 header.i=@comcastmailservice.net header.b="UytIbqV+"
Received: from resqmta-po-06v.sys.comcast.net ([96.114.154.165])
 by resqmta-po-12v.sys.comcast.net with ESMTP
 id HXkTjNz3lnykUHaLXjycIW; Thu, 26 Mar 2020 21:47:27 +0000
Received: from resomta-po-12v.sys.comcast.net ([96.114.154.236])
 by resqmta-po-06v.sys.comcast.net with ESMTP
 id HVR7jQiTR9uIxHaLVjro2o; Thu, 26 Mar 2020 21:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comcastmailservice.net; s=20180828_2048; t=1585259245;
 bh=wVrWEN3L7qEDmxUT6CTlAOW+L6k1g4LCF4AycwgcAds=;
 h=Received:Received:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type;
 b=UytIbqV+maxxIBdmPCfHxlIyt6BfCRVq5Sm4jA1NSbHoNYZbNGjidN8PWMz2QIHPg
 rBCU1tqnApTQn4imjW+tqdD9Y7ZW1Y9sGOZpAnKKPI0P7CfaE9mOD5t+SMR6zzEYju
 zancd9ltuHmbRyI83iUYwtkHBjeJbj/PFsefKCqXTfUSqCLoxbvxvfOmL2JjwSZBa4
 YFxmQUXjye5DD/LUPGdtH76L1KPhRauJrUv5flf8J5RU+9Xn3gc/eJrhlDoYfaBSnQ
 RZBtvt+SSGCHUk7YS7lscV8xbhLrUbmtIPKTTnBoRfLTcTUXlL8iNGKXB4uPuIAzuJ
 x92ABzSd+IJ+A==
Received: from moe ([76.21.90.186])
 by resomta-po-12v.sys.comcast.net with ESMTPA
 id HaLTjF3h7ECxpHaLTjf7LH; Thu, 26 Mar 2020 21:47:24 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedugedrudehjedgkeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepufhtvghvvgcuofhorhhrihhsuceomhhorhhrihhssegsuhhinhgvrgdrtghomheqnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvggtthdrohhrghenucfkphepjeeirddvuddrledtrddukeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghlohepmhhovgdpihhnvghtpeejiedrvddurdeltddrudekiedpmhgrihhlfhhrohhmpehmohhrrhhishessghuihhnvggrrdgtohhmpdhrtghpthhtoheprghlshgrqdguvghvvghlsegrlhhsrgdqphhrohhjvggtthdrohhrghdprhgtphhtthhopegtlhgvmhgvnhhssehlrgguihhstghhrdguvgdprhgtphhtthhopehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhrtghpthhtohepthhifigrihesshhushgvrdguvg
X-Xfinity-VMeta: sc=0.00;st=legit
Received: by moe (Postfix, from userid 1000)
 id F2AB12010D; Thu, 26 Mar 2020 14:47:22 -0700 (PDT)
Date: Thu, 26 Mar 2020 14:47:22 -0700
From: Steve Morris <morris@buinea.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: [alsa-devel] [PATCH 1/3] ALSA: bebob: expand sleep just after
 breaking connections for protocol version 1
Message-ID: <20200326214722.7xg2ffrzqrzq7edg@buinea.com>
References: <20191101131323.17300-1-o-takashi@sakamocchi.jp>
 <20191101131323.17300-2-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191101131323.17300-2-o-takashi@sakamocchi.jp>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, clemens@ladisch.de
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

On Fri, Nov 01, 2019 at 10:13:21PM +0900, Takashi Sakamoto wrote:
> As long as I investigated, some devices with BeBoB protocol version 1
> can be freezed during several hundreds milliseconds after breaking
> connections. When accessing during the freezed time, any transaction
> is corrupted. In the worst case, the device is going to reboot.
> 
> I can see this issue in:
>  * Roland FA-66
>  * M-Audio FireWire Solo
> 
> This commit expands sleep just after breaking connections to avoid
> the freezed time as much as possible. I note that the freeze/reboot
> behaviour is similar to below models:
>  * Focusrite Saffire Pro 10 I/O
>  * Focusrite Saffire Pro 26 I/O
> 
> The above models certainly reboot after breaking connections.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  sound/firewire/bebob/bebob_stream.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/firewire/bebob/bebob_stream.c b/sound/firewire/bebob/bebob_stream.c
> index f7f0db5aa811..1b264d0d63eb 100644
> --- a/sound/firewire/bebob/bebob_stream.c
> +++ b/sound/firewire/bebob/bebob_stream.c
> @@ -415,15 +415,16 @@ static int make_both_connections(struct snd_bebob *bebob)
>  	return 0;
>  }
>  
> -static void
> -break_both_connections(struct snd_bebob *bebob)
> +static void break_both_connections(struct snd_bebob *bebob)
>  {
>  	cmp_connection_break(&bebob->in_conn);
>  	cmp_connection_break(&bebob->out_conn);
>  
> -	/* These models seems to be in transition state for a longer time. */
> -	if (bebob->maudio_special_quirk != NULL)
> -		msleep(200);
> +	// These models seem to be in transition state for a longer time. When
> +	// accessing in the state, any transactions is corrupted. In the worst
> +	// case, the device is going to reboot.
> +	if (bebob->version < 2)
> +		msleep(600);
>  }
>  
>  static int
> -- 
> 2.20.1
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

This patch causes a reboot when I power on my Edirol FA-101. This is
consistent behavior with kernels 5.5.1 - 5.5.11.

I've changed msleep(600) back to msleep(200) and rebuilt the module and
I am once again able to power on and use the interface.

I am running Arch linux with 5.5.11-arch1-1 #1 SMP PREEMPT Sun, 22 Mar 2020 16:33:15 +0000 x86_64 GNU/Linux.


I had previously posted to the list on Feb 19, 2020 with the subject:

sytem reboots when initializing Edirol FA-101 firewire audio interface

Please forgive any lapses in reporting protocol as I generally don't
work at the kernel level. Hopefully this more specific report will help
fix the issue.

Thanks, 

Steve

