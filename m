Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 878477CFC79
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:27:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC2FDE5;
	Thu, 19 Oct 2023 16:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC2FDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697725641;
	bh=geXNpVRgk3I20R80hxfUGqxn435aRrCWq3UP1y1Q65Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k0vjuv0enxkge4ZK5b5ne6shVh84awHEera+gjCMV0QzBD2jmaoga5eJzX2iurEVe
	 DDJ8nzRRVtTdu9DH7wCSdOnTMiAGPd23HEvbmMzrimwtzFNOCwA1A26XOxSld8YM4J
	 NVl6DR5BzpEYlpHNgqQ8vURBIwXkwDtol/NxKwXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FF1DF8025F; Thu, 19 Oct 2023 16:26:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCB78F8024E;
	Thu, 19 Oct 2023 16:26:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC3E9F8025F; Thu, 19 Oct 2023 16:26:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 816A3F80166
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 16:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 816A3F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=system76.com header.i=@system76.com header.a=rsa-sha256
 header.s=fm3 header.b=lbVY8Q8I;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=LOMebt4v
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E52AB5C0229;
	Thu, 19 Oct 2023 10:26:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 19 Oct 2023 10:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1697725581; x=1697811981; bh=8+TngcIMRg
	F81R1bqa99WS9iwPqGLiZkgYXXdVzQ87k=; b=lbVY8Q8ILc+nG1Flr6AxZA8dQJ
	O//oE/O/m8ZEo62YokyqyPnKPy99Z3FS+BEqtVigfuKbsMWOyyAvNDcdTgPsYB13
	sKHwTmrGT1ksgct6Qxl//rkaD8CjLJe/URjwroCGTOGjIGJOfieZoTB9j3pglGmA
	g4zoX5gpLFUkmxeN2nu01/AExpRdyA0TcBj39G82jfIGFkRby+wCNzE9oBxGpqeV
	FelJ8GlLCA9ogr921jkyOA9yp+IPZD/kgs0EJWlBTy8GMhGHO2tfO7HwwXdUk7MC
	2GQLRQf4rOpM0YmkCTm1I5N1tP4RtrCrR93Q1oS0Mvd0m/SxzYrlYVumDEVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1697725581; x=1697811981; bh=8+TngcIMRgF81
	R1bqa99WS9iwPqGLiZkgYXXdVzQ87k=; b=LOMebt4vl/cukYL4Y6q19eU0iJC5z
	jhcNmXwPYU3U6HEdBn63gozj2hgB2wba2erKvT8ess3cJgu11HowXKMt32rN4eYt
	e70UFS5Hdt1M3SjmXwLfBSPGIQpFPXywR0U5GegOL3+Wy75hTGX6UJEGIHyyzBZg
	r6gkUovcexVS92uZ1zXonhE89y0o/UOOct94H1HwQrweLORpOig04tu1ej2I1xqS
	jgw50pW1zGtUhTwwopaY1Mad16JZFJ3DC4yK3PRNI3C40btwO66G5WfD959hyT4/
	yxbNTMCCPf0NzbSL55iQkfEwsDqcJgYSOjZQcdswuHc+pYDyf9pUaumzg==
X-ME-Sender: <xms:jTwxZalW3nv1dH5EE_cLcfgVbfoQaIm-vqKQVu_cbZ6Q6kBlnCT2Og>
    <xme:jTwxZR3YSDmKaFTdR9a4VqUFyzR1Kc5N7Kj0j5XV1ZS7gbeNtiSPMkCgtdAdXGUWi
    JCFJv-UHaXLCXVSqQ>
X-ME-Received: 
 <xmr:jTwxZYpqSi5knu3lOUOhsCsrzJkmuQdLmLc72a3-CN4tFzZ_kBgEXV_kNTYmEevCExy1Dkn_Vf3hXglmX7Zcp5hYYb6395Empw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedrjeeigdejhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvihhmucevrhgr
    fihfohhrugcuoehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomheqnecuggftrf
    grthhtvghrnhepkefgteefvdeivdfhffdtfffgieffhfetgeduudekieefueeutdelfedt
    veeuheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epthgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhm
X-ME-Proxy: <xmx:jTwxZenEgrnMryQXVUnuU0iry2TNleEUBrY4_j92tNkeLs5wA7_jog>
    <xmx:jTwxZY3xpkrVNtRikbNlVVoyEVtTgmMcQAptHvAVLZ2qbxcZ9BrJ9g>
    <xmx:jTwxZVsj_Dp5MffODclUgFgPQCmFscGq2sb38SGRMrhbKL3WwL0Q4g>
    <xmx:jTwxZWDDt4hiF89Da8REXbOaPHtwlt-mtK532nBNPFxzcmlpbSuJcg>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Oct 2023 10:26:21 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Cc: productdev@system76.com,
	Jeremy Soller <jeremy@system76.com>,
	Tim Crawford <tcrawford@system76.com>
Subject: [PATCH] ASoC: amd: yc: Add DMI entry to support System76 Pangolin 13
Date: Thu, 19 Oct 2023 08:26:16 -0600
Message-ID: <20231019142616.13947-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MHDVS3DBQKQR42CEMJ25BY2FQZMDWR32
X-Message-ID-Hash: MHDVS3DBQKQR42CEMJ25BY2FQZMDWR32
X-MailFrom: tcrawford@system76.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MHDVS3DBQKQR42CEMJ25BY2FQZMDWR32/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jeremy Soller <jeremy@system76.com>

Add pang13 quirk to enable the internal microphone.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 3ec15b46fa35..fd5b7d6c6eec 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -353,6 +353,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "pang12"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "System76"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "pang13"),
+		}
+	},
 	{}
 };
 
-- 
2.41.0

