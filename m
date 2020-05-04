Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF16D1C343A
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 10:19:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59C9016E7;
	Mon,  4 May 2020 10:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59C9016E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588580370;
	bh=euEAX1o30Px+iKhlixehq0ws1o/M7/R7uFMAOXmRne4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PlNSwvDJfsYCsttM4Lz8V/53ZEm6seVXpoNkM1uJMJ4U105KeS3+GO2KBVqbwQZVT
	 H9PdU0JBdzfXglgnmvj90BtORoR0WhE46RbeU4jhKdG7vEACFfto9ZoXZ44LyK2Bjt
	 9eOWmNZoy+nvLiFCFOgW7d5HiWXTZW9/Kj1+xc3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BF56F80290;
	Mon,  4 May 2020 10:17:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A4CCF8028F; Mon,  4 May 2020 10:17:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 628ADF80278
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 10:17:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 628ADF80278
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="JK15Tz10"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eafcf720000>; Mon, 04 May 2020 01:16:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 04 May 2020 01:17:02 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 04 May 2020 01:17:02 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 May
 2020 08:17:02 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 4 May 2020 08:17:02 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5eafcf7a0003>; Mon, 04 May 2020 01:17:01 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH 2/3] ALSA: hda: add member to store ratio for stripe control
Date: Mon, 4 May 2020 13:46:15 +0530
Message-ID: <1588580176-2801-3-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588580176-2801-1-git-send-email-spujar@nvidia.com>
References: <1588580176-2801-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1588580210; bh=qbzsxdHGBq2fDlJ3axAuLqANZI4+ZxwyGsOG2a287NQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=JK15Tz10z9ecQrye2vrnOS5GhNq0ik6JxOfXnzZm2YPy8IyvmBHGMaWqwZXD0h82W
 I7nDZQU81EJt43jo9y285vj4UNQ9pjaCl1po4KGIYThHPaR+nvTLtwFZtn6qPMKujm
 XFy9tZoJe3v96yv0T1RMzQtEDgDZc8suECBf5PzlzQQPPUc4D9C9+fs7UfCHg4sJ32
 ysLREkR6jk3fLFrOmChLeU+3Sdyn3467PSjkov6VwL8JzIWP6vkDqMdIJqL7en+37C
 2Ea3FOt76U74CNKAh4rVukBux7Smzd7oQzIKPlBTjOBloAzsMSmCSJHSh3ctOvH7Uj
 LxXFu81MStXjg==
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
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

Stripe control programming is governed by following formula, which is
referenced from the HD Audio specification(Revision 1.0a).
  { ((num_channels * bits_per_sample) / number of SDOs) >= 8 }

Currently above is implemented in snd_hdac_get_stream_stripe_ctl().
This patch introduces a structure member to store the default factor
of '8'. If any HW wants to use a different value, this member can be
easily updated.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 include/sound/hdaudio.h     |  3 +++
 sound/hda/hdac_controller.c | 12 ++++++++++++
 sound/hda/hdac_stream.c     |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index affedc2..d365297 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -364,6 +364,9 @@ struct hdac_bus {
 	/* link management */
 	struct list_head hlink_list;
 	bool cmd_dma_state;
+
+	/* factor used to derive STRIPE control value */
+	unsigned int sdo_limit;
 };
 
 int snd_hdac_bus_init(struct hdac_bus *bus, struct device *dev,
diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index bc4a8b6..ac15aa3 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -527,6 +527,18 @@ bool snd_hdac_bus_init_chip(struct hdac_bus *bus, bool full_reset)
 	}
 
 	bus->chip_init = true;
+
+	/*
+	 * Default value of '8' is as per the HD audio specification (Rev 1.0a).
+	 * Following relation is used to derive STRIPE control value.
+	 *  For sample rate <= 48K:
+	 *   { ((num_channels * bits_per_sample) / number of SDOs) >= 8 }
+	 *  For sample rate > 48K:
+	 *   { ((num_channels * bits_per_sample * rate/48000) /
+	 *	number of SDOs) >= 8 }
+	 */
+	bus->sdo_limit = 8;
+
 	return true;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_bus_init_chip);
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index a314b03..a38a2af 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -38,7 +38,7 @@ int snd_hdac_get_stream_stripe_ctl(struct hdac_bus *bus,
 		else
 			value = (channels * bits_per_sample) / sdo_line;
 
-		if (value >= 8)
+		if (value >= bus->sdo_limit)
 			break;
 	}
 
-- 
2.7.4

