Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B5A669BCA
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 16:19:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E56B780E0;
	Fri, 13 Jan 2023 16:19:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E56B780E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673623199;
	bh=nVH3BIpm/6QJSOyCWkhldF8Mr4u5D6zKptnubEnLlCQ=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nXfwQotlwUkb3lrEn9GzaOV6v6JberGl/eDmTLjLyNw5sUZdHCx9dyOKob7pnh3sb
	 Zfi6Ri/WeJIX80fX26gCpcoRHLfchvjbR+fBpyP/JVJsA5Z15iMt5Lpsy/3WZp+zvK
	 6B4unMlTNy1WyduYbgBM5mVYi03BxM1nuqPXoOAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF7D3F8016D;
	Fri, 13 Jan 2023 16:19:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A79BF8030F; Fri, 13 Jan 2023 16:18:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52413F8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 16:18:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52413F8019B
Received: by mail-oi1-f182.google.com with SMTP id d127so17889855oif.12
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 07:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ieDDnBbNB9JJsaMwpNzXJlERKk1wwpqLtOrBhJRfGpo=;
 b=ryEh/bKnmlPfYCbiMyBoFwZDgGWAe4TSRjBd+D1TQakMDA9/CU13HlsbpaytRgNE1O
 AuVM+OeUza5Rhn2rDfgwmVJMI545j84uuagzF1X4DDNJJByq1EIrgxvwY63SUsjjCIEL
 pwsqeNb+vc88VZzijffnK6XZCQqc6HnRKUnG1MkK4HgbunAoh4OZBCQYuqGTgLaQGKBr
 vktQd2nDeU9V87NGxYcp5HM8pWROhavcCQrCXU6rz3VsBPQrRljG3QmoJNjiICIsMxyu
 wJF/xrczNCSe4YBh7wD3QUJvvVeo0/NwjyrYocsh7ChySRMnIcBwar3B/AAEIhMKM7EH
 OxlA==
X-Gm-Message-State: AFqh2kr0/vmVqG5v/rxYNcQi0HX8VJtRPL5pSPYAiZhwTr1lmi+sC7ez
 Dw9rjNPUSffMRyuINadBvg==
X-Google-Smtp-Source: AMrXdXvKjUuXqtnMP8HRUWF6KklExF2oSAG2rWu9CjnEqT3LUV2kOArvIgWmH2DzIBq+esFLR8R2ag==
X-Received: by 2002:a05:6808:996:b0:364:c003:e1ba with SMTP id
 a22-20020a056808099600b00364c003e1bamr517132oic.46.1673623135307; 
 Fri, 13 Jan 2023 07:18:55 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w11-20020a0568080d4b00b0035c422bb303sm9298016oik.19.2023.01.13.07.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 07:18:54 -0800 (PST)
Received: (nullmailer pid 2206759 invoked by uid 1000);
 Fri, 13 Jan 2023 15:18:53 -0000
Date: Fri, 13 Jan 2023 09:18:53 -0600
From: Rob Herring <robh@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: remove arch/sh
Message-ID: <20230113151853.GA2184281-robh@kernel.org>
References: <20230113062339.1909087-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113062339.1909087-1-hch@lst.de>
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

On Fri, Jan 13, 2023 at 07:23:17AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> arch/sh has been a long drag because it supports a lot of SOCs, and most
> of them haven't even been converted to device tree infrastructure.  These
> SOCs are generally obsolete as well, and all of the support has been barely
> maintained for almost 10 years, and not at all for more than 1 year.
> 
> Drop arch/sh and everything that depends on it.
> 
> Diffstat:
>  Documentation/sh/booting.rst                             |   12 
>  Documentation/sh/features.rst                            |    3 
>  Documentation/sh/index.rst                               |   56 
>  Documentation/sh/new-machine.rst                         |  277 -
>  Documentation/sh/register-banks.rst                      |   40 

Can you please also remove:

Documentation/devicetree/bindings/mtd/flctl-nand.txt
Documentation/devicetree/bindings/interrupt-controller/jcore,aic.txt
Documentation/devicetree/bindings/spi/jcore,spi.txt
Documentation/devicetree/bindings/timer/jcore,pit.txt

Rob
