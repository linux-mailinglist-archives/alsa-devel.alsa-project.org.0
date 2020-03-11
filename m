Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C00180E60
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 04:20:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C8471662;
	Wed, 11 Mar 2020 04:20:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C8471662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583896854;
	bh=az7rvA7qHu2lFEl9HYZEloMU4ywTW9hpP/RejLmLfZI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ra6mt6iO9y5zVxG/5qJMhRoWPsyigGN3w43fxaJa8k75vurWOCznOJtSZ1K+HACIT
	 agnf0UVUgvYhePsD73ziP6b4t/ayuI2BeAcPBNbGdyraUiRcwofwZRVg/5WQSpP3Wi
	 yxsCKGkXrIyH53E+fIxQWlmhgbsa0SWr1HlwPvVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CC0EF801F7;
	Wed, 11 Mar 2020 04:19:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 519CCF801EB; Wed, 11 Mar 2020 04:19:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EED9AF80141
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 04:19:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EED9AF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="TrxEz737"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="CsgbMFq0"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id C6EC46BE;
 Tue, 10 Mar 2020 23:19:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 10 Mar 2020 23:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=n7m72Tx+CWEa02zHghdkj9AV/pW
 oZotPpODUQGq39GM=; b=TrxEz737tfc4toeTcWR6JE6dB+EN4l1X7zs9bym9ZW3
 6HcmOb6wtTuWJRtDKH8N6LWA6iVwY6S1lvkdLnp8DJRFN4yE/LlCXVS9Czh7M+Zr
 WJCwXjQnSM0NuK4fmv4wjXJYZ5a1U26aBPHKl+MIGlHh53Yyu5o8CxEzNtsDlo+s
 nsnb7nw0sNQV95CBjm9uwt8DsHoBsYCeqZxZyWHFoz/ydz6oZLvV9tSmY4OElaO2
 scjr9g8LRd+CpR292Oj1p5qHrpchE9KxnZbA+hkNMxsVrsilWRZkAMdX4xAtBGqO
 6SZ3rgaoNt8BRmB32jYRExf+5bMu9Fq/5F2aiWtpsBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=n7m72T
 x+CWEa02zHghdkj9AV/pWoZotPpODUQGq39GM=; b=CsgbMFq0GBoJbAzszr8IH5
 /25ZkX1Z3ZP6p9bO86zYssPEZCBQ6NPhk1yj1WI5YSEKe+IxdVnObvWw7xCM1rJg
 cysDqa8PwmcLR1au8LKZxNDpkzEQ3iGz730i59Fu9CaOrwrzN72erFKw+NN312B3
 6S1JGk6LnGQXuPqKwnOkgrJ52tK8x5dbsgBo+5Sq5upCD5fvBKPHaArzO3ng1+db
 pdiDJ/TomXx3EA03ZXpoiZXESNmKpqOt7Ss9MZz5bNr67FtX0Yq1Sv50KZrVvyHv
 1OExx+A0fZkSrVLoF13nKioeCyvsfBRmiWH8+RtdpqWtuF4Vv7WwGLZwDc7Jwy2A
 ==
X-ME-Sender: <xms:o1hoXiE9F8d63W5FJwaI-hRTaAe0E3KcYFl4fj5Bb0eJ5jyLm_putg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddvuddgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecukfhppedugedrfedrjeegrdduieeknecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthh
 hirdhjph
X-ME-Proxy: <xmx:o1hoXpyvpK075-EuV3DK9-cOJwJdQNqwHsLwAtPjM8IeJlo0jnvfzA>
 <xmx:o1hoXk8k5N5gJTt-jqWBtt8oEPd9rAMHIUfdRsIvW7jMV9nE7x8Hrw>
 <xmx:o1hoXrVjRku8AwyWmYO0iMwZ51L9dICuSIv63yN3yZQSPxOSyWBYxg>
 <xmx:pFhoXrIdJdSGK1Dh7-0w7wkFolMYiM2ibdevR8DbGPFC5QjW7P7na5qWUJU>
Received: from workstation (ae074168.dynamic.ppp.asahi-net.or.jp [14.3.74.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7370B328005A;
 Tue, 10 Mar 2020 23:18:56 -0400 (EDT)
Date: Wed, 11 Mar 2020 12:18:54 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jules Irenge <jbi.octave@gmail.com>
Subject: Re: [PATCH 8/8] ALSA: firewire-tascam: Add missing annotation for
 tscm_hwdep_read_locked()
Message-ID: <20200311031853.GA8197@workstation>
Mail-Followup-To: Jules Irenge <jbi.octave@gmail.com>, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 "moderated list:FIREWIRE AUDIO DRIVERS and IEC 61883-1/6 PACKET..."
 <alsa-devel@alsa-project.org>
References: <0/8> <20200311010908.42366-1-jbi.octave@gmail.com>
 <20200311010908.42366-9-jbi.octave@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311010908.42366-9-jbi.octave@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:FIREWIRE AUDIO DRIVERS and IEC 61883-1/6 PACKET..."
 <alsa-devel@alsa-project.org>, netdev@vger.kernel.org, boqun.feng@gmail.com,
 Takashi Iwai <tiwai@suse.com>, Clemens Ladisch <clemens@ladisch.de>,
 linux-kernel@vger.kernel.org, Alexios Zavras <alexios.zavras@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, bpf@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
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

On Wed, Mar 11, 2020 at 01:09:08AM +0000, Jules Irenge wrote:
> Sparse reports a warning at tscm_hwdep_read_locked()
> 
> warning: context imbalance in tscm_hwdep_read_locked() - unexpected unlock
> 
> The root cause is the missing annotation at tscm_hwdep_read_locked()
> Add the missing __releases(&tscm->lock) annotation
> 
> Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
> ---
>  sound/firewire/tascam/tascam-hwdep.c | 1 +
>  1 file changed, 1 insertion(+)

Thanks for your care of the warning. Although I have found it, I had
no idea to suppress it.

Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/firewire/tascam/tascam-hwdep.c b/sound/firewire/tascam/tascam-hwdep.c
> index 9801e33e7f2a..6f38335fe10b 100644
> --- a/sound/firewire/tascam/tascam-hwdep.c
> +++ b/sound/firewire/tascam/tascam-hwdep.c
> @@ -17,6 +17,7 @@
>  
>  static long tscm_hwdep_read_locked(struct snd_tscm *tscm, char __user *buf,
>  				   long count, loff_t *offset)
> +	__releases(&tscm->lock)
>  {
>  	struct snd_firewire_event_lock_status event = {
>  		.type = SNDRV_FIREWIRE_EVENT_LOCK_STATUS,
> -- 
> 2.24.1
> 
