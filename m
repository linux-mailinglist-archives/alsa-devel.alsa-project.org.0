Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4545E672298
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 17:10:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D312143E0;
	Wed, 18 Jan 2023 17:09:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D312143E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674058248;
	bh=NHDzLkKy19bLifRO57yeP/7cqOTHByeej8aWmKcWJ4c=;
	h=Subject:From:In-Reply-To:Date:References:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YOR3YDXY21YenjA5WjGYJOIvE961jY0fHORHN++3zDnjP0EmQJJHFzx5yyIuQHQlM
	 Q5f9GVORYNX/ax1ggofOG/agUcZoJRutQowUBIZReRzTITXoqPzPNXVryuqMBc0ZCl
	 cPRhOgxIWPTE9astsshHreArtezuB0wgFu5x36NE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3FB7F80551;
	Wed, 18 Jan 2023 17:08:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD10BF804EC; Wed, 18 Jan 2023 01:10:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C1CDF8022D
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 01:10:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C1CDF8022D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=X8kEN2RC
Received: by mail-yb1-xb30.google.com with SMTP id l139so36197284ybl.12
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 16:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mqoGaxCv32d9QDH8rbs+wNFx+mRHisbPyzqWglfmzdo=;
 b=X8kEN2RCR0Z7j9dvYBPvrUngCUUeFWtb1S07rcVgUPJfjZWU74psq/1gmCn184hHsa
 uAze+wMWm/HhTilA6p92QH5ri8+IauhT90wWGY1gF+L4D1hxqn6EEUAC2u4NEpV9Nmvn
 x+3uw1f3Kj62qSMscS/TsPlYBzCYZoW6NNjmtZbAPUJ/5TKESadBgRtm8J1MdvDK06vz
 WYfkJ4Sp7G5/xmXAjhT1J6VJC34p+oXr1s/hPXo04xworQlkKedZ7oKdZ+cdRdRuwnLj
 FlNdnb/9pL7BHz0y6pWQYZ0EY4EDj4CwBCe3rsWwDGIkCSO63TNtAcqrhSR1ML+9G3SE
 inSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mqoGaxCv32d9QDH8rbs+wNFx+mRHisbPyzqWglfmzdo=;
 b=dOIQtYGOe4W6CUnPwUfjfqrx6Phy/JLjgug/av7RqGVNd3LDjC/7RbBsTIMnlPBBBS
 Rv7q+BHjlq79Ap0Mu3oHnUtdYfpcbRriuQ77c+v1+dpxsewPW6TNG5mtXmwDXYaZ3mLQ
 6mYdH8XRQbO2Gb8Lu5NnhIQNDAc0J8/wGeFoGdNguTxTLcYGKq/xg1LZ76bf8UJuF//t
 PdWQlzU5oKqui5IecIAbUQUAKGCvfMrjLrVtGHG5Q3KyduuYM+uwrVqlH3X5jaZinstk
 p+s/et93NdaDCtlM86Hg/f6omDLbWOtXAZffG/6p7II+ch8jqJvxytiO+KSXwa60EBB+
 /6bQ==
X-Gm-Message-State: AFqh2kqOtF/ImWdplme6bNCEOztAZxPsWBmiF8r6MvpjwJUbWiwqLDrK
 fV67ObkAsR95fn4zqXmfHJ8=
X-Google-Smtp-Source: AMrXdXvLckhDa1bG5Pn2IzKkim7J+U5lK7NIKjwNimaDoNI+pnG9GJpZUGRqId1mcbsUGnMptZYX1A==
X-Received: by 2002:a25:4084:0:b0:7d8:aaf9:bdd7 with SMTP id
 n126-20020a254084000000b007d8aaf9bdd7mr4610072yba.3.1674000628976; 
 Tue, 17 Jan 2023 16:10:28 -0800 (PST)
Received: from [192.168.0.14]
 (cpe84948cc906a3-cm84948cc906a0.cpe.net.cable.rogers.com. [99.231.72.42])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a05620a401200b007064fa2c616sm6796318qko.66.2023.01.17.16.10.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Jan 2023 16:10:28 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: remove arch/sh
From: "D. Jeff Dionne" <djeffdionne@gmail.com>
In-Reply-To: <c9ce648e-e63e-8a47-03c6-7c7e30d8dbc7@roeck-us.net>
Date: Tue, 17 Jan 2023 19:10:25 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <9FC76FF3-9DD4-48E2-BC39-479A50B40C1D@gmail.com>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <9325a949-8d19-435a-50bd-9ebe0a432012@landley.net>
 <CAMuHMdUJm5QvzH8hvqwvn9O6qSbzNOapabjw5nh9DJd0F55Zdg@mail.gmail.com>
 <c9ce648e-e63e-8a47-03c6-7c7e30d8dbc7@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
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
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Landley <rob@landley.net>, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> Since there are people around with real hardware .... is sh in big =
endian mode
> (sheb) real ? Its qemu support is quite limited; most PCI devices =
don't work
> due to endianness issues. It would be interesting to know if this =
works better
> with real hardware.

Hi Guenter,

SH big endian works very well, and is in use on J-Core J2 SMP (hardware =
w/FPGA, simulation and ASIC this year) as well as some of the Hitachi / =
Renesas IoT chips e.g. SH7619.

It=E2=80=99s the base of the real new line of development (as opposed to =
backward looking support of older SH chips).  New chipsets will be based =
on the same RTL.

But does it actually work?  Yes, we have (new) devices such as a USB =
Wireguard based VPN hardware dongle, that are J2 (SH2 2 core SMP) that =
are in use with Linux sheb, nommu and fdpic.  MMU chips will be little =
endian.

Cheers,
J.

> Thanks,
> Guenter
>=20

