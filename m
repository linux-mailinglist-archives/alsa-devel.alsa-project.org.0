Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AD18A9F2D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C81922A7;
	Thu, 18 Apr 2024 17:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C81922A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455647;
	bh=S5SKxjqBLEazmK9VzoxpMLNUbW254TmsbmfvUiZKfkU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BwAF5kydpo4x3BmQ7mg3mJ1pkb2izM/2SvdLPrRvDvTEU4HSou/1+xIXl8HCgocJR
	 ODQmWUyOXqdl8Y7iWcB1DxLMCtkk9laeXoZtzNNTwyF6OU3CHtmJNECumnQcmessIW
	 pyrDfL2XW2o1NCzxIMPRH8CheWpWG+IkYpv3iJ5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4B9BF8978B; Thu, 18 Apr 2024 17:47:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D91BF8978E;
	Thu, 18 Apr 2024 17:47:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1216BF8026D; Sat, 13 Apr 2024 13:37:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HELO_DYNAMIC_IPADDR,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from out203-205-221-245.mail.qq.com (out203-205-221-245.mail.qq.com
 [203.205.221.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 4D070F800C9
	for <alsa-devel@alsa-project.org>; Sat, 13 Apr 2024 13:37:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D070F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256
 header.s=s201512 header.b=ukChcDgI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1713008214; bh=buU/TI1ycm4oXmFV2yW1Moaxa/OBm98bV+Uw5KNRXxo=;
	h=From:To:Cc:Subject:Date;
	b=ukChcDgIOq7MbGQ2i6zowPIcpZbqHH80nZlfKXIOpwStd3/rfSn8UT1T0X9UgJ18t
	 7okRnzEUYScrK5S7wlCcYuXlXV3P4JfeM3l5y1CTohosisgfGsd7bslhIWS7cI68M7
	 PJgkEamPec6+CAmIbBXN7OOEQJDORpoOq6c7Hnm4=
Received: from levi-pc.. ([61.186.29.10])
	by newxmesmtplogicsvrsza15-1.qq.com (NewEsmtp) with SMTP
	id 92D1C830; Sat, 13 Apr 2024 19:36:45 +0800
X-QQ-mid: xmsmtpt1713008205tvbhjow7w
Message-ID: <tencent_1FEC358E200042A50F654401EFAF6CDE3005@qq.com>
X-QQ-XMAILINFO: MfjpfBJIjGEYyQKna3BycqEjkVrbFg70sO1ENcrfb/jTGQFVo+L++lpRLjtdxr
	 2THWD93pMZrYfKD+bj263CqkpKrELKL4Z9le+Vxa5WBMfYanifFP3N6xYlLZejCaJsdRFL4x08UT
	 9wx+DOI4+b0fjnPiH+/B7rr2VL8AMm9nQUi0CDjPudvEOjwaQj90OPooOpfnEwA+ayJqxxNxutFm
	 afKLRBx3yHTfau9dVf8sr9hrJcMxqj8Gq584HKr4u3Mysa0ct5KTbVXwJO4U7dltRyeWFpt8KET6
	 SfZNYavL4j6x33scooQiQnVQLwFzURH0wNvJFB9Cz3GLJBZfLCmpaxEl+1V+D6iEIEV4Rgv6UeJh
	 d3qvSbwKKvPB5DQBgGCOVUQbBdgGZBjq9A2CO7lwC1ZZieQ2lv9KXXpvf/Os8WKnEetpmSNdyKMV
	 8WEjB+Kj7hbgQgx+3nO+qKM8JvzBVCXOKu2xThcbjPWBOQluZFwsArYhocW9V4YXyoKsaO0T21ZZ
	 RDCj+5Ye1CdxYLi+gpbsfmppd+rJwjPm8/BOmhtYZdPB3ONzRfilgPYMZqal4PboK/vayrRdT2xD
	 6BkLNFMgVyGqvxw2hPnzGGIqNihea/zgPzHtcyvGyXaCEznvXj5rP1Jqe5dmCIYB5aJxQ3Xl8nvK
	 SpyXsNF0b4/uOh/dvp9O6OqnTUUO4FmJAb9QXvtq3P8DBbfCju/lu9KIitznMOKzLXaQTGJhW1qX
	 El0zmtWycZSthJm310Hvp5m7I/1vh9u2z+KgE8AfkaxTD0uwMWe+CLaPH/Rgf3T4R9BiOEFBRNZu
	 3DZCN4PxS/nzmin5YTP22Shq1MNHJfyWOaka6O5uByKK1YPxVxu3LcyiaS2RXuI/j8d8W9mLTv34
	 WxW1M+8tvxHdNlx5TajbGjsOMSWQTUFb0V1fudts+UV5VaXI+8FLtH1D4vzARShJSYuA9qP/CxWq
	 pTio/BPhWGR3n/Hxo7kEO3QFAUd3QsW9Saq2KPIHHC6D7terZVJdyexZu5qHxR0NfsTJqFz1hXZR
	 2OkoaxQUR9NvLj4x6mPmm0lHKJ9yG6ArGGw6hbmEd1WqmXhaqTz2bEi+94h/beTxT+AbtjfXUR1I
	 Nsiqyp7fHofSqKvFqnqnOHtx4goA==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: zhanghuayu1233@qq.com
To: perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	zhanghuayu.dev@gmail.com,
	zhanghuayu1233@qq.com
Subject: [PATCH] Fix volumn control of ThinkBook 16P Gen4
Date: Sat, 13 Apr 2024 19:36:54 +0800
X-OQ-MSGID: <20240413113654.22769-1-zhanghuayu1233@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: zhanghuayu1233@qq.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: EATAHRJJACGX2R63IE6N4GNQO7VHOZXI
X-Message-ID-Hash: EATAHRJJACGX2R63IE6N4GNQO7VHOZXI
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:47:17 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EATAHRJJACGX2R63IE6N4GNQO7VHOZXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Huayu Zhang <zhanghuayu1233@qq.com>

change HDA & AMP configuration from ALC287_FIXUP_CS35L41_I2C_2 to
ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD for ThinkBook 16P Gen4 models to fix volumn
control issue (cannot fully mute).

Signed-off-by: Huayu Zhang <zhanghuayu1233@qq.com>
---
 sound/pci/hda/patch_realtek.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d6940bc4ec39..1aef223307bb 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -10396,8 +10396,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a7, "Y780P AMD YG dual", ALC287_FIXUP_TAS2781_I2C),
 	SND_PCI_QUIRK(0x17aa, 0x38a8, "Y780P AMD VECO dual", ALC287_FIXUP_TAS2781_I2C),
-	SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x17aa, 0x38ab, "Thinkbook 16P", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x17aa, 0x38a9, "Thinkbook 16P", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
+	SND_PCI_QUIRK(0x17aa, 0x38ab, "Thinkbook 16P", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
 	SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.34.1

