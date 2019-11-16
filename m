Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7E5FEC7B
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Nov 2019 14:41:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A48E1692;
	Sat, 16 Nov 2019 14:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A48E1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573911691;
	bh=riaYIjTz+x5Pj69i5OQsInmn2ZSHs4KYnWJfOY1v8UI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n6NxC+HcXk7SbsjzAeEW7orpgtJtdYBIUXA8DsbqTsEeXPXW0BijQwgPv24sgy7gy
	 eVoLeMF+kjz+YtRTd+NKdBkQ5TdE2TKzOpP0dW4IRU01PcMkdORkU10QC/5LqhE9uv
	 K6dBX25dzmW7TimCIiVdk3VABP1/KiT6GKhZAUlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7A41F8010A;
	Sat, 16 Nov 2019 14:39:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0F09F80101; Sat, 16 Nov 2019 14:39:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42638F80082
 for <alsa-devel@alsa-project.org>; Sat, 16 Nov 2019 14:39:41 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 46349A0042;
 Sat, 16 Nov 2019 14:39:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 46349A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1573911581; bh=K1k70lbegR5gXXlkJOxDqXylUUOS3xdfXqfWypp1O78=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mzBd4wef/dRV1GUCA0VQTDb2dVelKJFjVParUHoFY1BHVsgW9uz+6jwlAZo0JjBhz
 wq93W0NrwvX59pLChCyQSJ2TvaoQyEddp5zpXYUKAgdSRsmuXMGVaEgqS82YLMvB1u
 sbTMobPpIO9HXFUqYlKtQxuyvr8kH+qW2hfOFfBU=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sat, 16 Nov 2019 14:39:38 +0100 (CET)
To: Lars Wendler <polynomial-c@gentoo.org>, alsa-devel@alsa-project.org
References: <20191116142440.2b4e8e12@abudhabi.paradoxon.rec>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <48906630-65c7-c0de-6b93-322153cc0968@perex.cz>
Date: Sat, 16 Nov 2019 14:39:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191116142440.2b4e8e12@abudhabi.paradoxon.rec>
Content-Language: en-US
Cc: alsa-bugs@gentoo.org
Subject: Re: [alsa-devel] compression format of alsa-ucm-conf and
 alsa-topology-conf tarballs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 16. 11. 19 v 14:25 Lars Wendler napsal(a):
> Hello lists,
> 
> some shell output says more than any explanation:
> 
> 
> lars@abudhabi:~/temp/alsa> wget -q
> https://www.alsa-project.org/files/pub/lib/alsa-topology-conf-1.2.1.tar.bz2
> lars@abudhabi:~/temp/alsa> wget -q
> https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.1.tar.bz2
> lars@abudhabi:~/temp/alsa> tar -xjf alsa-topology-conf-1.2.1.tar.bz2
> bzip2: (stdin) is not a bzip2 file.
> tar: Child returned status 2 tar: Error is not recoverable: exiting now
> lars@abudhabi:~/temp/alsa(2)> tar -xjf alsa-ucm-conf-1.2.1.tar.bz2
> bzip2: (stdin) is not a bzip2 file.
> tar: Child returned status 2
> tar: Error is not recoverable: exiting now
> lars@abudhabi:~/temp/alsa(2)> file alsa-topology-conf-1.2.1.tar.bz2
> alsa-topology-conf-1.2.1.tar.bz2: XZ compressed data
> lars@abudhabi:~/temp/alsa> file alsa-ucm-conf-1.2.1.tar.bz2
> alsa-ucm-conf-1.2.1.tar.bz2: XZ compressed data
> lars@abudhabi:~/temp/alsa>
> 
> Please rename the tarballs if possible.

Oops, it was a mistake. The tar balls are repacked. Thanks for your notice.

				Jaroslav


> 
> Please CC me on replies. I'm not subscribed.
> 
> Kind regards
> Lars
> 
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
