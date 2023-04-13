Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E166E0456
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 04:38:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 195B5F85;
	Thu, 13 Apr 2023 04:37:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 195B5F85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681353492;
	bh=d0X3yg7haQvgsR2Vxh0jBkmYqiZKufzWZYdFlrBGUqM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lt4d3ei/9lHAGVdfCzc0hF13fKZy4gKekBZteTp8hjykU0D4EttWWejaVAE9b+0zt
	 Eb/PLHyUmh4MyQ3Fzh7lLItwHwrnskaFkL4DU7eNwUo1SxCiMg6v1AK2Mufe/BAO26
	 aUiiWfn9dBC/T6h2G/Ia7Sn0599o+wHCA/h9yjuA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9753F8052E;
	Thu, 13 Apr 2023 04:36:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D344F80448; Thu, 13 Apr 2023 04:36:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A145F8032B
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 04:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A145F8032B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dn4Ct3Cb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3BC4063A84;
	Thu, 13 Apr 2023 02:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40686C433D2;
	Thu, 13 Apr 2023 02:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681353374;
	bh=d0X3yg7haQvgsR2Vxh0jBkmYqiZKufzWZYdFlrBGUqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dn4Ct3Cb96EUShoHhbzYgfP/dc0zaUfUJxd2365nVQKlxvyTuvxIMqiiORy7WJ15B
	 ANBjS9g0H/oyQ8y3WyiZynRum1mYlGiICNnoB1zb1tUL6lYNcuPzABvVBCSIS7xraR
	 VGBSJ1giS0dt0YdrSrrZ0X6twGWx2tAkpsAew9aZBT9sJ0+SL4p89+DaQoFD/QlnmK
	 A+o0FsP2o4cmQcvn4MC4Dvx9lerrktu8WF8NhrRZ87p2iKcsJmRezaSM9g1Fbmx58O
	 AgsthEvaUpSODKvu8Kd9V9lFeTa/s7Hc/JfVXg+1YeTEChaTRU5bT9GrsBku2k6BfD
	 2eFYGKbKZcvlQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 05/20] ASoC: amd: yc: Add DMI entries to support
 Victus by HP Laptop 16-e1xxx (8A22)
Date: Wed, 12 Apr 2023 22:35:43 -0400
Message-Id: <20230413023601.74410-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413023601.74410-1-sashal@kernel.org>
References: <20230413023601.74410-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 74FGQIBMXPPGLEDPA2XTXITWRTLOHI35
X-Message-ID-Hash: 74FGQIBMXPPGLEDPA2XTXITWRTLOHI35
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Ge-org Brohammer <gbrohammer@outlook.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 lgirdwood@gmail.com, tiwai@suse.com, mario.limonciello@amd.com,
 Syed.SabaKareem@amd.com, leohearts@leohearts.com, wimvanboven@gmail.com,
 fengwk94@gmail.com, xazrael@hotmail.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74FGQIBMXPPGLEDPA2XTXITWRTLOHI35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ge-org Brohammer <gbrohammer@outlook.com>

[ Upstream commit 205efd4619b860404ebb5882e5a119eb3b3b3716 ]

This model requires an additional detection quirk to
enable the internal microphone.

Tried to use git send-email this time.

Signed-off-by: Ge-org Brohammer <gbrohammer@outlook.com>
Link: https://lore.kernel.org/r/PAVP195MB2261322C220E95D7F4B2732ADABC9@PAVP195MB2261.EURP195.PROD.OUTLOOK.COM
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 4a69ce702360c..0acdf0156f075 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -269,6 +269,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8A43"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8A22"),
+		}
+	},
 	{}
 };
 
-- 
2.39.2

