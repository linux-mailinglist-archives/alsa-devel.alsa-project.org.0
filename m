Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C260701E73
	for <lists+alsa-devel@lfdr.de>; Sun, 14 May 2023 19:07:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A89FE88;
	Sun, 14 May 2023 19:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A89FE88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684084051;
	bh=Ml8RvSoG8RY5NYP1enxWgGwRhCRhNEdi3JpsxHP1neE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GI6rSEXbfoMWCPSiPJFF8A9DZUYAQJqVxawsicIiLN7bw2dIYdplyCCUBqdBTf/Db
	 0Pi/x97cJwiKEflJHw8PR/Y3kS7ZIGBKD52kFFM5Mp6OmvSYXoC++d2UlxLH7iA159
	 MQp3QsBokg7TLFU+nwdEFZ62V9Bd1QdMO+NGJPA4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4944DF8024E; Sun, 14 May 2023 19:05:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA682F80564;
	Sun, 14 May 2023 19:05:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39B43F80272; Sun, 14 May 2023 19:05:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC34BF80542
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 19:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC34BF80542
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id A808024283;
	Sun, 14 May 2023 13:03:23 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyF7z-Ink-00; Sun, 14 May 2023 19:03:23 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 3/7] ALSA: emu10k1: validate min/max values of translated
 controls
Date: Sun, 14 May 2023 19:03:19 +0200
Message-Id: <20230514170323.3408834-4-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230514170323.3408834-1-oswald.buddenhagen@gmx.de>
References: <20230514170323.3408834-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KH5I5UVWHKT6QE3RWNA4OPSJKWD4NGDX
X-Message-ID-Hash: KH5I5UVWHKT6QE3RWNA4OPSJKWD4NGDX
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KH5I5UVWHKT6QE3RWNA4OPSJKWD4NGDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

User space could pass arbitrary ranges, which were uncritically
accepted. This could lead to table lookups out of range.

I don't think that this is a security issue, as it only allowed someone
with CAP_SYS_ADMIN to crash the kernel, but still.

Setting an invalid translation mode will also be rejected now. That did
no harm, but it's still better to detect errors.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emufx.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index fbc1bfc122fc..796e24b6f01a 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -769,6 +769,32 @@ static int snd_emu10k1_verify_controls(struct snd_emu10k1 *emu,
 			err = -EINVAL;
 			goto __error;
 		}
+		switch (gctl->translation) {
+		case EMU10K1_GPR_TRANSLATION_NONE:
+			break;
+		case EMU10K1_GPR_TRANSLATION_TABLE100:
+			if (gctl->min != 0 || gctl->max != 100) {
+				err = -EINVAL;
+				goto __error;
+			}
+			break;
+		case EMU10K1_GPR_TRANSLATION_BASS:
+		case EMU10K1_GPR_TRANSLATION_TREBLE:
+			if (gctl->min != 0 || gctl->max != 40) {
+				err = -EINVAL;
+				goto __error;
+			}
+			break;
+		case EMU10K1_GPR_TRANSLATION_ONOFF:
+			if (gctl->min != 0 || gctl->max != 1) {
+				err = -EINVAL;
+				goto __error;
+			}
+			break;
+		default:
+			err = -EINVAL;
+			goto __error;
+		}
 	}
 	for (i = 0; i < icode->gpr_list_control_count; i++) {
 	     	/* FIXME: we need to check the WRITE access */
-- 
2.40.0.152.g15d061e6df

