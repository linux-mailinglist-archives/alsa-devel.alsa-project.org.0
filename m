Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 153DE78C67F
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 15:54:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1352B84C;
	Tue, 29 Aug 2023 15:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1352B84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693317289;
	bh=YNQ29OlHCj6Fklm9he144gEuBni15L796iQIjfZINiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GM/OhhVYyJw1X1ZxyKgQzyB/EaDjSAsCHuP0si5SI2eea87G8nb/tLrGL6YDngrRJ
	 IAP7+8UCbmJdNCDGMAdiaR3nZvoRiuyJHZ+0d3XsRsTvPsd33dz6UuE8DoWVdcTlY6
	 YVhKaru55FMMoyEtlg0WQz3DC679Z7XstSpDR0oQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC1CEF80551; Tue, 29 Aug 2023 15:53:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 686F4F80527;
	Tue, 29 Aug 2023 15:53:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E8E6F80536; Tue, 29 Aug 2023 15:53:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09761F80527
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 15:53:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09761F80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=vNh2b77R;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=lHK8UyWA
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 526735C00ED;
	Tue, 29 Aug 2023 09:53:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 29 Aug 2023 09:53:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1693317183; x=
	1693403583; bh=QO0cAWDjlQqMXF4c9C3sNOLdFaVIBPulzKwyHhmEg24=; b=v
	Nh2b77RvWJmpzWDST36Wfd7+FqIyADhNMIDFbGNpfWQD4paHEVwvgI3vXvIZOgyT
	Ak9ML15H7qSm7bY1bSNAr9lsLLNaIIBfIBMiL3VKswGOW0lJ6nXd2yl7/nZEytyB
	YuaRmwDIHspxjHV6/HqQMHMmKxRS28yKaCzt2rmu3t6ZWfws5xMVotXQyCd15Luw
	UZ/dWphdoXo21IVxlWbPoZargzgy+8DTIObHnc37rGDHT9RfNda54KF+6Y3BbKf7
	n1yTZ05DcBix5SYEGJnL2ndUg0H7NZSsKluz1r78pQCjrkqMlBUTJPQTSVKMut/X
	E8sWb3gctJEgeW/hfSVWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1693317183; x=1693403583; bh=QO0cAWDjlQqMX
	F4c9C3sNOLdFaVIBPulzKwyHhmEg24=; b=lHK8UyWAChat2hoWvFB4+LfU++VM7
	coDr3wJ7RAPpSURSSVCz6cB/yA5RORIVvaR8cJ4V8xu2hVFzaaPt2Se9e85Mlvyi
	uRKzdDv0dpWzFlxJlIK//X3XJpHqfcqtMynvDkp0i27tmifleuOH8uKiiC1gzab0
	yHjujHHkVeIQ8Gcr5whzyZbceIjLCrPfCVprV0m26HUxwjAsrKTt1mIZqtpJBHJd
	o7IuiPinNRb6fy2+sW29mQ8yeM5q4sHOov7oyHgSDhFpwkahnZBpdtWk8LIHLag/
	xbgmsgtIaxxdbcvVhAG78CMwhBrFCCoxvXLYGBFDqext/jTr+6XHyo4YA==
X-ME-Sender: <xms:PvjtZCZ0tzGRt7PwjBA_bC-BTInY1l2ZxI1pP2MLMZnG1DmZbGNHQA>
    <xme:PvjtZFa0dEyIWsvU1Xlvs1jQ_LUXgBijmDrg6ttPRF9-QZ7A6XkETpq5j0jytg9SV
    xMRsgZe_Zgfok06kEk>
X-ME-Received: 
 <xmr:PvjtZM9kXjIUw9qq8tsbPp3KX8ZJKjaOcr0WFQxwOw08tj3F_4nMxLXZJzWWMgeoZU05OvnZsomzo30Vk-ImUxD7rXbVylMQ0FM>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudefiedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepvfgrkhgr
    shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
    hjpheqnecuggftrfgrthhtvghrnhephefhhfettefgkedvieeuffevveeufedtlefhjeei
    ieetvdelfedtgfefuedukeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:PvjtZEpSevZlfHe3Xrz5TSNv49T2wbrYubr4z5evXuopeXeU2HfLug>
    <xmx:PvjtZNpJfxz3Ezt7d6YKu4MZL3aa36ZI2ymJkqrI-wvOJl3mVqsrEw>
    <xmx:PvjtZCTqaiATNqKssL-ji9OGCjLC7i1CTSlfLDStpZDTqONkcUbeMA>
    <xmx:P_jtZOCc6bRFlfU68oyagydFI3eYZT3KJOARBcSsksFnBoLHPWPHhw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Aug 2023 09:53:00 -0400 (EDT)
Date: Tue, 29 Aug 2023 22:52:56 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Meng_Cai@novatek.com.cn
Subject: Re: [PATCH] ALSA: pcm: Fix missing fixup call in compat hw_refine
 ioctl
Message-ID: <20230829135256.GA116864@workstation.local>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	Meng_Cai@novatek.com.cn
References: <20230829134344.31588-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829134344.31588-1-tiwai@suse.de>
Message-ID-Hash: LC33LEBZWBKO5COWCYNNOQS3ZV6DI4QX
X-Message-ID-Hash: LC33LEBZWBKO5COWCYNNOQS3ZV6DI4QX
X-MailFrom: o-takashi@sakamocchi.jp
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LC33LEBZWBKO5COWCYNNOQS3ZV6DI4QX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Tue, Aug 29, 2023 at 03:43:44PM +0200, Takashi Iwai wrote:
> The update of rate_num/den and msbits were factored out to
> fixup_unreferenced_params() function to be called explicitly after the
> hw_refine or hw_params procedure.  It's called from
> snd_pcm_hw_refine_user(), but it's forgotten in the PCM compat ioctl.
> This ended up with the incomplete rate_num/den and msbits parameters
> when 32bit compat ioctl is used.
> 
> This patch adds the missing call in snd_pcm_ioctl_hw_params_compat().
> 
> Reported-by: Meng_Cai@novatek.com.cn
> Fixes: f9a076bff053 ("ALSA: pcm: calculate non-mask/non-interval parameters always when possible")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/pcm_compat.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Indeed. I did overlook PCM compat layer. The branch for hw refine compat
ioctl should call the fixup, while the branch for hw params has no need
since the helper function call the fixup.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
> index 42c2ada8e888..c96483091f30 100644
> --- a/sound/core/pcm_compat.c
> +++ b/sound/core/pcm_compat.c
> @@ -253,10 +253,14 @@ static int snd_pcm_ioctl_hw_params_compat(struct snd_pcm_substream *substream,
>  		goto error;
>  	}
>  
> -	if (refine)
> +	if (refine) {
>  		err = snd_pcm_hw_refine(substream, data);
> -	else
> +		if (err < 0)
> +			goto error;
> +		err = fixup_unreferenced_params(substream, data);
> +	} else {
>  		err = snd_pcm_hw_params(substream, data);
> +	}
>  	if (err < 0)
>  		goto error;
>  	if (copy_to_user(data32, data, sizeof(*data32)) ||
> -- 
> 2.35.3


Regards

Takashi Sakamoto
