Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E61E74687D
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 06:50:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D62E4852;
	Tue,  4 Jul 2023 06:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D62E4852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688446230;
	bh=tY5/r16lNfESw+ZriT6dJ0dD82ocpxp52F96jol386A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vCekZtMqHYGYXGX342SlNpnygEpZcwOUSmILM1sLoDwYTlqDXAJPRikUk21qNtFbn
	 gVHwLfXCuPYjqoWw7LzTR6ERcF2og3ulmXE9W+cApqVldkdW/Rui0DXfqGxz+znjAR
	 56M3SygYRFy2SCdRAuEyP9Q2ewvIrU360sFnD8wQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87CCEF805AE; Tue,  4 Jul 2023 06:48:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7388FF805A8;
	Tue,  4 Jul 2023 06:48:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFB84F80125; Tue,  4 Jul 2023 06:46:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D017FF80104
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 06:46:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D017FF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm3 header.b=XlXegA7O;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=aoOR3VF9
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id BB80C5C017E;
	Tue,  4 Jul 2023 00:46:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 04 Jul 2023 00:46:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1688446013; x=
	1688532413; bh=I7hwEV3srjyCYS9t+KWnEQ73pm3PsV/kMvHeobjOFJQ=; b=X
	lXegA7OjSwia35Cvwj9U6IIADHrmmE/GEUE0vKaLiZ0JqiestiZXqCnXi9Y3bmtX
	rfgoA6QhAz+rLufUskh2r1eaFNijxn3gj0J6I80KktDL9VpMukKz0G5EZhS85b6i
	IGjGLmBUyCRARx7YZn8RayU+x2WWN60ehsZ3jWKz7wY7YE7DBOTGDq60BWSc0X6H
	oyZU0o40l1B6RtH5DV3lsLRVlb1Uwf+Ch7zOadohJ5Dzy+T952kwXUrg298zGw1U
	cxwqYy9652mPrULRN9dC0qWMyM6g8+5qEXtUr+HHkjiqwkz9GxG3V6+5bdtvYaw0
	vNUw9F/4UZkTBHnFLDcOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1688446013; x=
	1688532413; bh=I7hwEV3srjyCYS9t+KWnEQ73pm3PsV/kMvHeobjOFJQ=; b=a
	oOR3VF9pK9LHYkU1GsLZh3MXRTx8UXEfnTFj11+Dg6w4X0pZmy1dKg/p26lZAP1n
	4GkPdwSYSZkaCGnsE+eJVfqCDICLg0kVCStjwUROhC0pbAimyydLUibp890uUDwZ
	y05ds78HyFA4dhp6gsTZKmJZKoHybOuRQIzlBI9WH9v1LbgvAuKLh9Xcb1N00Fie
	Z0iIHBp8q4kWFNyOLq6MXrNyItNEIFIobvi84dRvUjRxGeWI2Yml/L7e+lwxirHb
	hC/8RQApkYmHOL3Bs2QKVdjU0gGMIivFXEOPumv2GJPO/+PmAZ1AkYA2Do+Pe8m7
	cQZatJUPZMH/njO1UQ7qA==
X-ME-Sender: <xms:PaSjZPFbBr2dwFDpobYodLh5eLssqb2AuFV483H8s04V64B8XRDafQ>
    <xme:PaSjZMXHcTrWgMD4QeFyqAkczB_MwDLBjLJNfsfvb9aqg5D04THGbjtzkNAUa8pKy
    zON9JMTg8IW__kC6sM>
X-ME-Received: 
 <xmr:PaSjZBJl6RIgEhJt6dv-JQJDy8gGZZgbf9MdmPccSs1Aa3GANLGV9p3cJz4e>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrudefgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhj
    ohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpefgteefudfgteduueehteejhfeugf
    fgleeltedvveethfeuueejfedvgeelveehgfenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:PaSjZNGgqcv1JjlyxNsbjKq0I7Wvk54W-ePd6lMJ2Wz8ioKtg0QTWg>
    <xmx:PaSjZFUDpdi4p2Nl5XDqV6dLQH8RuHIPJfU8tQDDzksOnGIN0atazA>
    <xmx:PaSjZINlg8jUb5k-vHleHP7jzBGtGShNdRtIFHKG8r4dLc7RgsEXLA>
    <xmx:PaSjZAPfGU76qa8pWIV7TtGmUn5Hd58WTkykzh1aEQ-6hZyTxQiX5g>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jul 2023 00:46:49 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: tiwai@suse.com
Cc: perex@perex.cz,
	sbinding@opensource.cirrus.com,
	andy.chi@canonical.com,
	tcrawford@system76.com,
	tangmeng@uniontech.com,
	p.jungkamp@gmx.net,
	kasper93@gmail.com,
	ruinairas1992@gmail.com,
	yangyuchi66@gmail.com,
	yangyingliang@huawei.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v2 5/5] Fixes: 31278997add6 (ALSA: hda/realtek - Add headset
 quirk for Dell DT)
Date: Tue,  4 Jul 2023 16:46:19 +1200
Message-ID: <20230704044619.19343-6-luke@ljones.dev>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230704044619.19343-1-luke@ljones.dev>
References: <20230704044619.19343-1-luke@ljones.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AESPJUH376AHZOEE3H5HFZ5MNGM7HDYY
X-Message-ID-Hash: AESPJUH376AHZOEE3H5HFZ5MNGM7HDYY
X-MailFrom: luke@ljones.dev
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AESPJUH376AHZOEE3H5HFZ5MNGM7HDYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove an erroneous whitespace.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index ba3c113f0be1..1547c40dc7e9 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -5883,7 +5883,7 @@ static void alc_fixup_headset_mode_alc255_no_hp_mic(struct hda_codec *codec,
 		struct alc_spec *spec = codec->spec;
 		spec->parse_flags |= HDA_PINCFG_HEADSET_MIC;
 		alc255_set_default_jack_type(codec);
-	} 
+	}
 	else
 		alc_fixup_headset_mode(codec, fix, action);
 }
-- 
2.41.0

