Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2FB118CCB
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 16:42:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C570486F;
	Tue, 10 Dec 2019 16:41:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C570486F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575992551;
	bh=Bpv91dx0mkntZeuD2wtrNIJ6H3AsXjAAzQT1aUD+Mi4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lWzQQHt9ZD6eQ5UXd5HY6NYiuZ8CVaiwb2CyVMwKQUkVXna9KbQNlmSoZu/nhK2po
	 1mRxXX7La8AkofuyeopU3N+CXE2+24K2nluABZ9KpsoeQbVAoA2uu/TzfhCrpIOmRp
	 mv9hsLxVgz0U8MST8AgIuwQ2yxQ9eQtfqyk6JTaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE0ABF801D8;
	Tue, 10 Dec 2019 16:40:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A266AF8020C; Tue, 10 Dec 2019 16:40:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E60A0F800F3
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 16:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E60A0F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="Mtef67jF"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NozJjZIT"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D78E3222E3;
 Tue, 10 Dec 2019 10:40:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 10 Dec 2019 10:40:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=4/JyOWR8I3UkmBDZvYWSdZBCZtu
 cdHErchTguOG3sSM=; b=Mtef67jFaN0PhRwfxOIx8WjidfQ23ZjIWYDDFRrN4u2
 tAWpcgaL/BDMqIEtsELlvt8fuXxREHzI9YPUBljoxHlhs0BVff8dT0Km/CXBU158
 Ox3pOwZnu0Kh8JjePLXjP9s2FKiOkU1q3omxUVPqk1UvnpMi9T1jGnhcQq7pnzMm
 CTtVQRNarsLAFMWBKLYETVKHPRsVpjN7gVrLRL+0qKkMT3oMea10Xg1HlmGtRPcm
 DJ+jHMpCmSUy+urEu8HK86i2JRK7B69ISoHY/3f6//Zj9XTu+coVDGmRvUBffNm+
 CpaXGiN2goeSgDWd1h9nUXU6v9E5iZkFSmwkMR9U+NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4/JyOW
 R8I3UkmBDZvYWSdZBCZtucdHErchTguOG3sSM=; b=NozJjZITe+S8kdR1xQ/Sug
 e9w7VDJ/8HRLM1qeytf7kT5C8VNRq3sju5i1gCkaW6yGiWEEmmfzm4Ok9f4zjc5z
 TY+joc3nK5CdLZiJxphjaZK/yKyRfjRs287S2eQuEIhB6+dEorhQwHYVzOsuY4sh
 PDXaX5p5+6tZgYt1m5Sph7F/W3mEuJRFTLEsepeUWNl7jDTXMikvi/bvanfg+bC7
 7D29aCyh+w4YubiME04+iDoooJJQFerWHpoor1PHt+UY+DYrpyYNMKeV2kegILlc
 jRFo5nj6s4gEWKXckKVCN7qMUvzGncj5jQDOlNwQoX+MuGP9lfVrvtVAUgEpb0uQ
 ==
X-ME-Sender: <xms:drzvXfS8k-cs60U1JV7_MHWYh0p1mEar1FMG57GyLXioD95gSxZe3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudelfedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecukfhppedugedrfedrjeehrddukedunecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpnecuvehluhhsthgvrhfuih
 iivgeptd
X-ME-Proxy: <xmx:drzvXWm-82NM-wM64NrB-v3n_y0cIS8CJRqTa0HJAHNiFYD8dZzBJQ>
 <xmx:drzvXaKiJmqdhwyuS8cJTbCFszZfFlguJMqGFeeROkyz4jLgNi_99g>
 <xmx:drzvXZUQxBRqC3vvapThTZmc9h_eqSfXVmayoxkw3LooOfwTK066rA>
 <xmx:drzvXfjF8JOsy3SVnIZD277NZK7HBgglFwffl3UukmpWsotUB0-JUg>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 35EE630600AB;
 Tue, 10 Dec 2019 10:40:37 -0500 (EST)
Date: Wed, 11 Dec 2019 00:40:34 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191210154033.GA30661@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <s5hy2vl9v1f.wl-tiwai@suse.de>
 <20191209192422.23902-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209192422.23902-1-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH v2] ALSA: firewire: Use managed buffer
	allocation
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

Hi,

On Mon, Dec 09, 2019 at 08:24:22PM +0100, Takashi Iwai wrote:
> Clean up the drivers with the new managed buffer allocation API.
> The superfluous snd_pcm_lib_malloc_pages() and
> snd_pcm_lib_free_pages() calls are dropped.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
> v1->v2: corrected the return value to propate the error
>         initialize err variable for covering uninitialized compiler errors
> 
>  sound/firewire/bebob/bebob_pcm.c         | 11 +++--------
>  sound/firewire/dice/dice-pcm.c           | 13 ++++---------
>  sound/firewire/digi00x/digi00x-pcm.c     | 11 +++--------
>  sound/firewire/fireface/ff-pcm.c         | 11 +++--------
>  sound/firewire/fireworks/fireworks_pcm.c | 11 +++--------
>  sound/firewire/isight.c                  | 10 ++--------
>  sound/firewire/motu/motu-pcm.c           | 11 +++--------
>  sound/firewire/oxfw/oxfw-pcm.c           | 19 +++++--------------
>  sound/firewire/tascam/tascam-pcm.c       | 11 +++--------
>  9 files changed, 29 insertions(+), 79 deletions(-)

These changes are fine to me.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
