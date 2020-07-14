Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C25C421F834
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 19:30:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61BF6166C;
	Tue, 14 Jul 2020 19:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61BF6166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594747859;
	bh=Wpyme34OVlOG+zZlPsy4Q9nQoRs5/+eAdgK8YPylMp4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fxv0FOng/wNVsT7RCiL37vEsZMvy5IjG3lYVkGXTbCRhHcSMLXDP7CyNXHVqhDGMw
	 AHYIsjyzr55qf74xuqUoUjsQX3b05IYLP2M1oX5hqQNbIdeuoQVqMaHtAUIDBLwFHh
	 fiu7PLxP9t73BDwYNECuX27nIl2tzFx/cOT5wlco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC82FF802EB;
	Tue, 14 Jul 2020 19:27:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD324F8019B; Tue, 14 Jul 2020 19:26:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (unknown [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE2B1F8019B
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 19:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE2B1F8019B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14AF7AD5C
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 17:26:38 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/10] ALSA: ac97: Replace the words white/blacklist
Date: Tue, 14 Jul 2020 19:26:23 +0200
Message-Id: <20200714172631.25371-3-tiwai@suse.de>
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
words "whitelist" and "blacklist" appropriately.

Only comment or function/variable renames, no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ac97/ac97_patch.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
index 23cb846cf8c2..52e95c39dcee 100644
--- a/sound/pci/ac97/ac97_patch.c
+++ b/sound/pci/ac97/ac97_patch.c
@@ -1791,10 +1791,10 @@ static const struct snd_kcontrol_new snd_ac97_ad1981x_jack_sense[] = {
 	AC97_SINGLE("Line Jack Sense", AC97_AD_JACK_SPDIF, 12, 1, 0),
 };
 
-/* black list to avoid HP/Line jack-sense controls
+/* deny list to avoid HP/Line jack-sense controls
  * (SS vendor << 16 | device)
  */
-static const unsigned int ad1981_jacks_blacklist[] = {
+static const unsigned int ad1981_jacks_denylist[] = {
 	0x10140523, /* Thinkpad R40 */
 	0x10140534, /* Thinkpad X31 */
 	0x10140537, /* Thinkpad T41p */
@@ -1821,7 +1821,7 @@ static int check_list(struct snd_ac97 *ac97, const unsigned int *list)
 
 static int patch_ad1981a_specific(struct snd_ac97 * ac97)
 {
-	if (check_list(ac97, ad1981_jacks_blacklist))
+	if (check_list(ac97, ad1981_jacks_denylist))
 		return 0;
 	return patch_build_controls(ac97, snd_ac97_ad1981x_jack_sense,
 				    ARRAY_SIZE(snd_ac97_ad1981x_jack_sense));
@@ -1835,10 +1835,10 @@ static const struct snd_ac97_build_ops patch_ad1981a_build_ops = {
 #endif
 };
 
-/* white list to enable HP jack-sense bits
+/* allow list to enable HP jack-sense bits
  * (SS vendor << 16 | device)
  */
-static const unsigned int ad1981_jacks_whitelist[] = {
+static const unsigned int ad1981_jacks_allowlist[] = {
 	0x0e11005a, /* HP nc4000/4010 */
 	0x103c0890, /* HP nc6000 */
 	0x103c0938, /* HP nc4220 */
@@ -1853,7 +1853,7 @@ static const unsigned int ad1981_jacks_whitelist[] = {
 
 static void check_ad1981_hp_jack_sense(struct snd_ac97 *ac97)
 {
-	if (check_list(ac97, ad1981_jacks_whitelist))
+	if (check_list(ac97, ad1981_jacks_allowlist))
 		/* enable headphone jack sense */
 		snd_ac97_update_bits(ac97, AC97_AD_JACK_SPDIF, 1<<11, 1<<11);
 }
@@ -1877,7 +1877,7 @@ static int patch_ad1981b_specific(struct snd_ac97 *ac97)
 
 	if ((err = patch_build_controls(ac97, &snd_ac97_ad198x_2cmic, 1)) < 0)
 		return err;
-	if (check_list(ac97, ad1981_jacks_blacklist))
+	if (check_list(ac97, ad1981_jacks_denylist))
 		return 0;
 	return patch_build_controls(ac97, snd_ac97_ad1981x_jack_sense,
 				    ARRAY_SIZE(snd_ac97_ad1981x_jack_sense));
-- 
2.16.4

