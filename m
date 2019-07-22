Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7925C6FFBE
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:34:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12149178A;
	Mon, 22 Jul 2019 14:33:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12149178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563798887;
	bh=y8tbjIB3iuZLubziNQJkdkzYdetWHg5vus3jXlcLoeI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UL/DacmPSKl3v7BJKLr3wu3h7HSdBSpUiNvviAbrRlHUArSCa1bAKN0EtDS1GnOxD
	 3BbhZmkxykIQywLTelX9H2D/hK5Sp/V0D1QGhq9z28e0YKEc0KUXk4YViCPiMTOW6P
	 V4n01SohqX+43GwAYnlQty39p8wJ7XXFD/9kgMEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23543F8065C;
	Mon, 22 Jul 2019 14:22:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C7B0F803D1; Mon, 22 Jul 2019 14:22:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6802FF80483
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6802FF80483
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="C49o/KLa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=4wnoQnjXvnfh9OuN8zDIKomjeOlWzLxv+ayQyClMX1Y=; b=C49o/KLa+cBx
 z9v6ErUOQkKoAXf7+/wQSZeiJAc6RR70z6iypfbsWyScVddB/Qh7fZPu3kOx0goMiU1CfOxCDgpEQ
 ogC8dkhjglMUjfxQl84RgiC4PKpfG2w1zKqCGkmkN78xY7DB/8tDmd3Jna4phltvYsIumogdw9Wfk
 f6spc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpXKU-0007dj-Gq; Mon, 22 Jul 2019 12:22:10 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DB22327416CB; Mon, 22 Jul 2019 13:22:09 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
In-Reply-To: <20190721142308.30306-1-yamada.masahiro@socionext.com>
X-Patchwork-Hint: ignore
Message-Id: <20190722122209.DB22327416CB@ypsilon.sirena.org.uk>
Date: Mon, 22 Jul 2019 13:22:09 +0100 (BST)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: use __u32 instead of uint32_t in
	uapi headers" to the asoc tree
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6863307686484602472=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============6863307686484602472==
Content-Type: text/plain

The patch

   ASoC: SOF: use __u32 instead of uint32_t in uapi headers

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 62ec3d13601bd626ca7a0edef6d45dbb753d94e8 Mon Sep 17 00:00:00 2001
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 21 Jul 2019 23:23:08 +0900
Subject: [PATCH] ASoC: SOF: use __u32 instead of uint32_t in uapi headers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When CONFIG_UAPI_HEADER_TEST=y, exported headers are compile-tested to
make sure they can be included from user-space.

Currently, header.h and fw.h are excluded from the test coverage.
To make them join the compile-test, we need to fix the build errors
attached below.

For a case like this, we decided to use __u{8,16,32,64} variable types
in this discussion:

  https://lkml.org/lkml/2019/6/5/18

Build log:

  CC      usr/include/sound/sof/header.h.s
  CC      usr/include/sound/sof/fw.h.s
In file included from <command-line>:32:0:
./usr/include/sound/sof/header.h:19:2: error: unknown type name ‘uint32_t’
  uint32_t magic;  /**< 'S', 'O', 'F', '\0' */
  ^~~~~~~~
./usr/include/sound/sof/header.h:20:2: error: unknown type name ‘uint32_t’
  uint32_t type;  /**< component specific type */
  ^~~~~~~~
./usr/include/sound/sof/header.h:21:2: error: unknown type name ‘uint32_t’
  uint32_t size;  /**< size in bytes of data excl. this struct */
  ^~~~~~~~
./usr/include/sound/sof/header.h:22:2: error: unknown type name ‘uint32_t’
  uint32_t abi;  /**< SOF ABI version */
  ^~~~~~~~
./usr/include/sound/sof/header.h:23:2: error: unknown type name ‘uint32_t’
  uint32_t reserved[4]; /**< reserved for future use */
  ^~~~~~~~
./usr/include/sound/sof/header.h:24:2: error: unknown type name ‘uint32_t’
  uint32_t data[0]; /**< Component data - opaque to core */
  ^~~~~~~~
In file included from <command-line>:32:0:
./usr/include/sound/sof/fw.h:49:2: error: unknown type name ‘uint32_t’
  uint32_t size;  /* bytes minus this header */
  ^~~~~~~~
./usr/include/sound/sof/fw.h:50:2: error: unknown type name ‘uint32_t’
  uint32_t offset; /* offset from base */
  ^~~~~~~~
./usr/include/sound/sof/fw.h:64:2: error: unknown type name ‘uint32_t’
  uint32_t size;  /* bytes minus this header */
  ^~~~~~~~
./usr/include/sound/sof/fw.h:65:2: error: unknown type name ‘uint32_t’
  uint32_t num_blocks; /* number of blocks */
  ^~~~~~~~
./usr/include/sound/sof/fw.h:73:2: error: unknown type name ‘uint32_t’
  uint32_t file_size; /* size of file minus this header */
  ^~~~~~~~
./usr/include/sound/sof/fw.h:74:2: error: unknown type name ‘uint32_t’
  uint32_t num_modules; /* number of modules */
  ^~~~~~~~
./usr/include/sound/sof/fw.h:75:2: error: unknown type name ‘uint32_t’
  uint32_t abi;  /* version of header format */
  ^~~~~~~~

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Link: https://lore.kernel.org/r/20190721142308.30306-1-yamada.masahiro@socionext.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/uapi/sound/sof/fw.h     | 16 +++++++++-------
 include/uapi/sound/sof/header.h | 14 ++++++++------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/include/uapi/sound/sof/fw.h b/include/uapi/sound/sof/fw.h
index 1afca973eb09..e9f697467a86 100644
--- a/include/uapi/sound/sof/fw.h
+++ b/include/uapi/sound/sof/fw.h
@@ -13,6 +13,8 @@
 #ifndef __INCLUDE_UAPI_SOF_FW_H__
 #define __INCLUDE_UAPI_SOF_FW_H__
 
+#include <linux/types.h>
+
 #define SND_SOF_FW_SIG_SIZE	4
 #define SND_SOF_FW_ABI		1
 #define SND_SOF_FW_SIG		"Reef"
@@ -46,8 +48,8 @@ enum snd_sof_fw_blk_type {
 
 struct snd_sof_blk_hdr {
 	enum snd_sof_fw_blk_type type;
-	uint32_t size;		/* bytes minus this header */
-	uint32_t offset;	/* offset from base */
+	__u32 size;		/* bytes minus this header */
+	__u32 offset;		/* offset from base */
 } __packed;
 
 /*
@@ -61,8 +63,8 @@ enum snd_sof_fw_mod_type {
 
 struct snd_sof_mod_hdr {
 	enum snd_sof_fw_mod_type type;
-	uint32_t size;		/* bytes minus this header */
-	uint32_t num_blocks;	/* number of blocks */
+	__u32 size;		/* bytes minus this header */
+	__u32 num_blocks;	/* number of blocks */
 } __packed;
 
 /*
@@ -70,9 +72,9 @@ struct snd_sof_mod_hdr {
  */
 struct snd_sof_fw_header {
 	unsigned char sig[SND_SOF_FW_SIG_SIZE]; /* "Reef" */
-	uint32_t file_size;	/* size of file minus this header */
-	uint32_t num_modules;	/* number of modules */
-	uint32_t abi;		/* version of header format */
+	__u32 file_size;	/* size of file minus this header */
+	__u32 num_modules;	/* number of modules */
+	__u32 abi;		/* version of header format */
 } __packed;
 
 #endif
diff --git a/include/uapi/sound/sof/header.h b/include/uapi/sound/sof/header.h
index 7868990b0d6f..5f4518e7a972 100644
--- a/include/uapi/sound/sof/header.h
+++ b/include/uapi/sound/sof/header.h
@@ -9,6 +9,8 @@
 #ifndef __INCLUDE_UAPI_SOUND_SOF_USER_HEADER_H__
 #define __INCLUDE_UAPI_SOUND_SOF_USER_HEADER_H__
 
+#include <linux/types.h>
+
 /*
  * Header for all non IPC ABI data.
  *
@@ -16,12 +18,12 @@
  * Used by any bespoke component data structures or binary blobs.
  */
 struct sof_abi_hdr {
-	uint32_t magic;		/**< 'S', 'O', 'F', '\0' */
-	uint32_t type;		/**< component specific type */
-	uint32_t size;		/**< size in bytes of data excl. this struct */
-	uint32_t abi;		/**< SOF ABI version */
-	uint32_t reserved[4];	/**< reserved for future use */
-	uint32_t data[0];	/**< Component data - opaque to core */
+	__u32 magic;		/**< 'S', 'O', 'F', '\0' */
+	__u32 type;		/**< component specific type */
+	__u32 size;		/**< size in bytes of data excl. this struct */
+	__u32 abi;		/**< SOF ABI version */
+	__u32 reserved[4];	/**< reserved for future use */
+	__u32 data[0];		/**< Component data - opaque to core */
 }  __packed;
 
 #endif
-- 
2.20.1


--===============6863307686484602472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6863307686484602472==--
