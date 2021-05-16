Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80252381E78
	for <lists+alsa-devel@lfdr.de>; Sun, 16 May 2021 13:25:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05D4A169E;
	Sun, 16 May 2021 13:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05D4A169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621164306;
	bh=NsPuNqiIpFn+lUD7/3ywYIC/1HKhx1a5pdpTi0pb6EQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H3a9IBmDiDg0YsiwHRb9TppfObEyrPwkD+sj9XYuQ/il5FpLoNn0iqDaLpjNNpkej
	 yOlYAIMJJnYY3Q5jzM3sTgx7ZWst8fkQKgfgdUgsapIPz++mYF6HimfvWgxabdS1a7
	 zFMniF2jAPe3y2FZ1CpUeSOcYlkJp+DyvKX0Qguk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 770E7F8016E;
	Sun, 16 May 2021 13:23:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A2ABF80217; Sun, 16 May 2021 13:23:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58E2AF8016E
 for <alsa-devel@alsa-project.org>; Sun, 16 May 2021 13:23:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58E2AF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="DXnVL0pk"
Received: by mail-pf1-x433.google.com with SMTP id g18so1412962pfr.2
 for <alsa-devel@alsa-project.org>; Sun, 16 May 2021 04:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lJG0zQvDeXMVv53Ck1aIxdEZ/keO24SJzKO0xIhMZeE=;
 b=DXnVL0pkjr1uBBJuNdlGYAMQdS05d4l6kYyV8u5Hx0ooeevWDgkeiKeQt3pSAGIvdt
 UIO2PQF4t4LhFGgyH/tW+sHN5I1iJv1VKtbw5wSOz8WjF1nDAzW0mkGCE6iBZBB2U11O
 YklXXQMHpnh+vcEhmmG8fLKpV6gy4EA9xxFHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lJG0zQvDeXMVv53Ck1aIxdEZ/keO24SJzKO0xIhMZeE=;
 b=cxNfE9N8Rrq8w8feZPArZHn0fFjp5y6/ocuy5FH1PTBx2fn/5FieRZAwhHP8XBo2h/
 yXkcP6fbTrb4YxJMd2ss2JWNSxQQizvChDi43M3wIPs39VvrmjDiPE5Bk7TObW1mco6k
 u2An8jcYkjWkgXvH6lT0Y2mHcxq0tLSRUWb+7Cf3kLiCqdmL8e5CjgXFyf4UDzT8LCIE
 cEJHfu0tVyvQTuO9k0rzmdD4mAisLv/xfcXOHJHZnhlBB99v3Iy5+WpJcJLibHBZ9TzC
 32Qx593Ydw5UrjV6Ce4Q5w8ZRKtjd7PXONbWPLqFJViPJ3Nu/q6n96I41RHM5nAYCB4v
 HWxg==
X-Gm-Message-State: AOAM5303M8ipkQawqB0yHUpuGQtdIy7X6HlUJt8uCYD/uyVeVrVLvIap
 GYojNutZSYrhltqhlEb1jixF3w==
X-Google-Smtp-Source: ABdhPJwxNb8d5ZlbARnU54AQKtx2pJJ/iterhcqiCFNnfTaHDGAeBoL/sepmaDiofgcZLc5RmD6tAA==
X-Received: by 2002:a62:4c3:0:b029:27c:892f:8e22 with SMTP id
 186-20020a6204c30000b029027c892f8e22mr54576846pfe.6.1621164207073; 
 Sun, 16 May 2021 04:23:27 -0700 (PDT)
Received: from google.com ([2409:10:2e40:5100:4596:acad:c782:2f52])
 by smtp.gmail.com with ESMTPSA id x20sm8137652pjp.12.2021.05.16.04.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 04:23:26 -0700 (PDT)
Date: Sun, 16 May 2021 20:23:21 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: ALSA: intel8x0: div by zero in snd_intel8x0_update()
Message-ID: <YKEAqdIAZ5K5FS+1@google.com>
References: <YJ4yBmIV6RJCo42U@google.com> <s5hk0o18tio.wl-tiwai@suse.de>
 <YJ5cHdv6MVmAKD3b@google.com> <YKDYQfDf7GiMfGCN@google.com>
 <YKDYbaprE3K2QpCe@google.com> <s5hbl9b6mah.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hbl9b6mah.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Leon Romanovsky <leon@kernel.org>,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>
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

On (21/05/16 11:49), Takashi Iwai wrote:
> Subject: [PATCH] ALSA: intel8x0: Don't update period unless prepared
> 
> The interrupt handler of intel8x0 calls snd_intel8x0_update() whenever
> the hardware sets the corresponding status bit for each stream.  This
> works fine for most cases as long as the hardware behaves properly.
> But when the hardware gives a wrong bit set, this leads to a NULL
> dereference Oops, and reportedly, this seems what happened on a VM.

VM, yes. I didn't see NULL derefs, my VMs crash because of div by
zero in `% size`.

> For fixing the crash, this patch adds a internal flag indicating that
> the stream is ready to be updated, and check it (as well as the flag
> being in suspended) to ignore such spurious update.

I reproduced the "spurious IRQ" case, and the patch handled it correctly
(VM did not crash).

> Cc: <stable@vger.kernel.org>
> Reported-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

I'll keep running test, but seems that it works as intended

Tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
