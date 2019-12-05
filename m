Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAEC113D9A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Dec 2019 10:13:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FD8A1671;
	Thu,  5 Dec 2019 10:12:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FD8A1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575537203;
	bh=LKeYZlsQ1/lRx8jl79yW89eo5lHu3kstrAQsPwIcfIE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lr/aBoL1WvTxZF6fDtx2eyqAkM8a7J3w6MDTSUx1MOj7DcNeiymyi0wqtX+zQV4ML
	 zhYT4bsmH3uc6YSf80i6CSeOWgyzIGK8P7OPV8CuUOFACW5tCX9efcpGixy++KTAF2
	 nrm3M9cTg33weA4RBUqCkONJf048WaTBE1mxH+LU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 966A7F80228;
	Thu,  5 Dec 2019 10:11:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDF88F801F8; Thu,  5 Dec 2019 10:11:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CB91F800F6
 for <alsa-devel@alsa-project.org>; Thu,  5 Dec 2019 10:11:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CB91F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RtrDRpE+"
Received: from localhost (unknown [122.167.100.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 702962464D;
 Thu,  5 Dec 2019 09:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575537093;
 bh=6vhc9UI8EPEtwe90QUvwgSdEyVpCq6mGOXhMWX8Kc5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RtrDRpE++QL4PHpCk+cVcRrOZ5ExUbrue23b2Hv+/Kjr/NgFtcvpSWuXfdO2kray+
 XwJuxrM+u4JcNOp8ISyOJUohX6R4kYnPpavITLxXqC3J6kyDcM7aU3/uTjJQrCuBiu
 /ixtcengwiA458cc0ZPwm4SvsWp5cPlK/r4idYdA=
Date: Thu, 5 Dec 2019 14:41:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20191205091127.GG82508@vkoul-mobl>
References: <20191119112625.GD82508@vkoul-mobl>
 <20191119124302.GE82508@vkoul-mobl>
 <85e86218-6766-82a9-059c-c4a169178c26@perex.cz>
 <20191203101203.GZ82508@vkoul-mobl>
 <89f264dd-e020-4d75-b6ac-e98893923e0a@perex.cz>
 <20191203110427.GA82508@vkoul-mobl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203110427.GA82508@vkoul-mobl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [ANNOUNCE] fcplay: compressed audio test utility
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

On 03-12-19, 16:34, Vinod Koul wrote:
> On 03-12-19, 11:23, Jaroslav Kysela wrote:
Hi Jaraslav,

> > I mean that you can add a new tool to tinycompress with the LGPL-only
> > licence. It depends on the packager/user if he/she accepts it. So, dual
> > BSD/LGPL licence by default and LGPL-only to fcplay. You may place this tool
> > to src/utils-lgpl directory or so.
> 
> Okay that sounds great to me. Let me try doing that instead!

I have added this to tinycompress and made it enable only if people
configure with --enable-fcplay flag.

Thanks
-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
