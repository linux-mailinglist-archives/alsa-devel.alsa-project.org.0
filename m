Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBE4672291
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:09:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6897963;
	Wed, 18 Jan 2023 17:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6897963
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058190;
	bh=WREOB3t8flR6ZGfm7JG3cDqAE+2VD24BdQqG9fbzXtg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pzStb01pLfGCbcePCK3wTr2/5PE1mfpuua6aR5VKNlAgLZAmnsRiuOjFHUAjaW87Z
	 Q75HUPWbzlxwMyEHG1a4z5BQgRShOmpuoastkbJclwK/xI64w/ZG8G2MQbQM2xumbV
	 vcGUh0mMUu2xQU6KwdukmdTnZGOk3DfcwsbNKPgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38575F8026D;
	Wed, 18 Jan 2023 17:08:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1232FF8047B; Tue, 17 Jan 2023 20:01:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBF02F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 20:01:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBF02F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=landley-net.20210112.gappssmtp.com
 header.i=@landley-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=7UFMvbpK
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-15bb8ec196aso21231570fac.3
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 11:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OgaymgAXi9Z6g6pYwBOzM02/P477EqWitgDVTE3LFbU=;
 b=7UFMvbpKkJyjWVLlq6ctk0nXiLL3RrLgvGqk+/g8pD0wAzMEFNodkoMNXxSPAzvJye
 T4nqVDpRCF5Pkw4fe0ROrd1BjE8DZbycDcUSRlgnihtqJaZkkqELJ7TzEZYyPHojRNxM
 MBh6YZCgcmJgLXwboxe3bvrjmez4qHhfCRIxGuc2G0+QOOJ/eKT38XBZ7MfSSmNLVm7z
 gDt6C3Ymsnj+eKLcMZ0dj5q2KFKnZutgcY/1C6+IgeLmT5DwAU4QsUhG6TCQdnlD6nEb
 fYtWfawIuB6wYahQA/cq89ISwAR2GZXbrrCFpCVxRJqHc9Mn337ID3jg/QgfKjbyHIu6
 BObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OgaymgAXi9Z6g6pYwBOzM02/P477EqWitgDVTE3LFbU=;
 b=gkrDO8LKnE8qs/iczsEep2mod4CbNmlhUXZlftjWBdlWYCbLQfuI3i9s0Rzk5wjrJQ
 kNR48tVBRgvpiNKQqyNwmpQCpeL1SKJ1hJPUfg6zBHwq8VhkYRfKaZ1nNdZkjJd/zrYp
 qgS3qtwbUD5UYAdVbZRPD2VW5Wdi19GeseSar5Ers9I72YUqKphW+esG83Y1jL59cnyy
 kBzWd/UBCjB6/A5Vdi5ULGrBPDchV9RWMwQozAi9RIpIO1NRWS/Uzv1k5XwyVtn8exRB
 4Oezk0WldnPHPEtL1bmwv7kQPAz3Iu9juDaXo+Mydz2Ub53yHrn+0bzqoc87ey8TpZZH
 1iUg==
X-Gm-Message-State: AFqh2kos9XFL5xns9UiStoZXNNsg8p+ygJS4baUMuuW2JB2iLSxhOmtZ
 Mk8XWfXf3Z99fpHeGcp9d4i8pA==
X-Google-Smtp-Source: AMrXdXsgzCxMhqm+bb3il7EsJjEv0NbGPCzT1qf9VREFYRxVllxrk/YEzaFAyrBdtefAaDgGfnk/UQ==
X-Received: by 2002:a05:6870:c190:b0:15e:cfca:b312 with SMTP id
 h16-20020a056870c19000b0015ecfcab312mr2807015oad.52.1673982083592; 
 Tue, 17 Jan 2023 11:01:23 -0800 (PST)
Received: from [192.168.86.224] ([136.62.38.22])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a05687080d200b0012763819bcasm16664335oab.50.2023.01.17.11.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 11:01:22 -0800 (PST)
Message-ID: <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
Date: Tue, 17 Jan 2023 13:13:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: remove arch/sh
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
From: Rob Landley <rob@landley.net>
In-Reply-To: <20230116071306.GA15848@lst.de>
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
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/16/23 01:13, Christoph Hellwig wrote:
> On Fri, Jan 13, 2023 at 09:09:52AM +0100, John Paul Adrian Glaubitz wrote:
>> I'm still maintaining and using this port in Debian.
>>
>> It's a bit disappointing that people keep hammering on it. It works fine for me.
> 
> What platforms do you (or your users) use it on?

3 j-core boards, two sh4 boards (the sh7760 one I patched the kernel of), and an
sh4 emulator.

I have multiple j-core systems (sh2 compatible with extensions, nommu, 3
different kinds of boards running it here). There's an existing mmu version of
j-core that's sh3 flavored but they want to redo it so it hasn't been publicly
released yet, I have yet to get that to run Linux because the mmu code would
need adapting, but the most recent customer projects were on the existing nommu
SOC, as was last year's ASIC work via sky130.

My physical sh4 boards are a Johnson Controls N40 (sh7760 chipset) and the
little blue one is... sh4a I think? (It can run the same userspace, I haven't
replaced that board's kernel since I got it, I think it's the type Glaubitz is
using? It's mostly in case he had an issue I couldn't reproduce on different
hardware, or if I spill something on my N40.)

I also have a physical sh2 board on the shelf which I haven't touched in years
(used to comparison test during j2 development, and then the j2 boards replaced it).

I'm lazy and mostly test each new sh4 build under qemu -M r2d because it's
really convenient: neither of my physical boards boot from SD card so replacing
the kernel requires reflashing soldered in flash. (They'll net mount userspace
but I haven't gotten either bootloader to net-boot a kernel.)

I include sh4 in the my mkroot builds each toybox release, I have a ~300 line
bash script that builds bootable toybox systems for a dozen-ish architectures,
including building a kernel configured to run under qemu:

  https://github.com/landley/toybox/blob/master/scripts/mkroot.sh

And I ship the resulting bootable system images, most recent release is at:

  https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/

As described at:

  http://landley.net/toybox/faq.html#mkroot

Various people in Japan have more hardware, but I haven't made it physically
back there since 2020. (My residency card expired during the pandemic.)

Rob
