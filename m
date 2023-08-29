Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C7E78C575
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 15:33:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A75F1741;
	Tue, 29 Aug 2023 15:32:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A75F1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693316019;
	bh=mRKu1UC/FEjbOCiCRZ1XXQL0JcQnLKJ78gtZHYpvv0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WKRz3yhyktimUQL72uTSTBnlkYGvC9hsKHX+PXaAeXLaJm/wkLqV7fI/xiB3y0qfv
	 MGsGy0gY/O9EgCL+UseHHpqlSon4PBljvXeKDtJUr4N6kLWayl734Pm4tDmbooESoN
	 UIz25cCJnLMNpCS0T/TGTswFbuaUefj5FYsxKJt4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C9CDF80158; Tue, 29 Aug 2023 15:32:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42519F80155;
	Tue, 29 Aug 2023 15:32:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 951C7F80236; Tue, 29 Aug 2023 15:32:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E329F800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 15:32:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E329F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jOi1eNL2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBE4365743;
	Tue, 29 Aug 2023 13:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DEFC433C8;
	Tue, 29 Aug 2023 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693315951;
	bh=mRKu1UC/FEjbOCiCRZ1XXQL0JcQnLKJ78gtZHYpvv0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jOi1eNL2oxOCXLCRyY9Xy4Bnc7uH0dDKuv8gMYOjEtccggV5UQAGL6TEw/UvqF8eK
	 eVJdhlnlD8DCYUzRaFUKygSRmK8qmw+5g4UknO1d5kHfBDekdo+bOjreTQqPkK1loI
	 8WATYWEnZMcEnK7ewotEMgVvXYimzt8wLxWJcRCd9hv0iZwKaxUSaRBDnvDoAh/Qvm
	 wfa8NiZMM2192O+Q3jPdULMEeW0gRuHPvMAxyAxqf1TNzYI60wncxcTElN8cjQaY4e
	 RmQrFcMqx1nVRpHncFH6fV9cZ+RMsebef5JR1COucVtvr0wwVvm3Acmfo/gzqttfvT
	 BrrLc5jyESynA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.4 10/17] ALSA: hda/cs8409: Support new Dell Dolphin
 Variants
Date: Tue, 29 Aug 2023 09:31:57 -0400
Message-Id: <20230829133211.519957-10-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230829133211.519957-1-sashal@kernel.org>
References: <20230829133211.519957-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.12
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FVVZ2UACJU3YEZCM4LWVAIS5GMGQY4EP
X-Message-ID-Hash: FVVZ2UACJU3YEZCM4LWVAIS5GMGQY4EP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FVVZ2UACJU3YEZCM4LWVAIS5GMGQY4EP/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Stefan Binding <sbinding@opensource.cirrus.com>

[ Upstream commit 7c761166399bedfc89c928bef8015546d85a9099 ]

Add 4 new Dell Dolphin Systems, same configuration as older systems.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20230811123044.1045651-1-sbinding@opensource.cirrus.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/patch_cs8409-tables.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index b288874e401e5..36b411d1a9609 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -550,6 +550,10 @@ const struct snd_pci_quirk cs8409_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0C50, "Dolphin", CS8409_DOLPHIN),
 	SND_PCI_QUIRK(0x1028, 0x0C51, "Dolphin", CS8409_DOLPHIN),
 	SND_PCI_QUIRK(0x1028, 0x0C52, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C73, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C75, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C7D, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C7F, "Dolphin", CS8409_DOLPHIN),
 	{} /* terminator */
 };
 
-- 
2.40.1

