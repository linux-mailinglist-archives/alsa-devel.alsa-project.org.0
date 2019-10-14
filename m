Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD4D6001
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Oct 2019 12:23:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8ABC51671;
	Mon, 14 Oct 2019 12:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8ABC51671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571048598;
	bh=2AXBPj1c6s0FXpwPohiBkFWiTcOllnNiCb0QCWkGVog=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gcwg2YX/bgqnJkj+JudFvBX6aMOz5aRouFnsDxbWc1QiLdglv4DMYmfo6WMdbVk60
	 2T/algCeiVv/Npfi69Xl8mwuHWaLeGIzikBWesH1nJGS+fVONL8Qya7nGasC4sZZWy
	 G5pm7BvZLtR2u2PYDUMarctOfcNumQYsTAV+ezZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E3C9F80212;
	Mon, 14 Oct 2019 12:20:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FC5AF80377; Mon, 14 Oct 2019 12:20:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yw1-xc4a.google.com (mail-yw1-xc4a.google.com
 [IPv6:2607:f8b0:4864:20::c4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80388F80376
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 12:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80388F80376
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="eVRPf2rK"
Received: by mail-yw1-xc4a.google.com with SMTP id l123so13326844ywd.23
 for <alsa-devel@alsa-project.org>; Mon, 14 Oct 2019 03:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=OjLdBxamMEBZoCWEKxvyfi3zlPS7sITB1tlY1PlFJZY=;
 b=eVRPf2rKgR0b8Na1dnuVjOtXmfbGYZwl4VqP3QxKcECdKXOoxlTz48u7APC+RWbHOP
 DFmgYXjsH3Lq/zIayx+kocIt92rT3kTuBrcarVlNG6TLb8STyyNtWyH6Raz4nU6/pWb1
 T+W3s4ZdUYNcNrT8U6hS/aiI0BEllbfG1QZ8ThZWgWj2bHZxD5Htx6fwC3qPPaxKYM/r
 8qwHg/2BsPSsjSolIcKqH2UN58FpZoh/LJ96A1q5PF2OLn2xfgMBGdd5leRkKduxQ9CA
 0pgr+/s1DHXcES8zswier67wDAXdUOOQlxaFBr1ZQhH0umfEaG6W6TqUErAN4ar19rX0
 pcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=OjLdBxamMEBZoCWEKxvyfi3zlPS7sITB1tlY1PlFJZY=;
 b=ck+SHSvtDnj60BQj8YLMkf2Pw43YEVxw+em8qggCGdn/1GowvgZHMheHjrdkmBNehm
 tmrFtSuCXUn+ha5/NpTdW6/q89rx1y9rHbciuDMV2r5iwsIPLJgY92ZmC5PBdq8f8nMh
 q+H2videE2BPO0lpa5oWEuUGtaNfvirpevx4p4Dt9tNqtaL+6EqRkb68/MeDK4WH0InM
 1Re7ApNKjS1AXZSI1XFQTKIZd8NvyFCMsN0djZtyCkhtj/a074oXUm0p09zqp4ho0oxc
 IG6i2SDMspopNc2WgDLrljiV5qCOlxfsXOIWtOHk8hG6VdhwXTcB23Y6aDjE7GRDjSoe
 ysLQ==
X-Gm-Message-State: APjAAAXSmDlVOEYBWsf5JCddcsrI3tFsCcjTgWFDrQJId51amwZiLY+2
 OwdOdZFAU+MrBIEKqky3WwYfOu6BnYH9
X-Google-Smtp-Source: APXvYqwpWgmqpyrmUa2wXckIz2VMz7v1JP5V+8C4UzQfkJmabm9Yn88YxlT1SHUJmolE6m4HsHNhhbbIoXZQ
X-Received: by 2002:a81:1b49:: with SMTP id b70mr11985099ywb.229.1571048444225; 
 Mon, 14 Oct 2019 03:20:44 -0700 (PDT)
Date: Mon, 14 Oct 2019 18:20:13 +0800
In-Reply-To: <20191014102022.236013-1-tzungbi@google.com>
Message-Id: <20191014180059.01.I374c311eaca0d47944a37b07acbe48fdb74f734d@changeid>
Mime-Version: 1.0
References: <20191014102022.236013-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH v3 01/10] platform/chrome: cros_ec: remove
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
