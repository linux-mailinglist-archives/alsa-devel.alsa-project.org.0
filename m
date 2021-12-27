Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 284844803F9
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Dec 2021 20:06:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7B3E1743;
	Mon, 27 Dec 2021 20:05:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7B3E1743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640632000;
	bh=oxhUhvFTWeK3mUGF9MafxpL16GDYsAKol6H7Dor33hk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JH6K8g88Kwb+8ponXzg2il/xo+mVve4lJ624R6KONcnyufBUcnfD53pA921xtD2PB
	 /E1rORgaFAJiF7dOKtJ+dqz/YR0Hzak7P308jXCOdR+mIzpDwubdPBc3kHAHDY88tS
	 vXrmC6LK/xRzyhDkj9lGIfHt00aIluBL2ST8UFi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54CFCF801F5;
	Mon, 27 Dec 2021 20:04:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C567F80518; Mon, 27 Dec 2021 20:04:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 316E1F8016D
 for <alsa-devel@alsa-project.org>; Mon, 27 Dec 2021 20:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 316E1F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pGPJvksl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5487161129;
 Mon, 27 Dec 2021 19:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7625AC36AE7;
 Mon, 27 Dec 2021 19:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640631882;
 bh=oxhUhvFTWeK3mUGF9MafxpL16GDYsAKol6H7Dor33hk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pGPJvkslbC5oKAN3b28T93mLhCmgH0YSp699nNkwvyZ97sJFGwpXtV27u4gtqnAfT
 R9OVsYCcw9TkbOV4jnUwKErWpLndbCeruGBlEb1+OJIYPH2o1i9wLcgGuCyIgP0Mld
 ZoKIuuCoZ21HBmCHiiFHG8n/wmYurC0SDPNXL3EdGP044Mh5nY55OUmosSlRjU5DaL
 WgeJOu0AFVOyLRQ3++r2fwa/d/1JTVkQPqYkYO7mNKyhSzb02G+rTCPCanrXOfKgUR
 GpIqeGVdaPiTPfM05v/NRfLC3/ecs7YbIEQ5+UPj3TpqiMMC4OFgEqAPO7Qp46JC4P
 i9H2PIzIKLVXQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 24/26] ALSA: hda: intel-sdw-acpi: harden
 detection of controller
Date: Mon, 27 Dec 2021 14:03:25 -0500
Message-Id: <20211227190327.1042326-24-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211227190327.1042326-1-sashal@kernel.org>
References: <20211227190327.1042326-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, guennadi.liakhovetski@linux.intel.com,
 Takashi Iwai <tiwai@suse.de>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 tiwai@suse.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

[ Upstream commit 385f287f9853da402d94278e59f594501c1d1dad ]

The existing code currently sets a pointer to an ACPI handle before
checking that it's actually a SoundWire controller. This can lead to
issues where the graph walk continues and eventually fails, but the
pointer was set already.

This patch changes the logic so that the information provided to
the caller is set when a controller is found.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Libin Yang <libin.yang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20211221010817.23636-2-yung-chuan.liao@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/intel-sdw-acpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index c0123bc31c0dd..ba8a872a29010 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -132,8 +132,6 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 		return AE_NOT_FOUND;
 	}
 
-	info->handle = handle;
-
 	/*
 	 * On some Intel platforms, multiple children of the HDAS
 	 * device can be found, but only one of them is the SoundWire
@@ -144,6 +142,9 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle handle, u32 level,
 	if (FIELD_GET(GENMASK(31, 28), adr) != SDW_LINK_TYPE)
 		return AE_OK; /* keep going */
 
+	/* found the correct SoundWire controller */
+	info->handle = handle;
+
 	/* device found, stop namespace walk */
 	return AE_CTRL_TERMINATE;
 }
-- 
2.34.1

