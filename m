Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEAE211313
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 20:50:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10E021681;
	Wed,  1 Jul 2020 20:49:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10E021681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593629416;
	bh=pnVDGoefEjU4pu9F3HhJUGLcZWdk60FyX2OUE9IxVR8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WxbLa7Fk30WQSIJbn2w8w5GkEQ/yzrC2+0MnxJuPnXweQ8Yvw8qE0uzPgJJ/FU+ws
	 WJufH5MeKQpG3FvgtKWe3jeAgt1brnOOT8ZcWieKNUzUWGYwhKF0NLHRvbGp3eto6y
	 Sq06tKfE22uWvb4X8XKi/F/IB/etjhLELngiQU+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3960EF800EA;
	Wed,  1 Jul 2020 20:48:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20E16F8020C; Wed,  1 Jul 2020 20:48:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A41F6F800C1
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 20:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A41F6F800C1
IronPort-SDR: gdRwxdhyaLpG3FAelGA4P5BwqApPxPOxFAtMIkazG4Uri2BS3PWF1uSYAVdMc4m+snVcpCKKGb
 6tyRPseTnv+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="164712611"
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="164712611"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:48:23 -0700
IronPort-SDR: aSOCtV9x7MtfgKy7FttALCYlGfxY+1d1G77RWRwld9EfTil8Yrcw78qevyCTXLpqDqAXgeckqj
 Ms7uQDMvClWQ==
X-IronPort-AV: E=Sophos;i="5.75,301,1589266800"; d="scan'208";a="455207787"
Received: from sawhitac-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.111.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 11:48:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] riscv: asm/gdb_xml.h: use __maybe_used to make W=1 warnings
 go away
Date: Wed,  1 Jul 2020 13:47:49 -0500
Message-Id: <20200701184751.84008-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Albert Ou <aou@eecs.berkeley.edu>, kernel test robot <lkp@intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>, broonie@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
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

0day/kbuild reports warnings with the ASoC codecs compiled with W=1.

In file included from arch/riscv/include/asm/kgdb.h:109,
                 from include/linux/kgdb.h:20,
                 from include/linux/fb.h:5,
                 from include/drm/drm_crtc.h:31,
                 from sound/soc/codecs/hdmi-codec.c:19:

arch/riscv/include/asm/gdb_xml.h:23:19: warning:
'riscv_gdb_stub_cpuxml' defined but not used [-Wunused-const-variable=]
   23 | static const char riscv_gdb_stub_cpuxml[2048] =
      |                   ^~~~~~~~~~~~~~~~~~~~~
arch/riscv/include/asm/gdb_xml.h:16:19: warning:
'riscv_gdb_stub_target_desc' defined but not used [-Wunused-const-variable=]
   16 | static const char riscv_gdb_stub_target_desc[256] =
      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
arch/riscv/include/asm/gdb_xml.h:13:19: warning:
'gdb_xfer_read_cpuxml' defined but not used [-Wunused-const-variable=]
   13 | static const char gdb_xfer_read_cpuxml[39] =
      |                   ^~~~~~~~~~~~~~~~~~~~
arch/riscv/include/asm/gdb_xml.h:10:19: warning:
'gdb_xfer_read_target' defined but not used [-Wunused-const-variable=]
   10 | static const char gdb_xfer_read_target[31] = "qXfer:features:read:target.xml:";
      |                   ^~~~~~~~~~~~~~~~~~~~
arch/riscv/include/asm/gdb_xml.h:7:19: warning:
'riscv_gdb_stub_feature' defined but not used [-Wunused-const-variable=]
    7 | static const char riscv_gdb_stub_feature[64] =
      |                   ^~~~~~~~~~~~~~~~~~~~~~

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---

I don't know if this is the right way of solving this issue but this
error is now consistently thrown in kbuild compile-test reports w/
W=1.

 arch/riscv/include/asm/gdb_xml.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/gdb_xml.h b/arch/riscv/include/asm/gdb_xml.h
index 041b45f5b997..c28fc1a1d230 100644
--- a/arch/riscv/include/asm/gdb_xml.h
+++ b/arch/riscv/include/asm/gdb_xml.h
@@ -4,23 +4,23 @@
 #define __ASM_GDB_XML_H_
 
 #define kgdb_arch_gdb_stub_feature riscv_gdb_stub_feature
-static const char riscv_gdb_stub_feature[64] =
+static __maybe_unused const char riscv_gdb_stub_feature[64] =
 			"PacketSize=800;qXfer:features:read+;";
 
-static const char gdb_xfer_read_target[31] = "qXfer:features:read:target.xml:";
+static __maybe_unused const char gdb_xfer_read_target[31] = "qXfer:features:read:target.xml:";
 
 #ifdef CONFIG_64BIT
-static const char gdb_xfer_read_cpuxml[39] =
+static __maybe_unused const char gdb_xfer_read_cpuxml[39] =
 			"qXfer:features:read:riscv-64bit-cpu.xml";
 
-static const char riscv_gdb_stub_target_desc[256] =
+static __maybe_unused const char riscv_gdb_stub_target_desc[256] =
 "l<?xml version=\"1.0\"?>"
 "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">"
 "<target>"
 "<xi:include href=\"riscv-64bit-cpu.xml\"/>"
 "</target>";
 
-static const char riscv_gdb_stub_cpuxml[2048] =
+static __maybe_unused const char riscv_gdb_stub_cpuxml[2048] =
 "l<?xml version=\"1.0\"?>"
 "<!DOCTYPE feature SYSTEM \"gdb-target.dtd\">"
 "<feature name=\"org.gnu.gdb.riscv.cpu\">"
-- 
2.25.1

