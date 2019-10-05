Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65939CC845
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Oct 2019 08:01:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C93D81684;
	Sat,  5 Oct 2019 08:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C93D81684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570255272;
	bh=dSqLiQZM3LRsqko2rhNe4K1PX7eDT2eM0wZGCXhWeOs=;
	h=Date:In-Reply-To:References:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QvADpdOPafzNRxtJIdi1OqJOiDWKMLSq9Ec9id4mfTPIy/YEVEsTk7qqxY9B9+KsI
	 sQ4y7998+THCU2oHQgfVHvFmQMc/R+n3SBxIczNYnHc1W6dgTo6rje8CFQtbux5tLH
	 G0UK45AkhqETOsvnI0/21xSdD1KnqZ73/ZWkAoJc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B39DF805FA;
	Sat,  5 Oct 2019 07:58:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2717BF805AF; Sat,  5 Oct 2019 07:58:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C29ACF80137
 for <alsa-devel@alsa-project.org>; Sat,  5 Oct 2019 07:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C29ACF80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="aIqzNjao"
Received: by mail-qt1-x849.google.com with SMTP id d3so9034312qtr.2
 for <alsa-devel@alsa-project.org>; Fri, 04 Oct 2019 22:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Z6x5CooX+KOT5/OTrrb8SPQO8MJH2PsqtriuzR88xtc=;
 b=aIqzNjao7eGlpDOkBJUo1bOShLQ0zbuy3gRuIGgwxMwHbzVXdUm/tmnBaTcv46rIcR
 eaw7GsfCxzAjSIADv8zxCBZSPfKF7t3HkG5uBqLZqwncZoGs6x02LW9vLTUvFILHXAN9
 djcSKbCA/oCxL4sKnkVHlONRorVo1fku0bH8vL7hh0FaPy3vsZxxzXdaZM+b3FuEBStT
 LAHlL9cvDbmNSOG0kJq9h3oPk0WVgAtwhjebey4QPGImeZHzRhiIbpFi03Fzpe2jCCyB
 pKFWFQZR5eRna6U77eRNcxhioznupjEOFJXichqPmUixpCSWLC1MyFyeR4uIB4UcOsAH
 PtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Z6x5CooX+KOT5/OTrrb8SPQO8MJH2PsqtriuzR88xtc=;
 b=DW3cd4Qp9wLrjkYZ7KGyaEJKxIHMucrbSiasR4JWnA51ryp5JXK2A9lWIwUUeUcRlY
 GuvGyoeaJ+bWNgri5nAdIJqnXLtEaxfnb9HpajrUqBFuZz6gvuolc/Nh49CtAkDSoczp
 9JJc7jPvqyNrfEb75tmfmgimBifv1fFULi/T9Hr40Im2p627BBzx26qJjRYE2L/EaVZs
 jj9rCcrlS/jT+cSLyUqhT3yaARPDVCMqQ1SfuMNnb5mkSKZ0Dkmqes0zwNMb1pnet40O
 +Vi4fayd8OFwF2qJYq6PeySE4P5DycHo+x9g6vjfr06eJcnJwXqlO6I1InFiWu/smk2s
 qBhA==
X-Gm-Message-State: APjAAAWaqnREG4MLHA6cJwwZ7is4d/SM4F7+2+6U2DbrMPTTaZ+UC9b1
 46pwMthIYi7UfyHHO9E3y6SX51+AWECg
X-Google-Smtp-Source: APXvYqx2zBUYSjjB09ua6ZMesuhjXWY6OXHFCexT3WCngq0RnSzyv3lkzrA7ht0WMZDaW3QUwAsVPn3TuIFc
X-Received: by 2002:ac8:6985:: with SMTP id o5mr2262786qtq.151.1570255117489; 
 Fri, 04 Oct 2019 22:58:37 -0700 (PDT)
Date: Sat,  5 Oct 2019 13:57:59 +0800
In-Reply-To: <20191005055808.249089-1-tzungbi@google.com>
Message-Id: <20191005130552.1.I374c311eaca0d47944a37b07acbe48fdb74f734d@changeid>
Mime-Version: 1.0
References: <20191005055808.249089-1-tzungbi@google.com>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, tzungbi@google.com,
 robh+dt@kernel.org, enric.balletbo@collabora.com, bleung@google.com,
 dgreid@google.com
Subject: [alsa-devel] [PATCH 01/10] platform/chrome: cros_ec: remove unused
	EC feature
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
2.23.0.581.g78d2f28ef7-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
