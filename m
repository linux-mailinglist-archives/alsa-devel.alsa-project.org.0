Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B240086107C
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Feb 2024 12:35:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA069822;
	Fri, 23 Feb 2024 12:35:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA069822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708688155;
	bh=IYOdq5sD1YmRKu7QJkXS/lwxV/Q8L01LSzl/baU/5A8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Wb+GHEihDYCqvf0GIhgpADOBwL3uIi8uL6oOaLkYZQTWSb7tgswWjztwZ1APKPgAn
	 uSbIM+V0PURnLZMjNGDf16JOGpWmsfbitDyIQ8g9jCzGWpNVU6ostKCPDyg3NmQ8Qs
	 2Fph+AOCG1P82/vAz2ojnLmtDpDosuntPlKMBaEQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA2D1F805AC; Fri, 23 Feb 2024 12:35:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77C7FF805A0;
	Fri, 23 Feb 2024 12:35:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9834F80496; Fri, 23 Feb 2024 12:35:17 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with UTF8SMTPS id 51C12F80104
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 12:34:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51C12F80104
Received: from fedori.lan (51b68dc5.dsl.pool.telekom.hu
 [::ffff:81.182.141.197])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000075253.0000000065D882DC.001DC1EC;
 Fri, 23 Feb 2024 12:34:52 +0100
From: Gergo Koteles <soyer@irl.hu>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
  Shenghao Ding <shenghao-ding@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
  alsa-devel@alsa-project.org, Gergo Koteles <soyer@irl.hu>,
  stable@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: tas2781: enable subwoofer volume control
Date: Fri, 23 Feb 2024 12:34:30 +0100
Message-ID: 
 <7ffae10ebba58601d25fe2ff8381a6ae3a926e62.1708687813.git.soyer@irl.hu>
X-Mailer: git-send-email 2.43.2
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 1.0
Message-ID-Hash: FQ7NCVEJVPLKCDZDLZ22G5NAXWJ2YKOP
X-Message-ID-Hash: FQ7NCVEJVPLKCDZDLZ22G5NAXWJ2YKOP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FQ7NCVEJVPLKCDZDLZ22G5NAXWJ2YKOP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The volume of subwoofer channels is always at maximum with the
ALC269_FIXUP_THINKPAD_ACPI chain.

Use ALC285_FIXUP_THINKPAD_HEADSET_JACK to align it to the master volume.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=208555#c827

Fixes: 3babae915f4c ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Gergo Koteles <soyer@irl.hu>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 0ec1312bffd5..24a26959070f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9585,7 +9585,7 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = tas2781_fixup_i2c,
 		.chained = true,
-		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
+		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
 	},
 	[ALC287_FIXUP_YOGA7_14ARB7_I2C] = {
 		.type = HDA_FIXUP_FUNC,

base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
-- 
2.43.2

