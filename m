Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B05E7FA934
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 19:47:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A54EB84D;
	Mon, 27 Nov 2023 19:46:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A54EB84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701110814;
	bh=geXNpVRgk3I20R80hxfUGqxn435aRrCWq3UP1y1Q65Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lAn3JUXywykY2ISbYOsMfHDN8YKpq4Wm9VCR3rtlyK+BXT6GjWK5vYeyQAGSmfvT+
	 VsRO3GcapikvujakCrk8t/w+uPTew1fhnjU6M9zAv5qYE8/ycHk5SZ3btXsef5y79h
	 IY2fai3N24G1IfID7nYLkq6Fe8Xo1k+Akadc0kBU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40900F8057A; Mon, 27 Nov 2023 19:46:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62B89F80578;
	Mon, 27 Nov 2023 19:46:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0CD7F801D5; Mon, 27 Nov 2023 19:46:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BE9CF8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 19:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE9CF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=system76.com header.i=@system76.com header.a=rsa-sha256
 header.s=fm1 header.b=e+SHTisB;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=OWuzH4lW
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 79C335C01EA;
	Mon, 27 Nov 2023 13:46:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 27 Nov 2023 13:46:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1701110772; x=1701197172; bh=8+TngcIMRg
	F81R1bqa99WS9iwPqGLiZkgYXXdVzQ87k=; b=e+SHTisB7ZRXSSsaUuuXrusLaw
	MVR4lWzO8Nd9T0+Ogt2kMjtUzSE5QM0frqrLD2nmz1Pvj+vXfPlz99bsgbSujxpk
	kpLI85pYqpgqDPV7YEGvUeG1nlDq+KTbghQ2kXQH4t1xHAtmeu7hpEMe96A5rofS
	k4hITJzXig8aVx1LA7pFQyZTV1ZgkNI9bgsxzzv0PUHwYf421vOOkBn+VKreBJmy
	/LhJ7ushiWUYOkJFKSP6N0UWWUFCl+dZjpaq52GKd/fPb5BIwURXvZIdcU8iXkzw
	qHcD0RdQxhJBXJtn3dWnJ99GtBOtd+XA8kCQFhgbgJEXWFkemSEN47nDzIdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701110772; x=1701197172; bh=8+TngcIMRgF81
	R1bqa99WS9iwPqGLiZkgYXXdVzQ87k=; b=OWuzH4lW1U4UobvDgAv4gQ3yxcmto
	bVwUvaG2tp1Ebr4CiFOlJzHX0feSecOX8c4AKiTfhnEQL4qzJYlp05fReDIrQXBr
	/jG7HRahgGsy0jVLBkngQpHHyyJtMsjWTFqJu4u+mnwmDuFuGFipBBKMijPdQEgT
	hdmYvZ9EkFqvuUgKXFEWV/CgmzbGnbDdZWCTNNvSSslfH7wwAczNtWvxFMIwN4w6
	QM9w9HGgjK9YcbxS8ohKUAs2L4dNRqYKgZQsPFtYXYpYQho/xF9ZEc3zFzGPRZSn
	eLO87GBVdNKYWHtKo5gIh+rWdK/VbCeHK5LbknGgIQ0GphNFvb+fx1WMg==
X-ME-Sender: <xms:9ONkZQFuvBfRk19Rym5vLqL4dyUiw1DWeD-t4OqOx9HgDCopj2gBmg>
    <xme:9ONkZZXY8fQuwbFMVJ1T6Lv5505I0o8ZvirJE087sedBq-jcz0hQpTyQ8OzQGgaKB
    PXFDxKy1RGEl2VMwQ>
X-ME-Received: 
 <xmr:9ONkZaJtS2r7m2zjJPoNno56wf0WxX21aEh9C5sCqfVm1yrx_uZbt8M3hr_FvGxT8STbWhJxmlGi8YD2k-Hoby9NQKw9yf4cww>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvkedrudeiuddguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvihhmucev
    rhgrfihfohhrugcuoehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomheqnecugg
    ftrfgrthhtvghrnhepkefgteefvdeivdfhffdtfffgieffhfetgeduudekieefueeutdel
    fedtveeuheefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepthgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhm
X-ME-Proxy: <xmx:9ONkZSGm2NiEu6vXHYqJGZb7h54_UZDY4bKpbu-POuQqOzkzxGwa_g>
    <xmx:9ONkZWUmMPqD4mj89x4QAiqDb9F_A_6A7xriZdnTLXUBmhTo7Tzgbg>
    <xmx:9ONkZVOzAUX7IFNbuyz9VZaC_rgjIiq2xgynxks7ZT8QOYCvTLNC5Q>
    <xmx:9ONkZVQQQFEfm8bZyOkXK0W7m3f1CarSQMIxP9MGRrx16oHjdDotQw>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Nov 2023 13:46:11 -0500 (EST)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Cc: broonie@kernel.org,
	productdev@system76.com,
	Jeremy Soller <jeremy@system76.com>,
	Tim Crawford <tcrawford@system76.com>
Subject: [RESEND] ASoC: amd: yc: Add DMI entry to support System76 Pangolin 13
Date: Mon, 27 Nov 2023 11:42:38 -0700
Message-ID: <20231127184237.32077-2-tcrawford@system76.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5WQDA2GTZ434SBMVM3GOSV6BIOWTXEUC
X-Message-ID-Hash: 5WQDA2GTZ434SBMVM3GOSV6BIOWTXEUC
X-MailFrom: tcrawford@system76.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5WQDA2GTZ434SBMVM3GOSV6BIOWTXEUC/>
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

