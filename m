Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 809982F2051
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 21:03:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19F0B1727;
	Mon, 11 Jan 2021 21:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19F0B1727
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610395387;
	bh=0JZexrYoCntGuuxnUh6gc6rO1iK2vzqTbruvZhbBg0Q=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mPX5kjLhewCvVkbqc3HLqvX6az+lf04z6f5YwkU9Xc8vHXSxVt+2PinJyN7YMKfdR
	 PFMG5gApxwppOYlKOn5D9hB9seZD+0wxaLu1CG+PK1U0LATofhCXBojHV7ubqecBnI
	 gfJkdvXe6LpSKGNwcYPxgYRHBQKkahseM26LcSnA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66269F80254;
	Mon, 11 Jan 2021 21:01:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E2D4F8016D; Mon, 11 Jan 2021 21:01:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0C7CF8013D
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 21:01:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0C7CF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net
 header.b="omPh6kk8"
Received: from lwn.net (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 03A669A8;
 Mon, 11 Jan 2021 20:01:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 03A669A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1610395272; bh=DTdgwVb8vb1yigbzXAtWWLTa0+pE5qUOEPoDlGFiLi8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=omPh6kk8G0GVYViVHlFBe2+e4TnHwHwH01S9b+4UzHEhihjTDOsi8VS4zeVxWL5OT
 0bgNRvPLdcZ6qbABTfhcYnkQChmOu9lFWl4ftn1ZbdNC510ucSF+cF/ZwmjZAYs9XW
 W7M/p0CsPZYQcfTz/d1zFvq2bjiH2GQylNxolZ8OM308g9kkG5U4qX9wG0x4A7ADJ2
 /m2w1ktHnXQgiIWgg6O9EjzXeByHzUosIHlG4RArKILh2lteYFITkCE5xWPUn6pPfg
 99FJa4CFSkNtvVNscL2xVaaBMfX3jwS/7Tc+2l7W/ggX5wYy/YtN/cjY11b6yYKubc
 B1E31PxxBr3+Q==
Date: Mon, 11 Jan 2021 13:01:10 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] docs: ALSA: Fix reference to mixart.rst
Message-ID: <20210111130110.72358aa9@lwn.net>
In-Reply-To: <20210101221942.1068388-1-j.neuschaefer@gmx.net>
References: <20210101221942.1068388-1-j.neuschaefer@gmx.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, linux-doc@vger.kernel.org
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

On Fri,  1 Jan 2021 23:19:42 +0100
Jonathan Neuschäfer <j.neuschaefer@gmx.net> wrote:

> MIXART.txt has been converted to ReST and renamed. Fix the reference
> in alsa-configuration.rst.
> 
> Fixes: 3d8e81862ce4 ("ALSA: doc: ReSTize MIXART.txt")
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/sound/alsa-configuration.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Takashi, I'm assuming you'll pick this one up; let me know if you'd rather
I took it.

Thanks,

jon
