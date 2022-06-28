Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3711655EA68
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jun 2022 18:59:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D00A11672;
	Tue, 28 Jun 2022 18:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D00A11672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656435589;
	bh=cnQtJT2YNF2vEjxFaiHlJHnilsiROtk24ImZlnovbQs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RhKn1xFjX1LWJ43NIamJXxc8bSB9z6+1ON7mzK3x2fQEj6+IWCdcXsV41Lp2tAQjP
	 q4SiWAEBfw0/0DFbvfYfdDqVCZicfI3i0SownnURwCgVWyS380qmJzQTXOgytLlk7v
	 AImS0pAUBJMJGV5bx8330nmH8pkD26U5bH8duL6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61E25F804CF;
	Tue, 28 Jun 2022 18:58:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DA37F80536; Tue, 28 Jun 2022 18:58:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A650F804CF
 for <alsa-devel@alsa-project.org>; Tue, 28 Jun 2022 18:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A650F804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="BQG+K9V8"
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F307F8407A;
 Tue, 28 Jun 2022 18:58:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1656435524;
 bh=Hwup3A+MAo/IIHDWPJcJuA/ZrTCj+SJh32Gz9ZwYe6g=;
 h=From:To:Cc:Subject:Date:From;
 b=BQG+K9V8ApzpqQAaJ4fC8V+TIy6dMCZu2y4/wGUR5RtMBFWX7fNyCxjiv/5bjWH0j
 wlCJ6PHKEc8qmTj2T65tYXhsEAdEaNxoepgcoHcS1j+V0HPyD1vSbazexEeJ3/5/pI
 XJgmTpns8xOmtnqmV7ob4yKG8M4suuCOsho1GO/4oWWAgiMEHDLWZzR9To/OZIyG7X
 O25i3VEGR6D9DUp82DI1aSq1zPU7lP2+CAbnrvyw29hP3G2MqIp7G8Hfa0IL9XYFco
 y8pPrSz12+ilXcN8EGr0bL7+oU7DgxMg0ll9WaCBtiIJPTxe6Nkr/FR1W8VcLmnaRJ
 v+1+6z1ipPKLw==
From: Marek Vasut <marex@denx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: doc: Capitalize RESET line name
Date: Tue, 28 Jun 2022 18:58:40 +0200
Message-Id: <20220628165840.152235-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Takashi Iwai <tiwai@suse.de>,
 Mark Brown <broonie@kernel.org>, linux-doc@vger.kernel.org
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

Make sure all AC97 interface lines are spelled in capitals,
to avoid confusing readers about where the 5th line is.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/soc/dai.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/soc/dai.rst b/Documentation/sound/soc/dai.rst
index 009b07e5a0f38..bf8431386d269 100644
--- a/Documentation/sound/soc/dai.rst
+++ b/Documentation/sound/soc/dai.rst
@@ -10,7 +10,7 @@ AC97
 ====
 
 AC97 is a five wire interface commonly found on many PC sound cards. It is
-now also popular in many portable devices. This DAI has a reset line and time
+now also popular in many portable devices. This DAI has a RESET line and time
 multiplexes its data on its SDATA_OUT (playback) and SDATA_IN (capture) lines.
 The bit clock (BCLK) is always driven by the CODEC (usually 12.288MHz) and the
 frame (FRAME) (usually 48kHz) is always driven by the controller. Each AC97
-- 
2.35.1

