Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A612B52E003
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 00:33:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3839317D1;
	Fri, 20 May 2022 00:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3839317D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652999587;
	bh=McSitjKrn9s99UhRibVIDR7IeDRbxna/75tspG6tj48=;
	h=From:To:Subject:Date:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=rFUkR1iGY1XKrg952C+HG/Uion67NKthXdCT3HUUcWYPtHjrWlC8eVKQuic1O4kkV
	 7hLmYSFzxilhHiqPyGSkF3gKOfBBg5JfUvhy3vPFpOIKTM98mtQXlXugk52sNqCNy1
	 cyrazZcABmxfDPXIJBWxSKL//VwRGhQkJOKwQM8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3095F80109;
	Fri, 20 May 2022 00:32:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75127F8025D; Fri, 20 May 2022 00:32:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3E0EF800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 00:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3E0EF800F0
Received: from hednb3.Dlink (unknown [109.252.138.248])
 by mail.ispras.ru (Postfix) with ESMTPSA id C7E0C40755E1;
 Thu, 19 May 2022 22:31:47 +0000 (UTC)
From: Alexey Khoroshilov <khoroshilov@ispras.ru>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: max98090: Move check for invalid values before casting
 in max98090_put_enab_tlv()
Date: Fri, 20 May 2022 01:31:26 +0300
Message-Id: <1652999486-29653-1-git-send-email-khoroshilov@ispras.ru>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <YoajesD+D1W3ZV7/@sirena.org.uk>
Cc: ldv-project@linuxtesting.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>
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

Validation of signed input should be done before casting to unsigned int.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Alexey Khoroshilov <khoroshilov@ispras.ru>
Suggested-by: Mark Brown <broonie@kernel.org>
Fixes: 2fbe467bcbfc ("ASoC: max98090: Reject invalid values in custom control put()")
---
 sound/soc/codecs/max98090.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 62b41ca050a2..5513acd360b8 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -393,7 +393,8 @@ static int max98090_put_enab_tlv(struct snd_kcontrol *kcontrol,
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
 	unsigned int mask = (1 << fls(mc->max)) - 1;
-	unsigned int sel = ucontrol->value.integer.value[0];
+	int sel_unchecked = ucontrol->value.integer.value[0];
+	unsigned int sel;
 	unsigned int val = snd_soc_component_read(component, mc->reg);
 	unsigned int *select;
 
@@ -413,8 +414,9 @@ static int max98090_put_enab_tlv(struct snd_kcontrol *kcontrol,
 
 	val = (val >> mc->shift) & mask;
 
-	if (sel < 0 || sel > mc->max)
+	if (sel_unchecked < 0 || sel_unchecked > mc->max)
 		return -EINVAL;
+	sel = sel_unchecked;
 
 	*select = sel;
 
-- 
2.7.4

