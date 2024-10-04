Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0BA990B22
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2024 20:23:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3B3B86E;
	Fri,  4 Oct 2024 20:23:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3B3B86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728066201;
	bh=Gce2tJSrY6NSysKhzi+wgb+psFG3TpJppphDMZmKAUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vUVkvcIk7Wc9kgE20OHoLNepkyq1sywrOtV61e3LuSbqXeBdUWBbu/JRzcKtUDyaP
	 imYVhI0i3/csPW11DZ4nEJ01LsdJribpbs0BlJhaEsDuE+7GogGUZYOfWiosNyKGyZ
	 Rks/A1UU/Tv1BSqCOpMhwm0KKIm054WZ/OSXi39o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB9D9F805BE; Fri,  4 Oct 2024 20:22:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1970CF800C9;
	Fri,  4 Oct 2024 20:22:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EBE7F80517; Fri,  4 Oct 2024 20:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 348C1F800C9
	for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2024 20:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 348C1F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bZz2cy8G
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 985EDA44CC1;
	Fri,  4 Oct 2024 18:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B18C4CED0;
	Fri,  4 Oct 2024 18:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066160;
	bh=Gce2tJSrY6NSysKhzi+wgb+psFG3TpJppphDMZmKAUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bZz2cy8G4yA7d5puaQRtCAcn426XLO03MDNGlD21b8OIEuJerf0Tu/4RS2jeV+ldn
	 NZ9K/AvzPsC6tAydzogcDrSShDVJJkBjjcPmsehsbtwN/XDuHq5aXCJq8bW6C/GlMo
	 NUaPYZWYRV+Xh+09e+eeLo6OwQENONIRw3ZfidzYyDDGwhCqdU0bV2wUY408s1lLt8
	 KURo3ON7XxD3iWpap6qh7YA6gaDcZSG3vxYmJy4T1O8TK28twTsz4mQ5/VWC9pOktT
	 zsAm8chHpDYSn/P9Cjety1ra3IedaPMy4IFU8DkAS+b1K95e0Y/6I7/LtZuJnsGZLy
	 Ka3CvDj32cz0g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.10 22/70] soundwire: intel_bus_common: enable
 interrupts before exiting reset
Date: Fri,  4 Oct 2024 14:20:20 -0400
Message-ID: <20241004182200.3670903-22-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182200.3670903-1-sashal@kernel.org>
References: <20241004182200.3670903-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.13
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VAZZ5GNAJOPV4C4UYA43VUGMN54MBDCW
X-Message-ID-Hash: VAZZ5GNAJOPV4C4UYA43VUGMN54MBDCW
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VAZZ5GNAJOPV4C4UYA43VUGMN54MBDCW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 5aedb8d8336b0a0421b58ca27d1b572aa6695b5b ]

The existing code enables the Cadence IP interrupts after the bus
reset sequence. The problem with this sequence is that it might be
pre-empted, giving SoundWire devices time to sync and report as
ATTACHED before the interrupts are enabled. In that case, the Cadence
IP will not detect a state change and will not throw an interrupt to
proceed with the enumeration of a Device0.

In our overnight stress tests, we observed that a slight
sub-millisecond delay in enabling interrupts after the reset was
correlated with detection failures. This problem is more prevalent on
the LunarLake silicon, likely due to SOC integration changes, but it
was observed on earlier generations as well.

This patch reverts the sequence, with the interrupts enabled before
performing the bus reset. This removes the race condition and makes
sure the Cadence IP is able to detect the presence of a Device0 in all
cases.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20240805115003.88035-1-yung-chuan.liao@linux.intel.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/intel_bus_common.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/intel_bus_common.c b/drivers/soundwire/intel_bus_common.c
index e5ac3cc7cb79b..179aa0d85951b 100644
--- a/drivers/soundwire/intel_bus_common.c
+++ b/drivers/soundwire/intel_bus_common.c
@@ -45,15 +45,15 @@ int intel_start_bus(struct sdw_intel *sdw)
 		return ret;
 	}
 
-	ret = sdw_cdns_exit_reset(cdns);
+	ret = sdw_cdns_enable_interrupt(cdns, true);
 	if (ret < 0) {
-		dev_err(dev, "%s: unable to exit bus reset sequence: %d\n", __func__, ret);
+		dev_err(dev, "%s: cannot enable interrupts: %d\n", __func__, ret);
 		return ret;
 	}
 
-	ret = sdw_cdns_enable_interrupt(cdns, true);
+	ret = sdw_cdns_exit_reset(cdns);
 	if (ret < 0) {
-		dev_err(dev, "%s: cannot enable interrupts: %d\n", __func__, ret);
+		dev_err(dev, "%s: unable to exit bus reset sequence: %d\n", __func__, ret);
 		return ret;
 	}
 
@@ -136,15 +136,15 @@ int intel_start_bus_after_reset(struct sdw_intel *sdw)
 			return ret;
 		}
 
-		ret = sdw_cdns_exit_reset(cdns);
+		ret = sdw_cdns_enable_interrupt(cdns, true);
 		if (ret < 0) {
-			dev_err(dev, "unable to exit bus reset sequence during resume\n");
+			dev_err(dev, "cannot enable interrupts during resume\n");
 			return ret;
 		}
 
-		ret = sdw_cdns_enable_interrupt(cdns, true);
+		ret = sdw_cdns_exit_reset(cdns);
 		if (ret < 0) {
-			dev_err(dev, "cannot enable interrupts during resume\n");
+			dev_err(dev, "unable to exit bus reset sequence during resume\n");
 			return ret;
 		}
 
-- 
2.43.0

