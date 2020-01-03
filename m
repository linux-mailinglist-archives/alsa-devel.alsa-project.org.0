Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E86D12F581
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:32:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF1EE16F3;
	Fri,  3 Jan 2020 09:31:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF1EE16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040347;
	bh=ohlQA5VRGsFdMjSOk72uuQAzBSFMlq/65UPLP8aGBvU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ARo41NeVqFVi/yxm63hmpr/pd2Hd79FhQnPVzrSdgS4i+CcF+yGCLwCLaTbPklV8S
	 7ZNf8DMuGmOS/LA8tNcT7JLCj5+E8kHsK9I+0W6t/Ra7vNwIWBFwbblHhxFC9pmjNQ
	 DBhQVNRTE+AVNv2/9Qvxx78GJXOkbWyEEs5LmreY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C262F80385;
	Fri,  3 Jan 2020 09:18:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B707BF80340; Fri,  3 Jan 2020 09:17:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B94BCF8027C
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B94BCF8027C
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BD0F7B26C
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:20 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:40 +0100
Message-Id: <20200103081714.9560-25-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 24/58] ALSA: arm: Constify snd_ac97_bus_ops
	definitions
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

Now snd_ac97_bus() takes the const ops pointer, so we can define the
snd_ac97_bus_ops locally as const as well for further optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/arm/aaci.c        | 2 +-
 sound/arm/pxa2xx-ac97.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
index d1b5dbcd9e87..d663bd7adae6 100644
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -811,7 +811,7 @@ static const struct ac97_pcm ac97_defs[] = {
 	}
 };
 
-static struct snd_ac97_bus_ops aaci_bus_ops = {
+static const struct snd_ac97_bus_ops aaci_bus_ops = {
 	.write	= aaci_ac97_write,
 	.read	= aaci_ac97_read,
 };
diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index 08ae55166890..ea8e233150c8 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -52,7 +52,7 @@ static void pxa2xx_ac97_legacy_write(struct snd_ac97 *ac97,
 	ret = pxa2xx_ac97_write(ac97->num, reg, val);
 }
 
-static struct snd_ac97_bus_ops pxa2xx_ac97_ops = {
+static const struct snd_ac97_bus_ops pxa2xx_ac97_ops = {
 	.read	= pxa2xx_ac97_legacy_read,
 	.write	= pxa2xx_ac97_legacy_write,
 	.reset	= pxa2xx_ac97_legacy_reset,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
