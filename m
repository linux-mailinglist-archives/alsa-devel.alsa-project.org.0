Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AF36F8CF6
	for <lists+alsa-devel@lfdr.de>; Sat,  6 May 2023 02:00:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 416FA2AC6;
	Sat,  6 May 2023 01:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 416FA2AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683331229;
	bh=iVX7lclcAoJnIF4W5fGmj75PmCzgU51PsGVm6brEA8s=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HF7oDsvIUnF864t6/QnJ6KOxCai8fWfSdIDoGLvTU7NQ3AUUmdJTbkODqKat78UBp
	 M/ySiJvDL4H+19xvGbc6e7gaJWincz7VjohAapda7WmZc3m48WqVgvv1uDL1puvT3b
	 L2iGxsJDaUetKC2+P+5+x7CUG/1RgI1vgWwIGJeM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E67CF80534;
	Sat,  6 May 2023 01:58:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 862E1F8052D; Sat,  6 May 2023 01:58:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF587F80529
	for <alsa-devel@alsa-project.org>; Sat,  6 May 2023 01:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF587F80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=ljones.dev header.i=@ljones.dev header.a=rsa-sha256
 header.s=fm2 header.b=iecNa1aE;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=E55B8Dzc
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 2C1453200904;
	Fri,  5 May 2023 19:58:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 19:58:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1683331118; x=
	1683417518; bh=wgx9OlJUGgtCHCUW3XQZRT2ug76o6oSVL5OftK+7SPA=; b=i
	ecNa1aEUaai5WLVrvylzG5UiBHzj7u0pmTawrXirhMWio6917vq5zIjNL2hcmt4r
	CN8xbBmaMGpqeKyy5Lu/ps5h4qd/oRcL0YaGRl1R6kUWWizqX1ho42Ntr6CoWfX1
	0e3/1rO6BdokPvL/m6mhDRV03oA/mBEfkVw2yU5jbfd5IIbnW2yHmYPTmuLUZ45O
	IsAvuH0I3lg8ryl7i/pbB828zPmiuBCw2lRXrDDhSBTmvMF0KGJqcHlbRAVU4BL0
	wWeoYabpXJT0Xlpl2lq6EKHNiyQs1PMRDLF1QUhPDnql1GL9UOwkLueTYW/d6Chi
	kejzdbN86cljLbfUz7aFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1683331118; x=
	1683417518; bh=wgx9OlJUGgtCHCUW3XQZRT2ug76o6oSVL5OftK+7SPA=; b=E
	55B8DzcHlRoR9q8iF8dinAPz4esIP4ka2JLjPMvsWL2HRgjd45UYgG5NywQSA30t
	0a17KrmTXz7vfEK+k2aCUUga4SsLCxTyaCufOsyZdsxOtdzLqOHo93UaA2mvmj8h
	Tpz/QyhcPHlYzMKc6X8Li3cSUD54YVS+ykyyCJscTt2pXrRJt0vxdEcRT1vpwWKX
	eLuYRTZyZwP+5AwW114m4TDZUgD7lKNj5q+peLceBqkAfmomPlQrxmqCXJgF3d+D
	qnyL3E8rlQEvZ8rm/hBQcdNr3KUfjygGY8ca6Y4a9jS9FpZqNLrlOoAINsrP526j
	QG6yS3Tn+byASV3tppI6w==
X-ME-Sender: <xms:LphVZMnO3ZK3nPpEKrAYHUv45vYrP_hxdiQdRu3rjawsFXA6TQfZ8g>
    <xme:LphVZL29ewc7TuOhgl2T6zQ57UjpAy3bYnzKCvU1J55u050woEe5wjCy_ZLaZOii0
    Q096IAGHHL-Qg4iX8c>
X-ME-Received: 
 <xmr:LphVZKrvwyMeyQtYBI_7CulYqCqx7EBLmWFoa2zH_FxTroZ-QXWfrbpjjqTT>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrfeeffedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehl
    jhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfetfedugfetudeuheetjefhue
    fggfelleetvdevtefhueeujeefvdegleevhefgnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:LphVZIkzW-U7-6chNVsJNA12AOsUQpfGaffj0bO6JeCYlHxNP1rjWg>
    <xmx:LphVZK3LsSS7tZ_Z4BwAMaDYBimmslH7zgXoVXgs1GGlwoslHsWH_A>
    <xmx:LphVZPvCE6eVN8jNR_w2GPg-KiRshJpWVKYvEjPxg4Rn8Gr8z2GXZA>
    <xmx:LphVZIDBN8gYBeici_RUOqWWkWKsKl3MhL2Wvv2TROMI78ilHT9hZQ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 19:58:35 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] ALSA: hda/realtek: Add quirk for 2nd ASUS GU603
Date: Sat,  6 May 2023 11:58:24 +1200
Message-Id: <20230505235824.49607-2-luke@ljones.dev>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505235824.49607-1-luke@ljones.dev>
References: <20230505235824.49607-1-luke@ljones.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7L3ITL6URDY5RTJT6QSJ5MQGY6CRGOXW
X-Message-ID-Hash: 7L3ITL6URDY5RTJT6QSJ5MQGY6CRGOXW
X-MailFrom: luke@ljones.dev
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, tiwai@suse.com,
 "Luke D. Jones" <luke@ljones.dev>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7L3ITL6URDY5RTJT6QSJ5MQGY6CRGOXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add quirk for GU603 with 0x1c62 variant of codec.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3b9f077a227f..87839bf77b5a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9519,6 +9519,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1b13, "Asus U41SV", ALC269_FIXUP_INV_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x1bbd, "ASUS Z550MA", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1c23, "Asus X55U", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
+	SND_PCI_QUIRK(0x1043, 0x1c62, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x1c92, "ASUS ROG Strix G15", ALC285_FIXUP_ASUS_G533Z_PINS),
 	SND_PCI_QUIRK(0x1043, 0x1ccd, "ASUS X555UB", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x1d42, "ASUS Zephyrus G14 2022", ALC289_FIXUP_ASUS_GA401),
-- 
2.40.0

