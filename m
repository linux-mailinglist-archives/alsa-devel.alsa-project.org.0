Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C7F47470
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jun 2019 14:13:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98B8517F2;
	Sun, 16 Jun 2019 14:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98B8517F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560687235;
	bh=YlU2bbpr4q1jo14Ga3bCcOZw63s5KnxC0S/9t29EFf4=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K3YQHdDLtjOosCVLfYWkLpXjZLn1sL47u7MJbifyU8uURMP27hWNrjdrIi9CL0z1N
	 8YMHDAtaDg2oRj5WdmtUwu3UUx4vkMbKLFk9igw1mIsBEAO4rbN82COMyNYlZZMnMS
	 fNIj+eictit2uAsY0UmbDcp4N0qVG2I3qv6LcB5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AB41F896F4;
	Sun, 16 Jun 2019 14:12:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CBC3F896F4; Sun, 16 Jun 2019 14:11:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04898F896C7
 for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2019 14:11:40 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id EBAC5A003F;
 Sun, 16 Jun 2019 14:11:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz EBAC5A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1560687100; bh=Xd6eYWk42HPqdYfPjkOaauz2zbNhmdEQSItGyx56A/Q=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=GB2BXnpQt5xZjIGjH87orLvloOiCr+U/gFaI4N2ZkqKCiRsE4YujCVqqWkWIV6/eb
 kaYVGGNAY0dVJWRUp9otreeICMDl5c/g84s07Ol2kfn1JGGF3cYVPJ5j3fKDgdeyTQ
 4f3xh6AzKXB1YmSxIIZIeadweJQi0o6fPf+5yXm0=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 16 Jun 2019 14:11:37 +0200 (CEST)
To: scott andrew franco <samiam@moorecad.com>, alsa-devel@alsa-project.org
References: <20190615134103.6c61c97e98fe7bb02193b2d6dca4a85a.50a60f16a4.mailapi@email03.godaddy.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <f016bbb5-d3bb-06ae-d2de-6597aefc851f@perex.cz>
Date: Sun, 16 Jun 2019 14:11:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190615134103.6c61c97e98fe7bb02193b2d6dca4a85a.50a60f16a4.mailapi@email03.godaddy.com>
Content-Language: en-US
Subject: Re: [alsa-devel] Building the alsa library
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

Dne 15. 06. 19 v 22:41 scott andrew franco napsal(a):
> Hi,
>  
> I have been trying to solve a difficult issue using the ALSA library. To solve it, I need to be able to
> debug into the ALSA library.
>  
> I tried to build it from the sources, from the alsa-lib-1.1.9 library source to be specific.
>  
> Problems:
>  
> Using the build procedure in the INSTALL file, it appeared to build but I could not find a libasound.so file
> anywhere.
>  
> I also tried the recommended procedure for static linking, also from the INSTALL file. That gives a 
> ./src/.libs/libasound.a file (indeed, this gets generated on a dynamic link as well, which I don't understand).
>  However, linking with that produces (after adding back a few missing libs):
>  samiam@samiam-linux-pc:~/scratch$ ./hello
> This is a test program
> ALSA lib conf.c:3558:(snd_config_hooks_call) Cannot open shared library libasound_module_conf_pulse.so (/usr/lib/alsa-lib/libasound_module_conf_pulse.so: libasound_module_conf_pulse.so: cannot open shared object file: No such file or directory)

Your config files (perhaps from the distribution?) refer to the ALSA pulse
plugin which is in the alsa-plugins package. Fix the configuration files or
compile alsa-plugins, too.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
