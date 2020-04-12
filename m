Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB04C1A5C00
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Apr 2020 04:21:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85BC816C3;
	Sun, 12 Apr 2020 04:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85BC816C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586658062;
	bh=Md5Cy4QgK9rlMtlcC9ofAXgPhlbR0PDRr8PvoF43pP8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F/eqj32npKmOKkA5PwRIZrJiih0l4lizKmBypSRqLZZBD2JSIZFJSfI9yZo+MjmvE
	 tH3OB6rOOoAK0pTbptp4QtKiLNOnSwLi5wdkPq7odedQrhAz7l83t3Fu8dCxWCJKja
	 2PsVQlZGqiU6BYhtj/W2TxHb/Yb5odtx7KoN/XDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACDEEF8014E;
	Sun, 12 Apr 2020 04:19:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 209C9F8013D; Sun, 12 Apr 2020 04:19:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC0C5F800B9
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 04:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC0C5F800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="B0aelKUS"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="VG6XLrDB"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id DAF0E5C01A3;
 Sat, 11 Apr 2020 22:19:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Sat, 11 Apr 2020 22:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=JkWyFzkV86OX8Wwchhnc+2/zw6S
 a3RL1dTvwyItUZ/s=; b=B0aelKUSHNklzJs9LgDUfN+vO58vjCo7fqa6XcWR9Ze
 MqKKGYqYKnwjnSo07AbE/yWpRxLFF9mKBWXofkug+H0/xgiFl9pZDAg2T3cqEGyY
 XjXphH3KO2hHqwN2k5/DeNNFIffkun18sdV/4OOLB41YwWK2Dm7ECebM+NHRRapW
 VeJA6uW0rb/GDSz6yWf5yE4VDOt0mM4fCdGBuNoyz+U0zdsMWQdGI9oUN7yWUknH
 Ms9KFazkz2dSzgyuUSqoUKfW5dU22nTPuiIoSsJEKL5DKboodOzIof/nfqRzyhij
 fbx72EKiXlfNx33Egdfk8O1mepfJ9t4bndkvBc9ituA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=JkWyFz
 kV86OX8Wwchhnc+2/zw6Sa3RL1dTvwyItUZ/s=; b=VG6XLrDBktAr6rzM3Q9hwN
 mMi1n7udybqjZUMBqrKcMeFt17j4DvlE9dJfmHsYb7LyL+LkfCacu3dG3VFbjQ8H
 L5FEuCsQzerWtR/lwujYl1+nHvffo08Q+M8hrAZBM28Lg/XEHxC88PiPfCS/d0is
 F0Ws5+ptBRDip68V1F1AGa4tcI77uV0+46ri/AtApDyaeICBvpnwk96gToLdjq1d
 7SaefMNYGMLa+0X6c+y1erhjmxwtV5vpDSBfGa5P+rEcAWomIoXm6qwUwRJlbw6d
 50cO71su+73+nZ1jDRZiNwpnxLAyk6CUlBcKLRSAqJEVKuXc5xo/5ZZnFHkGIT3w
 ==
X-ME-Sender: <xms:nXqSXoP5Vl6C-XQT74VBCoy1z6ZnNLXDrZocs0FqXUHzzAM3dU-k6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvdehgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjfgesthdtre
 dttdervdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecukfhppedugedrfedrkedvrdduuddune
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgr
 khgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:nXqSXpRr0t2GlGxVA8DBsQsdw1-Lkeeo4_PMvC3JdeEQjcZWONyMjQ>
 <xmx:nXqSXpiwDsFTuuV7dMOTDVfj1Wc2prdtwlBd_5E2cqtivTITEx6LtA>
 <xmx:nXqSXm-1u-fwOPLx1LwW45R-E96QwTma5glpxFdQaAfEauy3_edZvw>
 <xmx:nXqSXgx_ifsNjWMitVcIbU6VOKXIcPnHqROivIxyJpsiyEh3xLO8gQ>
Received: from workstation (ae082111.dynamic.ppp.asahi-net.or.jp [14.3.82.111])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4B760306005E;
 Sat, 11 Apr 2020 22:19:08 -0400 (EDT)
Date: Sun, 12 Apr 2020 11:19:06 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH] alsactl: avoid needless wakeups in monitor loop.
Message-ID: <20200412021905.GB3961@workstation>
Mail-Followup-To: Zev Weiss <zev@bewilderbeest.net>,
 alsa-devel@alsa-project.org
References: <20191015043802.23619-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015043802.23619-1-zev@bewilderbeest.net>
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

Hi,

On Mon, Oct 14, 2019 at 11:38:02PM -0500, Zev Weiss wrote:
> The timeout wasn't really being used for anything; disabling it should
> reduce idle energy consumption slightly.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  alsactl/monitor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I overlooked it as well... It looks good to me.

Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

> diff --git a/alsactl/monitor.c b/alsactl/monitor.c
> index 6b090e4f5c92..6d9328d899a4 100644
> --- a/alsactl/monitor.c
> +++ b/alsactl/monitor.c
> @@ -340,7 +340,7 @@ static int run_dispatcher(int epfd, int sigfd, int infd, struct list_head *srcs,
>  		int count;
>  		int i;
>  
> -		count = epoll_wait(epfd, epev, max_ev_count, 200);
> +		count = epoll_wait(epfd, epev, max_ev_count, -1);
>  		if (count < 0) {
>  			err = count;
>  			break;
> -- 
> 2.23.0

Regards

Takashi Sakamoto
