Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E778396795
	for <lists+alsa-devel@lfdr.de>; Mon, 31 May 2021 20:08:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3EDE1655;
	Mon, 31 May 2021 20:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3EDE1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622484499;
	bh=5QVWUl6zXeiq9hlpMClkyx9Z6D9FNfmYiA4tbqIxFHU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZqZ4eBbrS238A6gS8gmtHt6CnNp0q5AZb5Bs0nXjfBwgUSFpgNzkkl8GLqB37WuFl
	 6OLU7LDkE6kO1RBTJ3pTB43y3BvciusnNuPIx0Ape+IGcGdrnigWgpju7Jxtq8OLjO
	 +WVGYhaRnl9YzI1AiUtdipk9+iLZZhisC/NT+/Po=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 708CBF80424;
	Mon, 31 May 2021 20:06:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AE1EF802E2; Mon, 31 May 2021 20:06:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A98BF80253
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 20:06:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A98BF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="xZUk6pRp"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="lS1wCFUV"
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622484394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Zf2XCLHTc6qMDR8YskIg2+6vvvb9xTAwY0sMMlVNwCY=;
 b=xZUk6pRpD6RAs5tNWoF4jcOlOwaFgH2bSWewTllzMuoyZr4VTx5YP4R3kX9K5BpLwOhNCv
 huPjj5EZ2KNtonTd1mmL+3MHIYq0ooJN7y+DIe3F0skhHu6jNfYawxaFF68sccGwqWr4bg
 jxEkThqoUvNu+xlmIiD9gO/ev1Ezphk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622484394;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Zf2XCLHTc6qMDR8YskIg2+6vvvb9xTAwY0sMMlVNwCY=;
 b=lS1wCFUVHdn7L1C1Ezjjr9R83FiesO0RsHZkZCjnDcGRkRpxg/uP1R+N761HU+Ma7BHrbU
 Q19MIRmpROsSp8Cw==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64A08B9C4
 for <alsa-devel@alsa-project.org>; Mon, 31 May 2021 18:06:34 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Fix a regression in Capture Switch mixer read
Date: Mon, 31 May 2021 20:06:33 +0200
Message-Id: <20210531180633.27831-1-tiwai@suse.de>
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

The recent commit to drop the HDA-specific mute-LED control,
e65bf99718b5 ("ALSA: HDA - remove the custom implementation for the
audio LED trigger"), caused a regression on the mixer element read for
"Capture Switch" when it's built from bind controls.  The function
create_bind_cap_vol_ctl() creates the snd_kcontrol_new object directly
via snd_hda_gen_add_kctl() instead of add_control().  Although the
commit above added a workaround for the SNDRV_CTL_ACCESS_READWRITE in
add_control() as default, this code path fell out from the radar.  As
a result, now the driver gives -EPERM error because of the lack of the
proper access bit at reading "Capture Switch" element value.

Fix the regression by setting the access bit properly.

Fixes: e65bf99718b5 ("ALSA: HDA - remove the custom implementation for the audio LED trigger")
BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1186634
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_generic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index b638fc2ef6f7..1f8018f9ce57 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -3520,6 +3520,7 @@ static int cap_sw_put(struct snd_kcontrol *kcontrol,
 static const struct snd_kcontrol_new cap_sw_temp = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Capture Switch",
+	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.info = cap_sw_info,
 	.get = cap_sw_get,
 	.put = cap_sw_put,
-- 
2.26.2

