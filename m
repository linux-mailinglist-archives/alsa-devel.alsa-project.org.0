Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD93F8AF71
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 08:12:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DC971660;
	Tue, 13 Aug 2019 08:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DC971660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565676752;
	bh=5ylZh4fovjY1Rq7ny+aBoW+/yQPnQlwIu6MDuw5PwzE=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UNaR4FPyRSGV3Q0DGn49PBjBLnvkkpCl6qNt7MPART2uMIPFGI6PQmyVMpG5OJoHT
	 4ZYvbfRlZFCd7aycPSmVQRkJFT7+o/xKiozM2mTYN0YqRgY1gB0NdgY5JGAluat+EK
	 kJBeLe5C8z1rrvHVnWL7PxvMG9jVV8xO0Rz74DlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B68DCF80274;
	Tue, 13 Aug 2019 08:10:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CA7CF80273; Tue, 13 Aug 2019 08:10:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22003F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 08:10:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22003F80120
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EFNBrpf4"
Received: by mail-wr1-x443.google.com with SMTP id 31so106643445wrm.1
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 23:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kBSt0AC9Wj3a2Ydwo1maYp10w7mbRorMD87B4HpPB2I=;
 b=EFNBrpf4FGy8XSbk7pjxipP5hP7dxFcpKbU3qvMtIJzOf1VB3T4nl+m93RK9SIgQWd
 vy7SOw3tnXpYDGANVBfSKDzG/RsM9zs7UFu7YLtphmPEJKaloc4faCWDOFcQRDOOq9PQ
 3XSrvcy07BVqhiWRJfjFJ54qSIVtFTblfvgZkGdRcuXPCOdc69btchprsNzrw4ADSt2X
 x6SOn+jSzWm9wAJjJirCqA9XSE+DiVWzJa59OFWJ50s6dTWqmu2BFEWSNeuVkiAv9x2W
 uLwHurY2yVU71+w7fEzw6p97QvGn781V0D2zUCGZ/ZX8y1kcQpCIrULkWAqbAexFqNMQ
 zrvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kBSt0AC9Wj3a2Ydwo1maYp10w7mbRorMD87B4HpPB2I=;
 b=W6QryWQWBtNjHELZrLU+kIHpA4MJ8T6HbSA7k22aqR63v/J1AnShejq3Hfgdouw6lI
 MHFRy4nythpBrOJjSFnbXEvgkQSY/sGEUUujj7LXS/vm8gq99oRNNRM1nI+EOVs740gx
 C1r72BOL+LgxuVDyR65cuKDrCKSYdG/btWNq9Wa7tnBEf0ysZcGkYwhZaFZDi0CCeu1j
 R/kNaCMDwkrbHDn5Y9J495CDtdfZff6o14uQUWDpDl96mqfLlYMH++RaKko/urPi7Lkl
 iFYcMaplN7ObhRpxHc7inIqbYvKeEC83Ggm+3FYcwvgHtE1KIxqbvZVKY4Mub1NI2UhB
 DatQ==
X-Gm-Message-State: APjAAAV3pVLUQTUHAXzKFwIRY1A9B74p/lzPZTX0Hg+OLsNVUfDXCB+H
 tHcdqwFaIsPmetTsIcLIphCTqkFV1he3Yg==
X-Google-Smtp-Source: APXvYqxGqC2rz8hc6nTl6Ie7zwuqOcKOu6mYW+16lrACD1nVavptVxrdjPIR+Sgem/E5tC8bo9nZsg==
X-Received: by 2002:a5d:424d:: with SMTP id s13mr25409745wrr.178.1565676641744; 
 Mon, 12 Aug 2019 23:10:41 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id c1sm416096wmc.40.2019.08.12.23.10.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 23:10:41 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 12 Aug 2019 23:10:14 -0700
Message-Id: <20190813061014.45015-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] soundwire: Don't build sound.o without
	CONFIG_ACPI
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

clang warns when CONFIG_ACPI is unset:

../drivers/soundwire/slave.c:16:12: warning: unused function
'sdw_slave_add' [-Wunused-function]
static int sdw_slave_add(struct sdw_bus *bus,
           ^
1 warning generated.

Before commit 8676b3ca4673 ("soundwire: fix regmap dependencies and
align with other serial links"), this code would only be compiled when
ACPI was set because it was only selected by SOUNDWIRE_INTEL, which
depends on ACPI.

Now, this code can be compiled without CONFIG_ACPI, which causes the
above warning. The IS_ENABLED(CONFIG_ACPI) guard could be moved to avoid
compiling the function; however, slave.c only contains three functions,
two of which are static. Only compile slave.o when CONFIG_ACPI is set,
where it will actually be used. bus.h contains a stub for
sdw_acpi_find_slaves so there will be no issues with an undefined
function.

This has been build tested with CONFIG_ACPI set and unset in combination
with CONFIG_SOUNDWIRE unset, built in, and a module.

Fixes: 8676b3ca4673 ("soundwire: fix regmap dependencies and align with other serial links")
Link: https://github.com/ClangBuiltLinux/linux/issues/637
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/soundwire/Makefile | 6 +++++-
 drivers/soundwire/slave.c  | 3 ---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 45b7e5001653..226090902716 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -4,9 +4,13 @@
 #
 
 #Bus Objs
-soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
+soundwire-bus-objs := bus_type.o bus.o mipi_disco.o stream.o
 obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
 
+ifdef CONFIG_ACPI
+soundwire-bus-objs += slave.o
+endif
+
 #Cadence Objs
 soundwire-cadence-objs := cadence_master.o
 obj-$(CONFIG_SOUNDWIRE_CADENCE) += soundwire-cadence.o
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index f39a5815e25d..0dc188e6873b 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -60,7 +60,6 @@ static int sdw_slave_add(struct sdw_bus *bus,
 	return ret;
 }
 
-#if IS_ENABLED(CONFIG_ACPI)
 /*
  * sdw_acpi_find_slaves() - Find Slave devices in Master ACPI node
  * @bus: SDW bus instance
@@ -110,5 +109,3 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
 
 	return 0;
 }
-
-#endif
-- 
2.23.0.rc2

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
