Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E89107305
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 14:21:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A573417C9;
	Fri, 22 Nov 2019 14:21:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A573417C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574428911;
	bh=wXoJ+BkZyGD29Mbe5hYmkJIzEVenIY5+Gwqv8j4CjVM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rXMqKUam4yME908awr5Edmo3u3BXQI2oSu3E6KQl5U72T/UtjxKsjRLkHHEUux/0U
	 OL2lQCrp7TIGIbzSj7nCbDSb+z4TGOmtHsr2ZHDz/PXFb5aZ7WCakwcHBaCRkbK7om
	 5DCfuBI6U9pofkRxpQeaxIEs6FFuE6h44KcjZsqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 288ACF800EF;
	Fri, 22 Nov 2019 14:20:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 944EEF80140; Fri, 22 Nov 2019 14:20:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D491F800EF
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 14:20:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D491F800EF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 78BFEAB98
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 13:20:02 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri, 22 Nov 2019 14:20:00 +0100
Message-Id: <20191122132000.4460-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: hda - Disable audio component for legacy
	Nvidia HDMI codecs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The old Nvidia chips have multiple HD-audio codecs on the same
HD-audio controller, and this doesn't work as expected with the current
audio component binding that is implemented under the one-codec-per-
controller assumption; at the probe time, the driver leads to several
kernel WARNING messages.

For the proper support, we may change the pin2port and port2pin to
traverse the codec list per the given pin number, but this needs more
development and testing.

As a quick workaround, instead, this patch drops the binding in the
audio side for these legacy chips since the audio component support in
nouveau graphics driver is still not merged (hence it's basically
unused).

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205625
Fixes: ade49db337a9 ("ALSA: hda/hdmi - Allow audio component for AMD/ATI and Nvidia HDMI")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 55d20e40a195..9063bf88689f 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -3574,8 +3574,6 @@ static int patch_nvhdmi_legacy(struct hda_codec *codec)
 
 	codec->link_down_at_suspend = 1;
 
-	generic_acomp_init(codec, &nvhdmi_audio_ops, nvhdmi_port2pin);
-
 	return 0;
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
