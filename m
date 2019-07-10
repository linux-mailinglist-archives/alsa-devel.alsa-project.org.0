Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DAD63F3A
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 04:18:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68BE51667;
	Wed, 10 Jul 2019 04:17:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68BE51667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562725106;
	bh=2BaqkPOq4jSxQtNVNGh3+UWrVWi0Nlfm7dVizo4gdws=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=shFRhV7sMwgyRRQBfbBDqWKR1UrSobo7Ja5jk9LsMVCVcjalJ15YCBCARajpZ3TQ/
	 LeOHZIfsWaKJVzWjxmgEa7EyBzeu2zbv1DAyDk3tj35H0c0UXflAZBrjFAhuSQnSVM
	 zwvTnmLJjKDDo4CpHHv8sbgmOGHs+T3Um6UKyMak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD99CF802A1;
	Wed, 10 Jul 2019 04:16:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51C3DF802A1; Wed, 10 Jul 2019 04:16:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF755F800DE
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 04:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF755F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rSjHXX5v"
Received: by mail-pg1-x543.google.com with SMTP id s27so409507pgl.2
 for <alsa-devel@alsa-project.org>; Tue, 09 Jul 2019 19:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=IZY6bRwRAQjzoXQqf8HuJovnIklLNuUq+A5t+/AooUA=;
 b=rSjHXX5vdjCegktJNlazWg3hrKdWgPp1/UN6PCwb8y2g2db+sbKKA2yiv/7eUD679w
 qol/0/0On+lk1JFARxqxj/GWoiSTxfk861mv3xLN/2EK+HORDzSwW0du4f+rXYqC4bZj
 jRvpHIUpfeKQ+WhWOvXKsbBkWYepuEa3BWzXShSq5kZbFhz9sLHFbqiaJDcvvW7hS5GH
 8FSvlDMkpHcvcCQMyoIW7zRMTd25W4uw+2xdu2S83k+golNx+kwVv1K1R7PDb2HfhtJr
 iVjBzmuhIPaYIcTZg+/Hc3GZ4bcXTa9SOefa51arS82sl7q+7yxo0K36tye+Zy5VwoEJ
 hR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=IZY6bRwRAQjzoXQqf8HuJovnIklLNuUq+A5t+/AooUA=;
 b=tJCo2/NT8k5VzLzBzXS0JLT4Fkc0posWs93zL/lNpa2LD7PWWdgylRxQYQ8sPMv7SZ
 drvUQeiqQeg/i/6uL0s/2dbSGk6ABNLYWMVsPPaw/xIAooCu6lIVuELL4HK6dRbT5AN0
 OEFBb0n52F9IDq8vcGRaGjW+uWhPKNR83aEiHQ5A6We9UF9+wzY43AFfnSQw2YwCtcla
 01iIktpkgo3cJUP0WpAwy2eB9gzrokVMkKa7zMCETEfjmOrj8Xwj0mXTo+OblcGFrRwL
 o2IBnzGaY9LRlGzvaxchLy+qQ/6RnyfWokNlH5wVnPHj4LgyVTcJoVMYOsWPzeZDAsxG
 XSqw==
X-Gm-Message-State: APjAAAWhk3TJ7CxPPbX8v9j+T439BeOuk0OiJwOPqo3oqwItcFEzdi+6
 gzmVJnhrMqzJsGptVHxvmFs=
X-Google-Smtp-Source: APXvYqxWbZI7rdrR4yEM0s/9je9rCJge8KVD+rD7iWvAP0hkCUC2Z51r9a1d4bA37gHPdkE1Xxnpig==
X-Received: by 2002:a63:7e42:: with SMTP id o2mr33754977pgn.162.1562724994909; 
 Tue, 09 Jul 2019 19:16:34 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id z20sm404943pfk.72.2019.07.09.19.16.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 19:16:34 -0700 (PDT)
Date: Wed, 10 Jul 2019 07:46:27 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Vinod Koul <vkoul@kernel.org>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Gen Zhang <blackgod016574@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Message-ID: <20190710021627.GA13396@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: [alsa-devel] [Patch v2] sound: soc: codecs: wcd9335: add irqflag
	IRQF_ONESHOT flag
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

Add IRQF_ONESHOT to ensure "Interrupt is not reenabled after the hardirq
handler finished".

fixes below issue reported by coccicheck

sound/soc/codecs/wcd9335.c:4068:8-33: ERROR: Threaded IRQ with no
primary handler requested without IRQF_ONESHOT

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
v1 : add IRQF_ONESHOT and introduce irqflags variable 
v2 : remove irqflags variable

 sound/soc/codecs/wcd9335.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 1bbbe42..9566027 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -4062,7 +4062,8 @@ static int wcd9335_setup_irqs(struct wcd9335_codec *wcd)
 
 		ret = devm_request_threaded_irq(wcd->dev, irq, NULL,
 						wcd9335_irqs[i].handler,
-						IRQF_TRIGGER_RISING,
+						IRQF_TRIGGER_RISING |
+						IRQF_ONESHOT,
 						wcd9335_irqs[i].name, wcd);
 		if (ret) {
 			dev_err(wcd->dev, "Failed to request %s\n",
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
