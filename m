Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 146D93F45E4
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 09:39:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DBF51658;
	Mon, 23 Aug 2021 09:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DBF51658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629704353;
	bh=/QhqJJBIoQfrbct361szXBdqx3VlWmzZ13jKGtK4t4I=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dBOHmDmC6Vm1JERNb4Kl1GlR5hLUigJj4dJMOipxprxmTXL9W75UT/jCR2iujxfBj
	 fVGkrZMezzJxyacBMdlbRQ4pVE5kPVgjjf/JEPbFSM6ALeypZGaWJLvsAaYXzQ7I0e
	 tbieDgqVcFV69NmyGQA6+E5bxnRdt0WKAqBtWE68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F195F80431;
	Mon, 23 Aug 2021 09:37:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B548AF80431; Mon, 23 Aug 2021 09:37:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B396FF80240
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 09:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B396FF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="RS3yLl5a"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="M1YTk5Qf"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7161C21F1E
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 07:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629704250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uOcvhwMIjjR+H5ut7BLcluqbLwnOSFpUkWEnEBXf9g0=;
 b=RS3yLl5aax98+Cb9/4MGJa4dLN9roSPS/FAP/fRSy+ucQc1fkWLzXdNGXm7rxhqs09YfJ0
 sV8H7YNHBZPXpAU6YKt1dPexAiLROQiaYMR3fLCXOWv9uYwOsPv32Avv5N9g6HWvcXaAtZ
 PsCjd1sFw26bBUZIvlsL6wot1cLviZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629704250;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uOcvhwMIjjR+H5ut7BLcluqbLwnOSFpUkWEnEBXf9g0=;
 b=M1YTk5QfJf4aVz7zwNs4Ra2usoAEUiw7fBpJE+cjVSQP5Am8rTfvjzDwKgJ+65G0RO5P8M
 mP2zNdLJdHAo6sCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 616D1A3BAE;
 Mon, 23 Aug 2021 07:37:30 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ALSA: hda: Update documentation for aliasing via the
 model option
Date: Mon, 23 Aug 2021 09:37:22 +0200
Message-Id: <20210823073722.14873-4-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210823073722.14873-1-tiwai@suse.de>
References: <20210823073722.14873-1-tiwai@suse.de>
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

The previous patch allowed user to specify the aliasing of SSID via
model option for applying a quirk.  Update the documentation
accordingly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/alsa-configuration.rst |  6 ++++++
 Documentation/sound/hd-audio/notes.rst     | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index f148b58502c0..e61edd1295fc 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -1059,6 +1059,12 @@ The model name ``generic`` is treated as a special case.  When this
 model is given, the driver uses the generic codec parser without
 "codec-patch".  It's sometimes good for testing and debugging.
 
+The model option can be used also for aliasing to another PCI or codec
+SSID.  When it's passed in the form of ``model=XXXX:YYYY`` where XXXX
+and YYYY are the sub-vendor and sub-device IDs in hex numbers,
+respectively, the driver will refer to that SSID as a reference to the
+quirk table.
+
 If the default configuration doesn't work and one of the above
 matches with your device, report it together with alsa-info.sh
 output (with ``--no-upload`` option) to kernel bugzilla or alsa-devel
diff --git a/Documentation/sound/hd-audio/notes.rst b/Documentation/sound/hd-audio/notes.rst
index cf4d7158af78..d118b6fe269b 100644
--- a/Documentation/sound/hd-audio/notes.rst
+++ b/Documentation/sound/hd-audio/notes.rst
@@ -215,6 +215,17 @@ There are a few special model option values:
 * when ``generic`` is passed, the codec-specific parser is skipped and
   only the generic parser is used.
 
+A new style for the model option that was introduced since 5.15 kernel
+is to pass the PCI or codec SSID in the form of ``model=XXXX:YYYY``
+where XXXX and YYYY are the sub-vendor and sub-device IDs in hex
+numbers, respectively.  This is a kind of aliasing to another device;
+when this form is given, the driver will refer to that SSID as a
+reference to the quirk table.  It'd be useful especially when the
+target quirk isn't listed in the model table.  For example, passing
+model=103c:8862 will apply the quirk for HP ProBook 445 G8 (which
+isn't found in the model table as of writing) as long as the device is
+handled equivalently by the same driver.
+
 
 Speaker and Headphone Output
 ----------------------------
-- 
2.26.2

