Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 844566722AC
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:11:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D10E79A5;
	Wed, 18 Jan 2023 17:10:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D10E79A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058293;
	bh=o207/8Aolhui6XSClRkOJigK5rfepT6oSTq6FBfPVNE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sPS8jO1GXSyNrNfYpKeOrfEfqkWXzx7FLE59IoqCi5uOfPLu6LHTO6l7KGAXNJg2v
	 BN054t0fZMKjZsNomxV6A2OUT0vNkrJze0VIFFqmS7PwxPTAeCz285sww5Ej6IoxD4
	 jQ8jD7bi3fIF0mMwADFB38WeUm0cmPdY2t8KnvWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FCFDF8055A;
	Wed, 18 Jan 2023 17:08:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9E88F8024D; Wed, 18 Jan 2023 12:02:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FA7BF8021D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 12:02:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FA7BF8021D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=landley-net.20210112.gappssmtp.com
 header.i=@landley-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=5PCGooyh
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-15027746720so35049325fac.13
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 03:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KuI0iwHsMdHgi9UUhJbv/FF6Zx1hDWv0kF6EEdUlD2I=;
 b=5PCGooyhPIEuUA8LfHpgz2E1NSo9q7mSLwwd+kP7a2WQx5oIObawC1SZ8b3GjlhI6w
 k+aUwf08xYT06HES1GVAUttTfmtlU/+2mUQ+E6nwI3mvpykPVqpS3CT4T1OK8Y7wh8Lh
 OxdivEq+CnvHPuPDLKxMirSIFn7kanNvD0azdCBrxVrZC626tljgU09Q5NwDlRdCl5Pm
 h30BKW+O6Gpe2j8vZBVS7nQX0CZx9F+vnTsIKQmfF0oeOZkgBCg3IFGxtjTVee8Llq3v
 VTgrTzM1eGIkuy0knsusfqmXW3O1e3iUrjIXv4sd1h2zvdReBrfi+vZn6Ejf/45OptwH
 w5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KuI0iwHsMdHgi9UUhJbv/FF6Zx1hDWv0kF6EEdUlD2I=;
 b=bu5IxILnG+y5TMIqU6gFyGksmGGAPqlqp2Lx/zTQLhBys4T/1/9sJcJt7dfzCRt4jZ
 YjnCZv6tnD2XFciHTXMJj/SOKCUNiD/3WpoMqvGbX2zs2uEPp4DnPUi6Ln5wbsFQewZK
 0tPAfxeq40HhOTq7zagf0Td9GT7DdbV/8DNvmxM6eVIWc1XDKft5y1Wj1qtFeY3TvDZN
 /ywMUw41JkqxkPiLxCLAE7ZDk9CP873lzmei3m/kC8BXwypsLnnh03f+obSj8aKq6mdd
 YJiU+bnuDn6woKQI0oLlefRsx+splIiJOqpq8cvCL1e24ySLYemcph02Y4ld2NMiuvBX
 HSFg==
X-Gm-Message-State: AFqh2kpRzYxxFxOwrEeo2K10Ai03Jh1Rq6GyUfQ2xBWkASzl9JRx3J70
 Nf4V56yYnf/Q+r++YJinbGps0A==
X-Google-Smtp-Source: AMrXdXvlrp1Ed3XBrrhA3zCnrQ6Rbb/wKmg6UrVk+wIslhGo+AMwXBPpNO4DwySZY2+3rtlEwlTN+A==
X-Received: by 2002:a05:6870:c190:b0:15e:cc77:1e6d with SMTP id
 h16-20020a056870c19000b0015ecc771e6dmr4364085oad.13.1674039741194; 
 Wed, 18 Jan 2023 03:02:21 -0800 (PST)
Received: from ?IPV6:2607:fb91:120e:1c84:8038:3fff:fe9f:cbb4?
 ([2607:fb91:120e:1c84:8038:3fff:fe9f:cbb4])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a056871045300b001442fada152sm18099522oag.46.2023.01.18.03.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 03:02:20 -0800 (PST)
Message-ID: <efa6a8aa-466e-cfaa-0113-b85002af008e@landley.net>
Date: Wed, 18 Jan 2023 05:14:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: remove arch/sh
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
 <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
 <7329212f-b1a0-41eb-99b3-a56eb1d23138@landley.net>
 <CAMuHMdXo3iR2C=CAaXO5tBRCncnQAAMR6BMPLOm_nBpFAeVhrA@mail.gmail.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <CAMuHMdXo3iR2C=CAaXO5tBRCncnQAAMR6BMPLOm_nBpFAeVhrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 18 Jan 2023 17:08:49 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/18/23 01:46, Geert Uytterhoeven wrote:
> Again, I think you're talking about something different.
> Does kexec work for you?

Sorry, got woken up several hours early by sirens and flashy lights this morning
(duplex on the corner caught fire, Austin has a LOT of emergency vehicles), been
a bit underclocked all day.

No, I haven't tried kexec on sh4. I'll add it to the todo heap.

>> > I tried working my way up from 2.6.22, but gave up around 2.6.29.
>> > Probably I should do this with r2d and qemu instead ;-)
>>
>> I have current running there. I've had current running there for years. Config
>> attached...
>>
>> > Both r2d and landisk are SH7751.
>>
>> Cool. Shouldn't be hard to get landisk running current then.
> 
> Current kernels work fine on landisk with an old Debian userspace
> on CF.  The 8139cp driver is a bit flaky: last time I tried nfsroot,
> that didn't work well.

I've never had luck with NFS, I was using NBD. Hadn't noticed the flake but
haven't stress tested it too hard either?

Mostly new userspace is what I'm testing...

Rob
