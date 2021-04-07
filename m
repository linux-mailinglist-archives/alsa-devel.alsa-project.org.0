Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E68357897
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 01:35:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0F0F1662;
	Thu,  8 Apr 2021 01:34:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0F0F1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617838502;
	bh=sYEaL5BwcPL8fCUgKNyex4OiVDRL0t+1hU0phb2KSSg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QmDy3uwrTG6Nhmp0fCmRHe1sTuSaMYVOJSpBv7v2aVB0OAtifO03Vv8qx3Te/rPfh
	 Pkeiy5lcKO1MitvTf+8fchfgAQSRSoeQIEDagvld7AQrAMvwv/XFyRSPG5zjPsMN17
	 rzMKReZERg+uZCo0XTE8P1VUz3KwzDN6i+ayxY2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13025F8016D;
	Thu,  8 Apr 2021 01:33:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 676B6F8016A; Thu,  8 Apr 2021 01:33:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9727F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 01:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9727F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="nffNf62G"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=MpRbqVH11WDrjLdwbclElTPVzrqxrO57EVIBD5YvChw=; b=nffNf62G6/CX8WGvEysy5Kk7AO
 MwShDBcnxiZ3H4csUaoGs3vFs74SpF+UU6I7wuj7WqiWBbtZijYHLi2nsbzxZkkV2OCUTbgLt+dwk
 7ua/4n1won2dLpQC9m0YW2vV0rl0pdZ2gWMBpjmCa4G3xuB98P6kJDZVE3J3fSGda9qUKboV1PcK1
 zEz8JHeKTV8Hol8DtpDeQjZYLXrqoet3if8ViF2yCyQQjBHt51NZAvHDdaRgJGpkIsSSLVeXugFhs
 7NZWIZFW/FCNpDZg5DzvCvGw98IvA2qgUgNo8u4WIgNQ6+Emcn39kCKraBmlgNmK8N96T226+mB4o
 /NQDxgaA==;
Received: from [2602:306:c5a2:a380:9e7b:efff:fe40:2b26]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lUHeW-00FGPa-8Q; Wed, 07 Apr 2021 23:32:10 +0000
Subject: Re: [PATCH] sound:ppc: fix spelling typo of values
To: caizhichao <tomstomsczc@163.com>, perex@perex.cz, tiwai@suse.com
References: <20210323085543.741-1-tomstomsczc@163.com>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <89c4f3e6-437c-6562-1ab8-5b253c9038fa@infradead.org>
Date: Wed, 7 Apr 2021 16:32:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323085543.741-1-tomstomsczc@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, caizhichao <caizhichao@yulong.com>,
 mpe@ellerman.id.au, linux-kernel@vger.kernel.org, paulus@samba.org,
 benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org
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

On 3/23/21 1:55 AM, caizhichao wrote:
> From: caizhichao <caizhichao@yulong.com>
> 
> vaules -> values
> 
> Signed-off-by: caizhichao <caizhichao@yulong.com>
> ---
>  sound/ppc/snd_ps3_reg.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Seems fine. Thanks for your contribution.

Acked-by: Geoff Levand <geoff@infradead.org>

