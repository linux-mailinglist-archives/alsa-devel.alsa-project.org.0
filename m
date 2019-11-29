Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D94A410DB68
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Nov 2019 22:59:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5997B16D5;
	Fri, 29 Nov 2019 22:58:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5997B16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575064781;
	bh=ZjV8oP63ZbCHoZj7pb3dfpdnIe0NxMxeIKRYY+jYws8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jzDaXPuNdB2ycDxsGOWiWzAehj0o8logO005gL7t7n/zak5sU6IxeH6k3RZ4kZBxd
	 wcuFx/UqdEOkOyxo4tjJ0OKryxyZ1h1XjHGCaE57574o+GxNaCkw/0x31UL4ig7W3Q
	 23cyjVfymtmDc0FgYEAhfil0AqpxqdQbqvMvtTw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A03BAF8016F;
	Fri, 29 Nov 2019 22:57:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30EFEF8016F; Fri, 29 Nov 2019 22:57:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D7CEF800C2
 for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2019 22:57:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D7CEF800C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="h+Urcqkv"
Received: by mail-lf1-f68.google.com with SMTP id a17so23547873lfi.13
 for <alsa-devel@alsa-project.org>; Fri, 29 Nov 2019 13:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9LD4rQhoJx4ZWspvu75ddE3vIc7NmBG4blVspw65+Ak=;
 b=h+UrcqkvvN9oJJUK//cTB3MxoQBX/E+7ZKK7ZuLVAqkSaZ8unS864P1OMcS1vg2a3Q
 +4hoafy8DD/IG50/pEM2wJK6aDj54jKpzntXyDmHkwT0XCSKMnhW5wXqQHwU5iySfKyI
 GLHLk/7hxanv+rwdJB71FGUDdvqK97cyLo0aXVEddkXDmk27Ea0GYFzpktLN/T0aDRkY
 TMdWqD1JB/lj55gA5rZtU8T9+fd8UNhzgnpdWdjo8z5fUCGleC1y/5GGEhn307QxsjgH
 +lwUR/Zz4+wufbCuGvtgMx41MPXI2I0K7PC7na1MIoQA4ppYUzHnpljncGPzRU7HKyMX
 9ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9LD4rQhoJx4ZWspvu75ddE3vIc7NmBG4blVspw65+Ak=;
 b=G4XZ/JYSVlKAd1buvoSDuWLB5g1BD6pL5BJ7F7H+LyQMGSNGF20H4UpGcYtqL5Itzz
 UmEhzCWT6Ya9aHhdhcCzKF7xOASfbfY2MAe2Iwr8Vq5ywLNHxtwWmJiT4YXIm16uFgkG
 +e8qfclWUo1g7X0P+e6PJVjgo83G4mDA5lASdEGyye0qIr/0Iyk+wvLmFU2gUOpZ2SvY
 pmFpGKp67F2SOa/eIEsYtKuNLrH/N8llKwl5LCuSRMiA0gr2MPTYO/UM5Z6ifUCoGnoP
 mBa4fEsLmHCrLGBYtZ7V+tK1kOtAHc73qOOJ3/a6PVidTfXbIprpHRbYvzHQt3YbULAK
 grjw==
X-Gm-Message-State: APjAAAUjIUt5COO35YOP2HxRu9ig4TFvyKJJ73bFUhr8BTypmRkxfPzK
 uA4tDULQ6K3xvezlm2dc4sTTnP9rFt07RzDD8WY=
X-Google-Smtp-Source: APXvYqzr4BSwRZNjxhOAWUVDRbfg2dtVgVWBqnqcRA37vtO1uegkRbcP0hHi7H8HMy5Gjx8/7y0dzxANy2cw7iFxak4=
X-Received: by 2002:a05:6512:1cf:: with SMTP id
 f15mr5449017lfp.12.1575064611401; 
 Fri, 29 Nov 2019 13:56:51 -0800 (PST)
MIME-Version: 1.0
References: <20191128223802.18228-1-michael@walle.cc>
In-Reply-To: <20191128223802.18228-1-michael@walle.cc>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 29 Nov 2019 18:57:04 -0300
Message-ID: <CAOMZO5CP6ohaHqv5qy=RAisjiYQ6pO9xqGfKbHDzQ77gsm=CwA@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: add IRQF_SHARED
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

Hi Michael,

On Thu, Nov 28, 2019 at 7:38 PM Michael Walle <michael@walle.cc> wrote:
>
> The LS1028A SoC uses the same interrupt line for adjacent SAIs. Use
> IRQF_SHARED to be able to use these SAIs simultaneously.

On i.MX8M SAI5 and SAI6 share the same interrupt number too:

Reviewed-by: Fabio Estevam <festevam@gmail.com>

Thanks
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
