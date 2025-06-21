Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 869EEAEB8CE
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:24:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 408E7601FC;
	Fri, 27 Jun 2025 15:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 408E7601FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030667;
	bh=U1t7u8l2/hiXO8Wzq2xYh/3s2sZDhAvFEnY4rfcPWyA=;
	h=Date:To:From:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MM2bdqJqjJx9oBfeV5FQCVCrY4M2A+GrSqOf+JHlN/dTzd9YF7M63CDiFojkAGyAW
	 hx4knZxzXqBMCq7HShfjrJbV74KRkOqRzhWAYO7zIcULqAQ2Uwws4QAZXfZDWF1Vwa
	 VUhmsAQcX5HD6RL45ipb6W7b0Eq0apU8rLGDyspU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E9B7F8063E; Fri, 27 Jun 2025 15:23:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8B88F805E3;
	Fri, 27 Jun 2025 15:23:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2EA1F80269; Sat, 21 Jun 2025 20:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9B25F800D0
	for <alsa-devel@alsa-project.org>; Sat, 21 Jun 2025 20:02:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9B25F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256
 header.s=protonmail header.b=hiPNNJqb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750528951; x=1750788151;
	bh=U1t7u8l2/hiXO8Wzq2xYh/3s2sZDhAvFEnY4rfcPWyA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hiPNNJqbazqpKySnh8Nf+HJgKT+wW1E6DivuujtjwDHd6SLQC9PnGCVZQZOWkiQpa
	 lMey8cTICzRS3o7SsvMcTmigL0H9vtvotuamLex6kmfnfoOn6QerKT0LXxxNoijD+E
	 RSW7k6judvZag8ugDmCQSXCmsGfnsx40A2LzKFwge2/QOj+QvQgvsq5SCTs/Fa4015
	 CTlXMvJbao9gmqzwG9Ph6aI8dJhhKzpCYKjrrLSxsgaZt1XkEYGveYx1/bB4724k2T
	 N5GFWPPk8IvWZKbcjSuCKlDncXQ4XKPjk8EYCDq4KjVFi9RHbpJzt2+TCue4WTlnyh
	 NG/Il6iBoIezA==
Date: Sat, 21 Jun 2025 18:02:28 +0000
To: broonie@kernel.org
From: Yuzuru10 <yuzuru_10@proton.me>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Yuzuru10 <yuzuru_10@proton.me>
Subject: [PATCH] ASoC: amd: yc: add quirk for Acer Nitro ANV15-41 internal mic
Message-ID: <20250621180223.14677-1-yuzuru_10@proton.me>
Feedback-ID: 69774799:user:proton
X-Pm-Message-ID: 157dc826bff55585d992db26d48cf200b97aea7b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: yuzuru_10@proton.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4PUHFIGBQINMOKYNGRNAOAEHLO4FV3TW
X-Message-ID-Hash: 4PUHFIGBQINMOKYNGRNAOAEHLO4FV3TW
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:23:20 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4PUHFIGBQINMOKYNGRNAOAEHLO4FV3TW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds DMI-based quirk for the Acer Nitro ANV15-41,
allowing the internal microphone to be detected correctly on
machines with "RB" as board vendor.
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 98022e5fd428..499f9f7c76ee 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -353,6 +353,13 @@ static const struct dmi_system_id yc_acp_quirk_table[]=
 =3D {
 =09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "83Q3"),
 =09=09}
 =09},
+=09{
+=09=09.driver_data =3D &acp6x_card,
+=09=09.matches =3D {
+=09=09=09DMI_MATCH(DMI_BOARD_VENDOR, "RB"),
+=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "Nitro ANV15-41"),
+=09=09}
+=09},
 =09{
 =09=09.driver_data =3D &acp6x_card,
 =09=09.matches =3D {
--=20
2.50.0


