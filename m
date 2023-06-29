Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ED9742C98
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 21:02:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFACC839;
	Thu, 29 Jun 2023 21:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFACC839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688065365;
	bh=y9x06U1tVv44gNduxq6fUF2ydIzmA1HJ9n4cFuX6o94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NxjmAGRRZjWnPsLgLinsoU6fOScCbS08+G7PPHsOKdys3+weCUehw0MBj0p6gT5zQ
	 Ofi/QxU6mbDX2FDjcE+0UhEvqc9g0fW5ZfSjGFSfAlF7JHUSKK0siGAGe3r96S6WX2
	 nvF2zsM6yvhOyh+yrD3IE+XWaND8wED/PQnFuUeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C28E1F80551; Thu, 29 Jun 2023 21:01:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F0DEF80544;
	Thu, 29 Jun 2023 21:01:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FE4AF80548; Thu, 29 Jun 2023 21:01:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 627C3F8027B
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 21:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 627C3F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hT0i0oUO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E82F1615FF;
	Thu, 29 Jun 2023 19:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE73C433CD;
	Thu, 29 Jun 2023 19:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688065281;
	bh=y9x06U1tVv44gNduxq6fUF2ydIzmA1HJ9n4cFuX6o94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hT0i0oUO3GoRSNLBQOLcb9uT0eSq6SOdAfa6RdEPhNeQyo04IHANlsEjR26n0n7Ut
	 z39bk0MQBPFXpMyg5FsEKg+3B2lj/3pI0uSajeVgGBzxyXUPy/Ld1LE8rMjHUSUnmV
	 nVJ9yY15nqheNtIcZsv9q9ccEnIVxuQSebnuDsCbPGPOuMH4EmlmGF4juvJwvuI3TI
	 fWP5Gb85W4AnjWDPGfayjQ9Wi2iMbvB7nVz+B0MGPnOZPvVlZJLZ9bp/kl3Kw4bVHt
	 SSl3y565mKIf8zMYQ7kzX6RlPAgragy+9G+D5yl4BvYQQkoFr79DC8BUOo7SG2d7Mq
	 az0CXo9+6vinQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "Luke D. Jones" <luke@ljones.dev>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	sbinding@opensource.cirrus.com,
	andy.chi@canonical.com,
	tcrawford@system76.com,
	tangmeng@uniontech.com,
	p.jungkamp@gmx.net,
	kasper93@gmail.com,
	yangyuchi66@gmail.com,
	yangyingliang@huawei.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.3 10/17] ALSA: hda/realtek: Add quirk for ASUS ROG
 G634Z
Date: Thu, 29 Jun 2023 15:00:39 -0400
Message-Id: <20230629190049.907558-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230629190049.907558-1-sashal@kernel.org>
References: <20230629190049.907558-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.9
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K32KQTDLGP5Q57LUD2IPYDX5CBTZJVAQ
X-Message-ID-Hash: K32KQTDLGP5Q57LUD2IPYDX5CBTZJVAQ
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K32KQTDLGP5Q57LUD2IPYDX5CBTZJVAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Luke D. Jones" <luke@ljones.dev>

[ Upstream commit 555434fd5c6b3589d9511ab6e88faf50346e19da ]

Adds the required quirk to enable the Cirrus amp and correct pins
on the ASUS ROG G634Z series.

While this works if the related _DSD properties are made available, these
aren't included in the ACPI of these laptops (yet).

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Link: https://lore.kernel.org/r/20230619060320.1336455-1-luke@ljones.dev
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 920e44ba998a5..3889701bdb1c9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9552,6 +9552,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1c23, "Asus X55U", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
+	SND_PCI_QUIRK(0x1043, 0x1caf, "ASUS G634JYR/JZR", ALC285_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1ccd, "ASUS X555UB", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1d4e, "ASUS TM420", ALC256_FIXUP_ASUS_HPE),
-- 
2.39.2

