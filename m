Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FA4B586
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Apr 2019 09:36:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C3DC884;
	Sun, 28 Apr 2019 09:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C3DC884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556436968;
	bh=TjaagqHqYjZmylpo5lFaZa/KGdmnVwjTBcvcsc5IZVQ=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q6Usn/9u+MGBS1vDfB/OsWMRqv6xo0DvK4So0/iixBqCCu19k2Ua2MGoN5gHxSdCf
	 oCVarP6Fzx+AiefOHHOlHuPF3BbpCiZisBUFG52RdMhyqBtnCu/cJeZiU31S3gyxA0
	 yFA5VcCTG5kMd5nytZWA89BPvZ3Yo9zTecBnVBAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98911F89737;
	Sun, 28 Apr 2019 09:30:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63450F896DB; Sat, 27 Apr 2019 17:30:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 850D3F80CAB
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 17:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 850D3F80CAB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=lynges-net.20150623.gappssmtp.com
 header.i=@lynges-net.20150623.gappssmtp.com header.b="J+4lEGtf"
Received: by mail-it1-x144.google.com with SMTP id e13so10296830itk.4
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 08:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lynges-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=PbQ8rYCeP+Ktp4hnZV4Azwco19QlKjc52nJkjZ4YhaY=;
 b=J+4lEGtf0xrGKm5SICR48vFYx9N0aVl3PHpgMWIWiOqNAaQ7Xp0US5nXQykgdWywPf
 kQv6HWV9x7nmhdhMhFZ/0ALxfJ8mAttQzLUPubDLLYkDHJnhd29kS5Vi9TviNix37I2d
 8kXXDC5ywqL581XL8u9sAplSYfMAto0/0BvuLODve6ampM+VRxW/9LBg7FQvHnsIW5Gr
 9jiCgRrbvnVRWXEDpsNrSj7YQHXX7BkH02fNlo16ZHLZwT8KxSTuYtJS5vvYHl9oUI0X
 GedKNTav0ooiax9x7Q8gRpB+qMUI8wLeEy2Gq7lPXxJUttUY6RSBmsiWRDhg2xlrd6kX
 AoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PbQ8rYCeP+Ktp4hnZV4Azwco19QlKjc52nJkjZ4YhaY=;
 b=UdD+H/3fxQ1V9gBnnb2guKtYoLznm43R0Z0Aa83WNLMVTc5W1Bln7M6Vp0JJEreNlc
 1rDf0/URP22SVGR11u7EbfYUjwLUtdenpWvx5ZJsZtCcgGdyarHhGwShWXK059J00lJI
 3duj0oHy2gyyoUIlZNE7QW7wmyLAmRA2OnTFLHiETURdSuFrudoF4AF5/imNAMipBkJx
 USjIxBkz9dx1MAcm9kj9IGdXhC8Ea9wTM5mKP0tyZwn6l+Mz6N29rpRUv7qgLatJJiPu
 i8ky9yAWxS1DKoOUw/wrWNPCRypxRMX2lDr7O+j05uK0iWsDmmN38410cU4wrT3n1ZYn
 6MJw==
X-Gm-Message-State: APjAAAUNXJMHp6zgo+4Z6OLduLrxDF/o7gOPmo1cpEMpVzOzgq3D/b9X
 Vpkip/4F6UIIwroyKtI9rGsDc6DyCubbc057Z3Oy50Pr9cI=
X-Google-Smtp-Source: APXvYqwd93Qzj8TS/jaO9uE+NjSR04oIDjz9ADKGOmJ2Wqee97a5fdOGLNQlhUAgiOpbHjdfxMIat+pFWPVTBDT0qu0=
X-Received: by 2002:a24:7893:: with SMTP id
 p141mr11942842itc.166.1556379003633; 
 Sat, 27 Apr 2019 08:30:03 -0700 (PDT)
MIME-Version: 1.0
From: Mathias Nielsen <lynge@lynges.net>
Date: Sat, 27 Apr 2019 17:29:53 +0200
Message-ID: <CAJjsnGEZ_MeAMtZJqzmgfDmeY+WqzWaz_US31Nhqx7EzU-jpGQ@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Sun, 28 Apr 2019 09:30:26 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] Help with cross compilation of alsa-lib.
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

Hi. I have made a small Go app (https://github.com/Lynges/susimup). It is a
simple music player for the console and one of the libraries I use has alsa
as a dependency on linux. I would really like to have cross compilation
working so that I might provide binaries for the various platforms.

I have tried getting it working using xgo (https://github.com/karalabe/xgo)
and it solves the problem for both windows and macos, but on linux I have
to get alsa-lib injected and compiled.

I have created an SO question with some more details here: (
https://stackoverflow.com/questions/55656194/xgo-cross-compile-not-working-for-alsa-lib
)

I realize that I am asking no small thing unless someone on this list is
very familiar with both xgo and alsa, but I could really use some help
getting this working and I have spent quite a lot of time searching for
other solutions and found nothing so I guess it would be helpful to others
as well as my self.

I do not have a whole lot of experience getting cross compilation for C
working and the fact that the process is somewhat obscured by xgo does not
make it any easier. One thing I have not tried yet is just forking xgo and
using a different version of their docker image that then has the alsa
packages installed with multiarch, but I have no idea how to make that work
or if it even could work.

Any more information I can provide, please dont hold back.

-- 
Best regards

Mathias Nielsen
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
