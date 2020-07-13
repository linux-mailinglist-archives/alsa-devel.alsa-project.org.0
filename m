Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1A121CF29
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jul 2020 08:07:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D6231614;
	Mon, 13 Jul 2020 08:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D6231614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594620479;
	bh=4fQVi6oyhGduvWaUlDd1FcX/OzXC1SIlN+Gfm+fBxng=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qKWze/3scYeeiopDE9F79sZpl0DIevpzXfCgqDWEJxNYudiEHH9FuWgR6XuITOkem
	 MDVlXo8xXQBz5OrrHqm2ZvABOLlu0usDt3x/8mFlsnmmRACx2Fg2A/NnmCtb7gOSkV
	 lvY7yq0ai1xiVYDcY9syZ2y1e/Gj6BsanHauJqgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77087F80227;
	Mon, 13 Jul 2020 08:06:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 035E4F8021D; Mon, 13 Jul 2020 08:06:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7ADE3F800B2
 for <alsa-devel@alsa-project.org>; Mon, 13 Jul 2020 08:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ADE3F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com
 header.i=@endlessm-com.20150623.gappssmtp.com header.b="jTrxQ6Iy"
Received: by mail-pl1-x644.google.com with SMTP id k5so5037386plk.13
 for <alsa-devel@alsa-project.org>; Sun, 12 Jul 2020 23:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MlERMPe6fGAvj4w5/nTL9cv57borO+mmI3Hl4AGrcc4=;
 b=jTrxQ6IyNq2Ysc69R/0IFeTQFBhkhM0+6xrEYqZyvO9DhGt1rl0E/hhiqEgkxY08Bf
 KZku6pqYZMch1MugMhTHA9MPFe6EzZgd/czxeNolMSnMBLKs7eJsFVQzl9DCXYwi0OXp
 l6Kg7F0OmcZxmWNtiVrxOues0aaX3OHFetjsgKIUZFXm/iAObzoIrJjy3k1c3/5GArWg
 aV5tX29fakQCIq3Ihc+JooBiqRGxOFximFhH6gQ7dkd97IE3jwxlp80gGioeedBEwoZB
 exXJM7MHv9a3ZTmZ1cEYsdDzUcP3Xlf/RqT0ssE0YJNnH/Yl3maoHQyuHGIuOI4CR/T7
 AgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MlERMPe6fGAvj4w5/nTL9cv57borO+mmI3Hl4AGrcc4=;
 b=s4VaVv5g48mCeF717pg0BDZFy0B/SpwazjNYmQnWFIJnFRmJn6SrGYaZoA+6y/ZXKl
 jFnvunWEzVOYIjcS0oJHaWOvJux6pp3PLYDRFH9agyXu8RffZFE5RKvrdi3LZNQJ4vEy
 pXD3Wp2njyLEYT1z68G628/ADeRyI/Skh5n2splyJkKO2DIDgIlCgSxXARpGHYFPuASD
 pKIX1/t2BXEsOb7C6QHqqjEqbnNC8eoTQl2Q5z6Al1qIq56jzyAMwmV3YQ7uOx6TjXw1
 3LVl6bUgOiHuAvhDxUllB1VN/LPW5te51WjOo10i45uVEQOXqKJYxHFNNlF3iPM8eaTI
 zUuQ==
X-Gm-Message-State: AOAM531EbJGCOo4TOZibVRpkK6gWFoopwdHNT4LkW/FyK9zCDbRwWh4P
 QqQ54+C97jxZoiYN+lWPFBpC6Q==
X-Google-Smtp-Source: ABdhPJxx0ea7ecSDl4FCc5Y25WmO9d3urI7HLdgrZJ05S+ydYUvbkx/eCtceyh2sg1fo2wzE8XjCMA==
X-Received: by 2002:a17:902:c24a:: with SMTP id
 10mr64821849plg.82.1594620364526; 
 Sun, 12 Jul 2020 23:06:04 -0700 (PDT)
Received: from starnight.localdomain (123-204-46-122.static.seed.net.tw.
 [123.204.46.122])
 by smtp.googlemail.com with ESMTPSA id g6sm13317525pfr.129.2020.07.12.23.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 23:06:04 -0700 (PDT)
From: Jian-Hong Pan <jian-hong@endlessm.com>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ALSA: hda/realtek: Enable headset mic of Acer TravelMate
 B311R-31 with ALC256
Date: Mon, 13 Jul 2020 14:04:22 +0800
Message-Id: <20200713060421.62435-1-jian-hong@endlessm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jian-Hong Pan <jian-hong@endlessm.com>, alsa-devel@alsa-project.org,
 Kailang Yang <kailang@realtek.com>, linux@endlessm.com,
 linux-kernel@vger.kernel.org
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

The Acer TravelMate B311R-31 laptop's audio (1025:1430) with ALC256
cannot detect the headset microphone until
ALC256_FIXUP_ACER_MIC_NO_PRESENCE quirk maps the NID 0x19 as the headset
mic pin.

Signed-off-by: Jian-Hong Pan <jian-hong@endlessm.com>
---
Re-send for wrong email address

 sound/pci/hda/patch_realtek.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 194ffa8c66ce..0585ac97faf4 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6152,6 +6152,7 @@ enum {
 	ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
 	ALC269VC_FIXUP_ACER_HEADSET_MIC,
 	ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE,
+	ALC256_FIXUP_ACER_MIC_NO_PRESENCE,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7359,6 +7360,15 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MIC
 	},
+	[ALC256_FIXUP_ACER_MIC_NO_PRESENCE] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x02a11120 }, /* use as headset mic, without its own jack detect */
+			{ }
+		},
+		.chained = true,
+		.chain_id = ALC256_FIXUP_ASUS_HEADSET_MODE
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7387,6 +7397,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x1308, "Acer Aspire Z24-890", ALC286_FIXUP_ACER_AIO_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x132a, "Acer TravelMate B114-21", ALC233_FIXUP_ACER_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x1330, "Acer TravelMate X514-51T", ALC255_FIXUP_ACER_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x1430, "Acer TravelMate B311R-31", ALC256_FIXUP_ACER_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0470, "Dell M101z", ALC269_FIXUP_DELL_M101Z),
 	SND_PCI_QUIRK(0x1028, 0x054b, "Dell XPS one 2710", ALC275_FIXUP_DELL_XPS),
 	SND_PCI_QUIRK(0x1028, 0x05bd, "Dell Latitude E6440", ALC292_FIXUP_DELL_E7X),
-- 
2.27.0

