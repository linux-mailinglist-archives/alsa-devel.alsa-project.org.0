Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEC098A03D
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 13:22:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 483DA211C;
	Mon, 30 Sep 2024 13:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 483DA211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727695339;
	bh=cQVGGq5xQOiRJgIv8/0eVuPLYc+ntYYQOa3eK7PlFn8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lTal3jJpOYc5x2hLfjg0XPc4HfsJ57IqM9UHwtKm+vmdydxFxXMDaTgfsMLFY013q
	 Dc9Z4kYFEiXb7XwMqQn21/cBBwUDtpv4Wfk0CJhYDhgGdQRI/vk2EGcsa3ieL4tDyU
	 X+0CMkVsrA/ct0vq6Oc/lNFkVGDDes1HqpD94sig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C9A2F805E3; Mon, 30 Sep 2024 13:21:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC142F805CA;
	Mon, 30 Sep 2024 13:21:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAD05F80518; Mon, 30 Sep 2024 13:21:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3929F80007
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 13:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3929F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256
 header.s=dc header.b=ZdwSKBn5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UVwqg9pSLhRbnrHgL5k+5dBK/PrMq/KHM37Icoezd/0=;
  b=ZdwSKBn5snaHNt5KRSYKxd2+0XuNlbB5QiNmgqtZyqBSloro/wGyWGHc
   8UHHvnowXQA8HP9/if4H9vdzCXibWmWMdEhz9b/wBaSGCQR5gAqfhygnY
   aNy2yEIUS9yv55H+EWtZfK+5LFcVsnv/TrGNqJMAtmezbsu1La+qswK1B
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400";
   d="scan'208";a="185956913"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:21:28 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: kernel-janitors@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 31/35] slimbus: messaging: Reorganize kerneldoc parameter
 names
Date: Mon, 30 Sep 2024 13:21:17 +0200
Message-Id: <20240930112121.95324-32-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZFPKMXYKZYMF757EPHKHKS4TSIXQ4CPC
X-Message-ID-Hash: ZFPKMXYKZYMF757EPHKHKS4TSIXQ4CPC
X-MailFrom: Julia.Lawall@inria.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFPKMXYKZYMF757EPHKHKS4TSIXQ4CPC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reorganize kerneldoc parameter names to match the parameter
order in the function header.

Problems identified using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/slimbus/messaging.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index 242570a5e565..e7aa9bd4b44b 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -13,8 +13,8 @@
  *
  * @ctrl: Controller handle
  * @reply: Reply received from the device
- * @len: Length of the reply
  * @tid: Transaction ID received with which framework can associate reply.
+ * @len: Length of the reply
  *
  * Called by controller to inform framework about the response received.
  * This helps in making the API asynchronous, and controller-driver doesn't need

