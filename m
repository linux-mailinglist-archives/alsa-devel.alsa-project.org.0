Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E7D24CEB
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2019 12:38:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D3391668;
	Tue, 21 May 2019 12:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D3391668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558435102;
	bh=HmY2CKOLeWCM7RGyjcQNfjzsODURisGFkm1FRsz0Ylc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tRX/OPvsQ6p38ygq0jdBirIV+fHepRADAG0bxBJW+89ABRTM54K4uYmoTkUcXJKpN
	 dat86kRJsSJnLfHqFPF33f29YlJ0yzukpdyk3cuw3mSWt2LIuwAzDx6iJCSg4543Rv
	 70ywBvRQTi2OiZqP+TXWA3gxihECEusU7lew60Ks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D42CBF8970E;
	Tue, 21 May 2019 12:36:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31EADF89674; Tue, 21 May 2019 12:36:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_64, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 961C7F8079B
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 12:36:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 961C7F8079B
Received: by mail-ed1-f66.google.com with SMTP id b8so28603995edm.11
 for <alsa-devel@alsa-project.org>; Tue, 21 May 2019 03:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=uAylt3ofKrXJiUmVt/aJiMVs6WCW7IL4o+lOVbQ9k+k=;
 b=TVocVEhcbDpcRIAr5tBQ7BMol5/Qwm2gCwiOfpDgLL21KWwzoqqJqrCeE+niLMJ3c8
 muNfVcBJauVPm3OMfyiVYo1gwDkUHKo97rOwP4oELowQn6tcLDyaMZPPjQH1wGqiQL83
 fqikNRF7rA9358hBCyVc5pZfOoFafapoes2Z7Bn4VFoVWYndBrbxhj+KOzyU/c+5xrW4
 D+zupvKnHNgyhd3GOXKzLA38d9IwnwZHoyfYPs8ypYQQRTvxx1oz1258CUrcItoq5hzo
 K0iqQOiSM1sHtPrUIW+8Bx7LrDB9jgwn5e6ka6jCRHPzbkxKptNwheyTcaLL8T/kLeaE
 hWJQ==
X-Gm-Message-State: APjAAAXrRHTN0+B7BIMGOQ4GX3c1v749BSMFCR6Kw9BqbLtpBrPcE4MI
 qohpdwEWcOyt8DSvQX8DSm8kDgwtfyOHS3bXxwjR+SmgtFBYgdIiCuTNE8w5Q0YGkAdbsgp1Zns
 QlJAeAjIfkLocP+c=
X-Google-Smtp-Source: APXvYqxwKTRDeQeHnXoeo2S5PjdpTBXMJbW529IdtNa7k6B9JmqbZcfYZOYpZVGnzIrOSfgpYYl4WA==
X-Received: by 2002:a17:906:5593:: with SMTP id
 y19mr35149813ejp.264.1558434989114; 
 Tue, 21 May 2019 03:36:29 -0700 (PDT)
Received: from localhost ([194.105.145.90])
 by smtp.gmail.com with ESMTPSA id a40sm6205178edd.1.2019.05.21.03.36.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 May 2019 03:36:28 -0700 (PDT)
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Fabio Estevam <festevam@gmail.com>
Date: Tue, 21 May 2019 13:36:13 +0300
Message-Id: <20190521103619.4707-1-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Igor Opaniuk <igor.opaniuk@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Subject: [alsa-devel] [PATCH v1 0/6] VAG power control improvement for
	sgtl5000 codec
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


VAG power control is improved to fit the manual. This fixes as
minimum one bug: if customer muxes Headphone to Line-In right after boot
w/o playing any sound, the VAG power remains off that leads to poor
sound quality from line-in.

I.e. after boot:
- Connect sound source to Line-In jack;
- Connect headphone to HP jack;
- Run following commands:
$ amixer set 'Headphone' 80%
$ amixer set 'Headphone Mux' LINE_IN

Also this series includes fixes of non-important bugs in sgtl5000 codec
driver.


Oleksandr Suvorov (6):
  ASoC: sgtl5000: Fix definition of VAG Ramp Control
  ASoC: sgtl5000: add ADC mute control
  ASoC: sgtl5000: Fix of unmute outputs on probe
  ASoC: sgtl5000: Fix charge pump source assignment
  ASoC: Define a set of DAPM pre/post-up events
  ASoC: sgtl5000: Improve VAG power and mute control

 include/sound/soc-dapm.h    |   2 +
 sound/soc/codecs/sgtl5000.c | 250 ++++++++++++++++++++++++++++++------
 sound/soc/codecs/sgtl5000.h |   2 +-
 3 files changed, 212 insertions(+), 42 deletions(-)

-- 
2.20.1


-- 

Ciklum refers to one or more of Ciklum Group Holdings LTD. and its 
subsidiaries and affiliates each of which is a legally separate entity. 
Ciklum LLC is a limited liability company registered in Ukraine under 
EDRPOU code 31902643, with its registered address at 12 Amosova St., 03680, 
Kyiv, Ukraine.



The contents of this e-mail (including any attachments) 
are confidential and may be legally privileged. If you are not the intended 
recipient of this e-mail, please notify the sender immediately and then 
delete it (including any attachments) from all your systems. Any 
unauthorised use, reproduction, distribution, disclosure and/or 
modification of this message and/or its contents are strictly prohibited. 
We cannot guarantee that this e-mail is secure or error-free. Ciklum cannot 
be held liable for any loss or damage caused by software viruses or 
resulting from any use of or reliance on this email by anyone, other than 
the intended addressee to the extent agreed in a contract for the matter to 
which this email relates (if any). Messages sent to and from Ciklum may be 
monitored; by replying to this e-mail you give your consent to such 
monitoring.  Notice: we do not accept service by e-mail of court 
proceedings, other processes or formal notices of any kind without specific 
prior written agreement. This email does not constitute a binding offer or 
acceptance for Ciklum unless so set forth in a separate document.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
