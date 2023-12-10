Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C6E80BE50
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Dec 2023 00:45:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A9C71E2;
	Mon, 11 Dec 2023 00:45:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A9C71E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702251922;
	bh=Z2Ha0UceD8+6eiXJ2eFShFtYaaHl6MfJYWWtULZmZlk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=pYfGXWCrCQITbqNC4eT3uRLeYLMRb2X9dHeEnWQ+/5i8MDQ7wcflrxcOLDS0JGNCI
	 0TkXN8XIICKCqarzp6rXtfRN6ZNipkst/0ge8rgsLHDkXdshp3O1utYGjvGmC35sQH
	 pno5pzthealQrZUmPJQ9SMtmrXXjlNWUhofHvL0c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 933D7F80564; Mon, 11 Dec 2023 00:44:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A24BF80579;
	Mon, 11 Dec 2023 00:44:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EDE5F8019B; Mon, 11 Dec 2023 00:37:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id A1D03F8001F
	for <alsa-devel@alsa-project.org>; Mon, 11 Dec 2023 00:37:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1D03F8001F
Received: from fedori.lan (51b690cd.dsl.pool.telekom.hu
 [::ffff:81.182.144.205])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 000000000006E46F.0000000065764BC4.0012065E;
 Mon, 11 Dec 2023 00:37:40 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
  Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
  Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
  Gergo Koteles <soyer@irl.hu>, stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/tas2781: handle missing EFI calibration data
Date: Mon, 11 Dec 2023 00:37:33 +0100
Message-ID: 
 <f1f6583bda918f78556f67d522ca7b3b91cebbd5.1702251102.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: NLULM5KDFYTW6MLUTROYXHI3JIFU5XOC
X-Message-ID-Hash: NLULM5KDFYTW6MLUTROYXHI3JIFU5XOC
X-MailFrom: soyer@irl.hu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NLULM5KDFYTW6MLUTROYXHI3JIFU5XOC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The code does not properly check whether the calibration variable is
available in the EFI. If it is not available, it causes a NULL pointer
dereference.

Check the return value of the first get_variable call also.

BUG: kernel NULL pointer dereference, address: 0000000000000000
Call Trace:
 <TASK>
 ? __die+0x23/0x70
 ? page_fault_oops+0x171/0x4e0
 ? srso_alias_return_thunk+0x5/0x7f
 ? schedule+0x5e/0xd0
 ? exc_page_fault+0x7f/0x180
 ? asm_exc_page_fault+0x26/0x30
 ? crc32_body+0x2c/0x120
 ? tas2781_save_calibration+0xe4/0x220 [snd_hda_scodec_tas2781_i2c]
 tasdev_fw_ready+0x1af/0x280 [snd_hda_scodec_tas2781_i2c]
 request_firmware_work_func+0x59/0xa0

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
CC: stable@vger.kernel.org
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/tas2781_hda_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index fb802802939e..6e506efe61cd 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -455,9 +455,9 @@ static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
 		status = efi.get_variable(efi_name, &efi_guid, &attr,
 			&tas_priv->cali_data.total_sz,
 			tas_priv->cali_data.data);
-		if (status != EFI_SUCCESS)
-			return -EINVAL;
 	}
+	if (status != EFI_SUCCESS)
+		return -EINVAL;
 
 	tmp_val = (unsigned int *)tas_priv->cali_data.data;
 

base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
-- 
2.43.0

