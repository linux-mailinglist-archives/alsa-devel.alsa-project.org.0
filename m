Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E48E198CE4
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 09:25:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DD8B1614;
	Tue, 31 Mar 2020 09:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DD8B1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585639502;
	bh=6z4g/3atHdAr/FHv1ySFbxSRHdnz0vBAUgqE0DBqTuo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N8OdQAUu32/xwrdb+guJQ4EWsRmhSE1f68bUsY2qvw8GYG9c+FlTPT8nKTjBo5MOw
	 7iDjwDrZJufSjw3P4wTqQj4IZidL/g3bQvivxoY1gCQ75h6/cUSAKapJPg2c0h3CJJ
	 xiDo9K6uId73XECNb8I8YxK6LVhLigM4Dz1LZJO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A32B1F80146;
	Tue, 31 Mar 2020 09:23:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2B1FF8014A; Mon, 30 Mar 2020 15:32:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA482F8010C
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 15:32:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA482F8010C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com
 header.i=@monstr-eu.20150623.gappssmtp.com header.b="tPtDy92F"
Received: by mail-wr1-x444.google.com with SMTP id 31so21628877wrs.3
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 06:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GReVM19GqlV7E1aqnFYm2Dbl1ANbJ9X/aCuGV6MPAK4=;
 b=tPtDy92FT4caRu0Go0j/xtotMfvEW73iVr1JrhXGYFiODgBmlFD4UkSG+eIhOelQ1v
 5NRavlh2gpcX1SlyM069vAdFaI3ZKdD9dSDvHljVLXWJ3JkIk5JipREpSGpx2KYJNL4B
 lUKNx7pIs3PB00N271P+OpF96/RhRouVe8Fq8IyQc6F/UKTWr5TiEVqCAe5hFUEcrP3e
 p82QUd/MGQfMz6nnMwrnGuqjrjrCFNMxq3SCpeTiEHUITZEDcO7W4FMwXpNINYDSQyH9
 M0LnX8G76+Yfc770nfxdsIFAUDW4aTKkAK5nSUe36Qpjmck2pmAr7lx+SXJc8Sz7JhQ/
 sDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GReVM19GqlV7E1aqnFYm2Dbl1ANbJ9X/aCuGV6MPAK4=;
 b=gVDsFu5L9677UqdUdIuxIe69+lqk0XOSL6juVfhw5Z7VqMSOoe0d1o6cOiJMQ7/G0l
 GXgcWRAk3AiyjkHq2PYb/9QolIEj+kksaLsMhmDurALlVPPkgcNcsXcvUxxpYBca7fDn
 Md3KtQtJdSUH2akcbbdbqhVkZGLReG6oUo+szqdBOT35mbqtJoeYFqlUoN8QZQfEAQcx
 7k/NsI7U91emGjy9VdDwpWjebXNdMWoxipJs/dIXJ4izPSRq/IEUHjJPhQHDZU1rqHhs
 TGK0xXy5+PYlh8PBKc3qvRK7xh3UdO2cbOcDHNghNYT8V94+SfIBMVTBMfqf595DHe0n
 RwFA==
X-Gm-Message-State: ANhLgQ3ZAL6nQUHjn5DzX4z6tTfHTQ/O9vonBR9EyegbUOci9R8zIY1k
 GkZMO8q4NbkIFPtT8WmJ2NunHw==
X-Google-Smtp-Source: ADFU+vukZhm8tPUtLxOs/XW+LNo5gAR+llcU4X818GoCkrWfN2kr6XBx/zvgubTDyo9BIxw/lYRumQ==
X-Received: by 2002:adf:bc12:: with SMTP id s18mr4492529wrg.220.1585575139439; 
 Mon, 30 Mar 2020 06:32:19 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id x6sm4823230wmi.2.2020.03.30.06.32.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 06:32:18 -0700 (PDT)
From: Michal Simek <michal.simek@xilinx.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com, sfr@canb.auug.org.au, maz@kernel.org
Subject: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx platforms
Date: Mon, 30 Mar 2020 15:32:15 +0200
Message-Id: <cover.1585575111.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 Mar 2020 09:23:19 +0200
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Sasha Levin <sashal@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Masahiro Yamada <masahiroy@kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Allison Randal <allison@lohutok.net>,
 Matt Porter <mporter@kernel.crashing.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
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

Hi,

recently we wanted to update xilinx intc driver and we found that function
which we wanted to remove is still wired by ancient Xilinx PowerPC
platforms. Here is the thread about it.
https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/

I have been talking about it internally and there is no interest in these
platforms and it is also orphan for quite a long time. None is really
running/testing these platforms regularly that's why I think it makes sense
to remove them also with drivers which are specific to this platform.

U-Boot support was removed in 2017 without anybody complain about it
https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed

Based on current ppc/next.

If anyone has any objection about it, please let me know.

Thanks,
Michal

Changes in v2:
- Remove also sound/drivers/pcm-indirect2.[ch] files
  Reported-by: Takashi Iwai <tiwai@suse.de>
- Based on my chat with Arnd I removed arch/powerpc/xmon/ changes done in
  v1 to keep them the same as before. (kbuild reported some issues with it
  too)

Michal Simek (2):
  sound: ac97: Remove sound driver for ancient platform
  powerpc: Remove Xilinx PPC405/PPC440 support

 Documentation/devicetree/bindings/xilinx.txt |  143 --
 Documentation/powerpc/bootwrapper.rst        |   28 +-
 MAINTAINERS                                  |    6 -
 arch/powerpc/Kconfig.debug                   |    2 +-
 arch/powerpc/boot/Makefile                   |    7 +-
 arch/powerpc/boot/dts/Makefile               |    1 -
 arch/powerpc/boot/dts/virtex440-ml507.dts    |  406 ------
 arch/powerpc/boot/dts/virtex440-ml510.dts    |  466 -------
 arch/powerpc/boot/ops.h                      |    1 -
 arch/powerpc/boot/serial.c                   |    5 -
 arch/powerpc/boot/uartlite.c                 |   79 --
 arch/powerpc/boot/virtex.c                   |   97 --
 arch/powerpc/boot/virtex405-head.S           |   31 -
 arch/powerpc/boot/wrapper                    |    8 -
 arch/powerpc/configs/40x/virtex_defconfig    |   75 -
 arch/powerpc/configs/44x/virtex5_defconfig   |   74 -
 arch/powerpc/configs/ppc40x_defconfig        |    8 -
 arch/powerpc/configs/ppc44x_defconfig        |    8 -
 arch/powerpc/include/asm/xilinx_intc.h       |   16 -
 arch/powerpc/include/asm/xilinx_pci.h        |   21 -
 arch/powerpc/kernel/cputable.c               |   39 -
 arch/powerpc/platforms/40x/Kconfig           |   31 -
 arch/powerpc/platforms/40x/Makefile          |    1 -
 arch/powerpc/platforms/40x/virtex.c          |   54 -
 arch/powerpc/platforms/44x/Kconfig           |   37 -
 arch/powerpc/platforms/44x/Makefile          |    2 -
 arch/powerpc/platforms/44x/virtex.c          |   60 -
 arch/powerpc/platforms/44x/virtex_ml510.c    |   30 -
 arch/powerpc/platforms/Kconfig               |    4 -
 arch/powerpc/sysdev/Makefile                 |    2 -
 arch/powerpc/sysdev/xilinx_intc.c            |   88 --
 arch/powerpc/sysdev/xilinx_pci.c             |  132 --
 drivers/char/Kconfig                         |    2 +-
 drivers/video/fbdev/Kconfig                  |    2 +-
 sound/drivers/Kconfig                        |   12 -
 sound/drivers/Makefile                       |    2 -
 sound/drivers/ml403-ac97cr.c                 | 1298 ------------------
 sound/drivers/pcm-indirect2.c                |  560 --------
 sound/drivers/pcm-indirect2.h                |  127 --
 39 files changed, 7 insertions(+), 3958 deletions(-)
 delete mode 100644 arch/powerpc/boot/dts/virtex440-ml507.dts
 delete mode 100644 arch/powerpc/boot/dts/virtex440-ml510.dts
 delete mode 100644 arch/powerpc/boot/uartlite.c
 delete mode 100644 arch/powerpc/boot/virtex.c
 delete mode 100644 arch/powerpc/boot/virtex405-head.S
 delete mode 100644 arch/powerpc/configs/40x/virtex_defconfig
 delete mode 100644 arch/powerpc/configs/44x/virtex5_defconfig
 delete mode 100644 arch/powerpc/include/asm/xilinx_intc.h
 delete mode 100644 arch/powerpc/include/asm/xilinx_pci.h
 delete mode 100644 arch/powerpc/platforms/40x/virtex.c
 delete mode 100644 arch/powerpc/platforms/44x/virtex.c
 delete mode 100644 arch/powerpc/platforms/44x/virtex_ml510.c
 delete mode 100644 arch/powerpc/sysdev/xilinx_intc.c
 delete mode 100644 arch/powerpc/sysdev/xilinx_pci.c
 delete mode 100644 sound/drivers/ml403-ac97cr.c
 delete mode 100644 sound/drivers/pcm-indirect2.c
 delete mode 100644 sound/drivers/pcm-indirect2.h

-- 
2.26.0

