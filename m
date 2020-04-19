Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9298B1AF8FC
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Apr 2020 11:34:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16D501676;
	Sun, 19 Apr 2020 11:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16D501676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587288846;
	bh=p+nyrb32miHrtar0uo3mVZENxSGCMWhUb5Ijn+b2r+I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mCYGT1GuJ2YsddzqVT8Ii3k0XZoYLIDeRVWTq1juYJUK4uAaviO/HrH68IK0vsZbm
	 upCGdzYe5jvnY8qrR2n+npn8dRZlOBjOM8RWlxshZprKdLH+ZKtuypxM/KdlU7Y0hY
	 w8fygIoL5o5A3/1Avl+5wp5tvXreO7jEm+5Ir1ZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36416F800E7;
	Sun, 19 Apr 2020 11:32:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB810F801EC; Sun, 19 Apr 2020 11:32:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAFD9F800E7
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 11:32:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAFD9F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com
 header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="NH0bulwr"
Received: by mail-lj1-x243.google.com with SMTP id l19so4088620lje.10
 for <alsa-devel@alsa-project.org>; Sun, 19 Apr 2020 02:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/v/9MZ85W5Ot6ZouiFIXv368NZt8k8Og0OLJDhh34+s=;
 b=NH0bulwrsnvt31tchVdyynbpbLgVBI1HP3Wa6GOh5EZ3Avqvjt8Ws1W0S4skKIE0JE
 uuFvwHnFs3oUQXVFI6Uw/i025gYebahgui03U0O2zWDkm//77OlUL2W1AKMBSb9Ajkej
 pH7FGvf7PIw3hRxqcpxFEFxOgYR/zkwsdko5P7TmbImGk2kTGiNw6chaFyxITHjQVqFY
 uRAVMZmeGktYjCkJxVm65ElzX8WYSVJ2k7Gs01avu1wVrvwPeK6V94oh93DTqReUmhv8
 6bEZuutMc2hlHCS5Rb8vzRuhQ8/sT8T6SFBRcGie5PJZH40vg8BxIcQxKKnbEzWKi12i
 ZLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/v/9MZ85W5Ot6ZouiFIXv368NZt8k8Og0OLJDhh34+s=;
 b=EXA+mJWXK3luMi9Kwlvi/nhDOQ11AtOjcgPJZFJ/fc+kUjWDRRMEitKuzeZtmfhLhw
 Q/eqBTOcIUc5zXEVZKRFGw/BGzdoyE0KPxywVT6w0NhcMM0Yv6jmwXvfhuJi8ezrGmYL
 sogBOsotFndUe9R87E4UJS9fSE+l/BkfOP73Kg79fHToJ6KoI4KJC8tcXeu29+9egNoF
 UQWrdWVIyzVkztPEZeaVMDpCAbET+NYj0mbhNBmVDbKhSOV527K8C2nHDP2tHuJ+Fr1Q
 myPxpBT0O8kA8BnMvrRZ4PcfPvjQepC4Dm/tokmuA16Z5DEQkMmhEzJRjsTrstYL/K8+
 odRg==
X-Gm-Message-State: AGi0PuZk6w3oP39nsLyDzf+4gLX6pcH8vCauWoi+MDKMaO2qJJwIGkgZ
 ZP7F2ChwaXzgYG1v/BHjLbMuGQ==
X-Google-Smtp-Source: APiQypJtvjJEzhQ3IHjsR97nXY/X5+Mcqe2YVVnhcTkS4j8mOhshGgkVFOM17f0YxUmtnPiWj9nvZA==
X-Received: by 2002:a2e:4942:: with SMTP id b2mr7168793ljd.135.1587288733899; 
 Sun, 19 Apr 2020 02:32:13 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:2a7:ba19:e1ca:ac28:cceb:53f3?
 ([2a00:1fa0:2a7:ba19:e1ca:ac28:cceb:53f3])
 by smtp.gmail.com with ESMTPSA id 64sm20404911ljj.41.2020.04.19.02.32.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Apr 2020 02:32:13 -0700 (PDT)
Subject: Re: [PATCH 6/9] nfsd: fix empty-body warning in nfs4state.c
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20200418184111.13401-1-rdunlap@infradead.org>
 <20200418184111.13401-7-rdunlap@infradead.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <34fe524d-f9f0-ba8a-d5cb-ffbeacf1b5d8@cogentembedded.com>
Date: Sun, 19 Apr 2020 12:32:08 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200418184111.13401-7-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Zzy Wysm <zzy@zzywysm.com>, "J. Bruce Fields" <bfields@fieldses.org>,
 target-devel@vger.kernel.org, Dave Jiang <dave.jiang@intel.com>,
 linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
 Vishal Verma <vishal.l.verma@intel.com>, linux-input@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Chuck Lever <chuck.lever@oracle.com>,
 linux-fsdevel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

Hello!

On 18.04.2020 21:41, Randy Dunlap wrote:

> Fix gcc empty-body warning when -Wextra is used:
> 
> ../fs/nfsd/nfs4state.c:3898:3: warning: suggest braces around empty body in an ‘else’ statement [-Wempty-body]
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: "J. Bruce Fields" <bfields@fieldses.org>
> Cc: Chuck Lever <chuck.lever@oracle.com>
> Cc: linux-nfs@vger.kernel.org
> ---
>   fs/nfsd/nfs4state.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> --- linux-next-20200417.orig/fs/nfsd/nfs4state.c
> +++ linux-next-20200417/fs/nfsd/nfs4state.c
[...]
> @@ -3895,7 +3896,7 @@ nfsd4_setclientid(struct svc_rqst *rqstp
>   		copy_clid(new, conf);
>   		gen_confirm(new, nn);
>   	} else /* case 4 (new client) or cases 2, 3 (client reboot): */
> -		;
> +		do_empty();

    In this case explicit {} would probably have been better, as described in 
Documentation/process/coding-style.rst, clause (3).

MBR, Sergei
