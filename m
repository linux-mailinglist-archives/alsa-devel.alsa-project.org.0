Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B10811651F
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 03:53:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9C66165D;
	Mon,  9 Dec 2019 03:52:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9C66165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575860022;
	bh=+xQ3VCDX9pQ1mBrq4WVBBUzcWtgQQKeBhuUgfEI4sXs=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jUpj2oFAor6GQ6Wt4kewsAsFCzwyMlnsDXceWIhLdjv8Uj6qpLckL8rrHw+ru1PfO
	 a/GmBsxNPx1x8hO3zPt87Di5/6gmFSafqiLC7IJPnBgHpjyZ5pfBBo0sAh6BJxJBE6
	 pah2vImu6d3G5CRRx63qY+oCJjlotTWwejFrYdWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25AC7F80234;
	Mon,  9 Dec 2019 03:51:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34902F80234; Mon,  9 Dec 2019 03:51:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D880EF8011E
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 03:51:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D880EF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="l/7fE7An"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="SOgexvJ7"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 6CFA4619;
 Sun,  8 Dec 2019 21:51:46 -0500 (EST)
Received: from imap22 ([10.202.2.72])
 by compute1.internal (MEProxy); Sun, 08 Dec 2019 21:51:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type; s=fm3; bh=pcqKjfeOwXQGUDLlWb6KIRcxCcpc
 Opx3e7tydYkfVOc=; b=l/7fE7Ansk2X6MzoRPt+1/f2BI3ZHDc6FccHUcI7JWUN
 IwnrpCpUhL50tSxZkx5IYgB4XVAzFn9krgslR58DUYuwBHtFVGpFoK2LEZMUcJ59
 kWQtTsnNqOIB2fW6yAr60SFNHGnEJCdwAZIl1dk3hA8jU2yXxblyR4oSpfKsvLqK
 hl96iaNTlgPL1zF6J+9pCO5NQYdd7VHnNzJpPsNARJolYeOqc0iCXQ8JOuNx8xPL
 uK0mb0Lz3JgcReK/RTAgrcMfGqPaZKOaT1gPlJfVESM24nxuGlHWbN/vMABoQGIV
 Rb58L5lsYHMXempzVYx2mrXaa6Fd09I9VwDyV6dkJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=pcqKjf
 eOwXQGUDLlWb6KIRcxCcpcOpx3e7tydYkfVOc=; b=SOgexvJ7TmuxjeL4ZN60We
 FoP93aeknF1n+J6l0GHHqumOxxEpX/TSTczUxPiWS1KHY1GpKXguXwhye0XNEkV/
 TrdhHdCrouhHg07oQP78b1iBas/s1qn86LPBE+6z/PK0m1wjm9jxM2Aay7E3YTe1
 6OLXqm8EWdlU7FLb92i5B5PKrDRh3B7wbEN6SAFZWLMCQbMU4/gU8MdDP6FgM2KE
 hgti8rr7MOAZj4FfmzcpH7Wvc8HhJ7SHLh5vTQhNcJNZVicT/kc2nsTvP607fIho
 e5wQwXf7rjsNEx45cZDNFA8h8QK2dlbGTWNxxn9nLi5W30Mx/6P4BZeE0NqA+4zA
 ==
X-ME-Sender: <xms:wbbtXWMqJz5n635wVkp2WnhAJLO9eFlDRK2Hgto1zz6fASaYdFrLSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudekledggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdfvrghk
 rghshhhiucfurghkrghmohhtohdfuceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
 hirdhjpheqnecuffhomhgrihhnpegrlhhsrgdqphhrohhjvggtthdrohhrghenucfrrghr
 rghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
 enucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:wbbtXXOqSpHPboj09npLoEGRcmcM5ct8o61tAbY2XnQRsCNmR7YFOA>
 <xmx:wbbtXdUDMexR_DYCgxReqxiMDAvgpTfTzDH19SOsDEAYF5ukEnWRoQ>
 <xmx:wbbtXfoFXQVE7P3PDAbEL291TpcvQvs7k4ZxPh0VlLifYDKl6u1xgg>
 <xmx:wrbtXX6FuFNFcvKk0x9XT7bDcbAwyoVNo0O15lyz-A7mVL9fngXF6w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EED6A668005F; Sun,  8 Dec 2019 21:51:44 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-612-g13027cc-fmstable-20191203v1
Mime-Version: 1.0
Message-Id: <e2d1e8dd-85aa-4d1a-ad8e-347dcc294404@www.fastmail.com>
In-Reply-To: <20191208232226.6685-1-o-takashi@sakamocchi.jp>
References: <20191208232226.6685-1-o-takashi@sakamocchi.jp>
Date: Mon, 09 Dec 2019 11:51:24 +0900
From: "Takashi Sakamoto" <o-takashi@sakamocchi.jp>
To: "Clemens Ladisch" <clemens@ladisch.de>, "Takashi Iwai" <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, kbuild test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel]
 =?utf-8?q?=5BPATCH=5D_firewire-motu=3A_fix_double_un?=
 =?utf-8?q?locked=09=27motu-=3Emutex=27?=
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

Oops. I forgot to add 'ALSA: ' prefix to the subject line. I'm sorry but would I
request maintainers to add it when applying...

On Mon, Dec 9, 2019, at 08:22, Takashi Sakamoto wrote:
> Mutex is doubly unlocked in some error path of pcm.open. This commit fixes
> ALSA firewire-motu driver in Linux kernel v5.5.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Fixes: 3fd80b200388 ("ALSA: firewire-motu: use the same size of period 
> for PCM substream in AMDTP streams")
> Fixes: 0f5482e7875b ("ALSA: firewire-motu: share PCM buffer size for 
> both direction")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  sound/firewire/motu/motu-pcm.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/firewire/motu/motu-pcm.c b/sound/firewire/motu/motu-pcm.c
> index 349b4d09e84f..005970931030 100644
> --- a/sound/firewire/motu/motu-pcm.c
> +++ b/sound/firewire/motu/motu-pcm.c
> @@ -177,18 +177,14 @@ static int pcm_open(struct snd_pcm_substream *substream)
>  			err = snd_pcm_hw_constraint_minmax(substream->runtime,
>  					SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
>  					frames_per_period, frames_per_period);
> -			if (err < 0) {
> -				mutex_unlock(&motu->mutex);
> +			if (err < 0)
>  				goto err_locked;
> -			}
>  
>  			err = snd_pcm_hw_constraint_minmax(substream->runtime,
>  					SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
>  					frames_per_buffer, frames_per_buffer);
> -			if (err < 0) {
> -				mutex_unlock(&motu->mutex);
> +			if (err < 0)
>  				goto err_locked;
> -			}
>  		}
>  	}
>  
> -- 
> 2.20.1
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
