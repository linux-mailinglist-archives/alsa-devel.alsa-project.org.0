Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4893D290D7
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 08:16:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64EA216A6;
	Fri, 24 May 2019 08:15:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64EA216A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558678584;
	bh=ReeJ5CcvSoIpLYw7zQQbRw4thv7e5sUNy81LUskoeOI=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BXFHDpx4UkAVbClplvZywgZQEK855jtb/b2cFJHKBqjznX+RMnPTYXy+clOkLAs7n
	 dmJ3KKiCVpH5QZrzsf8FVxDzcJDmHnrEunyDXQfeNCxt7hs9wQOkSuVZfRRY03+3aP
	 UryolIrrKcf+j7Eu9WArFCxMOeul0LuCY6/Z67A8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0E4FF89725;
	Fri, 24 May 2019 08:14:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7016F89630; Fri, 24 May 2019 04:12:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EF65F89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 04:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EF65F89625
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="g3644O0Z"
Received: by mail-pl1-x642.google.com with SMTP id g9so3493492plm.6
 for <alsa-devel@alsa-project.org>; Thu, 23 May 2019 19:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=KhyzEO6gm2Usal2JZM1pOHPArw9B2AFuGWgFY2WjYss=;
 b=g3644O0ZmeU+nqIb6Kwh0lI6jiCQ7h3YQLDk8r8ZQJU0SyglPqWoTmYTJh35D90YV2
 /KH2Bk9Xz/+w18thaM4erdQVvaKEYARCD8xDt7O8OUlJh/VORggOFTmXVQ1je4RnCC/l
 8zPtaFLeVUYqU32xAqVE0v9JBtryIvRwarb/T1HW7f7XZu4/5OjsnlN840Wtij0Fk2l5
 VkJD9zztg4n3krekfGxPq70XbMebwBGzDhkfLxAEPs+fQTeZ2678/DV+LVYmBASi4IiS
 +HJgWlhxaidtSluQgtOklcBofMQ67wsV2ayae+i7/hR4VzpFvuPhp3mNSJX33ZMaXQCK
 CtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=KhyzEO6gm2Usal2JZM1pOHPArw9B2AFuGWgFY2WjYss=;
 b=cfer62EsCr0ij8Y3aHaN9BphaV3n3vyHY0GbS2oRWzYooUbQJVkQt3qIQxj8+pg6Pz
 1FIKVrd4oZGQEOBKcYu9hbkVATn7R7mnkZ235nH280wKCeowjrCEi4HWYa/3dwmKgQpy
 Ghcv6iQ0n4z8J55W6b3IoHUzHZxCxwiuFdLzHjshj7fu4OlJ+PksJRnublFOf/bi1e/b
 NWSmpXRZUTRFAsrVlf4trSy17mTBRyhOqQ+8VtgOcEF6VX7C2ICfkRKVk/ht/GoQa75N
 c9KD/o4mL5sj/+7ZlX6ucQyI3xWPRLqQMDDKFFZ9Uypm1kxqHejQ+losltfAdScJLVwS
 02og==
X-Gm-Message-State: APjAAAUdg38EiQqpb1xKHa0TH1Kpys2cPfFjhh/ZOZabGzWM+abYGs+m
 E5+s/UdsGEeHtlvJRgGSmYw=
X-Google-Smtp-Source: APXvYqynZHdL0FJb/ejGsKpya0J9CI/4wBC9tTUjkaVApyUAoSdtyzZdHPnZXTKxPGrg6JwUqDiX9g==
X-Received: by 2002:a17:902:690b:: with SMTP id
 j11mr27720616plk.149.1558663959177; 
 Thu, 23 May 2019 19:12:39 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
 by smtp.gmail.com with ESMTPSA id q193sm796881pfc.52.2019.05.23.19.12.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 19:12:38 -0700 (PDT)
Date: Fri, 24 May 2019 10:12:21 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: broonie@kernel.org, tiwai@suse.com
Message-ID: <20190524021221.GA4753@zhanggen-UX430UQ>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Fri, 24 May 2019 08:13:59 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] pcm030-audio-fabric: Fix a memory leaking bug
 in pcm030_fabric_probe()
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

In pcm030_fabric_probe(), 'pdata->codec_device' is allocated by
platform_device_alloc(). When this allocation fails, ENOMEM is returned.
However, 'pdata' is allocated by devm_kzalloc() before this site. We
should free 'pdata' before function ends to prevent memory leaking.

Similarly, we should free 'pdata' when 'pdata->codec_device' is NULL.
And we should free 'pdata->codec_device' and 'pdata' when 'ret' is error
to prevent memory leaking.

Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
---
diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index a7fe4ad..d2e6eae 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -72,29 +72,43 @@ static int pcm030_fabric_probe(struct platform_device *op)
 	platform_np = of_parse_phandle(np, "asoc-platform", 0);
 	if (!platform_np) {
 		dev_err(&op->dev, "ac97 not registered\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto out_free1;
 	}
 
 	for_each_card_prelinks(card, i, dai_link)
 		dai_link->platform_of_node = platform_np;
 
 	ret = request_module("snd-soc-wm9712");
-	if (ret)
+	if (ret) {
 		dev_err(&op->dev, "request_module returned: %d\n", ret);
+		goto out_free1;
+	}
 
 	pdata->codec_device = platform_device_alloc("wm9712-codec", -1);
-	if (!pdata->codec_device)
+	if (!pdata->codec_device) {
 		dev_err(&op->dev, "platform_device_alloc() failed\n");
+		ret = -ENOMEM;
+		goto out_free1;
+	}
 
 	ret = platform_device_add(pdata->codec_device);
-	if (ret)
+	if (ret) {
 		dev_err(&op->dev, "platform_device_add() failed: %d\n", ret);
+		goto out_free2;
+	}
 
 	ret = snd_soc_register_card(card);
-	if (ret)
+	if (ret) {
 		dev_err(&op->dev, "snd_soc_register_card() failed: %d\n", ret);
+		goto out_free2;
+	}
 
 	platform_set_drvdata(op, pdata);
+out_free2:
+	platform_device_put(pdata->codec_device);
+out_free1:
+	devm_kfree(&op->dev, pdata);
 
 	return ret;
 }
---
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
