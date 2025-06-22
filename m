Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6193EAEB8D1
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:25:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41D9260288;
	Fri, 27 Jun 2025 15:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41D9260288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030701;
	bh=FXgCVQg29xOjyufmDx2h3U4xzkRyePHzuqYijSCrFKk=;
	h=Date:To:From:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=PwoEHqC7B4UNh49H0p4JFBN0Y6yVS2HeNnoRZP3Emmm7iUjCm98N3GX64BV61/TvU
	 5je9DrcjuNSYFEot1U/aWNfCF6OqXATuG+JzjM51S7SoaQ37goxoPtiulQ+FDJfAgc
	 jwRjgTyTyg7nCWxTgam6esPZ5c2Fstuiijc2Spc0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C27CF80698; Fri, 27 Jun 2025 15:23:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2E71F80693;
	Fri, 27 Jun 2025 15:23:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3895EF80424; Mon, 23 Jun 2025 00:58:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_PASS,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch
 [185.70.43.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B126F80087
	for <alsa-devel@alsa-project.org>; Mon, 23 Jun 2025 00:58:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B126F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256
 header.s=protonmail header.b=FUTiJ206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750633087; x=1750892287;
	bh=FXgCVQg29xOjyufmDx2h3U4xzkRyePHzuqYijSCrFKk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FUTiJ206dDlEqFwmj3QoCEUKArZFq0mtMfcDE0uQR1bQqBhxdd+oTMBDYiTjc6i2X
	 pe/afTntg55zoqjdoUAOvByxxpJUXajCLwBqRPteJimzli1QNahQqFzVBLTjCmXyGO
	 cD+8+5EYaj26+NKd1OJBPNwBrDhp0htfIXFsa4OAxrKlPi1LzQ5RVKOhwbDsf7O9b4
	 xPVOKi+BQNSRVWTUVH0GPbTwte/qFdtMTKMQZHIu27vGZKku+dYipdu6dyjs2rcPvW
	 TKArklvUCC6QwgfhO3NUroAKajJ6j4KEq0OHVG2tZsLh8qBlb5jOAJ1QBCbRzKZ4DS
	 mdd4i0Vwplsrg==
Date: Sun, 22 Jun 2025 22:58:00 +0000
To: broonie@kernel.org
From: Yuzuru10 <yuzuru_10@proton.me>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Yuzuru10 <yuzuru_10@proton.me>
Subject: [PATCH] ASoC: amd: yc: add quirk for Acer Nitro ANV15-41 internal mic
Message-ID: <20250622225754.20856-1-yuzuru_10@proton.me>
Feedback-ID: 69774799:user:proton
X-Pm-Message-ID: e9c87519a1144c14e2af0cfc88eb17c421809c90
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-MailFrom: yuzuru_10@proton.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GVAXNX6GJ3VNUGU76Z3SWAUJNBFNZNT4
X-Message-ID-Hash: GVAXNX6GJ3VNUGU76Z3SWAUJNBFNZNT4
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:23:20 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GVAXNX6GJ3VNUGU76Z3SWAUJNBFNZNT4/>
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

Signed-off-by: Yuzuru <yuzuru_10@proton.me>
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


