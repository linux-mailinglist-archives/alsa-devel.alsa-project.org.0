Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E456069DC
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 22:48:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AF3C9C21;
	Thu, 20 Oct 2022 22:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AF3C9C21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666298936;
	bh=km58EststHZeDX85X98sTFEXtW9cK7pgI/Nt6pOhyVY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BvpovBXAuRGtfHpwcT7M3L6RGs7WQm5LbzeLtZHqNBdJEEYDYlImfkCEAo/nIqd5x
	 ihPDzh23NLE0OrRB+WHU2AJsdD99rgmGvPWqsSu8kc4VaF2ePmUJU1IkHRHUWhyoP5
	 zPxV/aXHVjb6mwz1mHu6wlQf55xjO/1UH5Nk0qBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42CA0F8055A;
	Thu, 20 Oct 2022 22:47:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DCAEF80559; Thu, 20 Oct 2022 22:47:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from vps-vb.mhejs.net (vps-vb.mhejs.net [37.28.154.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCDD2F80548
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 22:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCDD2F80548
Received: from MUA by vps-vb.mhejs.net with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mail@maciej.szmigiero.name>)
 id 1olcRP-0007VS-7d; Thu, 20 Oct 2022 22:46:59 +0200
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 5/6] ALSA: ca0106: Use snd_ctl_rename() to rename a control
Date: Thu, 20 Oct 2022 22:46:25 +0200
Message-Id: <bffee980a420f9b0eee5681d2f48d34a70cec0ce.1666296963.git.maciej.szmigiero@oracle.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1666296963.git.maciej.szmigiero@oracle.com>
References: <cover.1666296963.git.maciej.szmigiero@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>

With the recent addition of hashed controls lookup it's not enough to just
update the control name field, the hash entries for the modified control
have to be updated too.

snd_ctl_rename() takes care of that, so use it instead of directly
modifying the control name.

Fixes: c27e1efb61c5 ("ALSA: control: Use xarray for faster lookups")
Cc: stable@vger.kernel.org
Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
---
 sound/pci/ca0106/ca0106_mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/ca0106/ca0106_mixer.c b/sound/pci/ca0106/ca0106_mixer.c
index 05f56015ddd87..f6381c098d4f6 100644
--- a/sound/pci/ca0106/ca0106_mixer.c
+++ b/sound/pci/ca0106/ca0106_mixer.c
@@ -720,7 +720,7 @@ static int rename_ctl(struct snd_card *card, const char *src, const char *dst)
 {
 	struct snd_kcontrol *kctl = ctl_find(card, src);
 	if (kctl) {
-		strcpy(kctl->id.name, dst);
+		snd_ctl_rename(card, kctl, dst);
 		return 0;
 	}
 	return -ENOENT;
