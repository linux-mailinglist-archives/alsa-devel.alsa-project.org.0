Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 049707B5809
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 18:50:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B25A485D;
	Mon,  2 Oct 2023 18:49:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B25A485D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696265418;
	bh=+ndZbwKiAJHi6yTQFerP95tlmJVKfVotqvNHfM2SzU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Uomx80BfO9osa8KBi+G1+Hti1y9h1SqmxXHzYv1laaoytZX6xQEH/2fakBchzTKEI
	 Y1EDlC6VFCUvqyOKboeVeK3n7nuPRmvCINrqeOS1LhCVYxTwZeCILRQcqinurNhe4n
	 X94QcwtPyNb8S2vn2b8fs9y3s6orxPrhQjzk2H5M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 235A1F80557; Mon,  2 Oct 2023 18:49:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A94C2F802E8;
	Mon,  2 Oct 2023 18:49:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 513CFF8047D; Mon,  2 Oct 2023 18:49:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC9C3F801EB
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 18:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC9C3F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=iOlNk3/0
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c328b53aeaso149556225ad.2
        for <alsa-devel@alsa-project.org>;
 Mon, 02 Oct 2023 09:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696265353; x=1696870153;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b7XJ5dqJNV5CR1Ji4WUBRRsOzTxjBAVuiqQFOAjz294=;
        b=iOlNk3/0uGDmk7yBiii6ZI2P9LTlzHHim1CV+7jLx27L48KucAJOJ7chdTG1HlWW46
         zMVND5VF9Mp5Z6Yzh0VH6R7rNEwI33t6iySmzJXZeTHWcg0f+KNjLCNOEy7n/TxkyutJ
         T7oKD+aOoXC3ocjoAJvZ3u288e0pm90I83sNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696265353; x=1696870153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7XJ5dqJNV5CR1Ji4WUBRRsOzTxjBAVuiqQFOAjz294=;
        b=eYJGm10DMdZG/JG29mZPMdCtmbMa+AavhC+xPxQesHhjCoitGhucXr59dXfK5S9trX
         L0ERqxqOR5KiB0zisMZI5jTqk80MQwElfxDFr2yuRxUJTVuBzAxk7rNkjb0frPV8+6q+
         5hOI+ZzDs5SVg9slqYTpzVcaoevB+8pRgS4BI3j6sm8QR73zJfjtwoAg7Yy81GIXnhxs
         iaMYjiG3SSki+ayze4Xyfd+/pm6yiV9WmSLPTQeJ56okA5pxj4OFl8uqVowSSw1cbZc2
         kwkDY6tLHFp/UHO0zTVibCjOHl4+jtdQkPMdZ9HchL/hoQdd4LHiWbGM8jA5x5NoJDcx
         qyig==
X-Gm-Message-State: AOJu0YwCURsBexFRPJQGxibHnGEeSdEg1Xw1sJA4ncayjXvTbzbkEV3B
	tnAjt0E4OE5A8herCrRnzK+RidQTaLyqgnMAqh4=
X-Google-Smtp-Source: 
 AGHT+IHrv23LVD12gIvMlECOZzW2oxgMdBZp+C3BsK92+u/yOg4JgdFuJ1c1G1mAfbhW7PBrvKLhkg==
X-Received: by 2002:a17:903:2788:b0:1c1:e380:b128 with SMTP id
 jw8-20020a170903278800b001c1e380b128mr11306748plb.60.1696265352674;
        Mon, 02 Oct 2023 09:49:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
 [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id
 g6-20020a170902740600b001c63429fa89sm12200145pll.247.2023.10.02.09.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 09:49:11 -0700 (PDT)
Date: Mon, 2 Oct 2023 09:49:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: SOF: ipc4-topology: Use size_add() in call
 to struct_size()
Message-ID: <202310020948.DEFCF4F@keescook>
References: <ZQSr15AYJpDpipg6@work>
 <169625984488.65718.9772394979337795498.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169625984488.65718.9772394979337795498.b4-ty@kernel.org>
Message-ID-Hash: TP46NNF6QGTJBXUJHP7ZIORSWZ73JQXF
X-Message-ID-Hash: TP46NNF6QGTJBXUJHP7ZIORSWZ73JQXF
X-MailFrom: keescook@chromium.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TP46NNF6QGTJBXUJHP7ZIORSWZ73JQXF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 02, 2023 at 04:17:24PM +0100, Mark Brown wrote:
> On Fri, 15 Sep 2023 13:09:11 -0600, Gustavo A. R. Silva wrote:
> > If, for any reason, the open-coded arithmetic causes a wraparound,
> > the protection that `struct_size()` adds against potential integer
> > overflows is defeated. Fix this by hardening call to `struct_size()`
> > with `size_add()`.
> > 
> > 
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: SOF: ipc4-topology: Use size_add() in call to struct_size()
>       commit: 3746284c233d5cf5f456400e61cd4a46a69c6e8c

Thanks! I've dropped it from my tree.

-Kees

-- 
Kees Cook
