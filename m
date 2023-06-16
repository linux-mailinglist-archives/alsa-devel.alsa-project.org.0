Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73768732E20
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 12:29:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79DF685D;
	Fri, 16 Jun 2023 12:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79DF685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686911375;
	bh=RmyQEvId7Q4D1NdxNMNyeH1BnQPNLsCs5kZZNV1k3l0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D2oxW7TDzSVFds0Tk5WH1lQvLEwwEKqaO3RuoqOS45WrXUQePRnCSBZU9EgE6nKLC
	 EHJU2rEJylmfvuMV+uUjgWnnOch21uvzgo0WheGaHVYcAMf793z/aiH/n83ni1SIcD
	 he4z+kK4jw+5QR67KFlS2gLe4rQV4J8GsMUZ5B0k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A9F8F805D9; Fri, 16 Jun 2023 12:26:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D732F805E8;
	Fri, 16 Jun 2023 12:26:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0F3AF80246; Fri, 16 Jun 2023 12:26:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5973F805D9
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 12:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5973F805D9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KQiTalbO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B9EE63658;
	Fri, 16 Jun 2023 10:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40977C433C9;
	Fri, 16 Jun 2023 10:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686911201;
	bh=RmyQEvId7Q4D1NdxNMNyeH1BnQPNLsCs5kZZNV1k3l0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KQiTalbOC2NxmQznPYDOTrAUP92eydbYHbgsWWbdNn+WVWh5Xsf94/GJNipGMxPRP
	 JWkOWIuFpjCHHIVLEjQMk4EHFTYhV3adUBlKGm4kgxbWxQnQWa4oSRoLbKvDVwJDk2
	 jU2TEUHbhBCD8j6CYyUTk9kYaN0DEGD8zSgNzMs+Q1NaHMu/u21uC2l24cUZV1chCQ
	 I2KGgR1aBwYdho0BA0HOJzKAB7K9nOI0cEIlEL7HDjzOUgLS3DVWagAuWxQuXoJxlA
	 /vqUgdV1YW13qfCNrkjR4Oh2w7xkBfVoSuXF68+kVidqsOueqsDzv2AKFDaJswdmdI
	 Zd1TN3+mhiCvw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 08/26] soundwire: dmi-quirks: add new mapping for
 HP Spectre x360
Date: Fri, 16 Jun 2023 06:26:05 -0400
Message-Id: <20230616102625.673454-8-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102625.673454-1-sashal@kernel.org>
References: <20230616102625.673454-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.34
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CFFXAHPKI5NY6IPOMRSNFESW2SZLXBJV
X-Message-ID-Hash: CFFXAHPKI5NY6IPOMRSNFESW2SZLXBJV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFFXAHPKI5NY6IPOMRSNFESW2SZLXBJV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 700581ede41d029403feec935df4616309696fd7 ]

A BIOS/DMI update seems to have broken some devices, let's add a new
mapping.

Link: https://github.com/thesofproject/linux/issues/4323
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20230515074859.3097-1-yung-chuan.liao@linux.intel.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/dmi-quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 58ea013fa918a..2a1096dab63d3 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -99,6 +99,13 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)intel_tgl_bios,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8709"),
+		},
+		.driver_data = (void *)intel_tgl_bios,
+	},
 	{
 		/* quirk used for NUC15 'Bishop County' LAPBC510 and LAPBC710 skews */
 		.matches = {
-- 
2.39.2

