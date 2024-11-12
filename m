Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7739C9C5423
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2024 11:38:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDBF02110;
	Tue, 12 Nov 2024 11:38:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDBF02110
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731407890;
	bh=PzeOA8w+AECUnUVCa08aeQFCwhtB+Ux77+jEn8m2cbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uRHiS7mGIzM79s2VAM70arKPKw11TQJQDFdMXH5gjbG0itRqx/45Ql37IS1kGxXBE
	 LMM0+8FNKiRgjFkp4UDp83vbQe3VTJuL5VVO4ElE53M1WWnk9XuQ/mP623mttrKcvX
	 fl1xbHG8RENx/faaUy2fdUcw90aiEHwHIpf2RQIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B03CF80633; Tue, 12 Nov 2024 11:37:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C918F80623;
	Tue, 12 Nov 2024 11:37:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3489F80612; Tue, 12 Nov 2024 11:36:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB966F80600
	for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2024 11:36:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB966F80600
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Nbnz7fN1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30E615C544D;
	Tue, 12 Nov 2024 10:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3597C4CED6;
	Tue, 12 Nov 2024 10:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407815;
	bh=PzeOA8w+AECUnUVCa08aeQFCwhtB+Ux77+jEn8m2cbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nbnz7fN1SztRrR/Hq3R0ez+5fBEl2Y0k5MN5MGNycWQ+wbSFMoesVlIk5liEKnGKA
	 3sQ3jabYKrxnMyc3HroEEN6gS8FHVuwMOWKxuNzKzqVN87F3pHsYBpYDdwpGOy0f+U
	 gbA71bFTRGf/JdBm9G5f2S5t0aiWiQOC8O3z/AIIEt2AtDbVSoYeLXdyijz319NPoS
	 mcEzAeTC3MymE/Ab5CBgpqkoA2boZq2kZA20i4661gfAMLpr+0UDYW8agG2vuFsCHl
	 3b1kTkUzJYo87WgVsYlNOh4kn/lttoJtB0763AtbD7IVIE78XN+JIHtHjYBW9VEl8p
	 pJiUuV+pLAdjQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 06/15] ASoC: tas2781: Add new driver version for
 tas2563 & tas2781 qfn chip
Date: Tue, 12 Nov 2024 05:36:27 -0500
Message-ID: <20241112103643.1653381-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103643.1653381-1-sashal@kernel.org>
References: <20241112103643.1653381-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.60
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LDLFRG3CZRJ2KVQNOOWFSDOPRMOF4IMJ
X-Message-ID-Hash: LDLFRG3CZRJ2KVQNOOWFSDOPRMOF4IMJ
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LDLFRG3CZRJ2KVQNOOWFSDOPRMOF4IMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shenghao Ding <shenghao-ding@ti.com>

[ Upstream commit fe09de2db2365eed8b44b572cff7d421eaf1754a ]

Add new driver version to support tas2563 & tas2781 qfn chip

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
Link: https://patch.msgid.link/20241104100055.48-1-shenghao-ding@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/tas2781-fmwlib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 629e2195a890b..1cc64ed8de6da 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2022,6 +2022,7 @@ static int tasdevice_dspfw_ready(const struct firmware *fmw,
 		break;
 	case 0x202:
 	case 0x400:
+	case 0x401:
 		tas_priv->fw_parse_variable_header =
 			fw_parse_variable_header_git;
 		tas_priv->fw_parse_program_data =
-- 
2.43.0

