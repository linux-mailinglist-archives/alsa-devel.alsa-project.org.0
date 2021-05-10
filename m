Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B33837918C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 May 2021 16:55:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18E491776;
	Mon, 10 May 2021 16:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18E491776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620658502;
	bh=j59zhSqa5PQ0pys/RflL8XmnRyFIueqMFYidvmK26Ks=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wol98WL7Df3bYxHQVHMHNlxW78+H2cj4KeP5oOrblPeJQrweCYzpesEPn/tNb0mim
	 efS9HFmfMj0XkA44gDP+8b7TyD3omAVDS8OPY28gj2EZq9tglrXkTbGQhu8IFrDtdF
	 qhoCgtK568rBJrHfW+LYhCPQZvPKV/lHkA6jbPbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9017F804E3;
	Mon, 10 May 2021 16:50:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 400ECF8026F; Mon, 10 May 2021 15:59:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4C0FF80240
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 15:59:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4C0FF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eI3N1Fpg"
Received: by mail-wm1-x32e.google.com with SMTP id n84so9284487wma.0
 for <alsa-devel@alsa-project.org>; Mon, 10 May 2021 06:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oOiV5WgMi7Wi96u1A0j7aVHx72rSJUWKb9L7JASEw6U=;
 b=eI3N1Fpg9OGfxDYeN9CkM6JnUmUHl5WgQKsZJBAEe06N6eQIW+N/2eMqTIlrsyK/qM
 Xa35uzmXt4bi7Z5ExQmBDGcCmQr1UD910O1m2RozktwaOIV8OjhOXtuMqdS2t5KIlfV2
 /xSjuQtpNfwsgUMZT4YbuSWeEoVUpnkLWdYWx57GHC/JMnIbfeomB6X1EwhI6GqtNjJz
 5mS+m2iGgDDSAr7pACiBgtShvHO5CxZyag+ZmeEb/XAmakP22Iz1mAVAu5X4yPcneMls
 MNKS6aX+UYGYTiDpkPzh+zNyC5KsbwVbzbmTl9DNNLPJNUbSwFzwjXpWYoyfaT3bHk/5
 tcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oOiV5WgMi7Wi96u1A0j7aVHx72rSJUWKb9L7JASEw6U=;
 b=AejHGSisthB4qDsssqjA+PfQbnZrH4S7C0m/hYlgGsqi7OLen5hTBWnDydcpkDKa+t
 L3V1nHSirBefQSNal7ibOzAkeTvS9qi7DXanI3BnNtjBN/wa3fMKcnMngzY1Xr3RBtRr
 irEjESz6HjeNt/oA1eYXblgOgaITCir4iY64q01MZtYks1aCIaoMeBd0Zobxyr4vA6jb
 9CywinLBBM+0LiiQx+Ac6/vHhvzhEKaT2Sta7RW6v3rh7+SxNQznl2LCNwqvUsEOWhzM
 4FMRy59KFrykNxoB1MthMeX0zvGHhWE+8NDLKEcpFiR/jQrIuBKbsKAH+oXdGTObBaHw
 f7cA==
X-Gm-Message-State: AOAM5337ZLiTBA1Zz+Wpjmb5pXKlcvsO0o8621dROwbLj6D+32QYI5RI
 APsXJMbhGFJFoqzUZ2mR3JY=
X-Google-Smtp-Source: ABdhPJxuRWxshXLY3D3BIGKPZC8k+BUcpGElfoLV7AagS8fiv45gCBBhTdzQWkysFh21R1ZatES2dQ==
X-Received: by 2002:a1c:e38a:: with SMTP id
 a132mr26226331wmh.135.1620655141215; 
 Mon, 10 May 2021 06:59:01 -0700 (PDT)
Received: from [192.168.1.122]
 (cpc159425-cmbg20-2-0-cust403.5-4.cable.virginm.net. [86.7.189.148])
 by smtp.gmail.com with ESMTPSA id d127sm25703586wmd.14.2021.05.10.06.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 May 2021 06:59:00 -0700 (PDT)
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
 <20210510153807.4405695e@coco.lan>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <b3366f65-35e1-8f1a-d8d8-ebd444c9499d@gmail.com>
Date: Mon, 10 May 2021 14:58:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210510153807.4405695e@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 May 2021 16:50:04 +0200
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
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

On 10/05/2021 14:38, Mauro Carvalho Chehab wrote:
> Em Mon, 10 May 2021 14:16:16 +0100
> Edward Cree <ecree.xilinx@gmail.com> escreveu:
>> But what kinds of things with × or — in are going to be grept for?
> 
> Actually, on almost all places, those aren't used inside math formulae, but
> instead, they describe video some resolutions:
Ehh, those are also proper uses of ×.  It's still a multiplication,
 after all.

> it is a way more likely that, if someone wants to grep, they would be 
> doing something like this, in order to get video resolutions:
Why would someone be grepping for "all video resolutions mentioned in
 the documentation"?  That seems contrived to me.

-ed
