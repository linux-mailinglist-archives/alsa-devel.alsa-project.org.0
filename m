Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2475140AC3B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 13:10:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9395E178D;
	Tue, 14 Sep 2021 13:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9395E178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631617813;
	bh=3y90Ii6/0rKNvYQVTGRMsBA0g6JHYMGWHr9qvqX6SHI=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gJCAXg8Ld0AkNVN9dVy5yi2a6mRjZBh7wIu5RTCGfbsE8A9Sf8SxJfgL+uWsnJzwl
	 wRA805aq/AAUUy9vbd7h5rNcnDQv7P1KZe3ghWToPiou9am27yyLfj2OGx5VSMdpoL
	 FSp+NtDCj8Swhj9qtDyvCcZF4gNk0On5hj8OKb8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09E54F80271;
	Tue, 14 Sep 2021 13:08:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54507F8025E; Tue, 14 Sep 2021 13:08:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D358EF80169
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 13:08:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D358EF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a7zytFvy"
Received: by mail-ej1-x629.google.com with SMTP id qq21so22105248ejb.10
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 04:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=3aP8/NSGA13GglmYH3br7YEMqiCNqexuws33nLMuqlQ=;
 b=a7zytFvyTmVlXWm+vz6mNN6DOVexJtmZTQSZlkpfDCJbANURijLJsreLQTu+5yabZZ
 yNtr/8DSaFJY+RHv4FJNvnjSDw5jGGwi1cWesRvtPk74dps4egoGNLCgdWt/0JBn1KFF
 8+ztvHY1xPOPtMM2SOg8Dihedk2TqgMdvopomeGKLwsVXPVRqO6GbIvycU0NZ8q7XUGm
 Je+Tq7OLlthROgBKytQwmRFw5gk8dYL4x9lVRHuIPqLbdvxjMITbEhTI5WGnOQxi0XWT
 Ym4Xd3F6PQebLlMeG0d5nl9WXUIeQKuXH08nm+opw60AlP5XGKDUu4mecOm8tID3nfYl
 YbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=3aP8/NSGA13GglmYH3br7YEMqiCNqexuws33nLMuqlQ=;
 b=u7+Lu2tm+UprAHtr9DhYsHPLuLH/OfegwHRKklymaIm611BkCXd0OK+TM+bs9u542q
 eTKkcj5tD/9z5yBmMByT/wseV23BDzmLmdibNXIc1Br/FClV5K4Ss7U5DMOuhqviR6gd
 dU3YJFqd1rvivUfCAoxMeiOng1xl3JI0X4rbnGM1UGL1eHuzIEVqYZZxLlgybB2BQzrK
 7ojb5iuMFo96zozwQQ9ar6VISrjh7DI+VN8iRZ0sSNpMWm3SyoxXhWjn4AWRy+Im+fA4
 YmhEtieR8oGL5p1uMojradVtBiEXV5gFePbRpLo7pazIabmiYe/Jyi7g1Ln2psQ9/HrU
 YZgA==
X-Gm-Message-State: AOAM531tna/vuO+38/nnjOXPzhGtwG34bHK1uN08+eaZ5YyJmraQwCW3
 McrTjZEgbyDinKDg51hzveMIJgyqcA==
X-Google-Smtp-Source: ABdhPJyn2/OvNrI4Dnn0d2Q6VIPy4QPZDExR9kxxZaXH8Cjn2hvwLvS8EI01fbNVwj2ZCEwJLtYk3A==
X-Received: by 2002:a17:906:ae9b:: with SMTP id
 md27mr16870075ejb.380.1631617729338; 
 Tue, 14 Sep 2021 04:08:49 -0700 (PDT)
Received: from localhost.localdomain ([46.53.249.181])
 by smtp.gmail.com with ESMTPSA id t24sm5085274edr.84.2021.09.14.04.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 04:08:48 -0700 (PDT)
Date: Tue, 14 Sep 2021 14:08:47 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: tiwai@suse.de
Subject: [PATCH] pcxhr: "fix" PCXHR_REG_TO_PORT definition
Message-ID: <YUCCv47sm4zf9OVO@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org
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

The following preprocessor directive is non-compliant:

	#undef PCXHR_REG_TO_PORT(x)

gcc warns about extra tokens but nobody sees them as they are under if
branch which is never parsed.

Make it an #error, it is not clear to me what the author meant.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 sound/pci/pcxhr/pcxhr_core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/sound/pci/pcxhr/pcxhr_core.c
+++ b/sound/pci/pcxhr/pcxhr_core.c
@@ -52,7 +52,7 @@
 #define PCXHR_DSP 2
 
 #if (PCXHR_DSP_OFFSET_MAX > PCXHR_PLX_OFFSET_MIN)
-#undef  PCXHR_REG_TO_PORT(x)
+#error  PCXHR_REG_TO_PORT(x)
 #else
 #define PCXHR_REG_TO_PORT(x)	((x)>PCXHR_DSP_OFFSET_MAX ? PCXHR_PLX : PCXHR_DSP)
 #endif
