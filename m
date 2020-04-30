Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E7D1C033A
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 18:56:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B932168F;
	Thu, 30 Apr 2020 18:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B932168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588265811;
	bh=2torgxbSpiwnaw7cxzwyIZZb9ZsnHbyDrFzwlAgJSIw=;
	h=From:To:Subject:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VUcAFUX8i8c3dRb59dBx1JbyI7goovj41AVfabeWEBLIs1pLGnc//aDg/MF7dGEUY
	 G12jdwogpbtbyhTV/j0HrkFZ7ntPzfBQQqtNOgAe0lvuT2Ra+3MazcmJa0v7H6JnYP
	 VEVZVOWUBi58+076rxzxhZ5C4FVqP56booj5r/uw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F093F8028F;
	Thu, 30 Apr 2020 18:53:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 307DEF801DB; Thu, 30 Apr 2020 18:34:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from depni-mx.sinp.msu.ru (depni-mx.sinp.msu.ru [213.131.7.21])
 by alsa1.perex.cz (Postfix) with ESMTP id C9B76F80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 18:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9B76F80123
Received: from spider (unknown [176.192.247.171])
 by depni-mx.sinp.msu.ru (Postfix) with ESMTPSA id EB35D1BF453;
 Thu, 30 Apr 2020 19:34:23 +0300 (MSK)
From: Serge Belyshev <belyshev@depni.sinp.msu.ru>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: pcm: oss: Avoid plugin buffer overflow
References: <20200309082148.19855-1-tiwai@suse.de>
Date: Thu, 30 Apr 2020 19:34:02 +0300
In-Reply-To: <20200309082148.19855-1-tiwai@suse.de> (Takashi Iwai's message of
 "Mon, 9 Mar 2020 09:21:48 +0100")
Message-ID: <87v9lhkk5h.fsf@depni.sinp.msu.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Thu, 30 Apr 2020 18:53:43 +0200
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

> ...
>
> This patch addresses those possible buffer overflow accesses by simply
> setting the upper limit per the given buffer size for each plugin
> before src_frames() and after dst_frames() calls.

Hi!

This patch breaks any output via oss interface, as evident by "mpv
--ao=oss somefile.mp3" or "mpg123 -o oss somefile.mp3" or just "cat
/dev/urandom > /dev/dsp", which worked previously in kernel version 5.5
but not any longer starting with 5.6.

It appears here that plugin->buf_frames is zero which results in ENXIO
returned to userspace.

> ...
> --- a/sound/core/oss/pcm_plugin.c
> +++ b/sound/core/oss/pcm_plugin.c
> @@ -209,6 +209,8 @@ snd_pcm_sframes_t snd_pcm_plug_client_size(struct snd_pcm_substream *plug, snd_p
>  	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
>  		plugin = snd_pcm_plug_last(plug);
>  		while (plugin && drv_frames > 0) {
> +			if (drv_frames > plugin->buf_frames)
> +				drv_frames = plugin->buf_frames;
>  			plugin_prev = plugin->prev;
>  			if (plugin->src_frames)
>  				drv_frames = plugin->src_frames(plugin, drv_frames);
> ...
