Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 318961AB28E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:35:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEED3167B;
	Wed, 15 Apr 2020 22:34:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEED3167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586982946;
	bh=9tpxc/lXAOGQkXRZXAcOhq31SJhrh/Xl1x9QvhHakgc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z3EgLunwyyRedhWAKCKuHVCchuNNXQlAA92gMONW5gopPmRxu365YNacDLrw/DW4o
	 bls3zr9XjjuXahaFWqwS05B7k04bciAxUJxzAaGfjJR3uiUbqpcg1UKszyuIop6P41
	 o3A+xGKRm8eyv5TX4pnL8ot7YBXuU4fYIIh3FgkA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46E9AF802EB;
	Wed, 15 Apr 2020 22:29:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F2C4F802A2; Wed, 15 Apr 2020 22:29:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFCB6F80292
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFCB6F80292
IronPort-SDR: OhDZLi9R0DLdZeh4nvFpOTOYUjz0v9teyBLyF/njcc9nYO2jfZq3dbptBdJueBNZeRnDoWk7GY
 l9v1N4vVFnew==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:05 -0700
IronPort-SDR: V2ycrDonV3MQwWOYHMOT6IGPZmrbHXN2Y5Egj1UIpYmhpWSVxayxuV4u2y5vQJLkgP7cTzrC8U
 xbCLt8M7dVgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656294"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:29:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/24] ASoC: SOF: change type char to uint8_t in info.h
Date: Wed, 15 Apr 2020 15:28:03 -0500
Message-Id: <20200415202816.934-12-pierre-louis.bossart@linux.intel.com>
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

Use uint8_t to replace char in packed ABI structs
to have fixed length for struct.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/info.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sound/sof/info.h b/include/sound/sof/info.h
index 162f38430958..2ef98b2fee1f 100644
--- a/include/sound/sof/info.h
+++ b/include/sound/sof/info.h
@@ -111,9 +111,9 @@ struct sof_ipc_cc_version {
 	/* reserved for future use */
 	uint32_t reserved[4];
 
-	char name[16]; /* null terminated compiler name */
-	char optim[4]; /* null terminated compiler -O flag value */
-	char desc[]; /* null terminated compiler description */
+	uint8_t name[16]; /* null terminated compiler name */
+	uint8_t optim[4]; /* null terminated compiler -O flag value */
+	uint8_t desc[]; /* null terminated compiler description */
 } __packed;
 
 /* extended data: Probe setup */
-- 
2.20.1

