Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EC1152909
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 11:22:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C8671683;
	Wed,  5 Feb 2020 11:21:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C8671683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580898150;
	bh=qp+ln4+bH9UctBaHL9XfZyEOCfMAvsIFFxChAdhtucQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cAbW+yDtjtYb2RFjEEPNtqlqtTdvroVlulGG7FNcmgw7x3qPkwV6D6d3QPr/dzxp/
	 orfK1txhd/5kjEYBhFb6n9e/oE1Ikzlgjqw9s0cQlSOazzPHsI2OPYu7gdphzHygjS
	 dPD/FbD8kzYNC4E7FWdplDGzcs5G9qa/lLRlAQPo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 546E9F80150;
	Wed,  5 Feb 2020 11:21:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1E97F80150; Wed,  5 Feb 2020 11:21:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BE91F80051
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 11:21:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BE91F80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="7bhExWhJ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="10x6D7Rx"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id E4EBD3BB;
 Wed,  5 Feb 2020 05:21:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 05 Feb 2020 05:21:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Ep/t4QuN0K06wbeunya2Iv+5O+C
 1wNfoLYh5cfuwaX8=; b=7bhExWhJEmkyMe3GA+krC0f2IeQY1v5H8vpfYfTLHtH
 Xt0Y2zaX1T9yLX+O6MinapdHNtCvtLUNV1GVH9XnyMlGDO95/DSyi7sGXrHbzUh0
 DGcSWRe+SHdkrIdFvwZo16OukjWaUcyS1iNWN+kwDLRrjxcV2egUTNE3D9K6klvx
 QIOQNVlHjZvAxGsH+5TE6GALLAuAOkluTwVR7WFZ+54tIRDSGlVZ/gGwNhT2zHvd
 8T/lXxGnaRmPPTbx961NKPkSFkk4RtuJAshOP9T4uLIBvh+uLkr7gJJOO7mZEYza
 zSAZyb4DaWguEzSswBQwHFrrjxvanKK4aboB6+OEnyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ep/t4Q
 uN0K06wbeunya2Iv+5O+C1wNfoLYh5cfuwaX8=; b=10x6D7RxVKVFbkHK6FVfM1
 E3BhLQCU9lwoi4TgG06kAifl0A/C1rHuRR5/qFq0HfN6vcgpE6U3/PKTlTKSu5kc
 3F88BRn8SD450/eob3D1nBxiJ89MUxzYS96hhb8/Gwo1PV4FrCqDbu7/CEpuBNxC
 SJIDSLbzo8t1J/tAVzTBTB4YvFeVSeAtcuJZtqriPm4dBPKV1R7JNlNZzUGibvwS
 MQhbCF9mcCnyTWbX2/BCy4/MRlXwOA4HMD6tSkribdDHeWy1xn/tCiBA8/gf7pQ5
 MUI9aLaM0bTn+lvUwhOUilr/ZporyHaOeyCMEUP9T2GJmjEL13Wm/q1mWcK/0XtQ
 ==
X-ME-Sender: <xms:IJc6XjxZbYf1Qq4s-4kKS5K-nnhy8mP8CO1Jmc-iY_NsU8XTNiQ04w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrhedugddufecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucffohhmrghinheprghlshgrqdhprhhojhgvtghtrdhorhhgnecukfhppedugedr
 fedrjeegrdduieeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:IJc6Xpie8jwGcPH2x73e5yYFNJ36b1ockDLSmEz8sqC2yVaLrLwOaw>
 <xmx:IJc6XqeXedV3dZSpES_Xz3lyFzckLkHFkBltZF-HLYFiha3fWzFrOA>
 <xmx:IJc6XgXn181E0vQG0e60c5Tcmp4X_mMn-XQ0JhvhWMJqxRA2lerFqg>
 <xmx:IJc6Xtfz3ltyjxetSN49NnqePY0_fIOoVlP-blg31_dWwcAdLPPksw>
Received: from workstation (ae074168.dynamic.ppp.asahi-net.or.jp [14.3.74.168])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6226930605C8;
 Wed,  5 Feb 2020 05:21:19 -0500 (EST)
Date: Wed, 5 Feb 2020 19:21:17 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Michael Forney <mforney@mforney.org>
Message-ID: <20200205102116.GB9810@workstation>
Mail-Followup-To: Michael Forney <mforney@mforney.org>,
 alsa-devel@alsa-project.org
References: <20200205081221.18665-1-mforney@mforney.org>
 <20200205081221.18665-2-mforney@mforney.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205081221.18665-2-mforney@mforney.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH alsa-utils 2/4] Avoid pointer arithmetic on
	`void *`
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

On Wed, Feb 05, 2020 at 12:12:19AM -0800, Michael Forney wrote:
> The pointer operand to the binary `+` operator must be to a complete
> object type.
> 
> Signed-off-by: Michael Forney <mforney@mforney.org>
> ---
>  aplay/aplay.c                     | 4 ++--
>  axfer/xfer-libasound-irq-mmap.c   | 7 ++++---
>  axfer/xfer-libasound-timer-mmap.c | 4 ++--
>  bat/common.c                      | 2 +-
>  seq/aplaymidi/aplaymidi.c         | 2 +-
>  5 files changed, 10 insertions(+), 9 deletions(-)

These changes look good to me.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/aplay/aplay.c b/aplay/aplay.c
> index 908093c..08395f6 100644
> --- a/aplay/aplay.c
> +++ b/aplay/aplay.c
> @@ -442,7 +442,7 @@ static ssize_t xwrite(int fd, const void *buf, size_t count)
>  	size_t offset = 0;
>  
>  	while (offset < count) {
> -		written = write(fd, buf + offset, count - offset);
> +		written = write(fd, (char *)buf + offset, count - offset);
>  		if (written <= 0)
>  			return written;
>  
> @@ -1210,7 +1210,7 @@ static int test_au(int fd, void *buffer)
>  	hwparams.channels = BE_INT(ap->channels);
>  	if (hwparams.channels < 1 || hwparams.channels > 256)
>  		return -1;
> -	if ((size_t)safe_read(fd, buffer + sizeof(AuHeader), BE_INT(ap->hdr_size) - sizeof(AuHeader)) != BE_INT(ap->hdr_size) - sizeof(AuHeader)) {
> +	if ((size_t)safe_read(fd, (char *)buffer + sizeof(AuHeader), BE_INT(ap->hdr_size) - sizeof(AuHeader)) != BE_INT(ap->hdr_size) - sizeof(AuHeader)) {
>  		error(_("read error"));
>  		prg_exit(EXIT_FAILURE);
>  	}
> diff --git a/axfer/xfer-libasound-irq-mmap.c b/axfer/xfer-libasound-irq-mmap.c
> index a13b3c3..386e741 100644
> --- a/axfer/xfer-libasound-irq-mmap.c
> +++ b/axfer/xfer-libasound-irq-mmap.c
> @@ -146,9 +146,10 @@ static int irq_mmap_process_frames(struct libasound_state *state,
>  	// TODO: Perhaps, the complex layout can be supported as a variation of
>  	// vector type. However, there's no driver with this layout.
>  	if (layout->vector == NULL) {
> -		frame_buf = areas[0].addr;
> -		frame_buf += snd_pcm_frames_to_bytes(state->handle,
> -						     frame_offset);
> +		char *buf;
> +		buf = areas[0].addr;
> +		buf += snd_pcm_frames_to_bytes(state->handle, frame_offset);
> +		frame_buf = buf;
>  	} else {
>  		int i;
>  		for (i = 0; i < layout->samples_per_frame; ++i) {
> diff --git a/axfer/xfer-libasound-timer-mmap.c b/axfer/xfer-libasound-timer-mmap.c
> index 1c642fe..ba26e29 100644
> --- a/axfer/xfer-libasound-timer-mmap.c
> +++ b/axfer/xfer-libasound-timer-mmap.c
> @@ -100,8 +100,8 @@ static void *get_buffer(struct libasound_state *state,
>  
>  	if (layout->vector == NULL) {
>  		char *buf;
> -		buf = areas[0].addr + snd_pcm_frames_to_bytes(state->handle,
> -							      frame_offset);
> +		buf = areas[0].addr;
> +		buf += snd_pcm_frames_to_bytes(state->handle, frame_offset);
>  		frame_buf = buf;
>  	} else {
>  		int i;
> diff --git a/bat/common.c b/bat/common.c
> index d3d1f28..339e749 100644
> --- a/bat/common.c
> +++ b/bat/common.c
> @@ -231,7 +231,7 @@ int generate_input_data(struct bat *bat, void *buffer, int bytes, int frames)
>  		load = 0;
>  
>  		while (1) {
> -			err = fread(buffer + load, 1, bytes - load, bat->fp);
> +			err = fread((char *)buffer + load, 1, bytes - load, bat->fp);
>  			if (0 == err) {
>  				if (feof(bat->fp)) {
>  					fprintf(bat->log,
> diff --git a/seq/aplaymidi/aplaymidi.c b/seq/aplaymidi/aplaymidi.c
> index 12d6fac..b086e70 100644
> --- a/seq/aplaymidi/aplaymidi.c
> +++ b/seq/aplaymidi/aplaymidi.c
> @@ -633,7 +633,7 @@ static void handle_big_sysex(snd_seq_event_t *ev)
>  		check_snd("sync output", err);
>  		if (sleep(1))
>  			fatal("aborted");
> -		ev->data.ext.ptr += MIDI_BYTES_PER_SEC;
> +		ev->data.ext.ptr = (char *)ev->data.ext.ptr + MIDI_BYTES_PER_SEC;
>  		length -= MIDI_BYTES_PER_SEC;
>  	}
>  	ev->data.ext.len = length;
> -- 
> 2.25.0
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
