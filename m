Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2921F84B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 19:34:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 691021676;
	Tue, 14 Jul 2020 19:33:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 691021676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594748056;
	bh=oKb4OumllQwKjUUub49RDTEL4UzFGDDFuDehjgFntKA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H7glS8OyQBQigJrDQJdr707PHuisY2hg9xrNOxKJfVnPGKy8Bpbrhh6mqYkvikwtR
	 n4EkORfgilgfkGT9jSLxBstS3ZCNyejI7tfRHeiHUFbGndCyGDzRHhY3a0YmnoL9nu
	 d5BR4dZd7Q8KOg9gmRI8soCtAfPYxr+59Ebai8cc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCB7AF80317;
	Tue, 14 Jul 2020 19:27:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9506BF802F8; Tue, 14 Jul 2020 19:27:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C2C6F8027B
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 19:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C2C6F8027B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A4C7AD78
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:26:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/10] ALSA: via82xx: Replace the words whitelist
Date: Tue, 14 Jul 2020 19:26:30 +0200
Message-Id: <20200714172631.25371-10-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200714172631.25371-1-tiwai@suse.de>
References: <20200714172631.25371-1-tiwai@suse.de>
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

Follow the recent inclusive terminology guidelines and replace the
words "whitelist" appropriately.

Only comment or variable renames, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/via82xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/via82xx.c b/sound/pci/via82xx.c
index 7abd47dbfe55..154d88ce8813 100644
--- a/sound/pci/via82xx.c
+++ b/sound/pci/via82xx.c
@@ -2419,7 +2419,7 @@ static const struct via823x_info via823x_cards[] = {
  * auto detection of DXS channel supports.
  */
 
-static const struct snd_pci_quirk dxs_whitelist[] = {
+static const struct snd_pci_quirk dxs_allowlist[] = {
 	SND_PCI_QUIRK(0x1005, 0x4710, "Avance Logic Mobo", VIA_DXS_ENABLE),
 	SND_PCI_QUIRK(0x1019, 0x0996, "ESC Mobo", VIA_DXS_48K),
 	SND_PCI_QUIRK(0x1019, 0x0a81, "ECS K7VTA3 v8.0", VIA_DXS_NO_VRA),
@@ -2467,9 +2467,9 @@ static int check_dxs_list(struct pci_dev *pci, int revision)
 {
 	const struct snd_pci_quirk *w;
 
-	w = snd_pci_quirk_lookup(pci, dxs_whitelist);
+	w = snd_pci_quirk_lookup(pci, dxs_allowlist);
 	if (w) {
-		dev_dbg(&pci->dev, "DXS white list for %s found\n",
+		dev_dbg(&pci->dev, "DXS allow list for %s found\n",
 			    snd_pci_quirk_name(w));
 		return w->value;
 	}
-- 
2.16.4

