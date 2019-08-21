Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80047976A0
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 12:04:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D44EE1666;
	Wed, 21 Aug 2019 12:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D44EE1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566381860;
	bh=RA1yp+WXmGajs/gYGpL8jEDyV+cJo95VH7gW31Ksuqc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cz6hjYc0rUFyX1RyFLxCSVM2/7a0z8VhBEjTmHoEjY6fGvhEEPE9LCFynbV9FOM9A
	 v0M1ElAICM6CUSk1eAnxmGnLBhxNvEE5GENxTNkiT2G06H6XKcZRDF7RdRpsptp4kq
	 gAlhBfCuUbZRtkrNHI8aIMxe0yXX/ZnNfCsBDF1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5974AF80322;
	Wed, 21 Aug 2019 12:02:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D8FFF80306; Wed, 21 Aug 2019 12:02:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACC26F802E0
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 12:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACC26F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NH79btyX"
Received: by mail-wm1-x343.google.com with SMTP id d16so1502000wme.2
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 03:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K/D2OOa3rUCb1UxCtROHFgWT7WT32fJQ0RqabewlpP4=;
 b=NH79btyXC6dVG3wkr4Fdx1Yq1A2e9kJmz8GnS4AUbk05BLqhDM/T4FXlmBmPj+yea1
 INXWJGh6G3Om7sI6e+Mrri8adjfEu4PPc3WfgUiN3UxBQ3Ddvlst3wGWHUE2VFV/pxI1
 kzBNpMH9JwNPiEJ8rllBzIvIvHOjSB2lgHeL4kL9zFSIC1RTbqs2UEVu7/k3myQlYqdx
 VY5FAdjqWKhfXl06TAKYs6XkranuHu44+/dWSOZNAnf31G+d40FE3x0r9Y4LQNrXiIUV
 8EymqI3vlQg2CZAgP5U4dz2pZSUnoKdSDHjwZKaJ7mhWcanv+G6yX+4ovVVyYI+9feSs
 eNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K/D2OOa3rUCb1UxCtROHFgWT7WT32fJQ0RqabewlpP4=;
 b=DZM+0YWIvVsENTYLYdRFdNvcFw8b1FGcd1fFW3vhrOMdd+vDkuWUu4pfwXFVEe/4ze
 +As0ADXgJbagjbvTtIdDevcoirLgQbe31mcAK+tGY3ecno5RzU+3abhMbG/dG15eQ7Si
 S2PzTZ2L+4DfzR5TPqC6baU8exD3H8Epf7CBdj7w9E9VF9seyCdgDSfED7PiLUz/i6pP
 +0TlocdQX/eiv5WjxARe4h4E+53rQcxK2jfEqJZFC0oAJqoWr7lWEX+yk5wH33UrVu5a
 NBTYtB+zrC/AWDce+otYRoYuJozkInS04N05l2BkBlzq9WMVtctcr3kuKfFHivV9VHXm
 +yxA==
X-Gm-Message-State: APjAAAXDeUyGiO2/iDngWk3yxdtePNqDr33hjKS35VZwHCJHhWIThEuL
 rjOWONVBiWh/gG0BwTVXrl1ZWQ==
X-Google-Smtp-Source: APXvYqzHE94cpljvv8xlZ6GRnFb9bVL8KuBZ7eNaqZt2v+ySmgDEtNXM67DGWWDrYyUuNQz3HJzGiw==
X-Received: by 2002:a1c:721a:: with SMTP id n26mr4968409wmc.88.1566381749694; 
 Wed, 21 Aug 2019 03:02:29 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id j9sm24102676wrx.66.2019.08.21.03.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 03:02:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Wed, 21 Aug 2019 11:02:25 +0100
Message-Id: <20190821100225.9254-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Deepa Madiregama <dmadireg@codeaurora.org>, Meng Wang <mwang@codeaurora.org>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Fix the mixer control range
	limiting issue
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

From: Deepa Madiregama <dmadireg@codeaurora.org>

- mixer_ctl_set() function is limiting the volume level
  to particular range. This results in incorrect initial
  volume setting for that device.
- In USB mixer while calculating the dBmin/dBmax values
  resolution factor is hardcoded to 256 which results in
  populating the wrong values for dBmin/dBmax.
- Fix is to use appropriate resolution factor while
  calculating the dBmin/dBmax values.

Signed-off-by: Deepa Madiregama <dmadireg@codeaurora.org>
Signed-off-by: Banajit Goswami <bgoswami@codeaurora.org>
Signed-off-by: Meng Wang <mwang@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/usb/mixer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 5070a6a76ab3..a67448327d07 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1248,8 +1248,10 @@ static int get_min_max_with_quirks(struct usb_mixer_elem_info *cval,
 	/* USB descriptions contain the dB scale in 1/256 dB unit
 	 * while ALSA TLV contains in 1/100 dB unit
 	 */
-	cval->dBmin = (convert_signed_value(cval, cval->min) * 100) / 256;
-	cval->dBmax = (convert_signed_value(cval, cval->max) * 100) / 256;
+	cval->dBmin =
+		(convert_signed_value(cval, cval->min) * 100) / (cval->res);
+	cval->dBmax =
+		(convert_signed_value(cval, cval->max) * 100) / (cval->res);
 	if (cval->dBmin > cval->dBmax) {
 		/* something is wrong; assume it's either from/to 0dB */
 		if (cval->dBmin < 0)
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
