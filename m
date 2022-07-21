Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D7957EE9C
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jul 2022 12:14:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B7FB1721;
	Sat, 23 Jul 2022 12:14:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B7FB1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658571290;
	bh=EunT8yTcy5xwzV7h7TyYyh5JQoEk2bgMjziXXQ22HdQ=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FeXLMVFIhCbc3SbuawEZrUuhiohI6XvjpJQ7FAj7Www7FGEpowZVUCFTG6oPPqV+S
	 gCYXsexoeNZFIJQyykEK8v/Z4BpexNQB7hwTeHwtpk3Lhdem5vEH0h6loz+GCK6WEH
	 7S4SzXzGX8aCrr2SWXxQ18kBglTGDBnmfSRiUaDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 054CFF80249;
	Sat, 23 Jul 2022 12:13:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB7D7F80256; Thu, 21 Jul 2022 23:12:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13A68F80169
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 23:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A68F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="mHkbVb8p"
Received: by mail-yb1-xb4a.google.com with SMTP id
 y4-20020a25b9c4000000b0066e573fb0fcso2158502ybj.21
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 14:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=H9qhrESkqws7B+N4ickDyQEkgfiwzQoqEZa3FmSu3cY=;
 b=mHkbVb8pyTYQPWxcIrfNOEjTQyv7GlKv2jUyqlvrEIw43WaBE5bpTN37PKVVXUss3v
 IkGFZGYfzwwH7gvS34yfIicRB8vAcr9J2j6pNIrWs9C/77wyTqntpBio0JKdb4Dv45il
 r9k+0K6lRxoseZA33pY8lAUt6eD5LXlHyfsKu96nKHKgMGYwhXWLKYURO71ud4y1MqNa
 dhP8d18OxotrFHYcH0sCVVNjkK5ChkCvNHPIcqWTkVU0S7pREt3fEL2x9QbFIRuLLfTQ
 o1Qk5Ai+LKZZDuF6QdqNw4QHu/XJrE0oFaQI5jYGxXq7PQINPK2ti9nCnNPd4sxypiOD
 22Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=H9qhrESkqws7B+N4ickDyQEkgfiwzQoqEZa3FmSu3cY=;
 b=jqjMxihg+FT6dWawslFyq/KM7Xdi15lUnghUwW88vrRvTBUiuwmDilsiY4EN5xAJ9D
 SkkztU/FY98xpVB5dgck5nZGGJX6f0H37fgPK4V7mLX8DtAH8c4Ou+YIBGfagbVvZ342
 eMlP+3MfRDZOQkrhWprSyEskyXLnfI2W/FKhvUJYeRW6sidEqbCbRP16eM3dKEMCg22p
 xAHQVS9qpYlHY8hPDkBkxlKgDm8B4GirWdD//H0jLvEquSn5ikil7//8Jt4nRQj3T/wY
 0LiRgZs4SRKlZpNjqXvqioQHmOvYpMEt7MvH5A3sP+NToFHMwc+wf7edrScgET47+JIU
 GKSQ==
X-Gm-Message-State: AJIora8XB/gg3qCUhWGA6KCcVXFmQZey8WmCOf8FIKzxtGXeK13m+dvL
 sFn9z5FRfeczqRky7ulOHxyYgI7VyuYb7uP2VA==
X-Google-Smtp-Source: AGRyM1vTYnR4aUWgN23O0d/xGeCiiVR9GEMqYRiTTMzQgIpMCx+gOwuM+yLRXZE4QVVT2iCwBiTkp6dnAnUtBxecvw==
X-Received: from justinstitt.mtv.corp.google.com
 ([2620:15c:211:202:21e:d672:5a6a:420e])
 (user=justinstitt job=sendgmr) by 2002:a81:7709:0:b0:31e:6ee2:dbe6 with SMTP
 id s9-20020a817709000000b0031e6ee2dbe6mr481076ywc.438.1658437965705; Thu, 21
 Jul 2022 14:12:45 -0700 (PDT)
Date: Thu, 21 Jul 2022 14:12:18 -0700
Message-Id: <20220721211218.4039288-1-justinstitt@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
Subject: [PATCH] soc: sof: fix clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 23 Jul 2022 12:13:48 +0200
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Justin Stitt <justinstitt@google.com>, sound-open-firmware@alsa-project.org
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

When building with Clang we encounter these warnings:
| sound/soc/sof/ipc3-topology.c:2343:4: error: format specifies type
| 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
|                  SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
|                  ^~~~~~~~~~~~~~~^~~~~~~~~~~~~~~^~~~~~~~~~~~~

Use correct format specifier `%d` since args are of type int.

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Reported-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Reported by Nathan here:
https://lore.kernel.org/all/YtmrCJjQrSbv8Aj1@dev-arch.thelio-3990X/

 sound/soc/sof/ipc3-topology.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index b2cc046b9f60..65923e7a5976 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2338,7 +2338,7 @@ static int sof_ipc3_parse_manifest(struct snd_soc_component *scomp, int index,
 	}
 
 	dev_info(scomp->dev,
-		 "Topology: ABI %d:%d:%d Kernel ABI %hhu:%hhu:%hhu\n",
+		 "Topology: ABI %d:%d:%d Kernel ABI %d:%d:%d\n",
 		 man->priv.data[0], man->priv.data[1], man->priv.data[2],
 		 SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
 
-- 
2.37.1.359.gd136c6c3e2-goog

