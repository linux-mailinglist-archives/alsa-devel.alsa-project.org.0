Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D1C6F8679
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 18:16:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC1392D4A;
	Fri,  5 May 2023 18:16:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC1392D4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683303413;
	bh=+9xonvPRhHnL9FJiVIPwMyb+c8rzQsxTcTRcl0IBNnA=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=I1w4+ilBCEuU6NEKfIe7f/uYWmAVPpgbtzLJzntkMHje3jHhJ1DbZarbftFfY5KFI
	 0RgdSH33dAJXZ9qnnh9xFrzrQSAltMiwspfb8YSO7Vt8C8cvH/YF4k7HhaxmIIqMR+
	 oM2d3qHuvhfoJ3eAeoB4YE9mbUPGauAhWr1c0uEw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D446F80529;
	Fri,  5 May 2023 18:16:03 +0200 (CEST)
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: amd: yc: Add DMI entry to support System76 Pangolin 12
Date: Fri,  5 May 2023 10:14:58 -0600
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZVZZJSWQTU4CITBPEJUWRS4ISNOWBD5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168330336238.26.17773386857384824083@mailman-core.alsa-project.org>
From: Tim Crawford via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Tim Crawford <tcrawford@system76.com>
Cc: broonie@kernel.org, productdev@system76.com,
 Jeremy Soller <jeremy@system76.com>, Tim Crawford <tcrawford@system76.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AF3FF8052D; Fri,  5 May 2023 18:15:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA9F8F804B1
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 18:15:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA9F8F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=system76.com header.i=@system76.com header.a=rsa-sha256
 header.s=fm3 header.b=EcZAUYMa;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=VrKscWGE
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 31D195C022D;
	Fri,  5 May 2023 12:15:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 12:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1683303350; x=1683389750; bh=A6EN8YSiV6
	gv5iSARizot8tHgSmTROTbBSMxUb3UYwo=; b=EcZAUYMa2xwIAO0qgaoYHlS+VQ
	XaHxxB4DplXbhNTlUi5bbbUQVUBu7/kJa1EEZlDiI2Fu6ApsgV48mhVwDILWJa4/
	xWnfBbrX5Qz4HtAjcS1s+9wkt8C0QsYfRxpo5dmSbuE7QBIet8EATKDYnQOnklKh
	WFxrUzPuagH7305NiMEcohX8we6z7VrVbeAntZ3nJYYPKz+CNTVbw2Jv8aT5tgY/
	4x/e0MGGgYWhsx7pKR5++CYzltf3oAATCwz2rqclxVX2jfzdA7NFoRgapEH/ISq1
	dxszqadBgt8vugAl6mUreyQ69Uq/Y7CHYbgUx9cnS1I9FKV7NVkXHFc/U1cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683303350; x=1683389750; bh=A6EN8YSiV6gv5
	iSARizot8tHgSmTROTbBSMxUb3UYwo=; b=VrKscWGEhLh4ywR2+edQpzNGbJyIx
	1CrSiXXkcH8b0IDxVv2bwBGB9AKGgmJ6pcUz/FRWt+ScIruHiHYgqzlrU1E++SwH
	jMTvKlMu7/itsAtv+U9C0R+u/ka35He0vyc52BhL8ERqrSlY+SM07NjqzWBdt0sI
	9smWXdCnO7n8tKVNaeAr55Glu6Zta3b4QEzE2zGdeEhQcWK4jMYJRGdpnbu+vWpk
	B0P/0poKxp1AVBOmaZ+ilMX4tj78QsXxkrjeY96OMKRExv2zJOoZfH9mcVsb36aH
	+mXxxv1AvfKXS1zmmVvDmU1qNeukeilD2cCBFH9CFXD7OoIcAGUl/lnVA==
X-ME-Sender: <xms:tStVZANxOgSu9MUfd4onFYvjEC1Q-ecjIuzdMIBsbByPeiyeL_OXnQ>
    <xme:tStVZG_sJF_mXQYiTYUr6frtokXiWpaXmY3t2Z31V1yk75Wp8PanY-uxYB45oyJDH
    iborKZjmf0w9e4GtA>
X-ME-Received: 
 <xmr:tStVZHS92N4MpGCrM3h5gsb4EOR2gpLRjnuZRkAl89fvQbMtePNDyClU6XjzlQCuQJPaJXv1b9nF9yZeWAHZdjqeNBkMP52zovedTOIqiA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddguddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvihhmucev
    rhgrfihfohhrugcuoehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomheqnecugg
    ftrfgrthhtvghrnhepkefgteefvdeivdfhffdtfffgieffhfetgeduudekieefueeutdel
    fedtveeuheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepthgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhm
X-ME-Proxy: <xmx:tStVZItOUiAJfmKedefgPpdFuGgxmyOykqTyhiTYWUMXHNRzcYYSHw>
    <xmx:tStVZIcXBOSxbiKdqhnC_cWMP9r4encyeK-zIRky2bIKGUcWS-2kQA>
    <xmx:tStVZM3qOwbEh553ucsQSWfxM0ibdY_0QTiO3ncOwtjUclWrhyG5dw>
    <xmx:titVZA791yyQVEj5aWAQsLpZ5qkUOKb7ucgafKo6DmUHYrDOMC3UxA>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 12:15:49 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: amd: yc: Add DMI entry to support System76 Pangolin 12
Date: Fri,  5 May 2023 10:14:58 -0600
Message-Id: <20230505161458.19676-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HZVZZJSWQTU4CITBPEJUWRS4ISNOWBD5
X-Message-ID-Hash: HZVZZJSWQTU4CITBPEJUWRS4ISNOWBD5
X-MailFrom: tcrawford@system76.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, productdev@system76.com,
 Jeremy Soller <jeremy@system76.com>, Tim Crawford <tcrawford@system76.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZVZZJSWQTU4CITBPEJUWRS4ISNOWBD5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jeremy Soller <jeremy@system76.com>

Add pang12 quirk to enable the internal microphone.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index b9958e555367..84b401b685f7 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -297,6 +297,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "8A22"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "System76"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "pang12"),
+		}
+	},
 	{}
 };
 
-- 
2.40.1

