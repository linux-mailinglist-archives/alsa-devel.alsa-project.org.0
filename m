Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F25781A5BFC
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Apr 2020 04:17:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9035616B8;
	Sun, 12 Apr 2020 04:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9035616B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586657821;
	bh=EEHYfC3QVqBgPYFIpPaM4xk0P9ZeUlvaHRgj8SMQfAA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jBy2l1aOAfpA9pYpglnmpM5xu6KAGp5915pr/RbnZAJysSiUxEnUGf0wgB9HO7hEq
	 QUqGMJ5aXBC59tL14d7yrQxA3DL8ivVjx8qjPDcho36t0LtShMYMnPufC1//gyrjHA
	 Ngl/IwX8Ou2KLhriP4aHvjA7f9BOczGN+wYzI3dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53728F80126;
	Sun, 12 Apr 2020 04:15:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86AD8F8013D; Sun, 12 Apr 2020 04:15:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF131F800B9
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 04:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF131F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="qALFqVq0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="oavigFNj"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 315755C01A0;
 Sat, 11 Apr 2020 22:15:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 11 Apr 2020 22:15:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=CQqaW6cieUAJsGP1GU0t9wHxBY5
 azeWDjcNm2ZKqVX0=; b=qALFqVq06cM9t+URCua8Ugzw13EGa+/R/UwIyGhszZG
 SD2Q+L0J/QHWGVuk4AbARhWDEfmu+0jZGf1k0Fq6l78jlh+KOCBA0wXWnO/++eqy
 7xBCkq1Pq8eJ3NU2SWIdltF6oI4FnUYyG606RSfUM70wsEJs9ora5ewEj54fykzT
 wmAKM+/2NezkUXsnkIz4Yh7aIAq7i4kewvK1THQfLCTyJm20eArbOcCPPobmm3Ce
 Snv6/qTUCL1hA3Mg5SIOOwHZy+4J3CyDJuAFKd5+3DBQ03OcRpPlHLDIswqqNnzd
 PryDAPoqLWuHvNESj181mf6ZK+2L9xgoFMCAHlqpf4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CQqaW6
 cieUAJsGP1GU0t9wHxBY5azeWDjcNm2ZKqVX0=; b=oavigFNjxa5x2+3kQFmbcA
 UPtbwXtT6svNRyk/kx7MR6ultf4mhhF18u4+MahSvaqZYswLrAHfTzMpykC7l257
 jWg+krTts5Ytyqf35W30QbB/8ulOJrOsSl8O0/l5l/LV51F3thNs/OMlqRBqVguz
 kctSucZzjyhrxQ3d7us9QcvJM86UpVXgOZbmVptiyT/lJ4eKfXuD09vHfr5AvFCJ
 /uiaiNHhLoZ22z5/9x8Hztek8p9y3m+kOEz9vsrqKo/CM57iVu6+8EqYpTQvZoKt
 EBXVfgjI1NoBhqGH6sNPZbuCN9xaUmjJuzqT6sWuVN+/VTduP94+I4RgXgrDdaLg
 ==
X-ME-Sender: <xms:qXmSXj2VU6At2ooLPXT69i-28tNzwBh4hqCQK_7DkJjoXDvF4saOag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvdehgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjfgesthdtre
 dttdervdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrkedvrdduuddune
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgr
 khgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:qXmSXr6gUkl30U2pr0z2v3eqkPAqbUwkjfkWdDe01BqyR440TWdCug>
 <xmx:qXmSXisQam2YkBiB7A1Zpkq3YwU_NZ9AUgoW2FlQ48pdQNCiQ0rPEg>
 <xmx:qXmSXkOuuLCkqrwZVW4M6PSQtwS6g79eobDCNfXGFG2qHRJZ3pKfWQ>
 <xmx:qnmSXiGaKsLeGCyM1DInLryYV4Nn_JGeS5ZeTM_oihNpNZt6gFv3jg>
Received: from workstation (ae082111.dynamic.ppp.asahi-net.or.jp [14.3.82.111])
 by mail.messagingengine.com (Postfix) with ESMTPA id C8673328006A;
 Sat, 11 Apr 2020 22:15:04 -0400 (EDT)
Date: Sun, 12 Apr 2020 11:15:00 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH] alsactl: don't exit on EINTR from epoll_wait().
Message-ID: <20200412021457.GA3961@workstation>
Mail-Followup-To: Zev Weiss <zev@bewilderbeest.net>,
 alsa-devel@alsa-project.org
References: <20191015043650.23536-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015043650.23536-1-zev@bewilderbeest.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Mon, Oct 14, 2019 at 11:36:50PM -0500, Zev Weiss wrote:
> Previously, things like attaching strace to a running 'alsactl monitor'
> process would cause it to exit.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  alsactl/monitor.c | 2 ++
>  1 file changed, 2 insertions(+)
 
I'm sorry but I overlooked the post. It looks good to me.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/alsactl/monitor.c b/alsactl/monitor.c
> index 6b090e4f5c92..cf4167bee165 100644
> --- a/alsactl/monitor.c
> +++ b/alsactl/monitor.c
> @@ -342,6 +342,8 @@ static int run_dispatcher(int epfd, int sigfd, int infd, struct list_head *srcs,
>  
>  		count = epoll_wait(epfd, epev, max_ev_count, 200);
>  		if (count < 0) {
> +			if (errno == EINTR)
> +				continue;
>  			err = count;
>  			break;
>  		}
> -- 
> 2.23.0

Regards

Takashi Sakamoto
