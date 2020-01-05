Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A4F130886
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:03:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2E4117B3;
	Sun,  5 Jan 2020 16:03:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2E4117B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236630;
	bh=DJXOSjGEBYAuAMSKY5A4+jM2Qypu+tpjKpk5eWoo3pM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oWKQgyzaYG3V9PCNOLCY8jnTkLdu+kZPEvYoAnbHSU8Vc4vW+qPvaT9E8Ualwtbnf
	 qVTBrl2iUtrBkG0Qn5v66TtM2CTVqwJMGsbqf6/sjCGY5s7x58Q1jKGkL1cgJfN6xp
	 w28e3GatMnZIj0xyYjq9gFu2n3Ym86zOrvZ7cKmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4FF9F80394;
	Sun,  5 Jan 2020 15:49:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E42ECF8033F; Sun,  5 Jan 2020 15:49:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6D45F80278
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6D45F80278
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 89024B1DD
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:33 +0100
Message-Id: <20200105144823.29547-19-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 18/68] ALSA: hdsp: More constifications
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

Apply const prefix to each channel map table and its callers.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdsp.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 632f7878ff3e..ba2a47dd384c 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -479,7 +479,7 @@ struct hdsp {
 	pid_t                 playback_pid;
 	int                   running;
 	int                   system_sample_rate;
-	char                 *channel_map;
+	const char           *channel_map;
 	int                   dev;
 	int                   irq;
 	unsigned long         port;
@@ -501,12 +501,12 @@ struct hdsp {
    where the data for that channel can be read/written from/to.
 */
 
-static char channel_map_df_ss[HDSP_MAX_CHANNELS] = {
+static const char channel_map_df_ss[HDSP_MAX_CHANNELS] = {
 	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,
 	18, 19, 20, 21, 22, 23, 24, 25
 };
 
-static char channel_map_mf_ss[HDSP_MAX_CHANNELS] = { /* Multiface */
+static const char channel_map_mf_ss[HDSP_MAX_CHANNELS] = { /* Multiface */
 	/* Analog */
 	0, 1, 2, 3, 4, 5, 6, 7,
 	/* ADAT 2 */
@@ -516,7 +516,7 @@ static char channel_map_mf_ss[HDSP_MAX_CHANNELS] = { /* Multiface */
 	-1, -1, -1, -1, -1, -1, -1, -1
 };
 
-static char channel_map_ds[HDSP_MAX_CHANNELS] = {
+static const char channel_map_ds[HDSP_MAX_CHANNELS] = {
 	/* ADAT channels are remapped */
 	1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23,
 	/* channels 12 and 13 are S/PDIF */
@@ -525,7 +525,7 @@ static char channel_map_ds[HDSP_MAX_CHANNELS] = {
 	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1
 };
 
-static char channel_map_H9632_ss[HDSP_MAX_CHANNELS] = {
+static const char channel_map_H9632_ss[HDSP_MAX_CHANNELS] = {
 	/* ADAT channels */
 	0, 1, 2, 3, 4, 5, 6, 7,
 	/* SPDIF */
@@ -539,7 +539,7 @@ static char channel_map_H9632_ss[HDSP_MAX_CHANNELS] = {
 	-1, -1
 };
 
-static char channel_map_H9632_ds[HDSP_MAX_CHANNELS] = {
+static const char channel_map_H9632_ds[HDSP_MAX_CHANNELS] = {
 	/* ADAT */
 	1, 3, 5, 7,
 	/* SPDIF */
@@ -553,7 +553,7 @@ static char channel_map_H9632_ds[HDSP_MAX_CHANNELS] = {
 	-1, -1, -1, -1, -1, -1
 };
 
-static char channel_map_H9632_qs[HDSP_MAX_CHANNELS] = {
+static const char channel_map_H9632_qs[HDSP_MAX_CHANNELS] = {
 	/* ADAT is disabled in this mode */
 	/* SPDIF */
 	8, 9,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
