Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA058C03C
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 20:14:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 237F41679;
	Tue, 13 Aug 2019 20:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 237F41679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565720043;
	bh=9lgBBwRK6fcQICu3ULO7YNi2U+WKHW/QUWkzscDS/fI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q+CqT5O0n+y/zFZWhjkwbxsJ2J8iaw00L5mRWBLsYL0Nv2nOL0e5WHGmZXqF1BYSj
	 cmIn5Qsn+FGwLRG0ch0/w1U8C3ALBw4woyms+GbYXSOvJvMWJMnY8Gb4oe5PK043CJ
	 nQQz7RNKQFeydeDR8+tMseSfHL7nO0iZqZIhOYsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 363CDF80273;
	Tue, 13 Aug 2019 20:12:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C8BBF80273; Tue, 13 Aug 2019 20:12:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A1D1F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 20:12:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A1D1F80120
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fvp7xvUo"
Received: by mail-wr1-x443.google.com with SMTP id t16so18499605wra.6
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 11:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H+HyNYqumhgzAfb6RQPcG1woV31dCtkzQNv0Z0BtjIQ=;
 b=fvp7xvUoAEO8LLtyrZs5Yi0BBIa9cTCA3g44OvUxFc8MB6V7gtoyk8ZX6aCCatQpyq
 IF3Iw296V6/hMXs8TSlQCGQ3WwORhSHmTbSmSi6ZHuSsok3Uybyi82sl93cdtM22rKIN
 vASlEhBGHPIn+XdY4eVclFBooSNxyJgKvqqmK6ahw/tygeGpSYF2HUUPMmbCuZ3Qkwvc
 bfkMW9zQ+h4/kco4b1k39AevSUtpm7x7LklvnVCj499Oss2vV6ZMnQnH4wYKTGnTvuRu
 8kOE96yIdnS03sAhIsWvw1+KY7VNksPSFI7LCZwrKfZO2spx9jZg8cZz/UMWJ/nxbqta
 q3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H+HyNYqumhgzAfb6RQPcG1woV31dCtkzQNv0Z0BtjIQ=;
 b=X0cfR8vv/Tc8OV0b7RLKAZ+S4LNzGf2gtPK2v/MzBxz5lMCs81fwjmTgVKPylVYuBk
 tdGd5yGUuVdAZ7triNfqA4yibmEDDw5kvCxkxxAYITDfhK/IcVdbk4/uLZJOLzmn4RJk
 6e90k3rD6B5pDsNAEiUNkAMBiQxoSXjmaXz1A/auBy2R2RGei+KeyvjmnGBXdI6ki21K
 gRwX40XWCnE9Cm9QObWe5hgY7TTKRdynpZ299WRqtlq4+f9IPNlvlE77aqFEqYH+cREl
 JG/iAogr7cpjhONv42PrKdkToZ95U54bsNhotYCcclsQfRrHmwwcamWJ8FKo3IqPJhM4
 fYBA==
X-Gm-Message-State: APjAAAW5yDGVMdORXqJlu+NOrvcmQh+1F84eFV2OZVDouI0rQO5WCaa+
 QnhgExDAvOMztoTGzIoYvS2A0WjdXpVGzw==
X-Google-Smtp-Source: APXvYqwjsJco2jXdMRkUTIwWS2QWhfQFiEMv9osfzl+KqkM1x4EDJWCjMdbH4r3jUxyvxr1DFQNJJA==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr28818222wrs.200.1565719932335; 
 Tue, 13 Aug 2019 11:12:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id a6sm1435050wmj.15.2019.08.13.11.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 11:12:11 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Tue, 13 Aug 2019 11:09:30 -0700
Message-Id: <20190813180929.22497-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc2
In-Reply-To: <20190813061014.45015-1-natechancellor@gmail.com>
References: <20190813061014.45015-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2] soundwire: Make slave.o depend on ACPI and
	rename to acpi_slave.o
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
two of which are static. Since slave.c is completetely dependent on
ACPI, rename it to acpi_slave.c and only compile it when CONFIG_ACPI
is set so sdw_acpi_find_slaves will actually be used. bus.h contains
a stub for sdw_acpi_find_slaves so there will be no issues with an
undefined function.

This has been build tested with CONFIG_ACPI set and unset in combination
with CONFIG_SOUNDWIRE unset, built in, and a module.

Fixes: 8676b3ca4673 ("soundwire: fix regmap dependencies and align with other serial links")
Link: https://github.com/ClangBuiltLinux/linux/issues/637
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Rename slave.o to acpi_slave.o
* Reword commit message to reflect this

 drivers/soundwire/Makefile                  | 6 +++++-
 drivers/soundwire/{slave.c => acpi_slave.c} | 3 ---
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename drivers/soundwire/{slave.c => acpi_slave.c} (98%)

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 45b7e5001653..718d8dd0ac79 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -4,9 +4,13 @@
 #
 
 #Bus Objs
-soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o
+soundwire-bus-objs := bus_type.o bus.o mipi_disco.o stream.o
 obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
 
+ifdef CONFIG_ACPI
+soundwire-bus-objs += acpi_slave.o
+endif
+
 #Cadence Objs
 soundwire-cadence-objs := cadence_master.o
 obj-$(CONFIG_SOUNDWIRE_CADENCE) += soundwire-cadence.o
diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/acpi_slave.c
similarity index 98%
rename from drivers/soundwire/slave.c
rename to drivers/soundwire/acpi_slave.c
index f39a5815e25d..0dc188e6873b 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/acpi_slave.c
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
