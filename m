Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5F690672
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:17:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D1B0DF0;
	Thu,  9 Feb 2023 12:16:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D1B0DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675941439;
	bh=5d+9PlcVs72/SwBwickPbffpbNEh+EgpSD5hr+nLxRI=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qFV8e8LKRec6O1Qa1aEEVf1921H33zBhTqE+5wwXpoQ1dAplimlVcrdi3hMiF7srQ
	 qN1T8il3mki4TI8DiIwV09W9pkYrlSVmwKX9Mgp1O7Pd0y4jIPlfoZYZRx4cTJ/Pl3
	 y5uDCQykHpHXCyfKopGrH/np5yXPbnmRD4Kw03zs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 682F2F8053B;
	Thu,  9 Feb 2023 12:15:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D99FAF8021D; Thu,  9 Feb 2023 12:15:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28772F800E4
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 12:15:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28772F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J5jmaAsQ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B96B0B820F2;
	Thu,  9 Feb 2023 11:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 389C2C433D2;
	Thu,  9 Feb 2023 11:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941309;
	bh=5d+9PlcVs72/SwBwickPbffpbNEh+EgpSD5hr+nLxRI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J5jmaAsQ12W8PyjZVCICZ3hO18c1RzNpFIJIukcWijgbhrROGvUrF/sfZVlUKpLSl
	 gRtLlO/ISvAXeRJ+3QE7W8EufeYSTtHnWu8IOl9SvMEBI1gOWyE/jfwvDqLgvmTQlO
	 s+Sf74AVX0ILE+d2I90Cv3dizf03UF0m3cIEZop+iEVPwGVtKPP70EQNxChjCbXDxo
	 yWbl7Jz5AQtNX3SgJdgQ1jTvRjn/3PJhsBcEvcEO8d0dyoC2cVIDVvgpFeWvnMWrxk
	 vgpfTf0Z0eugLbxKbQ0ri2bDMpPLhTr4M8DGU/TiJiVnMiUVta3aRVCsDOUsbsOrh+
	 bGaIhIYptUpXA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 03/38] ALSA: usb-audio: Add FIXED_RATE quirk for
 JBL Quantum610 Wireless
Date: Thu,  9 Feb 2023 06:14:22 -0500
Message-Id: <20230209111459.1891941-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111459.1891941-1-sashal@kernel.org>
References: <20230209111459.1891941-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MQ5DEA2UJVQ6TE7ZLPSJ3HV4RKWUQNYZ
X-Message-ID-Hash: MQ5DEA2UJVQ6TE7ZLPSJ3HV4RKWUQNYZ
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 tiwai@suse.com, sdoregor@sdore.me, aichao@kylinos.cn, cyrozap@gmail.com,
 john-linux@pelago.org.uk, jussi@sonarnerd.net, connerknoxpublic@gmail.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQ5DEA2UJVQ6TE7ZLPSJ3HV4RKWUQNYZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit dfd5fe19db7dc7006642f8109ee8965e5d031897 ]

JBL Quantum610 Wireless (0ecb:205c) requires the same workaround that
was used for JBL Quantum810 for limiting the sample rate.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=216798
Link: https://lore.kernel.org/r/20230118165947.22317-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 3d13fdf7590cd..3ecd1ba7fd4b1 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2152,6 +2152,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GENERIC_IMPLICIT_FB),
 	DEVICE_FLG(0x0525, 0xa4ad, /* Hamedal C20 usb camero */
 		   QUIRK_FLAG_IFACE_SKIP_CLOSE),
+	DEVICE_FLG(0x0ecb, 0x205c, /* JBL Quantum610 Wireless */
+		   QUIRK_FLAG_FIXED_RATE),
 	DEVICE_FLG(0x0ecb, 0x2069, /* JBL Quantum810 Wireless */
 		   QUIRK_FLAG_FIXED_RATE),
 
-- 
2.39.0

