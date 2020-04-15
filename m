Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D89AC1AB296
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:38:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87F6C86E;
	Wed, 15 Apr 2020 22:37:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87F6C86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586983111;
	bh=ZvVLE6rHuMNHacWfb4ndNwVdi1scp68aUBMDvLFaGE4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dcpyUgGs6J6C9eJtWFf2T49rpR0x289B3jIjpD9zizidqW4NbLpMVJ96ekXRD/wdT
	 HVLQGaw2d4H+7jQ+YyJSWmPXQ9A69T7Q7ODaPujKL/qohEg7NBTCgTsNA6v7MaZ0Sh
	 iG+jHT04pAmSZOvsNR+gK0rpAF5BOMvvUF7Ceby8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B7A6F80307;
	Wed, 15 Apr 2020 22:29:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5FB1F802BD; Wed, 15 Apr 2020 22:29:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A93BFF8027D
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A93BFF8027D
IronPort-SDR: dQpQ4jIbnYE7RP+/m8JPwWYGEhZuFZK1vB4yNtIM3x3GIYaF6VftnjJeG9D3v9K0Du4zO5XQyo
 1GhBHfNC7JRQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:10 -0700
IronPort-SDR: CfjThzDCE6+v79qL/R7Rq8PXRYRpy7dcjiEQKXRNZsoPtGeinxkGMOfrbBQZfVlKTWV1O+EIol
 jUVFyW+0ZZ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656315"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:29:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/24] ASoC: SOF: make sof_ipc_cc_version to fixed length
Date: Wed, 15 Apr 2020 15:28:06 -0500
Message-Id: <20200415202816.934-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

From: Pan Xiuli <xiuli.pan@linux.intel.com>

Align struct sof_ipc_cc_version to firmware definition in SOF ABI 3.15.0.

The struct definition was changed due to errors in FW build.
The Cadence XCC compiler produces incorrect linkage section sizes, when a
variable length array is used in the compiler version struct. The firmware
definition was changed to a fixed 32 byte compiler description string.
This length covers all released firmware binaries and thus only a minor
ABI change is needed.

As the same structure is used in IPC messages between driver and firmware,
the kernel needs to be aligned to firmware change.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/info.h     | 2 +-
 include/uapi/sound/sof/abi.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/info.h b/include/sound/sof/info.h
index 2ef98b2fee1f..d5eff3179a39 100644
--- a/include/sound/sof/info.h
+++ b/include/sound/sof/info.h
@@ -113,7 +113,7 @@ struct sof_ipc_cc_version {
 
 	uint8_t name[16]; /* null terminated compiler name */
 	uint8_t optim[4]; /* null terminated compiler -O flag value */
-	uint8_t desc[]; /* null terminated compiler description */
+	uint8_t desc[32]; /* null terminated compiler description */
 } __packed;
 
 /* extended data: Probe setup */
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index e0fa2939d49c..6c802a2386ef 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 14
+#define SOF_ABI_MINOR 15
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
-- 
2.20.1

