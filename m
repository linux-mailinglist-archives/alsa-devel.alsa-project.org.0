Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7480176C5A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 17:07:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6A23202F;
	Fri, 26 Jul 2019 17:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6A23202F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564153643;
	bh=Ks0LOzDj+Tc2mBv0cpxzAdfg9lcEkdYD5ShGgxnRddM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WZujmmGifbwfQRM6WLVd5A6vjRrf23YdrqlU0EqOiC9QOpqZd/XyZEiwS9os0Qkda
	 PPgLDjVWw+UaSlsZkXye5QKCm5NAIlysk9JOijdqEbMa8nbqgZqUvvCk19DPk+hmPl
	 aMtg1Z/U3BcBUBGojp4PFihJhxJE0uT67WCr9tyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A2BF803D1;
	Fri, 26 Jul 2019 17:05:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23F82F80393; Fri, 26 Jul 2019 17:05:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=SPF_HELO_PASS,SPF_NEUTRAL,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2A67F801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 17:05:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2A67F801A4
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 95EAB18AFA;
 Fri, 26 Jul 2019 17:05:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f04B5gwHognF; Fri, 26 Jul 2019 17:05:31 +0200 (CEST)
Received: from function (dhcp-13-113.lip.ens-lyon.fr [140.77.13.113])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id DFBD318AF8;
 Fri, 26 Jul 2019 17:05:30 +0200 (CEST)
Received: from samy by function with local (Exim 4.92)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1hr1mk-0001Vd-Gv; Fri, 26 Jul 2019 17:05:30 +0200
Date: Fri, 26 Jul 2019 17:05:30 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Message-ID: <20190726150530.cibwiaohhexl5jdc@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 931507@bugs.debian.org
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 931507@bugs.debian.org
Subject: [alsa-devel] hda: Fix 1-minute detection delay when i915 module is
	not available
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Distribution installation images such as Debian include different sets
of modules which can be downloaded dynamically.  Such images may notably
include the hda sound modules but not the i915 DRM module, even if the
latter was enabled at build time, as reported on
https://bugs.debian.org/931507

In such a case hdac_i915 would be linked in and try to load the i915
module, fail since it is not there, but still wait for a whole minute
before giving up binding with it.

This fixes such as case by only waiting for the binding if the module
was properly loaded (or module support is disabled, in which case i915
is already compiled-in anyway).

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 sound/hda/hdac_i915.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -143,10 +143,14 @@ int snd_hdac_i915_init(struct hdac_bus *
 	if (!acomp)
 		return -ENODEV;
 	if (!acomp->ops) {
-		request_module("i915");
-		/* 60s timeout */
-		wait_for_completion_timeout(&bind_complete,
-					    msecs_to_jiffies(60 * 1000));
+#ifdef CONFIG_MODULES
+		if (request_module("i915") == 0)
+#endif
+		{
+			/* 60s timeout */
+			wait_for_completion_timeout(&bind_complete,
+						   msecs_to_jiffies(60 * 1000));
+		}
 	}
 	if (!acomp->ops) {
 		dev_info(bus->dev, "couldn't bind with audio component\n");
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
