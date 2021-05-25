Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0CF390287
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 15:30:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C178173E;
	Tue, 25 May 2021 15:29:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C178173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621949420;
	bh=g3q2nyF6/0nTgrBzKvw078ZOxm3QDc2ptgilDyg+7GQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4F8gfdCKLaTO/K5n8+k33KrBgFir9hyot5JwvEMDg8h70BKnBrFGmfqFyGrtDLWF
	 l7s6//pTp/bRLNbF3m69XS6v5B9mZz78k691Xj7ZaPJVXSQTg2Jp32z4T/oWCosuRf
	 WzfYnXUlEgGUwhftpke9Gv7ja7UPYrwAVS/cZu24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24984F804FD;
	Tue, 25 May 2021 15:24:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99650F8051A; Tue, 25 May 2021 15:24:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63347F804FD
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 15:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63347F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="MFuEG1Z+"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RjuipA83"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A0F0B580729;
 Tue, 25 May 2021 09:24:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 25 May 2021 09:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=hGHCrNM0M2y01
 6SG38SN0lpQyVWkJTBkFC7xFnRt9z8=; b=MFuEG1Z+Zp0+p7jr0t4fLH5hVzAIk
 aLYaBtymMtqZuzP/TXqshbTg3LpTGpdBvhpS9diIY/dYNJzR9nfDYy6rP1KjrhkA
 sCT4dCPzSa/Gn5XZn6zAw6sbhJHYMefgY2ppc5LtZoimVqKUsfuZzGKHIpWO+rhp
 W4X6YUL3/3bC8OtHjo8kjjRCMbcq87glKwGWRW+TBSQepCFAEylyK6r0kE/J7mEk
 aQubZfrEarAgCi1u3h/9iYM+rrI9WKNp+hhxjTMdXGPOlf4BsQBqSWwbEWrW3M78
 HucjQc3mmtIXYuGJ88Vt0WVFkqV72uOEWdHnosVn1HtqzCS2v1xFd3r2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=hGHCrNM0M2y016SG38SN0lpQyVWkJTBkFC7xFnRt9z8=; b=RjuipA83
 vxl71CUaAicSglE6oP505P+gT6EUQKtyErrnVaboQJdKOGtkJAy7TfG8TfI+HL7w
 VSaIaxh6yPVTBw0lgoHmY6R0wovJtUpsqJs8MPSq2UWgh0yqiz+ipeO9xsihNpGP
 Ny1TNEq8JEs/7dwBrieryX5bmt7MrRXlHw3Y/T4+QfD6joVSl+1XmURJWHrpg7f1
 jiOzdrW9daRrCAqG67DfqQMBvlz//n4UWUg6zm+rO08fEUyXhK68vYtyxU2wuKOw
 sWSqYKpCTOGxPzdn4ytTvUDK7EtsuNTesiRi0ayzUqdgb1xCithxiWaK4oGwQSYM
 uRYeRqRw1xQjGg==
X-ME-Sender: <xms:jfqsYC2TzYciIcNKlOhuwg2yG2NMvYCJnZSQGKzi0QMr8tIheWPIIw>
 <xme:jfqsYFE0NIBO5ZJrHr_XZVSn31fW6N-h3Dw5-6vzmFwB6C5jKozR4hI74DtVYHI3p
 IP0P_eetc_9UzeOpKE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:jfqsYK5kR-0KEPm81XR_K_IGdYeIutKQ8zu0SxO_g9X3Lj-wrd7sJQ>
 <xmx:jfqsYD2eJSVsDSzbI2bK_QSVrPvBVbCTptDOtvyQXd6rRJ87XuHSJw>
 <xmx:jfqsYFHyrp8M4Z5fPRIR48n0oTS5us70osuIXHqeEeM8KOqeh_zAcg>
 <xmx:jvqsYIbSgvJbcQjV7pEbeW48B0w2ZW5Vdvp7jJhNEquYKGAQfU0epQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 09:24:29 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 12/12] ARM: dts: bcm2711: Tune DMA parameters for HDMI audio
Date: Tue, 25 May 2021 15:23:54 +0200
Message-Id: <20210525132354.297468-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525132354.297468-1-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, linux-doc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Eric Anholt <eric@anholt.net>,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Dom Cobley <popcornmix@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
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

From: Dom Cobley <popcornmix@gmail.com>

Enable NO_WAIT_RESP, DMA_WIDE_SOURCE, DMA_WIDE_DEST, and bump the DMA
panic and AXI priorities to avoid any DMA transfer error with HBR audio
(8 channel, 192Hz).

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/bcm2711.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 720beec54d61..9d1dde973680 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -344,7 +344,7 @@ hdmi0: hdmi@7ef00700 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "wakeup", "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
-			dmas = <&dma 10>;
+			dmas = <&dma (10 | (1 << 27) | (1 << 24)| (15 << 20) | (10 << 16))>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
@@ -385,7 +385,7 @@ hdmi1: hdmi@7ef05700 {
 				     <9>, <10>, <11>;
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "wakeup", "hpd-connected", "hpd-removed";
-			dmas = <&dma 17>;
+			dmas = <&dma (17 | (1 << 27) | (1 << 24)| (15 << 20) | (10 << 16))>;
 			dma-names = "audio-rx";
 			status = "disabled";
 		};
-- 
2.31.1

