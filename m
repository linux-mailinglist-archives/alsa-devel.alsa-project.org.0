Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A647196BC6
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Mar 2020 10:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A730168A;
	Sun, 29 Mar 2020 09:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A730168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585468824;
	bh=LmkCer8Nz4Fe+ZFORuoWP+VVp982DaMMvn/nnGd5fwQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gpoZw4+31/WQYxGjj4QiNgrENcHAocpN5ZiJUwmOSbsOeJ03Es4MtrJlW7SL+nBtZ
	 FhCdpdJ0SJmY0+PGetCuIg3e+DddcIefd/jd7pLY3kBqbJu1NK5aM1oXPVeu/wgkzP
	 /4nGxNYiYs1kph3YP74Xtne5PSSm/RW1PcxhRueg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F3C8F802DC;
	Sun, 29 Mar 2020 09:54:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43328F800EA; Fri, 27 Mar 2020 13:12:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 094EFF800EA
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 13:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 094EFF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=monstr-eu.20150623.gappssmtp.com
 header.i=@monstr-eu.20150623.gappssmtp.com header.b="Q6jkqOCl"
Received: by mail-wm1-x343.google.com with SMTP id c81so11162712wmd.4
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 05:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hu2wO3xqKJ9lAvcooNTrI/b8de0qGuxf2k7JbWd4Z40=;
 b=Q6jkqOCl9MKMuj7vToMTE8rlnHdmKPXfMdFa71ZYlGAi8tYooU25WC0zBNxvt8ugre
 JKckVbhTVb20SPsGPwIXRIbTrIefzGABtntSmF/8WooFaYXdfhUDFxOyeEKvbr41sHZl
 yZowdsHRWSPWXRZYVZHHoNriqZKMx3xG5kzsuLd1a8NPslgWUKm2YSfeuPtzi+68Wv2a
 ARaxJsgxVlidZ/u6U0LFttsTbPh0ChR7n/ZlhrjX5SLmvqsHsN9Waj4iXwHSJEUY+6nf
 SztK0OtmzOGUqZU/1cppOBYodGLZENJ87u6tkK4qIG9GhDUKCqoUZ4CXwnbcguoT7K7Y
 KRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hu2wO3xqKJ9lAvcooNTrI/b8de0qGuxf2k7JbWd4Z40=;
 b=QSFJHq93QRh9lizHeIXZUU0QJhkL9SL9PtIlzwNsemViO/zIH1ZtOnA+mVQrb19g2q
 VHptXtdOtofhXMRohk+dWPG81KcKoalGC8HymUdRJLPAHotlKmotP07qGcHIQQSA3tpr
 wd4St/uKmTSad9ZEoxaj7qeaohdOBQpSK0yNcGPopi6SKZ/UMSNTzo7hJGhjZuIQdp5E
 oLb1+VbPRKbYDVuyHm51K67DdBZNIt/klsRSgi88SxOnHDkkeyif+dyd+O/7uJ1M+yQo
 39Udg3mIH/CQOGl9Y/ykEeOt/vLSz+2r/5Kygj1lLamig45Q+FqqjiRJuvzQmlFCCMca
 P8Zg==
X-Gm-Message-State: ANhLgQ1pqs8+8nd5j57xznoYNO9RmSuZAuf96lwFzvGBhLkQZp+rOfUa
 scEUtD0sHYNvXxodkQPjhlaADQ==
X-Google-Smtp-Source: ADFU+vsPQ8HhY6iOzEkZp/Z+//NczVx5VEWwgI18HebHQy0Av5+Y7ASAetl9QrHODkVtgQzkfKPdHQ==
X-Received: by 2002:a05:600c:234f:: with SMTP id
 15mr4996664wmq.24.1585311155571; 
 Fri, 27 Mar 2020 05:12:35 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
 by smtp.gmail.com with ESMTPSA id s11sm8399792wrw.58.2020.03.27.05.12.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 27 Mar 2020 05:12:34 -0700 (PDT)
From: Michal Simek <michal.simek@xilinx.com>
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com, sfr@canb.auug.org.au, marc.zyngier@arm.com
Subject: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx platforms
Date: Fri, 27 Mar 2020 13:12:20 +0100
Message-Id: <cover.1585311091.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 29 Mar 2020 09:54:17 +0200
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
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Matt Porter <mporter@kernel.crashing.org>, devicetree@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Wei Hu <weh@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
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
 arch/powerpc/xmon/ppc-dis.c                  |    6 -
 arch/powerpc/xmon/ppc-opc.c                  |   23 -
 arch/powerpc/xmon/ppc.h                      |    5 -
 drivers/char/Kconfig                         |    2 +-
 drivers/video/fbdev/Kconfig                  |    2 +-
 sound/drivers/Kconfig                        |   12 -
 sound/drivers/Makefile                       |    2 -
 sound/drivers/ml403-ac97cr.c                 | 1298 ------------------
 40 files changed, 7 insertions(+), 3305 deletions(-)
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

-- 
2.26.0

