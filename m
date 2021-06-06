Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C99539D03E
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jun 2021 19:46:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85DD81726;
	Sun,  6 Jun 2021 19:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85DD81726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623001583;
	bh=yUxMOU+PPPSsh3u4Cb0TxFVp4HMn/ou6rpeH9BD7Drk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OG6vDQL05jYLZwx781/a8+KnD766so6tPqQ/7Nr/4+WnapusGTd6Jz7LPg+DAaDQ7
	 P8m+QCldqZIqdWkBrQf2GNwZNGcbfFicuI6K9SemEi/7UOvNs22Y5EVYk38/hG6QFc
	 JGJ8jDvrArDJQffILdOl9mYkfnno82jv0a/5Qq+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D4BCF8019B;
	Sun,  6 Jun 2021 19:45:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C611F80256; Sun,  6 Jun 2021 19:45:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F02C5F8019B
 for <alsa-devel@alsa-project.org>; Sun,  6 Jun 2021 19:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F02C5F8019B
Received: by m.b4.vu (Postfix, from userid 1000)
 id 70D14612FB14; Mon,  7 Jun 2021 03:15:19 +0930 (ACST)
Date: Mon, 7 Jun 2021 03:15:19 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 1/8] ALSA: usb-audio: scarlett2: Remove incorrect S/PDIF
 comment
Message-ID: <9706655aeb5c357c8e7fe4f9549404013c6c86c5.1622999147.git.g@b4.vu>
References: <cover.1622999147.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1622999147.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Vladimir Sadovnikov <sadko4u@gmail.com>
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

The 18i8 Gen 2 S/PDIF outputs are available at 192kHz, unlike
the 18i20 Gen 2. Remove the comment that says otherwise.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 48cf3e1954e0..54d7ac9b0c66 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -338,10 +338,6 @@ static const struct scarlett2_device_info s18i8_gen2_info = {
 		},
 		[SCARLETT2_PORT_TYPE_SPDIF] = {
 			.id = 0x180,
-			/* S/PDIF outputs aren't available at 192kHz
-			 * but are included in the USB mux I/O
-			 * assignment message anyway
-			 */
 			.num = { 2, 2, 2, 2, 2 },
 			.src_descr = "S/PDIF %d",
 			.src_num_offset = 1,
-- 
2.31.1

