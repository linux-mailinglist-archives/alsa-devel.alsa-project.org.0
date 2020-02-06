Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8795E153C38
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 01:02:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A7131685;
	Thu,  6 Feb 2020 01:02:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A7131685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580947371;
	bh=cQAqFL+iamg8XEYVuV6Tp8/7sTv7XpYxLJOd1G+77XQ=;
	h=In-Reply-To:References:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dd3EHb41vZRMAT7xzJWwUszh3vOxS4aVQwLM1qy1CVwxIbwYYQrH6XdnvUdyvG1yW
	 fJwXhI7WyIl0IoVN5b+ACMpHbkXFaT/dLEcNm3DVi9eeXPrJCV8MdU7QU7GM5UmSCJ
	 +v2xmboZOAiTacMPtEfq85P1jnU8pYxQFTpO8pvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FB64F80142;
	Thu,  6 Feb 2020 01:01:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63317F80148; Thu,  6 Feb 2020 01:01:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE70CF80051
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 01:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE70CF80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="tEHiUvvG"
Received: by mail-yb1-xb44.google.com with SMTP id w17so31825ybm.1
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 16:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=pPii7izgLeXNoTf4vn7SExy/Mmwr5HNXv8oU9Opje24=;
 b=tEHiUvvGK0e+ApLHxYtGtw5i0/bwOUyHOZo8xtR4o0hAhc1dyrqk0KmlDQGR4/fHwn
 cpPDwiOMoEVp3ZLSiGeLamApaMuQZMFxSJHyIVw/RpY0zJpYxVpurXueZMrmquOnIFbI
 FwM9fKLPyu9UujV8Ld3w2t2l0bMj/pzNWgJX6BoLJ0TUpEMmcDQpgj9aYTY3aDJ0kZzt
 11U0i+tFThGntyV+woR8Nbo1/8roZA9pjE1OlpycsC0DyP1yznyp1S26voEP3nMg3ULO
 xRdHO5/isswbySVfgHOAZ46WIIv5JlqgMHY22riBJ6x4wyCx40xhIpfQ0aQ+GVSMkXR4
 dXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=pPii7izgLeXNoTf4vn7SExy/Mmwr5HNXv8oU9Opje24=;
 b=C/oycy+oQVbfB0WpN7g1GQLXpjmpQ9N8czawkJbw0tFRDPwtVuXytXUvvD88/uhuat
 KEgN35mbF6Y19o29KWobsz6+AikP7mCZbI6VjumjYQaAGGgEavoJDda1cOdAZiz+6fET
 bKnIYy1qFC9T/McNEUuoPZROJqrL5t5VwuSaTMaEb+1bdMulLDx1TQ/P93RP0GHndenL
 la1efCgFhCMjm2PhNMs8YI6Pz/uoMxLkdiVY51/4v3PDIi4uCk7Z3kJ+W97NvRdZaf4A
 zx2GHCbO10+SU9qQaz6bb/m/AGQ4gXq0IlpS2k1BD8mhdTquvvrD2WxPvQP9IFvzgLhB
 exSA==
X-Gm-Message-State: APjAAAXkMMi51pBEGDcKPOYhppLK9P4BNfYC418qevJTyfhCtU/7wibs
 Dat5Y7SGbNVGmYTH+h3nCTHI1KyP7WEknml++qhXdg==
X-Google-Smtp-Source: APXvYqyS3ejLPd2BLocg/vkqA6I4UBktAZfCG/KP1MYvB7vzaEi+De5zhUDcfE/qy82XLddfhUidrf6WyptlpLXgcVU=
X-Received: by 2002:a05:6902:4c8:: with SMTP id
 v8mr570844ybs.451.1580947257532; 
 Wed, 05 Feb 2020 16:00:57 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a0d:e186:0:0:0:0:0 with HTTP;
 Wed, 5 Feb 2020 16:00:57 -0800 (PST)
X-Originating-IP: [73.70.188.119]
In-Reply-To: <cefeff1a-a35d-7d00-1f49-7c0dfa746ad1@ladisch.de>
References: <20200205081221.18665-1-mforney@mforney.org>
 <20200205081221.18665-2-mforney@mforney.org>
 <cefeff1a-a35d-7d00-1f49-7c0dfa746ad1@ladisch.de>
From: Michael Forney <mforney@mforney.org>
Date: Wed, 5 Feb 2020 16:00:57 -0800
Message-ID: <CAGw6cBuk4DhL033W+PusF2LBb=pg-FczR7nWUU_gnrtr1HM=gQ@mail.gmail.com>
To: Clemens Ladisch <clemens@ladisch.de>
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

On 2020-02-05, Clemens Ladisch <clemens@ladisch.de> wrote:
> Michael Forney wrote:
>> The pointer operand to the binary `+` operator must be to a complete
>> object type.
>
> Why are you making this change?  Are you trying to compile alsa-utils
> with MSVC?

I'm trying to compile alsa-utils with cproc[0], which is my C compiler project.

[0] https://git.sr.ht/~mcf/cproc
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
