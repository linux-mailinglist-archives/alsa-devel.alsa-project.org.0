Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E978A33A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 18:25:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0134B1675;
	Mon, 12 Aug 2019 18:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0134B1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565627132;
	bh=AwUUc4qV3sE290Lxf8uvCr6Eqfe6+ARSRBuzKkbSRHY=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qrDHVvubiARTPTNiUkaE176j+W+xI0nqD3Co6In5Hb9QkCz3Xeocw9SYyzX7Hdg49
	 wqtYb82HdBXdoWowPAh0xnVMgw+r7UbeLQ8CqRvI0HbwGCesehgdJd5F9YeF7bxYqv
	 iTVbc3R+QisWoBGXMHIbU+dzNInc+6mvy7QjElvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 212B3F800F6;
	Mon, 12 Aug 2019 18:23:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB550F80213; Mon, 12 Aug 2019 18:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E80B8F800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 18:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E80B8F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dP1gettt"
Received: by mail-lj1-x231.google.com with SMTP id x18so2398507ljh.1
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 09:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=nwrDfRymPNAmjGc9YeJBLPObrPmT6AmJ6N9ehpqjDZ4=;
 b=dP1getttQRVXhusNmc2mf1UwN8wxlcyE+NvYs9rrakxnZSRm44WHGhPtXykUdSiT7E
 g0172Ygwdr09w7GSnRbRCUzCc7Waqgn4SDR1YNLFGCZI+HXbFqT1vdMAmzcguSXB1mSn
 cT+PodUIgWOmXWZ/c0xO8iXkCYGpo1jdwTIPGXXHk3IMTaUYtfSB/mulrHn9qt0hmh0p
 XH8xnu1S942lVRfcfXZWWLxyXs52HyrLO6JdKca6s+dfy99lsR7xG6yNRewN9tkK+GyT
 yL6MvreKEkKpgyDsR0P/RWf1ftqIxRwt/a34hw1YqC+yNpx7twUE3sKVGejlMIvvZCgw
 mTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nwrDfRymPNAmjGc9YeJBLPObrPmT6AmJ6N9ehpqjDZ4=;
 b=mvWPvLP+AlC0Gg0mM2bftbFENaWzQjy4PbYL0K6VOh6IwfBDSYsa77lz/vOMjOAHk2
 6NaZIvl8594OvVRJhCONOGUjkLVTMdqVM/Dw0OKNDjaPiDP5o0TSsTGsAuCNhoCy9Wes
 vtkGMv92jWuTx8vBemhXC6oQw8r+Kaf0EX+pQ8tDocbIAerUgN//xOBN7B4NVs36nqmZ
 4hAYrUiJaYuaueAxovlZuYXqHm19LOht5gx0bnY9ZO182uyxWYFsbmKpPQptX4rVFDPm
 ioQRZwXzFuCcu407qucMARKSHPg00NREudS7a5pK3anenw7qOzx7pMco+G2zakgRWDJ/
 zwnw==
X-Gm-Message-State: APjAAAUvVD68aZnXuCLRl87h1pDtBU8Z2I3pcdyViWqL3ogLx18bFAL+
 hwXecgxnAxsXTJFLvt/MzM5VYf0TejusQf9HZLU+v9a3
X-Google-Smtp-Source: APXvYqwjtu4bjlILLHy5bnwZlyJZWm7kd5dgOmw634gjvLTB3u+bFqG6nhB+1Ybkq16VqtLoTk6sDvchwiH+sJk45qE=
X-Received: by 2002:a2e:8545:: with SMTP id u5mr5554578ljj.125.1565627020339; 
 Mon, 12 Aug 2019 09:23:40 -0700 (PDT)
MIME-Version: 1.0
From: Eric Desjardins <desjare@gmail.com>
Date: Mon, 12 Aug 2019 12:22:30 -0400
Message-ID: <CADsNRHvYVykXZ7C+DF14NACxFWYukUAe=aPZ_uo+=_YgBiQYSg@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] asound snd_pcm_start question
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

This is a simple question. I call:
snd_pcm_prepare
snd_pcm_writei

and it works fine but I would like to delay playback start. There is
snd_pcm_start for that. There is a method that is deprecated to specify a
start mode but I was wondering what was the correct new way to do that?

Thanks,
Eric
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
