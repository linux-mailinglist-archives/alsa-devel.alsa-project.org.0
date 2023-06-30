Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D066774339D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 06:33:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FC871E4;
	Fri, 30 Jun 2023 06:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FC871E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688099597;
	bh=040OH8KVbdGj2Wb407X7gz9RRRiPZuPbavdXhsXklKg=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CLSIdfqK/2G0jH0XQFC60UCQ22Jhm9vFoOqTpWzm5OF0iKs6P9iuNs4ghnQ9fD48F
	 yMh0gy+qt55n95OG/KWhYx3FNTN0o9iMjx70LaFjXBKLx58ugL9nwcCNn9wT6Z8f5N
	 lKxoXhWnNi/igQROh88ihS7wcBBZnoRKZb77RpWU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29521F80431; Fri, 30 Jun 2023 06:32:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B703F80212;
	Fri, 30 Jun 2023 06:32:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38D3DF80431; Fri, 30 Jun 2023 06:31:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC4DDF80169
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 06:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC4DDF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm3 header.b=qM6OGu7I;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Gy7eIe5t
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id EB90132007F9;
	Fri, 30 Jun 2023 00:31:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 30 Jun 2023 00:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1688099479; x=1688185879; bh=UiAWsI8tH3
	jOLRq3enhFEFv5i0nenQzGAZVM87LWRNw=; b=qM6OGu7Ir7gJkulUdQLhY68WmV
	kzOILSOf2bLI7YLQhxcx2LVcimvorZFCfHb42lX7MoaAH4CFOLiLR+NFFS/DoGLe
	aaCx53zXhVIesA5AFgkssu4RLN18g3AdKQbtfGVFeXxa0NQUjIxiZ3JGTZ4H3jxT
	Bb/rtgLrMaq3XXNikCqb7PtusLHgUYSbTLWheAyCJpV5LedUYxuhduGpVVrhLO4x
	n0qUCKerY9s3u8HWV4kT4/RQnnNReFDNzkRrctB7YCv5Jat6mIvSOcDJYuhaIxtu
	I5lzONl9i6BHDAaxul9xmrnQmf98VFnIxtfmsPwSnvStHLM9P/LLpmNm7qVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1688099479; x=1688185879; bh=UiAWsI8tH3jOL
	Rq3enhFEFv5i0nenQzGAZVM87LWRNw=; b=Gy7eIe5tXUgs1ekxnhKG1zqHL/V2P
	kpM4UPsJYtlIapwipTGM1LqDATqJCGKpJWr+OqeSQ3JjcOGDgiLQOH51HZyCrPaj
	QsB4YF4m1HpTOGZNsxoz2DFa+C8lOQNAavuj1MQ8BQl02vxwHQYV4Obn0cfHwuO5
	ddFVllfOFkCwbfMq5TQG37DNXrTFnmotCcUUKRuURkH5wxYw+dfdJQGIOSOpp2wj
	QQZvqttAIoSK9CM3tt53quNuvKJFxcBHFmn5hPgnqH+57a1QCjx7o8kE/yb5sxlb
	P4TyegSH9Zjwxm3XaYTFHLKtVbZgkggQN+iHIEai5TyYBoU/+nn9b1skA==
X-ME-Sender: <xms:lVqeZCLmNXUW3NYBAZUgUTHa206tAl3w3pJZ5XAx1tz5W8hvCsSlcQ>
    <xme:lVqeZKKkA0D8hjKGvSNk0Y4gRou_xILDWK7bh3AQf7nGJXyRFTDJcnNiD4dMDYP4s
    lBFz6h6Zp61brsnKfI>
X-ME-Received: 
 <xmr:lVqeZCv9LsAqsiXr3YIVQdzN5JIrrXyWOw-ak1fnWtVpR8_VTCknl_Egyb_8>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedviedrtdehgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
    dttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhjohhn
    vghsrdguvghvqeenucggtffrrghtthgvrhhnpefgudejtdfhuddukefffeekiefftddtvd
    fhgeduudeuffeuhfefgfegfeetvedvgeenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:llqeZHbZ_f2BnLcuZ76G-7HiYZo6KDo-dHqbc88TjkTbIPC_mqBJqg>
    <xmx:llqeZJZfgT-zMUn-_RowPcm0whCgEKjgOIXPAuJB9htI7ms-OrVG4g>
    <xmx:llqeZDATJfmsh311JNlWTzQjHtZfex3KH4Wegb3845JbemCm2QrHzg>
    <xmx:l1qeZMzwrTn117Nq1dDv7LSzqxY0ywfbARddcdPYjMuxEAIWwm3ciw>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jun 2023 00:31:15 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: tiwai@suse.com
Cc: perex@perex.cz,
	sbinding@opensource.cirrus.com,
	andy.chi@canonical.com,
	tangmeng@uniontech.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH 0/2] ALSA: hda/realtek: Add quirk for ASUS ROG laptops
Date: Fri, 30 Jun 2023 16:31:04 +1200
Message-ID: <20230630043106.914724-1-luke@ljones.dev>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XVL3WY576DACPYIJVD5WIZZBYBIT6BFB
X-Message-ID-Hash: XVL3WY576DACPYIJVD5WIZZBYBIT6BFB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XVL3WY576DACPYIJVD5WIZZBYBIT6BFB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adds two quirks for each GX650P and GA402X laptop with the I2C connected Cirrus amp.

The added quirk chain is similar to the one added for ROG Ally but with the verbs
removed. It is likely that the ROG Ally quirk will move to this set in future.

Luke D. Jones (2):
  ALSA: hda/realtek: Add quirk for ASUS ROG GX650P
  ALSA: hda/realtek: Add quirk for ASUS ROG GA402X

 sound/pci/hda/patch_realtek.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

-- 
2.41.0

