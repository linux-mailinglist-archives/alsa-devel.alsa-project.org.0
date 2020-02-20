Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C50D8165CBF
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 12:26:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADA4F16A3;
	Thu, 20 Feb 2020 12:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADA4F16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582197975;
	bh=EuvV5bK/D2GyFMuoOvIrzBlledsmeDArdQZV/I4d9XE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zts9b2mAT7Kzio9w7lbMoebwde47yo8Tb53aunEmpRR8fOvVDHMJgqxq1ezIyaorR
	 sLov8VRoi3PT4tQreT8sz3WT7VUHgj7nhCC6zX9BJaUq+KGL0myuE7tjrfr1CowP5R
	 GS8NrTCeGcovC/RIn8Zk7WwRtUM1q/GgMI7a0YmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B87BFF8014A;
	Thu, 20 Feb 2020 12:24:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50E5EF80148; Thu, 20 Feb 2020 12:24:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B02DBF80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 12:24:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B02DBF80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=superlative.org header.i=@superlative.org
 header.b="ckVQr/Gm"
Received: by mail-wm1-x344.google.com with SMTP id a6so1627924wme.2
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 03:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=superlative.org; s=google;
 h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/nR/8S2uaSFBekc5otIILZjPc7HoKij8yl6sQpf3OA4=;
 b=ckVQr/GmxB6FN4LxrbxK4792ISfIocutEILWSD24wui/BmD5NOw0DEOY19+zYF7HJs
 EOnDHvW/jl/aQC/xDn0u5dSaRQhP+/24GhqZEdh2/Ucw3WIT59D3lomkEN6Mr95kORpz
 lalaVHD0XaGxk7Po8KiCHN1RtVrz37Xw/eaa3v+TTYHHk4CgNPAk2s5zwItGhlaqPlB+
 bR2bdCcmkcYWgL4awedp1guP4MEQ0S5Q5ihFKBRoCDNuwoE7BRgm6VVZ/vFerxZl3Nry
 WIX6Q427hqfb6UKfcwzFizhUwGm+/IbrL+0TYP26EOfSx0pp+YiKxzrTFHroqKuu7U5T
 ZUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:user-agent
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/nR/8S2uaSFBekc5otIILZjPc7HoKij8yl6sQpf3OA4=;
 b=M4H7+nd7ZSu1EnM518NR7mtP9zyygpZFk+YOJrAiKJJ9LuWjvM3KYBQNxlz6kUYzCn
 2wN+mxE59rCSN+eHGXZAuPQzq7b+QWoatmHM46UeJASjpSBJnbHgUTx2rLLWdD6OJJpa
 czrs5NyM3qxMjKDQf9nYpQN1CRsrz9+TtryPCDle/JLxZCG5sUw8J8TYIkJ+8YL3HM9u
 NL9teF/G8JbIr8pID3JblDpiPRECOujSDCczDFBN+ZRbC2pQR7MiMwwxUfNbOggESE6Z
 w6odGm/N7PQnqTMDwjzii4MCIAPuNXButtXXF3nehuDWgYUIYkY5I6hPhnP2A59yqe7F
 BPZA==
X-Gm-Message-State: APjAAAW2f+Ec+kjB7M5qs5s4WZ4jJi8KJjowTXj/hGvJuYzTBfWeADcY
 E1NVJbJ/R3HfNQihpTWZWrGttJo9aSc=
X-Google-Smtp-Source: APXvYqwKGh/4BboO3+y8eFROO+W6/4EQi3JkdMaqAj0dml4FX2hvqfIhYzZCGAG9i9jkQ86TMvyqdQ==
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr3820358wmj.57.1582197868487;
 Thu, 20 Feb 2020 03:24:28 -0800 (PST)
Received: from kamdesktop.localnet ([2001:8b0:be0a:29af::201])
 by smtp.gmail.com with ESMTPSA id 25sm4206194wmi.32.2020.02.20.03.24.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Feb 2020 03:24:27 -0800 (PST)
From: "Keith A. Milner" <maillist@superlative.org>
To: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Implicit feedback solution for Boss GT-1 and maybe
 other devices
Date: Thu, 20 Feb 2020 11:24:27 +0000
Message-ID: <2821406.4gBEzi3Dfb@kamdesktop>
User-Agent: KMail/5.2.3 (Linux/4.15.0-74-generic; KDE/5.36.0; x86_64; ; )
In-Reply-To: <CAHXb3bcrSnAnwS+-HY8jh4eoBdt+tBoZTHSr-5jsGomN156fFw@mail.gmail.com>
References: <CAHXb3bcrSnAnwS+-HY8jh4eoBdt+tBoZTHSr-5jsGomN156fFw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Mike Oliphant <oliphant@nostatic.org>
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

On Thursday, 23 January 2020 10:06:58 GMT Mike Oliphant wrote:
> I received a very helpful email response to my previous thread about trying
> to get the Boss GT-1 pedalboard working reliably, and as a result I now
> have a working solution.
> 
> The issue seems to be that the GT-1 does not send any capture data until it
> gets some playback data first.

Hi Mike,

In my original investigations (which you referenced) this was the conclusion I 
was starting to reach, but real-world events meant I didn't have the time to 
follow up on it, so I'm grateful that you have.

In the kernel.org bugzilla report you also mention that you have a potential 
fix. I would be willing to test this, subject to time constraints (in other 
words it may or may not take me some time to get around to testing this).

Feel free to contact me directly to send me a patch (best email address is 
user kamilner on the same domain used to send this email).

For reference, I have a GT-1, a GT-001, and a 1st gen Katana I can test with.

Regards,

Keith


