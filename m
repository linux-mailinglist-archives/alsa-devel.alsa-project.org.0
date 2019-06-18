Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE4F4A66F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 18:16:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40B8516D6;
	Tue, 18 Jun 2019 18:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40B8516D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560874606;
	bh=XqxAb4kO7h7sZ2BNo8kUAgx+X423PNVzhqGKLs7AUSI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UDxZUeWR+1Y3jyy0mVOeyXgsKyE2oMOeKe87SMWtZHbT9fL3dcyxuic1kfEkc4fmz
	 /+NflOA2z/1KWA4UtKgHqlTXECfaiWqwz7fZ70dycjT5FyC1vG4D4Ak7NSNzuOhuy8
	 y9i/nSS7jm6K1LdBit1ptfuqZFrRqhA8KOFucBGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63571F8971C;
	Tue, 18 Jun 2019 18:15:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C95C3F896F4; Tue, 18 Jun 2019 18:14:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=HTML_MESSAGE,SPF_FAIL,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from p3plwbeout03-05.prod.phx3.secureserver.net
 (p3plsmtp03-05-2.prod.phx3.secureserver.net [72.167.218.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 320E8F80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 18:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 320E8F80CC4
Received: from p3plgemwbe03-05.prod.phx3.secureserver.net ([72.167.218.133])
 by :WBEOUT: with SMTP
 id dGkah85GDNk5idGkahzcVY; Tue, 18 Jun 2019 09:14:24 -0700
X-SID: dGkah85GDNk5i
Received: (qmail 183858 invoked by uid 99); 18 Jun 2019 16:14:24 -0000
MIME-Version: 1.0
To: alsa-devel@alsa-project.org
From: "scott andrew franco" <samiam@moorecad.com>
Date: Tue, 18 Jun 2019 09:14:24 -0700
Message-Id: <20190618091424.6c61c97e98fe7bb02193b2d6dca4a85a.2b4174f59f.mailapi@email03.godaddy.com>
X-Originating-IP: 73.93.93.31
User-Agent: MailAPI 
X-Sender: samiam@moorecad.com
X-CMAE-Envelope: MS4wfCd+KlJ+z9Xq8+2rLXKvHyHndCFMpguy8HYCK7yHgjafmy4wN8CG5jogqTHz6vMBPxxJzhYoUBCK4sGwBFmOzyBgMaq4Ib7nnMYWQybksGr3DqBmqius
 FvbuVYMqVx/7iPuZfGpRwIkFHYQ7T5OQEE+X4fTBcjRMcYhj0kdvRgTau+xZMbXPOQRE2TxBWQTSi7xLBhLXP88gFPnbPq0sZxCM+BIwd1IX7GZ6JbyUuF21
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Issues with tip alsa-lib (stable, 1.1.9)
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

A roundup of my current issues with the alsa-lib repository:
 
1. No apparent .so (dynamic link) file output.
 
The configure and make instructions were followed, and no apparent .so
resulted:
 
samiam@samiam-home-pc:~/projects/alsa/alsa-lib-1.1.9$ find . -name *.so
samiam@samiam-home-pc:~/projects/alsa/alsa-lib-1.1.9$ find . -name *.a
./src/timer/.libs/libtimer.a
./src/rawmidi/.libs/librawmidi.a
./src/ucm/.libs/libucm.a
./src/topology/.libs/libtopology.a
./src/.libs/libasound.a
./src/hwdep/.libs/libhwdep.a
./src/seq/.libs/libseq.a
./src/mixer/.libs/libmixer.a
./src/control/.libs/libcontrol.a
./src/pcm/.libs/libpcm.a
samiam@samiam-home-pc:~/projects/alsa/alsa-lib-1.1.9$
 This has made it difficult to debug issues with the library.
 Using the configure flags does not seem to have an effect on this, IE:
 ./configure --enable-shared=yes --enable-static=no
 Linux distributions have libasound.so files in them, so clearly it was
 possible at some time in the past.
  
 2. Build instructions are conflicting.
 ./configure
 make
 Does work on this version. This is the standard GNU build method, and I 
 have seen these build instructions around the internet for building alsa.
 The INSTALL file recommends:
 ./gitcompile
 Which also (appears) to work, but no reason appears for why this special
 file is needed or what it does that is different. I can't get a .so (dynamic library
 from the build, so I can't check the function of the resulting build.
 Is there a reason the instructions from ./gitcompile cannot be merged back
 into the make?
  
 3. make install brings the system down.
 Executing:
 make install
 Brought my ubuntu 18.04 sound system down. I had to reinstall Ubuntu to get
 it to work again.
  
 In summary, ALSA is not a development project anymore. It is the "official sound
 system of Linux" and is part of the kernel. There is a lot of activity on the ALSA
 list. Cannot some effort be put into professionalizing the repository?
  
 Thank you for your attention,
 Scott A. Franco
 San Jose, CA
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
