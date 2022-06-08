Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AE154321A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 16:02:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E20DC1898;
	Wed,  8 Jun 2022 16:01:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E20DC1898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654696947;
	bh=BpDN2kiN686svf//ATLLr+JfKLlUS/fQbwAmK6CRz/E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a5OW8PgvNRX2kIWeMQB9qIq6N7KtTi2ZpJz1QqvqXc5bL5P25pS8eYp1Ffo7GPfk0
	 LlQ2ZXLJVrUANbuJ614axwH+wAYiCAvIruN3Ntt4UtrVai9uWjURZbogTtkEOTW/+f
	 6MdFMCFenWaosQ56GPRpkOWhm7LlLYgR+gscBCTw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 555A0F8026A;
	Wed,  8 Jun 2022 16:01:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 298FCF80245; Wed,  8 Jun 2022 16:01:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6322F80245
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 16:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6322F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=system76.com header.i=@system76.com
 header.b="hdfJPJHy"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mZG7PIBv"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 64AF5320055E;
 Wed,  8 Jun 2022 10:01:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 08 Jun 2022 10:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=system76.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1654696873; x=1654783273; bh=TR1Mc8jC62WZY8Rk7AWB89PGs
 X3GoiT9VJEbOuJgRz0=; b=hdfJPJHy+MDPMRyAPTynC7nwwFx4Ilo/ammS7evN5
 oIRtmxhV4F1UBpcFnRRhShnMitZ3zI39SCf1bkhQnFxiOR5ClraXwM433iGtBhHe
 VIUDeKOGblkxA/bbhfZSZxAq/5oIlZLnlNYZCzw+NjEeaB+iciRnROacllXLNwfE
 NCxoQ/kNBcf77zWMFUKGNt+LtorRn1AnFjqz3oNkJuB10Ys1jSKfDWZwi1IZ7FNw
 p81FGjsk9uw6TgaqdbNNd4wLEGKnjJntLB+6Yy6bbKZUY5uu3Dvzrq5fiBPWTTYF
 jmxp5IrH2fJAiHGLO77QKENlfRJod5iL71QNsgR4/KRPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1654696873; x=1654783273; bh=TR1Mc8jC62WZY8Rk7AWB89PGsX3GoiT9VJE
 bOuJgRz0=; b=mZG7PIBvuu+z8BTZVQDIcBV/xm1d90Hy/fvdE0gySDvPAoXs18w
 1qpBxuxlsYR2uR38jSrccFnupgvQiWa/ySGbhjXQuGU3C/u3O+ldr95ZIiBAtZKw
 Qs/REjlFi/tgo/Tal+3KGjuXc8AGgD3olkB6s5rpvRSaxQzQ9rzjWA69yaXGoRun
 vv6OAQ6sf2b7bTf6X8s2YY9JtqzAEwQNU17wpw5gCgiMK4K6igWNDbFK2yCkyDe4
 S2dBAitxPForPJ3NJSGwE9hF9uoCrJQnTCbR3XwrStuaPTmMTsTkKuh4i6yOjN8K
 4HADaIpQGnap5Wiqqi52hX2FF1QIUL0kXBA==
X-ME-Sender: <xms:qaugYqKHFjQvuW81O5en8hSK7agS59uY5Ix2GmleVRShfElFP0jkww>
 <xme:qaugYiJowTiJyfcSVi3diBI495HmCPimARjrO92BdgQEI0zjMzDCSJISc1N4bymO1
 AK48lXBKiI6r7cdpg>
X-ME-Received: <xmr:qaugYqs6oGAzfpXF-FmHqc1akvlEUOiQ1XDFetY4RisEOGk4AzWI4eS0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtjedgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepvfhimhcuvehr
 rgiffhhorhguuceothgtrhgrfihfohhrugesshihshhtvghmjeeirdgtohhmqeenucggtf
 frrghtthgvrhhnpeekgfetfedviedvhffftdffgfeifffhteeguddukeeifeeuuedtleef
 tdevueehfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehttghrrgiffhhorhgusehshihsthgvmhejiedrtghomh
X-ME-Proxy: <xmx:qaugYvYIdr13STsMLUZIty9XXSDEBo4dP4CXi7tkC4eG6yb4caHLeA>
 <xmx:qaugYhaZWor-xSCSGYLRR0fI1oynaPOTF9VGvy0pqKY3E_ZiU7jlTg>
 <xmx:qaugYrCOSwOF6QHbbYYwdNpAyECGcPomL0A7KuM4_eIriSkbUE-0lQ>
 <xmx:qaugYglzu6EAkB4uzBgir1y3OER8MwkhNU0eGd_rbRggKkhW3K1tXQ>
Feedback-ID: i1761444e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jun 2022 10:01:12 -0400 (EDT)
From: Tim Crawford <tcrawford@system76.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Dev One
Date: Wed,  8 Jun 2022 08:01:11 -0600
Message-Id: <20220608140111.23170-1-tcrawford@system76.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, productdev@system76.com, Jeremy Soller <jeremy@system76.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Jeremy Soller <jeremy@system76.com>

Enables the audio mute LEDs and limits the mic boost to avoid picking up
noise.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
Signed-off-by: Tim Crawford <tcrawford@system76.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 7170e086f166..b0f954118e72 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9071,6 +9071,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89c3, "Zbook Studio G9", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89c6, "Zbook Fury 17 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89ca, "HP", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
+	SND_PCI_QUIRK(0x103c, 0x8a78, "HP Dev One", ALC285_FIXUP_HP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-- 
2.35.3

