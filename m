Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B85761A53FB
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Apr 2020 00:54:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43BCE169D;
	Sun, 12 Apr 2020 00:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43BCE169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586645680;
	bh=1IXIIUhlHrQRhhAut3RxtvGyQH4UFgKlxg8W7JHcanU=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=muzUfQtaDnt0W3ogByyR08ivdGeQv5LI5zGuDNnreHHSaDdw13N837bQ56fPfXe2N
	 g5lvGda280MwBE29yo+O2YvaoNJkC6qmMF+jaFqjL7lyB+SO//HZfBblTU1JyJwphD
	 tOm7OD8OtYUbOKxo643z4piBOTwBtA2+LRxZJCyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 682D6F800CB;
	Sun, 12 Apr 2020 00:52:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AD81F801DA; Sun, 12 Apr 2020 00:52:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1BE5F800CB
 for <alsa-devel@alsa-project.org>; Sun, 12 Apr 2020 00:52:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1BE5F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=bewilderbeest.net
 header.i=@bewilderbeest.net header.b="jsrCd63C"
Received: from hatter.bewilderbeest.net (unknown
 [IPv6:2600:6c44:7f:ba21:44a2:d13f:a31e:c764])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5A3FE806E4
 for <alsa-devel@alsa-project.org>; Sat, 11 Apr 2020 15:52:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 5A3FE806E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1586645567;
 bh=leYZuFjC4kL2LtBtrP773jljTo5/8cuBSu7NuJq/jJk=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=jsrCd63CNAkQIrbZApjj8/0egSPEOAFPtuO6ftdCddjCA47Wk9Xm8V1184ifTOCci
 Qh2FtXC+SxZCu2ImDyIyff68U/C0JFfHpfRDilrrvxbkHKAwnZZq30kv8kZxRy/B8B
 jiE+E3/gMoUsIuf5XepwZLkwYWox++WsCQO1ZKwQ=
Date: Sat, 11 Apr 2020 17:51:31 -0500
From: Zev Weiss <zev@bewilderbeest.net>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH] alsactl: avoid needless wakeups in monitor loop.
Message-ID: <20200411225131.kqbew5tiyhafzv5m@hatter.bewilderbeest.net>
References: <20191015043802.23619-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20191015043802.23619-1-zev@bewilderbeest.net>
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

Ping -- it's been a while since I sent this and
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-October/156866.html,  
never saw any response though.  Any problems with these patches?

Thanks,
Zev Weiss

On Mon, Oct 14, 2019 at 11:38:02PM CDT, Zev Weiss wrote:
>The timeout wasn't really being used for anything; disabling it should
>reduce idle energy consumption slightly.
>
>Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>---
> alsactl/monitor.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/alsactl/monitor.c b/alsactl/monitor.c
>index 6b090e4f5c92..6d9328d899a4 100644
>--- a/alsactl/monitor.c
>+++ b/alsactl/monitor.c
>@@ -340,7 +340,7 @@ static int run_dispatcher(int epfd, int sigfd, int infd, struct list_head *srcs,
> 		int count;
> 		int i;
>
>-		count = epoll_wait(epfd, epev, max_ev_count, 200);
>+		count = epoll_wait(epfd, epev, max_ev_count, -1);
> 		if (count < 0) {
> 			err = count;
> 			break;
>-- 
>2.23.0
>
