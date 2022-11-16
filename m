Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EDD62B2B8
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 06:25:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A99A168F;
	Wed, 16 Nov 2022 06:25:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A99A168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668576359;
	bh=Vkknpe1GVfbbLgoxCQyZHPsDJiFH51f7CWoIpZBOPo4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ums41QX66NpyjfXRClzJNth+MmI4fwRm/qAPTbxDjm20+UrhcJiYYMOC4otklp2pW
	 GPsYNrnH7XVqRRDBQq6wuU0L93vPAfR3Kga9/Vvgv7KYXbs+FVp2jLA1m5exKpCZ3b
	 x1lfyHQZEB6NzGgWKegu3s+FBCcSSRGxZBPuSLVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C41F1F80238;
	Wed, 16 Nov 2022 06:25:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C2BFF800B5; Wed, 16 Nov 2022 06:25:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DBE5F800B5
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 06:24:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DBE5F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="d0QhJSkf"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="QUvrNVzZ"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id D651732009F1;
 Wed, 16 Nov 2022 00:24:44 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 16 Nov 2022 00:24:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1668576284; x=1668662684; bh=0V
 Nw6rqCcj8kASCyTrs2oOeZMmFvW36iJ7mKzWx+0xo=; b=d0QhJSkfI5xX3FYmZp
 mB6Tyb5/k8SLcyBeZTrHBuplLVGHX/vvJv646lNuucQxn6o3/D4VixVjydFvEZRU
 0oY0vteUB3IOmS763rK7WhgCsIKSgLLSFbaMoiIuuhU4nJTdTj4vXxnvIq+ojTw9
 7w+CBRcJtMYQgohFI+hjcH32SwZYFyiuZMFQt1+5P7auD8sysztxp5z8m61S+XCK
 AnOMNDPGhVI8h9u3tDhBpih7r7vnrLLsva18ITaVFWtVyNi2lXERdGGULbGm+GId
 RUniEXRhB4nZkeUawdFLbT7ggBqh5EDe8q0dh8yQo+g6rNAHoKRb92piYbdD1JAB
 K0lA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668576284; x=1668662684; bh=0VNw6rqCcj8kASCyTrs2oOeZMmFv
 W36iJ7mKzWx+0xo=; b=QUvrNVzZsif/vbTbnEY6dGH+eopNlvqusxAyy8l5LbSy
 y9Cw1b7nSF/HCAXJ8mj2PwJr0dPNhx2+uqStkMFNQN/ZKwcZ0LkR12baguDLBaC5
 ueJMkMTV6qVmW0vLGDKj5VSj+m0onNb+aDYk4dy5QQvWnJ84Px7h76ttdTVSE2bW
 LQhWhtmKPK040hUbQS3FUbdxHDKIe+zZZfmhB5UKLyYQgwmpdzGNYKfZVD7DkGsm
 +CQua4fc3fEH9VOZ99qhhaitkdzVN7VVSZMM4D4pojmQY4doEHLVxv6iv/6uBsgL
 sZ9tXNA8I/wCRr2YrVA1gAWtfB0vgs3ibfcbbHpZkA==
X-ME-Sender: <xms:G3R0Y1xV4iABat2z574oBmjYddO4Lg-9QLlUSKOAmoVZ0zFmqC4lqg>
 <xme:G3R0Y1Qc1RmNXkZHhSyKZey-MM-fyRcj28rW-D13l7VdDWaH5s0Wx_w945kaZthor
 udm5HV6bcHpmQbvRM4>
X-ME-Received: <xmr:G3R0Y_XfAGQ90QONDwTQ_FwyYCDlSk0hdq6oYsrzaltok8ptPrAcudu-wCzp_eKgI-RnSJJCYLrNt_e50kcZM1Sno16CQNcxTM3P>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeehgdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfejieei
 tedvleeftdfgfeeuudekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:G3R0Y3jlVI5Bpw5BOhBVNT3KN32bvSEMB9AALhRYVfqvv526GkIKNA>
 <xmx:G3R0Y3BIM7e7qmhHjy0bhMwA6QL1iuJmz4v2Bh09tTvX1EqOvQNLGg>
 <xmx:G3R0YwIUEXyouRZPQUqxkU5iOevRKZfGoayCH1oCQ8p8tJwFojXbpg>
 <xmx:HHR0Y6PzlDxrWPAZ4NIpxKChj1nEywTXznUe-Z-dzRSQ8bjTMPdfrA>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 00:24:42 -0500 (EST)
Date: Wed, 16 Nov 2022 14:24:39 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ALSA: pcm: avoid nused-but-set-variable warning
Message-ID: <Y3R0F10szODuZ2zH@workstation>
Mail-Followup-To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
References: <874juzg3kd.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874juzg3kd.wl-kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>
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

On Wed, Nov 16, 2022 at 12:12:39AM +0000, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> It will indicate below warning if W=1 was added and CONFIG_SND_DEBUG
> was not set. This patch adds __maybe_unused and avoid it.
> 
> 	${LINUX}/sound/core/pcm_native.c: In function 'constrain_mask_params':
> 	${LINUX}/sound/core/pcm_native.c:291:25: error: variable 'old_mask' set but not used [-Werror=unused-but-set-variable]
> 	  291 |         struct snd_mask old_mask;
> 	      |                         ^~~~~~~~
> 	${LINUX}/sound/core/pcm_native.c: In function 'constrain_interval_params':
> 	${LINUX}/sound/core/pcm_native.c:327:29: error: variable 'old_interval' set but not used [-Werror=unused-but-set-variable]
> 	  327 |         struct snd_interval old_interval;
> 	      |                             ^~~~~~~~~~~~
> 	${LINUX}/sound/core/pcm_native.c: In function 'constrain_params_by_rules':
> 	${LINUX}/sound/core/pcm_native.c:368:29: error: variable 'old_interval' set but not used [-Werror=unused-but-set-variable]
> 	  368 |         struct snd_interval old_interval;
> 	      |                             ^~~~~~~~~~~~
> 	${LINUX}/sound/core/pcm_native.c:367:25: error: variable 'old_mask' set but not used [-Werror=unused-but-set-variable]
> 	  367 |         struct snd_mask old_mask;
> 	      |                         ^~~~~~~~
> 	${LINUX}/sound/core/pcm_native.c: In function 'snd_pcm_hw_params_choose':
> 	${LINUX}/sound/core/pcm_native.c:652:29: error: variable 'old_interval' set but not used [-Werror=unused-but-set-variable]
> 	  652 |         struct snd_interval old_interval;
> 	      |                             ^~~~~~~~~~~~
> 	${LINUX}/sound/core/pcm_native.c:651:25: error: variable 'old_mask' set but not used [-Werror=unused-but-set-variable]
> 	  651 |         struct snd_mask old_mask;
> 	      |                         ^~~~~~~~
> 	cc1: all warnings being treated as errors
> 	make[3]: *** [${LINUX}/scripts/Makefile.build:250: sound/core/pcm_native.o] error 1
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/core/pcm_native.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Indeed. I think it a good catch.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 33769ca78cc8..ba6e44d02faa 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -288,7 +288,7 @@ static int constrain_mask_params(struct snd_pcm_substream *substream,
>  					&substream->runtime->hw_constraints;
>  	struct snd_mask *m;
>  	unsigned int k;
> -	struct snd_mask old_mask;
> +	struct snd_mask old_mask __maybe_unused;
>  	int changed;
>  
>  	for (k = SNDRV_PCM_HW_PARAM_FIRST_MASK; k <= SNDRV_PCM_HW_PARAM_LAST_MASK; k++) {
> @@ -324,7 +324,7 @@ static int constrain_interval_params(struct snd_pcm_substream *substream,
>  					&substream->runtime->hw_constraints;
>  	struct snd_interval *i;
>  	unsigned int k;
> -	struct snd_interval old_interval;
> +	struct snd_interval old_interval __maybe_unused;
>  	int changed;
>  
>  	for (k = SNDRV_PCM_HW_PARAM_FIRST_INTERVAL; k <= SNDRV_PCM_HW_PARAM_LAST_INTERVAL; k++) {
> @@ -364,8 +364,8 @@ static int constrain_params_by_rules(struct snd_pcm_substream *substream,
>  	unsigned int stamp;
>  	struct snd_pcm_hw_rule *r;
>  	unsigned int d;
> -	struct snd_mask old_mask;
> -	struct snd_interval old_interval;
> +	struct snd_mask old_mask __maybe_unused;
> +	struct snd_interval old_interval __maybe_unused;
>  	bool again;
>  	int changed, err = 0;
>  
> @@ -648,8 +648,8 @@ static int snd_pcm_hw_params_choose(struct snd_pcm_substream *pcm,
>  		-1
>  	};
>  	const int *v;
> -	struct snd_mask old_mask;
> -	struct snd_interval old_interval;
> +	struct snd_mask old_mask __maybe_unused;
> +	struct snd_interval old_interval __maybe_unused;
>  	int changed;
>  
>  	for (v = vars; *v != -1; v++) {
> -- 
> 2.25.1

Regards

Takashi Sakamoto
