Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C81596C2193
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 20:33:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D12BC1F0;
	Mon, 20 Mar 2023 20:32:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D12BC1F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679340807;
	bh=iUsYdrTQdphqDM6iHPqhXELOzmYYpY4f+wmk9zs2qH8=;
	h=Date:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=PacztD7lkyNngiGrh+p/VW5AmKAGUclFNtMY6zbEIWKmBXtyvWoY/UvfwJ3Tn7Zh4
	 3cTPZtawUxb8oMJAGfex7+4/VrPTa2Pmi1NNG5rTY7bCUIhqAmpM00cZngT9thMoqr
	 Jg2ubr5cL5dzDmBNs0fwF7v9BusKggEQ2ommrTBA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D2C0F805A0;
	Mon, 20 Mar 2023 20:30:35 +0100 (CET)
Date: Sun, 19 Mar 2023 22:44:15 +0000
To: alsa-devel@alsa-project.org
Subject: [PATCH] Add M3402RA to the list of quirks
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Mon, 20 Mar 2023 19:30:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJTJISRIPIE4LYXVF5YJ3FX35QZLSPL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167934063401.26.16721279701258282521@mailman-core.alsa-project.org>
From: Enrico Belleri via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Enrico Belleri <idesmi@protonmail.com>
Cc: Enrico Belleri <idesmi@protonmail.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E0A9F8027B; Sun, 19 Mar 2023 23:44:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DCB1F80093
	for <alsa-devel@alsa-project.org>; Sun, 19 Mar 2023 23:44:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DCB1F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=nLxRTto5
Date: Sun, 19 Mar 2023 22:44:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1679265866; x=1679525066;
	bh=ZGEj28vLVYYAKIMYVRUiIOBJfNhxSizUuZNV3iJfbRI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nLxRTto5e/dWlwHfhyzS2jnPgOSTM/4xq1tURc7UaTXeAmmJN/uqCcd1KfB0yfGcv
	 BtuUI27yTFaF3VNeTL42XBwaqVi6PxofHuHR6na9F0w0acWPdnRBAhcxKi1xZmt8WW
	 xa+FpRYSG7I9xOOayWeqY4zVgnuJJIdHowzOiBUZvnMWT7DHblHhfvuoQ3V097u6bC
	 860NE320qSwzm6NyD7NGpGAcClcVJAiY0IhuChuetTV8cUy0aguDR4Ebz4sh7/fBNb
	 Gf/SDzR7HF/deT0J13vk32Pw60lCRLKcR2kjc3g1l9Mikgkryv2Bg2pRomXII+yQkN
	 GnUUEY38RXsnQ==
To: alsa-devel@alsa-project.org
From: Enrico Belleri <idesmi@protonmail.com>
Subject: [PATCH] Add M3402RA to the list of quirks
Message-ID: <20230319224332.17205-1-idesmi@protonmail.com>
Feedback-ID: 2564857:user:proton
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256;
 boundary="------045b8f4a3a5615564519524634f8a91071d1448f08476ae49126fb25c1d84a4e";
 charset=utf-8
X-MailFrom: idesmi@protonmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TJTJISRIPIE4LYXVF5YJ3FX35QZLSPL5
X-Message-ID-Hash: TJTJISRIPIE4LYXVF5YJ3FX35QZLSPL5
X-Mailman-Approved-At: Mon, 20 Mar 2023 19:30:08 +0000
CC: Enrico Belleri <idesmi@protonmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJTJISRIPIE4LYXVF5YJ3FX35QZLSPL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------045b8f4a3a5615564519524634f8a91071d1448f08476ae49126fb25c1d84a4e
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From: Enrico Belleri <idesmi@protonmail.com>
To: alsa-devel@alsa-project.org
Cc: Enrico Belleri <idesmi@protonmail.com>
Subject: [PATCH] Add M3402RA to the list of quirks
Date: Sun, 19 Mar 2023 23:43:32 +0100
Message-Id: <20230319224332.17205-1-idesmi@protonmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0

Fix builtin microphone on ASUS Vivobook S 14 OLED 2022 (M3402RA)

Same issue with this model as apparently with other Rembrandt laptops: https://bugzilla.kernel.org/show_bug.cgi?id=216270

Signed-off-by: Enrico Belleri <idesmi@protonmail.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index 4a69ce702..80dfb6036 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -213,6 +213,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "M5402RA"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "M3402RA"),
+		}
+	},
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
--
2.40.0


--------045b8f4a3a5615564519524634f8a91071d1448f08476ae49126fb25c1d84a4e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsBzBAEBCAAnBQJkF5A+CZCt/Sbt3T+1mhYhBGWP0f7rDhhyQnowI639Ju3d
P7WaAACL1wf7BMElbMC9pUAfy+b+strNVX3rgJ1kyJ8YHbWs28IkBZo6BxbY
sMkbxmb0rxnH3/Em/zfIuFlmEJ6KClQ99eq4V3mbq8tMrkIKtSxfwoBDt9CS
huACV5Mxi4lVQ7SgJWMSZa3OLfNZdVf7uxazEicRgObEElPEEIp6SFwBZte3
7K3jx2NteIiifMjCcjN+RT4H4GWaP1cHxGobfaNpDJ0AFJbOO7TxGDkgnFJW
XDduvlUkKIIFVDubUoTOYQmJt4D438o0KALLXQe+q/WF/7AQN8qxf3aigvXM
tdTXU+r5ffeGpOIQJdtHyk2sXVgMmFQhFQtI89KtTOYpkWtCjrm+oQ==
=PT5E
-----END PGP SIGNATURE-----


--------045b8f4a3a5615564519524634f8a91071d1448f08476ae49126fb25c1d84a4e--

