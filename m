Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 038E43F49E9
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 13:36:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DC7C84A;
	Mon, 23 Aug 2021 13:36:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DC7C84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629718613;
	bh=cdeESgKNzmb+McgfJPH+U08M9GYibUmlrM+nkUemB2A=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FW8d3cIhDBTmjakw+W4HNUbVFI7bQfck69Z38UxvopUnQ5BE5LLeHubTi+PXKDunk
	 QUZ5yAtVjsjdNTP4K1Gi+rCgVG5xRLuoZxJ9W8P6L64dXLI0lFmCEj3WNxayvxjhWF
	 SVcB6mveV/FlpQUPVK7qfjpAlQ4nhcNgvgZpfoHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2F95F800B6;
	Mon, 23 Aug 2021 13:35:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 072D8F80217; Mon, 23 Aug 2021 13:35:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A247F8016E
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 13:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A247F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="P14dz1QL"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="5jcuor3M"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8400521F76
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 11:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629718519; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IkoMaDLPDkJ1s5a9SnemkjhE0hddmYiStim0O0HgEK0=;
 b=P14dz1QLdOm/MMJN5Cz7ytcs1PAfMOdJ2Sc2PiMW5EeVpg647yp1Y5Z6/nuriHoOnhDj+e
 wPI7H3Hjw+QrvtmO2PAZq8CTitsClSLngsxFXLJ5/x9+AZ1jABB2HW54nOlQfFocC9dLPp
 +PhNGUf4Sefrqxr2lCku/4QFW5cAZ/o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629718519;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=IkoMaDLPDkJ1s5a9SnemkjhE0hddmYiStim0O0HgEK0=;
 b=5jcuor3Mi/WfhAmTV/8aiwdig7oCSrPRRTBg9j+1uF/ssdVSBgRng/Ysy4Ol4p2Fu8+q0y
 o9R44LxEHd+aomBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 73E5CA3BB2;
 Mon, 23 Aug 2021 11:35:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: doc: Fix indentation warning
Date: Mon, 23 Aug 2021 13:35:18 +0200
Message-Id: <20210823113518.30134-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Fix a trivial warning for the indentation by putting an empty line:
  Documentation/sound/alsa-configuration.rst:2258: WARNING: Unexpected indentation.

Fixes: a39978ed6df1 ("ALSA: doc: Add the description of quirk_flags option for snd-usb-audio")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/alsa-configuration.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index e61edd1295fc..e3c33b8d6d78 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2261,6 +2261,7 @@ delayed_register
 quirk_flags
     Contains the bit flags for various device specific workarounds.
     Applied to the corresponding card index.
+
         * bit 0: Skip reading sample rate for devices
         * bit 1: Create Media Controller API entries
         * bit 2: Allow alignment on audio sub-slot at transfer
-- 
2.31.1

