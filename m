Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3CD50B8FA
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:47:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFF541620;
	Fri, 22 Apr 2022 15:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFF541620
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635222;
	bh=xU/U9xkTvFUXFL8Wopr4rZHXHyzXgLRf0YqQRK4Kvss=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LRiGKPPTXNOwH2DVVXZKqNzjI/EWqwCEVr1YfqjmXph3xytzDBDsY2GkWEBoBehRy
	 Tk8EIHdQzogXF7rCZuahMjd9C4AB1ThmYZLaWJk1dROrWjiIeXPPAN5RH2x96c9Gvx
	 qYwKobVKyej3aWxwotuatV8xoZzO2mhxBeZVm9h0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A6DEF80684;
	Fri, 22 Apr 2022 15:32:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DF55F8025D; Tue, 19 Apr 2022 18:44:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91CD8F80237
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91CD8F80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OM0GwvoF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3A117B81BFB;
 Tue, 19 Apr 2022 16:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61AA5C385AD;
 Tue, 19 Apr 2022 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386652;
 bh=xU/U9xkTvFUXFL8Wopr4rZHXHyzXgLRf0YqQRK4Kvss=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OM0GwvoFjDTXu7F7DMTK9IAJLrdekpoJNNdqgKZOqnT0MxcJctOA38FNelxFTEIEi
 rfOkyib+5L0BuGs5gSth50JnQfK4wt3P5XbEMzwjlxtkKR2D5Fp6NSpVpT6JKLzOYa
 sUcSPu9YpMeAuC5R0d9Ntrrwz+yhMHEr/UloCY/EYZJ1RL8i+BYnDoiDTB5kDUDvsN
 cfM9amClMURurngFRlcw5eiNrdaaZ0Wt5Rgqq1W263FPZpQFgkIEKzYtsp52+Hu//Z
 ZDG5KKaetJsY/MAdjSi0qUGYxcFLyaW3uLnIWcs9gXXeXABgeTGYRt2fpOditJ3OfS
 VNvsgnrEcsb+w==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 41/48] ARM: pxa: remove unused mach/bitfield.h
Date: Tue, 19 Apr 2022 18:38:03 +0200
Message-Id: <20220419163810.2118169-42-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:42 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
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

From: Arnd Bergmann <arnd@arndb.de>

The sa1111.h header defines some constants using the bitfield
macros, but those are only used on sa1100, not on pxa, and the
users include the bitfield header through mach/hardware.h.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/include/asm/hardware/sa1111.h    |   2 -
 arch/arm/mach-pxa/include/mach/bitfield.h | 114 ----------------------
 2 files changed, 116 deletions(-)
 delete mode 100644 arch/arm/mach-pxa/include/mach/bitfield.h

diff --git a/arch/arm/include/asm/hardware/sa1111.h b/arch/arm/include/asm/hardware/sa1111.h
index 2e70db6f22ea..d8c6f8a99dfa 100644
--- a/arch/arm/include/asm/hardware/sa1111.h
+++ b/arch/arm/include/asm/hardware/sa1111.h
@@ -13,8 +13,6 @@
 #ifndef _ASM_ARCH_SA1111
 #define _ASM_ARCH_SA1111
 
-#include <mach/bitfield.h>
-
 /*
  * Don't ask the (SAC) DMA engines to move less than this amount.
  */
diff --git a/arch/arm/mach-pxa/include/mach/bitfield.h b/arch/arm/mach-pxa/include/mach/bitfield.h
deleted file mode 100644
index fe2ca441bc0a..000000000000
--- a/arch/arm/mach-pxa/include/mach/bitfield.h
+++ /dev/null
@@ -1,114 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- *	FILE    	bitfield.h
- *
- *	Version 	1.1
- *	Author  	Copyright (c) Marc A. Viredaz, 1998
- *	        	DEC Western Research Laboratory, Palo Alto, CA
- *	Date    	April 1998 (April 1997)
- *	System  	Advanced RISC Machine (ARM)
- *	Language	C or ARM Assembly
- *	Purpose 	Definition of macros to operate on bit fields.
- */
-
-
-
-#ifndef __BITFIELD_H
-#define __BITFIELD_H
-
-#ifndef __ASSEMBLY__
-#define UData(Data)	((unsigned long) (Data))
-#else
-#define UData(Data)	(Data)
-#endif
-
-
-/*
- * MACRO: Fld
- *
- * Purpose
- *    The macro "Fld" encodes a bit field, given its size and its shift value
- *    with respect to bit 0.
- *
- * Note
- *    A more intuitive way to encode bit fields would have been to use their
- *    mask. However, extracting size and shift value information from a bit
- *    field's mask is cumbersome and might break the assembler (255-character
- *    line-size limit).
- *
- * Input
- *    Size      	Size of the bit field, in number of bits.
- *    Shft      	Shift value of the bit field with respect to bit 0.
- *
- * Output
- *    Fld       	Encoded bit field.
- */
-
-#define Fld(Size, Shft)	(((Size) << 16) + (Shft))
-
-
-/*
- * MACROS: FSize, FShft, FMsk, FAlnMsk, F1stBit
- *
- * Purpose
- *    The macros "FSize", "FShft", "FMsk", "FAlnMsk", and "F1stBit" return
- *    the size, shift value, mask, aligned mask, and first bit of a
- *    bit field.
- *
- * Input
- *    Field     	Encoded bit field (using the macro "Fld").
- *
- * Output
- *    FSize     	Size of the bit field, in number of bits.
- *    FShft     	Shift value of the bit field with respect to bit 0.
- *    FMsk      	Mask for the bit field.
- *    FAlnMsk   	Mask for the bit field, aligned on bit 0.
- *    F1stBit   	First bit of the bit field.
- */
-
-#define FSize(Field)	((Field) >> 16)
-#define FShft(Field)	((Field) & 0x0000FFFF)
-#define FMsk(Field)	(((UData (1) << FSize (Field)) - 1) << FShft (Field))
-#define FAlnMsk(Field)	((UData (1) << FSize (Field)) - 1)
-#define F1stBit(Field)	(UData (1) << FShft (Field))
-
-
-/*
- * MACRO: FInsrt
- *
- * Purpose
- *    The macro "FInsrt" inserts a value into a bit field by shifting the
- *    former appropriately.
- *
- * Input
- *    Value     	Bit-field value.
- *    Field     	Encoded bit field (using the macro "Fld").
- *
- * Output
- *    FInsrt    	Bit-field value positioned appropriately.
- */
-
-#define FInsrt(Value, Field) \
-                	(UData (Value) << FShft (Field))
-
-
-/*
- * MACRO: FExtr
- *
- * Purpose
- *    The macro "FExtr" extracts the value of a bit field by masking and
- *    shifting it appropriately.
- *
- * Input
- *    Data      	Data containing the bit-field to be extracted.
- *    Field     	Encoded bit field (using the macro "Fld").
- *
- * Output
- *    FExtr     	Bit-field value.
- */
-
-#define FExtr(Data, Field) \
-                	((UData (Data) >> FShft (Field)) & FAlnMsk (Field))
-
-
-#endif /* __BITFIELD_H */
-- 
2.29.2

