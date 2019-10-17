Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C57CADAF0A
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 16:03:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02E1E1675;
	Thu, 17 Oct 2019 16:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02E1E1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571320992;
	bh=Tua/cLACoUEjnBY8xXQEbdI/Gm4LQiTF29oyaWPOTCs=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SUECW+5FmKOHWpoZg+oK89s4YfyK9laZnSPxrLZPaP8Y6ZtfGpIpWez7Ims9fnO+c
	 tQfamBFel+17Gj2aKU0HPKJET4B2m937uFRZSg/iHyRBkGf/96oSn/xj/znSkCULh7
	 WuR5W6yKLqlg1Tpt9unzPRZwIhYw0sDM/ld65+Bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05F57F805F5;
	Thu, 17 Oct 2019 16:00:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16331F805AE; Thu, 17 Oct 2019 16:00:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A971F80529
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 16:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A971F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="n2JSe8UN"
Received: by mail-yw1-xc4a.google.com with SMTP id p205so1806413ywc.14
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 07:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=sPUInOHOyJISga0nsIoDkcE9uERJbjlKtvSm1L4EC1Q=;
 b=n2JSe8UN+vMIN/vWiExN9l7uHbbCr7dpVdWQyOuT2oa/8fykg8jdwDsCluR0L7suFg
 w8aJM5nlg+fXLbJASbTz6B1as9lv8bQOQQGopbnC7xes8xulfoCio3vqOVQs3RVF8rdd
 PpXZfA2AdLcXG5fAiOfttvMZ9ZlOAkvhGORQdHuu+SJ4aYCqWkEy+K+n7Tx0QTmlcVmP
 hGDzDl32S9586nuyAGTkdZqpa0NA/HqbtiYIpNYUWD6E0UyAPRVcnXT9L/UgugPFx6Hm
 0k+ZA1nYzXNAOL+G9QdSEcj/UiBAtddYi1PezjIVCttmNidZNaeGCch9bnab9x9XdS8f
 cE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=sPUInOHOyJISga0nsIoDkcE9uERJbjlKtvSm1L4EC1Q=;
 b=IEKM9YyzoYedydo3z6+0oEFGpYohPqvgiLjrGQZPrGHE25gHFu3EKgya96PzG3O6b+
 du1CBVrpzQb24kptpRaFjqfIRYYrBqxcZ6sYMJKQaAvTttMGkpG7Ck997Wlc2s/+hC69
 RcjAjfTiTlGXBI40eddb68RPyS1P18e516UZHYjIu33NS0jkb0l4O+kBK1JAC+ikiWMN
 WHa5S5IkMfElDUF3+4jkVVCFcfuM5shAY6Q5Emg3YoIqWJQPzZ5sKL2JGakqkGxyVWhx
 b4K9qDxO5opGn1JEf8H/C4H4AH4LHw8XhcBgpJEaD4WvSzvltZFzrwIe0nqjBTd0zGIb
 HltA==
X-Gm-Message-State: APjAAAVKFJwS6BxXVSFNdI/rRV8tgkwRq/xnl5eNLLXmW6kIjVLHg6AV
 IVvJ71+ujNp+LMU0fT3WSAgEiEGTrTw2
X-Google-Smtp-Source: APXvYqxanDSZD8jVdo6n8A5IheppZHSTAOpiP67QqhT4uOuLCvuXcuyC/c3gwqOjYPKo6dsyL53ai01imaLl
X-Received: by 2002:a81:4888:: with SMTP id v130mr2737177ywa.42.1571320838316; 
 Thu, 17 Oct 2019 07:00:38 -0700 (PDT)
Date: Thu, 17 Oct 2019 22:00:06 +0800
In-Reply-To: <20191017213539.00-tzungbi@google.com>
Message-Id: <20191017213539.01.I374c311eaca0d47944a37b07acbe48fdb74f734d@changeid>
Mime-Version: 1.0
References: <20191017213539.00-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, Benson Leung <bleung@chromium.org>,
 tzungbi@google.com, robh+dt@kernel.org, enric.balletbo@collabora.com,
 bleung@google.com, dgreid@google.com
Subject: [alsa-devel] [PATCH v4 01/10] platform/chrome: cros_ec: remove
	unused EC feature
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Remove unused EC_FEATURE_AUDIO_CODEC.

Acked-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 include/linux/platform_data/cros_ec_commands.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 98415686cbfa..43b8f7dae4cc 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -1277,8 +1277,6 @@ enum ec_feature_code {
 	 * MOTIONSENSE_CMD_TABLET_MODE_LID_ANGLE.
 	 */
 	EC_FEATURE_REFINED_TABLET_MODE_HYSTERESIS = 37,
-	/* EC supports audio codec. */
-	EC_FEATURE_AUDIO_CODEC = 38,
 	/* The MCU is a System Companion Processor (SCP). */
 	EC_FEATURE_SCP = 39,
 	/* The MCU is an Integrated Sensor Hub */
-- 
2.23.0.700.g56cf767bdb-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
