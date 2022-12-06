Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 320F2644C0F
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 19:54:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1E4A17EF;
	Tue,  6 Dec 2022 19:53:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1E4A17EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670352859;
	bh=Xc1nZT3s/98Tft8V6UbcWG2psx4PVYfqJmO40e+iuLE=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ipWL5i6d0fzw+MwyKrMcj9kSeLd0L5hf/WtxP1pWCdgQd4wT1vIqM4A6EHMJWu7iP
	 4PLJLfXYw+cwDsH6Wa8gxMN/+xzAzf4RaDqgKU4puEnVhyrv+d1ThcxIMbccRT6yJr
	 b3jX5+3A2KybU/eSjrfux1qIUw2UJIFhYad3IG10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62982F80290;
	Tue,  6 Dec 2022 19:53:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2DE0F80121; Tue,  6 Dec 2022 19:53:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 586A3F80121
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 19:53:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 586A3F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="kAmPFP+8"
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-3c44ac82606so161716927b3.1
 for <alsa-devel@alsa-project.org>; Tue, 06 Dec 2022 10:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Ebsp9FYEkYyuG/DGzsGxYZ/f8i+h5XwOATDILciMk5U=;
 b=kAmPFP+8tIvMd4taQY+ISZDqheM+U82FG1e1a1Af1ukXnEoeI1E3wEgsjaWTk+OuTH
 /bshKCREdjV+adiGBS4CuS8UVCxo9sjFr1i6YaRwY9gtFixDcaULrSP0uovQvgfqRav4
 eyJh5t2I5XcGrSx66wjHXpDrZm6RSn7MNlyd2vwuYbW2hyjTWmDK3hXWdPrdSr8cKNsG
 j2F8+FCgHxKnE1LsaPTtG86znV8IBFtCBTgNgtuTsPQn8cKBhXqZKTd8fi0bQDffD4/M
 xVszqA4mFTq3YDXzUAKWDT4ADv55qYbKJK5VvHBgJ4kSC2dYpd8QTkLnQrxzdRe2gJN4
 KCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ebsp9FYEkYyuG/DGzsGxYZ/f8i+h5XwOATDILciMk5U=;
 b=7p50WBg588pHlG5o+9qGhwu5/zOJQbShNrT26Qypjp8Dnn2wQbytK/FPa41LGVCFFX
 UHVeTNB8H9ixWYM1KDq+QPSn6N1PbSkzZIrsy0YW0ZgLyGMn9qBOEt1wTTrd+xRz4rNS
 beFnLeez7t55Ainu80CgO8Cl+LuG0vGCKKg9rmYjnW2tRi2S633yGhaCZr854QnQ5Y5L
 7UwV/SAbbBg8CeWggXkFNJP5x7h9J7eKZE0n8JkSNwTJIF/h20mXB4A+JR3KOskdQz7L
 INXI4k9PfMgE/DndGRgAHX/QTHesVLD6iy2RnWpd8dZJHSgOSsB8m7X7P0IysGhJJwc6
 q7Dw==
X-Gm-Message-State: ANoB5pl7DFnxzJ1zh8AO5W7v9t2ykoo8oWQ0qiU2P5SBYs94No5dg2Jz
 4PDBU8ZzGgSM91haE+kmKyg4zje8VJdHhsE5qKemvsRqChBdpnulWP3c9SrQs4vSbJIYaJ39/rA
 Vs9Qdl6Uv0zFtmt2PptShD6h2hwDs3Bb/cP/1k4EZVOo3FUO8PcvWNKeHW3ON9s8RHLUIRMkosQ
 ==
X-Google-Smtp-Source: AA0mqf4x/c5OW7CqVQtw4yP5IGIpJRwgJk5yea7P8Jt4wgbKjrP5wpomjCae//NUzT1gA5M/o0neX5RtTz8O5w==
X-Received: from jiaozhou11.nyc.corp.google.com
 ([2620:0:1003:314:4bd2:9e13:f0a0:1ee2])
 (user=jiaozhou job=sendgmr) by 2002:a25:69cf:0:b0:700:ec9a:7efd with SMTP id
 e198-20020a2569cf000000b00700ec9a7efdmr9827863ybc.141.1670352795532; Tue, 06
 Dec 2022 10:53:15 -0800 (PST)
Date: Tue,  6 Dec 2022 13:53:11 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Message-ID: <20221206185311.3669950-1-jiaozhou@google.com>
Subject: [PATCH v2] ALSA: hda/hdmi: Add HP Device 0x8711 to force connect list
From: Jiao Zhou <jiaozhou@google.com>
To: ALSA development <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Takashi Iwai <tiwai@suse.de>, Jiao Zhou <jiaozhou@google.com>
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

HDMI audio is not working on the HP EliteDesk 800 G6 because the pin is
unconnected. This issue can be resolved by using the 'hdajackretask'
tool to override the unconnected pin to force it to connect.

Signed-off-by: Jiao Zhou <jiaozhou@google.com>
---
 sound/pci/hda/patch_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 21edf7a619f07..7a40ddfd695a1 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1975,6 +1975,7 @@ static int hdmi_add_cvt(struct hda_codec *codec, hda_nid_t cvt_nid)
 static const struct snd_pci_quirk force_connect_list[] = {
 	SND_PCI_QUIRK(0x103c, 0x870f, "HP", 1),
 	SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
+	SND_PCI_QUIRK(0x103c, 0x8711, "HP", 1),
 	SND_PCI_QUIRK(0x1462, 0xec94, "MS-7C94", 1),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", 1),
 	{}
-- 
2.39.0.rc0.267.gcb52ba06e7-goog

