Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B5E1FD265
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 18:41:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AB8D1679;
	Wed, 17 Jun 2020 18:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AB8D1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592412079;
	bh=zJFu9vR6BlUbWdUn5AZGed9ZzSTneQXZZr7us5eaZrE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eKYPd+5Hde5VpCcy71fJPHr2pJsdZtV4EQv33BOGo88b8vjvyjSYjQ1E7LUG+wbrK
	 PM4pZ5RqSlad7cQ3fxVm5JOHjZMUQu2lsDeI/DBdyZ3qYwKqDhYntmpMfc2glk6nSF
	 DhmEVehi1d6Xo3Oy44idXkuRw+ah/udm3tCUjeFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A8E1F800EF;
	Wed, 17 Jun 2020 18:39:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10C34F80171; Wed, 17 Jun 2020 18:39:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E726F800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 18:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E726F800EF
IronPort-SDR: TUCJAzUsKwWJgMdQNfmX96zlLdB0euK0MQbUSDqeJirqzc1OIpKhGnbdVcBGYf/oyDA7vLJiAD
 ZeIepzefND9Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 09:39:30 -0700
IronPort-SDR: IwJt8IVIlsSKjZf5pZBRSBYupg3zeibMExm2K4AEJ+eEuqx4P9HJDgRLj75QksXcIwKf52kiKD
 Cr3kMPhz4mpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="309531624"
Received: from zdsmith-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.128])
 by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2020 09:39:29 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] regmap: fix memory leak with map->patch
Date: Wed, 17 Jun 2020 11:39:00 -0500
Message-Id: <20200617163900.17674-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

kmemleak throws the following error on devices using
regmap_register_patch().  map->patch is allocated dynamically with
krealloc() but never freed.

root@Zotac:~/kmod# cat /sys/kernel/debug/kmemleak
unreferenced object 0xffff8880641c4e08 (size 96):
  comm "systemd-udevd", pid 266, jiffies 4294736541 (age 414.914s)
  hex dump (first 32 bytes):
    3d 01 00 00 00 36 00 00 00 00 00 00 12 01 00 00  =....6..........
    a8 0a 00 00 00 00 00 00 14 01 00 00 aa 0a 00 00  ................
  backtrace:
    [<00000000f2841faf>] krealloc+0x63/0xc0
    [<00000000ed643fb3>] regmap_register_patch+0x68/0x1d0
    [<000000001806a5c3>] 0xffffffffc088a5f9
    [<00000000f4781e26>] i2c_device_probe+0x462/0x4b0
    [<000000009dd7f5f4>] really_probe+0x17f/0x520
    [<00000000be42920d>] driver_probe_device+0x114/0x170
    [<00000000e5840d3f>] device_driver_attach+0x82/0x90
    [<0000000027828801>] __driver_attach+0xa9/0x190
    [<0000000085195e73>] bus_for_each_dev+0xe1/0x140
    [<0000000070edb38c>] bus_add_driver+0x224/0x2e0
    [<000000002d41b24a>] driver_register+0xd3/0x150
    [<0000000055dbb3fb>] i2c_register_driver+0x6b/0xd0
    [<00000000bf84b954>] do_one_initcall+0x86/0x2a0
    [<000000001d939871>] do_init_module+0xf8/0x350
    [<00000000267b474f>] load_module+0x41a9/0x44c0
    [<000000007d8014dc>] __do_sys_finit_module+0x121/0x1b0

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/base/regmap/regmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index c472f624382d..46f4b6322e47 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1357,6 +1357,7 @@ void regmap_exit(struct regmap *map)
 	if (map->hwlock)
 		hwspin_lock_free(map->hwlock);
 	kfree_const(map->name);
+	kfree(map->patch);
 	kfree(map);
 }
 EXPORT_SYMBOL_GPL(regmap_exit);
-- 
2.20.1

