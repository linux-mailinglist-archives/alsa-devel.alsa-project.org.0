Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5576475E2
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jun 2019 18:21:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C8911787;
	Sun, 16 Jun 2019 18:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C8911787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560702079;
	bh=M/BGO8jxEPFDVNo1Ww6StUBHDs+CzzA/MbNZ0IXm13A=;
	h=To:From:In-Reply-To:Date:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ikJ+Yo3XDQEuRKH9wjmEZLRDmZSjiECr/kUQCtq/MTo3l+QsYc65EE3jkKfRwEq73
	 6w+omcT7dsEudtHIgw1Xlp5ydYyiJyU/ABj7/THCMFkOBTAq/Ow9bBtMo7Gs3fouCC
	 LZGUIUyKeRHkeAooqc+eoS1WgDkeRL++prGrT8CE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B43AF896F4;
	Sun, 16 Jun 2019 18:19:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 082CAF896F4; Sun, 16 Jun 2019 18:19:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=HTML_MESSAGE,SPF_FAIL,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from p3plwbeout03-03.prod.phx3.secureserver.net
 (p3plsmtp03-03-2.prod.phx3.secureserver.net [72.167.218.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 541C9F896C7
 for <alsa-devel@alsa-project.org>; Sun, 16 Jun 2019 18:19:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 541C9F896C7
Received: from p3plgemwbe03-02.prod.phx3.secureserver.net ([72.167.218.130])
 by :WBEOUT: with SMTP
 id cXrqh4TjKIoaacXrqhWnWe; Sun, 16 Jun 2019 09:18:54 -0700
X-SID: cXrqh4TjKIoaa
Received: (qmail 156975 invoked by uid 99); 16 Jun 2019 16:18:54 -0000
MIME-Version: 1.0
To: "Jaroslav Kysela" <perex@perex.cz>, alsa-devel@alsa-project.org
From: "scott andrew franco" <samiam@moorecad.com>
In-Reply-To: <f016bbb5-d3bb-06ae-d2de-6597aefc851f@perex.cz>
Date: Sun, 16 Jun 2019 09:18:54 -0700
Message-Id: <20190616091854.6c61c97e98fe7bb02193b2d6dca4a85a.9759151e16.mailapi@email03.godaddy.com>
X-Originating-IP: 73.93.93.31
User-Agent: MailAPI 
X-Sender: samiam@moorecad.com
X-CMAE-Envelope: MS4wfAy/3bxwF1hJf/of7sLWxL+USKJKk0rfYdtvFBRz9sZEHV0N6d/kZGYmhFPiRKeHL8eQBTMmDjp7B5ymPAM+G8zSEuYKuIEupS+WkLTmUiaDwaJ27MJN
 VSpiRv+4WEAe9cKuPk7y8yq23wfuS67u9eUMfQ+LuH3s6qglaV1ByKEHOucyI/el7lrPFhONHvxurmD6h5Xy2D21MTqyv9+p0tJspZ/boXzUaf9FAi/5ubLY
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Thanks!
 
--------- Original Message --------- Subject: Re: [alsa-devel] Building the alsa library
From: "Jaroslav Kysela" <perex@perex.cz>
Date: 6/16/19 5:11 am
To: "scott andrew franco" <samiam@moorecad.com>, alsa-devel@alsa-project.org

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
 > However, linking with that produces (after adding back a few missing libs):
 > samiam@samiam-linux-pc:~/scratch$ ./hello
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
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
