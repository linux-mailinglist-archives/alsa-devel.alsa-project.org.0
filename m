Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD52A4D8E00
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:15:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E59C18E4;
	Mon, 14 Mar 2022 21:14:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E59C18E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288910;
	bh=O26k9wEMCa9SbIu5JzfSmC9aCZ9VxG21sjXh0uQhqhU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W0/o20xXgTl8Cy87vTK7LxYKyuwtObEKD0kuiSx6wZDOJKIh3g0/7Z1WAvlZ/A8GZ
	 JugyQefCzSbO2b7TH/Os+9Nc1tV6Ori9nKkh0JB/qjPWVTFQP1LIZdq6d+VAg9cksn
	 rXCw9xknN/upltnWe17sCGbrqn+7vUXE+xkM5YFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9CDBF80095;
	Mon, 14 Mar 2022 21:14:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56E5DF80224; Mon, 14 Mar 2022 21:14:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5340F8012C
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:13:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5340F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="NH/fSe+V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pMJTaScS4byrcx8FOghvfu/S1us65v7BrF2Jbfl4qTg=; b=NH/fSe+V6fhCP8oc91us13bAUZ
 egzjpYUV2TI7Pj2K0OvioWzc4btSc1Uhx0tsK4DWvigkUJpy/CbqJUS9Tnhk6IehO7dHtAXUH1xna
 /aMj3Gq88il5cb4yj8u7JVoGfqMH3xZOe/syBoWEjdha1Mr4TZHKXDN3gnpZlpMMEnGp5IxA+XYZr
 IEM1coren+qQvIgrVnL8931g7IlfJ/cgtpS3fYEkgxfV+YaJAuDG9Rg/L9YTUSOlHN+9LbSbWXXne
 eelF0Qt1Q2607RACjEFT25m0RRkqp9Mu6I8S7d7ZvKDCy9YI0DKOwuEzUxpPThqwn/A43Cjl1lgZS
 evub9vcw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTr4i-004N9Z-CO; Mon, 14 Mar 2022 20:13:52 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 56B59300325;
 Mon, 14 Mar 2022 21:13:50 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 13275203C7999; Mon, 14 Mar 2022 21:13:50 +0100 (CET)
Date: Mon, 14 Mar 2022 21:13:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 0/2] x86: Avoid CONFIG_X86_X32_ABI=y with llvm-objcopy
Message-ID: <Yi+h/h6xcTQBdQBY@hirez.programming.kicks-ass.net>
References: <20220314194842.3452-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314194842.3452-1-nathan@kernel.org>
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev,
 Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-fsdevel@vger.kernel.org
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

On Mon, Mar 14, 2022 at 12:48:40PM -0700, Nathan Chancellor wrote:
> This is based on -tip x86/core and I would like for both patches to go
> with the IBT changes so that there is no build breakage.
> 
> Masahiro Yamada (1):
>   x86: Remove toolchain check for X32 ABI capability
> 
> Nathan Chancellor (1):
>   x86/Kconfig: Do not allow CONFIG_X86_X32_ABI=y with llvm-objcopy
> 

Mucho gracias, I was indeed seeing a lot of that. I was also in the
process of rebasing that tree, so I'll stick these on top.
