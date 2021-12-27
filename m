Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4BA48040A
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Dec 2021 20:06:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC6A1176B;
	Mon, 27 Dec 2021 20:06:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC6A1176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640632014;
	bh=b3Xj1hsvYvx7YeGTfGNEKNSU4PO1BelsYqOh4/01pZw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DbT4MhAlpCRHTFCVqsnGFcOTBB8Ltmp3Hhw9fm0wTjDlsQrsBq5kUeJjwN14778kR
	 hSgVqyAv6WK3DstEnlz3wVipeRU7sCWx3VZLmBzc1XZ52XOPy8nuTkEg5IkbB+eAoh
	 qifqmB5F/fMnzSfo4b7OZXtazELM9ckjQ3GRgSCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC0ADF8051D;
	Mon, 27 Dec 2021 20:05:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 274A5F8051F; Mon, 27 Dec 2021 20:04:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70389F8019D
 for <alsa-devel@alsa-project.org>; Mon, 27 Dec 2021 20:04:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70389F8019D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hd99dl9y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4D84DB8113A;
 Mon, 27 Dec 2021 19:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01EAEC36AE7;
 Mon, 27 Dec 2021 19:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640631888;
 bh=b3Xj1hsvYvx7YeGTfGNEKNSU4PO1BelsYqOh4/01pZw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hd99dl9y/mHOQxXbZtAU8jL9fQw6ZgDVcKVUc1594+sN6cNGCg4Zwtsxxsfd5kcsl
 o3zIzTHlZ2qIDzhCCfsrekrbgTfO5BhDQKFWTV5MAOSN+WiWaWYEacDN5/tzXmrJ4h
 U0o7La2i4wOdIrx1OyjPFKEQooZeuO7M/cgtv03BY/q2yu7I1rHAw7cGnCuekq0E0A
 nO2jgIhyzJqlbA5AM6JEz7f4SmBYDrtijH4qpzNxcWHfG9zZrfXCfP7DgKP5zUZhjS
 lz8neUa1LGRTNdZNgJnRESTyGBJAvPV8dLKn7ceHlRd13fTKWSRunrfSYnYzgNNHfo
 xVScgewZk3jXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 25/26] ALSA: hda: intel-sdw-acpi: go through HDAS
 ACPI at max depth of 2
Date: Mon, 27 Dec 2021 14:03:26 -0500
Message-Id: <20211227190327.1042326-25-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211227190327.1042326-1-sashal@kernel.org>
References: <20211227190327.1042326-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 tiwai@suse.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Libin Yang <libin.yang@intel.com>

[ Upstream commit 78ea40efb48e978756db2ce45fcfa55bac056b91 ]

In the HDAS ACPI scope, the SoundWire may not be the direct child of HDAS.
It needs to go through the ACPI table at max depth of 2 to find the
SoundWire device from HDAS.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20211221010817.23636-3-yung-chuan.liao@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/intel-sdw-acpi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index ba8a872a29010..b7758dbe23714 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -165,8 +165,14 @@ int sdw_intel_acpi_scan(acpi_handle *parent_handle,
 	acpi_status status;
 
 	info->handle = NULL;
+	/*
+	 * In the HDAS ACPI scope, 'SNDW' may be either the child of
+	 * 'HDAS' or the grandchild of 'HDAS'. So let's go through
+	 * the ACPI from 'HDAS' at max depth of 2 to find the 'SNDW'
+	 * device.
+	 */
 	status = acpi_walk_namespace(ACPI_TYPE_DEVICE,
-				     parent_handle, 1,
+				     parent_handle, 2,
 				     sdw_intel_acpi_cb,
 				     NULL, info, NULL);
 	if (ACPI_FAILURE(status) || info->handle == NULL)
-- 
2.34.1

