Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0953C3C9A19
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 10:04:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 863F616A2;
	Thu, 15 Jul 2021 10:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 863F616A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626336280;
	bh=rXd3rGaZ0EkgeHDojGaFPpZiTaj1DBoxC6XqwIBWSCo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jveJzdoF93gutoCZn46n4LIK+esO0m7u1tAsGBdr+HHuBfnhCy49FAfNXVYUFKuSm
	 2ExS9Oc0tQjvbshdpb0LyIjGfW9sfqs8tooP0cK+ks6V98jRi6qMGmzTqR/2/lGAFX
	 gp98F7mtdywD1MHsWTZrdTs00tMkw9KRQn1gBEMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC31CF8057D;
	Thu, 15 Jul 2021 10:00:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DF04F80544; Thu, 15 Jul 2021 10:00:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA574F804DA
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA574F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="HckqRdQ6"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="VzJte51Y"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 981531FDEB
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 07:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626335992; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+80vNdV6jE9Ou8O5FXAHfr7DOF9xGqto4WGILLz14c=;
 b=HckqRdQ6SGh9JzUdfNrkvTAQIQpQ8AtVZ8hhlYczC8/S1FTrWpscB1Cd4ENS1ATSTyvhnu
 0pgkie22c1dI8Ve0p5VMexSKbTQQZxqkbQlEsdZ+ULSCS5jG8rFQUh0yB1sEL7kSiF+R8P
 jMnsFW1L+9OZ0UyCp555sF75wGcO530=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626335992;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+80vNdV6jE9Ou8O5FXAHfr7DOF9xGqto4WGILLz14c=;
 b=VzJte51YWp6KnPn/utzTLyfXukQZ3h+HcGFW01eGjE3snTFnX5WqVpPSl3q51Idn+q6/S/
 +R571eUdXWWaqiDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 85BF4A3B8F;
 Thu, 15 Jul 2021 07:59:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 04/79] ALSA: doc: Add device-managed resource section
Date: Thu, 15 Jul 2021 09:58:26 +0200
Message-Id: <20210715075941.23332-5-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210715075941.23332-1-tiwai@suse.de>
References: <20210715075941.23332-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Give brief explanations about the device-managed resources and the
newly introduced snd_devm_card_new() helper.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .../kernel-api/writing-an-alsa-driver.rst     | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 01d59b8aea92..255b7d3bebd6 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -4172,6 +4172,39 @@ module license as GPL, etc., otherwise the system is shown as “tainted”.
   MODULE_LICENSE("GPL");
 
 
+Device-Managed Resources
+========================
+
+In the examples above, all resources are allocated and released
+manually.  But human beings are lazy in nature, especially developers
+are lazier.  So there are some ways to automate the release part; it's
+the (device-)managed resources aka devres or devm family.  For
+example, an object allocated via :c:func:`devm_kmalloc()` will be
+freed automatically at unbinding the device.
+
+ALSA core provides also the device-managed helper, namely,
+:c:func:`snd_devm_card_new()` for creating a card object.
+Call this functions instead of the normal :c:func:`snd_card_new()`,
+and you can forget the explicit :c:func:`snd_card_free()` call, as
+it's called automagically at error and removal paths.
+
+One caveat is that the call of :c:func:`snd_card_free()` would be put
+at the beginning of the call chain only after you call
+:c:func:`snd_card_register()`.
+
+Also, the ``private_free`` callback is always called at the card free,
+so be careful to put the hardware clean-up procedure in
+``private_free`` callback.  It might be called even before you
+actually set up at an earlier error path.  For avoiding such an
+invalid initialization, you can set ``private_free`` callback after
+:c:func:`snd_card_register()` call succeeds.
+
+Another thing to be remarked is that you should use device-managed
+helpers for each component as much as possible once when you manage
+the card in that way.  Mixing up with the normal and the managed
+resources may screw up the release order.
+
+
 How To Put Your Driver Into ALSA Tree
 =====================================
 
-- 
2.26.2

