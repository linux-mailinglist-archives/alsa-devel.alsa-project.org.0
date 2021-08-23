Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3D23F4EF6
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 19:05:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47FFB85D;
	Mon, 23 Aug 2021 19:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47FFB85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629738310;
	bh=podLZavGuPLjdyUUzf8zXd3j+Wtud9rZJCmaTVVDG2U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LKnByyfqrnOBMi8h8qMtBjObuOkfJNyLP8f2r/MbREmcOjOvO6b3zQb0VB5r54NxC
	 oVI/LfnLyw3gAB52R4cj6F6eLlcyv2RMbURVWV7LGXmQfJFCpdzR8JPsFmPnuSfV3M
	 Za6EvSQRmntWNTaiwSrrMvPzQgfnDhnP8x0H5gCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 846E8F8020D;
	Mon, 23 Aug 2021 19:03:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46A09F800AE; Mon, 23 Aug 2021 19:03:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lb1-smtp-cloud8.xs4all.net (lb1-smtp-cloud8.xs4all.net
 [194.109.24.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 261FCF800AE
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 19:03:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 261FCF800AE
Received: from cust-b66e5d83 ([IPv6:fc0c:c157:b88d:62c6:5e3c:5f07:82d0:1b4])
 by smtp-cloud8.xs4all.net with ESMTPA
 id IDMImbs1ZUWyVIDMJmw8Rh; Mon, 23 Aug 2021 19:03:40 +0200
Received: from localhost (localhost [127.0.0.1])
 by keetweej.vanheusden.com (Postfix) with ESMTP id C66D7161E7C;
 Mon, 23 Aug 2021 19:03:38 +0200 (CEST)
Received: from keetweej.vanheusden.com ([127.0.0.1])
 by localhost (mauer.intranet.vanheusden.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id C5LbdOb66xyj; Mon, 23 Aug 2021 19:03:32 +0200 (CEST)
Received: from belle.intranet.vanheusden.com (belle.intranet.vanheusden.com
 [192.168.64.100])
 by keetweej.vanheusden.com (Postfix) with ESMTP id 4CE04161E77;
 Mon, 23 Aug 2021 19:03:32 +0200 (CEST)
Received: by belle.intranet.vanheusden.com (Postfix, from userid 1000)
 id 3D744162DC6; Mon, 23 Aug 2021 19:03:32 +0200 (CEST)
Date: Mon, 23 Aug 2021 19:03:32 +0200
From: folkert <folkert@vanheusden.com>
To: sujith kumar reddy <sujithreddy6192@gmail.com>
Subject: Re: arecord is failing with -V stereo
Message-ID: <20210823170332.GD890690@belle.intranet.vanheusden.com>
References: <CAAd2w=btf3DZLbPuovAC9xo3rizmFeT4iAxJs6zNZwKxOnKT6A@mail.gmail.com>
 <20210819183450.GV890690@belle.intranet.vanheusden.com>
 <CAAd2w=YFhiJJ=4nqo7JfbrqdNWVxvSp06E=1XiHOXV8Kp2sgaQ@mail.gmail.com>
 <20210819190634.GW890690@belle.intranet.vanheusden.com>
 <CAAd2w=Z4rG1UwA6ELzqwr_0TXjQmD0T1izonAJk9-32TSzGchQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAd2w=Z4rG1UwA6ELzqwr_0TXjQmD0T1izonAJk9-32TSzGchQ@mail.gmail.com>
Reply-By: Fri 16 Jul 2021 08:34:34 AM CEST
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4xfOdb6bO78RDAJIeIQohZ4BQBV5OBPT5iZ6PmJ+nry0Fmbwedi4qtfKKaz7fqrRhv5NSbFLT6vvQHAPj1/W2IcOqgP2MeLJmghwghlVSR/FMQOdqJoMYW
 9H1SOvtexRy989HfKeKVm8oWsnLcYcUTQVfxqGxCNz1kRABLBxXNZZHUwA9L8Rab6LnIpiqdh/aL3Fr8l6yMC21sCpM/vWthXaMOBhw0JwtlY/D0Z/tdP8aj
 w080tA2UJSzGrPjVz61Kaa7KPLbWRzri/yvDmfPYZgU=
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

>         const int bar_length = 35;
>         char line[80];
...
>                 if (p > bar_length)
>                         p = bar_length;
>                 if (c)
>                         memset(line + bar_length + 6 + 1, '#', p);
> ----------------//this is the line where it is crashing.here p value is
> becoming negative at c=1.As we see if we change the p value to bar_length
> it works fine ..As it is a player issue not a driver issue.

This is puzzling.
bar_length + 6 + 1 + p and thus 35 + 6 + 1 + 35 is max 77, that fits
easlity in 80.

But wait:

                        line[bar_length - p - 1] = '+';

p is max bar_length, so we would end up putting '+' in line[-1]

Can you try this?


diff --git a/aplay/aplay.c b/aplay/aplay.c
index cc51dcb..9cfd52c 100644
--- a/aplay/aplay.c
+++ b/aplay/aplay.c
@@ -1764,7 +1764,7 @@ static void print_vu_meter_stereo(int *perc, int *maxperc)
 			p = bar_length;
 		if (c)
 			line[bar_length + 6 + 1 + p] = '+';
-		else
+		else if (p < bar_length)
 			line[bar_length - p - 1] = '+';
 		if (ABS(maxperc[c]) > 99)
 			sprintf(tmp, "MAX");
