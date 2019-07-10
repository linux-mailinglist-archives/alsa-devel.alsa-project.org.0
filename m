Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3249F63F59
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2019 04:32:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA6121667;
	Wed, 10 Jul 2019 04:32:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA6121667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562725976;
	bh=rBnEsPe2CaYdYYFIP8JKa4PGnKo2KnpkZBYeY5lcAAw=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZpR3doXuGWI2cvxgACAgia/NaFe3AQB7oGZ8fzbnyzsFAKlP0eWEY78Z9U1RME/Jl
	 0K7HJ1NkXrY1clJ2jGmMgYm/cUnDCWHr3bKDTFZZ3pPWXqpVqwRwUnsu/USELrfDRK
	 yV7FqspQFw+mVPPNEi3jWun/Fw6VilqzxS4JUjCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC670F802A1;
	Wed, 10 Jul 2019 04:31:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E3A4F802A1; Wed, 10 Jul 2019 04:31:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PDS_NO_HELO_DNS,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BD39F800E2
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 04:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BD39F800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TcSDpgWZ"
Received: by mail-pg1-x544.google.com with SMTP id g15so421030pgi.4
 for <alsa-devel@alsa-project.org>; Tue, 09 Jul 2019 19:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=4cRP2WCZtummGCJmZjETlwBuipDUxE57gp0VCpL4ho0=;
 b=TcSDpgWZpw8sLhLS8hOEKXei4aNVrcM8KH61CL66GmWu2wgPFvVSi1uI0KpG/X5wx7
 U3/NtP/DhFikSl/ERcT7WzTpI5aoHCqbd5myNR8Lqz5jvDq4I3tPLttR77m+WWBI53+R
 8yIev1fHE3BiekEOcKVZVG0TKmytVuJFlSoSFRh/HvdVgEHk3NCAuIxVczM6S0shEyQ7
 4aZlPQDVNc6BSxjU1WKFcr54DcTQIU13U03lCUhpxuAkHl18SC1YRIcwceeVqWwyAJ+4
 P/tIyqBMyaX4otCiZMtZiPFWxHTr93pRnBMiin2SlBQeTPbbVs2efCYCtLRWHWjR8Dry
 hoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=4cRP2WCZtummGCJmZjETlwBuipDUxE57gp0VCpL4ho0=;
 b=W63XEiV1a8BwnW9Z57dmnT8WcJd2X6miyHoSt8/+F2r/74up6LEBikWcUXAZgDBrDr
 IAF01EgeYrhormM/y+gaZfMC2PH0oLunCAznYHTFFNCqy2fKQK4LH59mra2aRORSBmTQ
 Ge7DfQ5FnWHQSiRM6wB2T4GPlXsgELXoYYBHl6m/+7ZkFXSxODZmJp1gFhgE2yxh0GZg
 1/mxM1y/0QL+YksR+JLhhuZ1WdlDIgLMeQMKU77SKe29inB6r1KYa+njC3SSqumeFT8m
 1hksvz6a2SsXAw076gZC2UkuKk8OEK+BMmNdidIXkoAlnwTKUWW82kzoLQ6scD+CbcUo
 2uIQ==
X-Gm-Message-State: APjAAAWNoUwZZcGJ837X7QECA0aJ5htPxOudunWxhAC1SZtpwOvYg+s0
 s6gX55pVW1e5/PWFf86IZZo=
X-Google-Smtp-Source: APXvYqzY/mS53Xz6A6fiZt/w7HVVhNTxk8ojhH/ywhjWnS0wRHa/saBxl3uWe++xDS6GzuH2JUorYg==
X-Received: by 2002:a17:90a:8c18:: with SMTP id
 a24mr3622949pjo.111.1562725864971; 
 Tue, 09 Jul 2019 19:31:04 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id r7sm387790pfl.134.2019.07.09.19.31.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jul 2019 19:31:04 -0700 (PDT)
Date: Wed, 10 Jul 2019 08:00:59 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Hariprasad Kelam <hariprasad.kelam@gmail.com>,
 Allison Randal <allison@lohutok.net>,
 Thomas Gleixner <tglx@linutronix.de>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Message-ID: <20190710023059.GA14204@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: [alsa-devel] [PATCH] sound: pci: lx6464es: Remove unneeded variable
	err
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

This patch fixes below issue reported by coccicheck
sound/pci/lx6464es/lx6464es.c:256:5-8: Unneeded variable: "err". Return
"0" on line 258

We cannot change return value as its registered with snd_pcm_ops->close

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 sound/pci/lx6464es/lx6464es.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/lx6464es/lx6464es.c b/sound/pci/lx6464es/lx6464es.c
index 1771a6d..583ca73 100644
--- a/sound/pci/lx6464es/lx6464es.c
+++ b/sound/pci/lx6464es/lx6464es.c
@@ -253,9 +253,8 @@ static int lx_pcm_open(struct snd_pcm_substream *substream)
 
 static int lx_pcm_close(struct snd_pcm_substream *substream)
 {
-	int err = 0;
 	dev_dbg(substream->pcm->card->dev, "->lx_pcm_close\n");
-	return err;
+	return 0;
 }
 
 static snd_pcm_uframes_t lx_pcm_stream_pointer(struct snd_pcm_substream
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
