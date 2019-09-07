Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D53FAC6E7
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Sep 2019 16:09:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E96F41658;
	Sat,  7 Sep 2019 16:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E96F41658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567865379;
	bh=qirscW/f8K1TiQp21aJ6b7EQFHEA9LaRNtMjJgY8/5A=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WYLTcZwFJd1mkket6qbW+BzC+O+1Fvj5QjS+P1Z5SjQh5pdXbHiWrRi3fwN9nlclj
	 W2/DrOvER6kVHvyzjc6Tbp5c7yYfE9EAMHT7VjdIomWmfeG0HHKA1WgKrPKaec33G+
	 /uQLAvwc0Kl7jpTIhW1MnA67hZFw4KCx+enzRxaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A89FF804A9;
	Sat,  7 Sep 2019 16:07:54 +0200 (CEST)
X-Original-To: Alsa-devel@alsa-project.org
Delivered-To: Alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92B24F80448; Sat,  7 Sep 2019 16:07:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DB81F80171
 for <Alsa-devel@alsa-project.org>; Sat,  7 Sep 2019 16:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DB81F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cn2pNxGQ"
Received: by mail-lj1-x233.google.com with SMTP id u14so8564827ljj.11
 for <Alsa-devel@alsa-project.org>; Sat, 07 Sep 2019 07:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=z7ONNnu5EJtCT0jGrlK26Uu8T1SytVjb9O7m/YrYiYA=;
 b=cn2pNxGQeYK1QadMcnIFA4Dd3eAueLTa/2UaYdv8LXglHx9aIVHazhQLIKpoH0ZfkC
 jeDykjqCMmawcacgJi2CUHPT+piWWY0xAF2P8sod2JuJNhGgyY8+PrLR5LRLMCV9/9me
 7W+3HKbsT3ckweOqODplakv9jf+8R4mJ6c+aPaRcYqlT1qpNhzKKB2WNXHYW4/LxftrP
 2VWdSsb6lpXsDbKYzyxsmeoDDsbLQW71E6UHyvzwwiZHJYxsztMOM/O1A6J6KrYzkvMx
 fN2mQ5WlYMKycVyzcbrCxzXDId7QAdfR5r6hpxL4td+XZbkaeFfRbXU9pbbJRA7JK+Ab
 1gfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=z7ONNnu5EJtCT0jGrlK26Uu8T1SytVjb9O7m/YrYiYA=;
 b=GH+lEnkUovrpM4aQWPHqeqvomyzuZsaoFSdADlbFVALVyXgfcn7TEJAtCC+v284/4b
 1gv+coBKzYq+8MR2ZMDLvEYrZTfCpYomwVhK3qUHzep5F3ZWoui42DXSMXaYINqoy9iC
 MnR8aRizk4PmcNLCYb4g3Z9B/U81lVTcV89O4RQB+ZwA539GOuWnW2Szq6ZcbGKm2o8G
 lZ/EMA8M6sPqBei7J0jrIzE/srWrL7Z91YJhiQh6pqFlfvjpuRemALVop55ldeNJVFZV
 bzokNr47k0xHPUSK3lSB6cWerTEshiAOKLR7rpquADrzTIYcQmEm/scRvexgFzCiU3r8
 grGg==
X-Gm-Message-State: APjAAAVTMmj2bQOVx/ioSipYHJVCrP/u8BJrYhoA6qo57s4cFOrQ3Ghi
 f6kA15kBW0vhRhSvzKtPL8NVCMY2fiip/BcHODJx9g==
X-Google-Smtp-Source: APXvYqy9XSNJsLdBUmkYh8MnSHcjN7QTI3Xzoiw//rOVlJ7r5K6/mnvh9hsQZM2xe6OLBXFC2Xf/7l46ffy1/6Jo9l0=
X-Received: by 2002:a2e:5d98:: with SMTP id v24mr9495952lje.56.1567865267226; 
 Sat, 07 Sep 2019 07:07:47 -0700 (PDT)
MIME-Version: 1.0
From: Eric Desjardins <desjare@gmail.com>
Date: Sat, 7 Sep 2019 10:07:36 -0400
Message-ID: <CADsNRHsGeM3bMv3Xh++QbZXeR1PBr30VkzoweyCqMKeAguXRUg@mail.gmail.com>
To: Alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] 5.1 to stereo using libasound
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

Hi,

I am playing a mkv with 5.1 channels from a mkv. I configure libasound for
6 channels and I feed them interleave audio using snd_pcm_writei. I use the
default pulse audio device.

So far, nothing is wrong. However, I do not ear things correctly. I listen
this on my stereo speaker. There is no mixdown to stereo and I was
wondering how to do that. I tried to use chmap api but anything I try on
the default device returns an error.

I was wondering what was the correct way to do that?
Using the mixing api?
How do we detect that my device output stereo if chmap doesn't work?

I am on a ubuntu 18.04 linux box.

Thanks,
Eric
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
