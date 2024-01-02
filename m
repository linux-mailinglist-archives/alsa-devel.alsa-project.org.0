Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB00823E80
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 10:23:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7BDAE7A;
	Thu,  4 Jan 2024 10:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7BDAE7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704360194;
	bh=Wl373xlx/nePhMbz+OJN/a+fdEhuxEOBtJowioF1SkU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vrfpfNgijANTFvrbNE97W5wmyU8uYjTkEuxcvRXRLesL1oaz3XahQZfA+39Z5VVPS
	 Up4IKq/duR+GDXtHpJNpCgpQjD3II9EEwVHqRJcnSmoSxbWWcVY/vf5CfPn//dIGAe
	 TMqoPQmo/TRkTylV5s09HY6b74yHjqoC+cGqfCYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A6A0F805A1; Thu,  4 Jan 2024 10:22:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A283F8057F;
	Thu,  4 Jan 2024 10:22:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 465ACF806E7; Tue,  2 Jan 2024 22:50:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx.dolansoft.org (s2.dolansoft.org [212.51.146.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DC65F8984D
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 22:48:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DC65F8984D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=brun.one header.i=@brun.one header.a=rsa-sha256
 header.s=s1 header.b=E2npxgfi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=brun.one;
	s=s1; h=MIME-Version:Message-ID:Date:Subject:Cc:To:From:In-Reply-To:
	References:From:To:Subject:Date:Message-ID:Reply-To;
	bh=tk05/deGlS4tuw8pDhigIISVFF8G63ZmEtVtmgFP+ks=; b=E2npxgfi8/c4idsH1/Hnvcq0ax
	l7IuT51xDlloC1d+wTulBhV6qiDkBEf/+BzNDF+RWbqHBZe89s5aOgWu2foYq/9Ubt2D7ajNQMADZ
	kb2/YsJ+iV4k8Yb2eyY7YDAAqpKSR3yDX1vFQHxgDfmX59XDq2Sxgo9N+M6XNUWJPwDtJ7S8tahd/
	QRMyLP6fed+t06iymK5hahb4B+dG/9UV1+kMbmKbvRd5zL1Brp7j4yx6U1fP8J5N2W9Xuun2tZdf4
	u9qNXfySN5EQrkJCd1UZleR7BMuw3mgwvK72KGs56fde0PSu3Xq/I7P17dbUt4z7qsg0V6+Gt7/bK
	u9C/TkRg==;
Received: from [212.51.153.89] (helo=blacklava.cluster.local)
	by mx.dolansoft.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <lorenz@dolansoft.org>)
	id 1rKmca-001AiL-2O;
	Tue, 02 Jan 2024 21:48:24 +0000
From: Lorenz Brun <lorenz@brun.one>
To: Stefan Binding <sbinding@opensource.cirrus.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ALSA: hda: cs35l41: Support more HP models without _DSD
Date: Tue,  2 Jan 2024 22:48:20 +0100
Message-ID: <20240102214821.3394810-1-lorenz@brun.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: lorenz@dolansoft.org
X-MailFrom: lorenz@brun.one
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2EDSZMTMU5QYA56ET5KNSKX34K73VFZJ
X-Message-ID-Hash: 2EDSZMTMU5QYA56ET5KNSKX34K73VFZJ
X-Mailman-Approved-At: Thu, 04 Jan 2024 09:22:28 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2EDSZMTMU5QYA56ET5KNSKX34K73VFZJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This adds overrides for a series of notebooks using a common config
taken from HP's proprietary Windows driver.

This has been tested on a HP 15-ey0xxxx device (subsystem 103C8A31)
together with another Realtek quirk and the calibration files from the
proprietary driver.

Signed-off-by: Lorenz Brun <lorenz@brun.one>
---
Changes in v2:
 - Use newly-introduced config table instead of function
 - Change boost cap value from 10uF to 24uF after cross-referencing my
   sources with the preexisting 103C89C6 entry.

Changes in v3:
 - Rebase onto sound/for-next
 - Sorted model table
 - Updated commit message

 sound/pci/hda/cs35l41_hda_property.c | 44 ++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 52820ca9c603..fcc605be51cf 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -42,6 +42,28 @@ static const struct cs35l41_config cs35l41_config_table[] = {
  * in the ACPI. The Reset GPIO is also valid, so we can use the Reset defined in _DSD.
  */
 	{ "103C89C6", 2, INTERNAL, { CS35L41_RIGHT, CS35L41_LEFT, 0, 0 }, -1, -1, -1, 1000, 4500, 24 },
+	{ "103C8A28", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8A29", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8A2A", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8A2B", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8A2C", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8A2D", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8A2E", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8A30", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8A31", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BB3", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BB4", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BDF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BE0", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BE1", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BE2", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BE9", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BDD", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BDE", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BE3", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BE5", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8BE6", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
+	{ "103C8B3A", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4100, 24 },
 	{ "104312AF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431433", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
 	{ "10431463", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
@@ -356,6 +378,28 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "10280BEB", generic_dsd_config },
 	{ "CSC3551", "10280C4D", generic_dsd_config },
 	{ "CSC3551", "103C89C6", generic_dsd_config },
+	{ "CSC3551", "103C8A28", generic_dsd_config },
+	{ "CSC3551", "103C8A29", generic_dsd_config },
+	{ "CSC3551", "103C8A2A", generic_dsd_config },
+	{ "CSC3551", "103C8A2B", generic_dsd_config },
+	{ "CSC3551", "103C8A2C", generic_dsd_config },
+	{ "CSC3551", "103C8A2D", generic_dsd_config },
+	{ "CSC3551", "103C8A2E", generic_dsd_config },
+	{ "CSC3551", "103C8A30", generic_dsd_config },
+	{ "CSC3551", "103C8A31", generic_dsd_config },
+	{ "CSC3551", "103C8BB3", generic_dsd_config },
+	{ "CSC3551", "103C8BB4", generic_dsd_config },
+	{ "CSC3551", "103C8BDF", generic_dsd_config },
+	{ "CSC3551", "103C8BE0", generic_dsd_config },
+	{ "CSC3551", "103C8BE1", generic_dsd_config },
+	{ "CSC3551", "103C8BE2", generic_dsd_config },
+	{ "CSC3551", "103C8BE9", generic_dsd_config },
+	{ "CSC3551", "103C8BDD", generic_dsd_config },
+	{ "CSC3551", "103C8BDE", generic_dsd_config },
+	{ "CSC3551", "103C8BE3", generic_dsd_config },
+	{ "CSC3551", "103C8BE5", generic_dsd_config },
+	{ "CSC3551", "103C8BE6", generic_dsd_config },
+	{ "CSC3551", "103C8B3A", generic_dsd_config },
 	{ "CSC3551", "104312AF", generic_dsd_config },
 	{ "CSC3551", "10431433", generic_dsd_config },
 	{ "CSC3551", "10431463", generic_dsd_config },
-- 
2.42.0

