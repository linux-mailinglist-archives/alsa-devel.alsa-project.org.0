Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EAE17A69F
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:46:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCEF715F8;
	Thu,  5 Mar 2020 14:45:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCEF715F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583415979;
	bh=eGL3p1IHf9edqq3kxH5vE7XPSA+vqylPUjwtkEiHuWk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gXWJeTakAxygvwTkQclxNsW/mkw1QcxYoVbJ6cUHbHNTirDhnS25qXM9lYcj7avLP
	 mGOM52sVEmKb4SL5V1x5EmYH0jD0gl8XV25Zharw1bcdH2D/NoG4xgwQ8sDK7/Ge3l
	 MVYqdK1N+VGuGlSf5mm8FBSkLj6korqpvj1piqhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3698F80266;
	Thu,  5 Mar 2020 14:44:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90918F80266; Thu,  5 Mar 2020 14:44:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8815F800D8
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:44:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8815F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yEvHYrzc"
Received: by mail-wm1-x332.google.com with SMTP id a141so5786679wme.2
 for <alsa-devel@alsa-project.org>; Thu, 05 Mar 2020 05:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8WY2lzyi/TKkFb0Qxrd7XVTyizJTyW1RRVpFhSXpUJA=;
 b=yEvHYrzcGnRqreMYMaDaezEp6sUz0olv3ypZ/J0OvfAejxiLovsX0YOG+IL2b/veKf
 SWSBoaq5LZ3dMAhu7XJ/55oFNURoIHBs2OiUESnvQsBOLEj4yJeijC8JtrVmovIKnz3G
 OtVY+nuVuVaPXbUO0MzN4DT7xJRJS7rAdmr14hTUyQDqgML1jJIY5HQRoW3sP22GJn+F
 23NyFP84pQUOiTYA/5/SKkvyXDoWGErnl7mhuGBaQJDp73guRp5XdUkTnrfKlIs9H/e/
 1dXv43kcTu/Yk99A2n3TzNo+QN/MGN12utSPkBXzKrpqPgBYx4hwpdF7MziyP/buKKry
 X+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8WY2lzyi/TKkFb0Qxrd7XVTyizJTyW1RRVpFhSXpUJA=;
 b=geykJLAbtJO/RMlAX0S8Cns6s9pAgLLKKoz1yIRTVRzSdMhfu8hlMrk+Lq8uhKClvc
 Xu9hfsEJ46rF48TDJAk1SFzVgkxiMtTCWCYmBUy6I+f4Z2NA+B//EZ/33WlG8HgXHku1
 cesKHhaX+PlldSjdGw8KZ9yJnOKbbwPTH3oUoqCl2/3Czawcfn6gCn/Zv/BYDliSqhi3
 4HB2YMM7GB17SbsJhMfSf+LVgLfNzaCRi0cA0/JfCAlmk+nd9ulgevqEFZTb6YixzW6p
 Cj/RJpNiO6DcFnuni1OL8ug4z0jr9RgphJRC/092k7jjrWAPPCcpDIchDlBpXHZ2gU/y
 PO6w==
X-Gm-Message-State: ANhLgQ0mB1azs178eoKjl/QVWS68EOE6vWyhhfN7fmpUdWB7lncfl4VB
 f1qKpx9W2TeNmMHH0Oji++1DTw==
X-Google-Smtp-Source: ADFU+vtILtrFtaNaE2weX2r5j+pFLEoY3qj6t+5aAQmaj6xSsq6JfcV3IYYDu+SWxqvDhyqCP6AFuA==
X-Received: by 2002:a1c:2dc7:: with SMTP id
 t190mr10020652wmt.137.1583415872163; 
 Thu, 05 Mar 2020 05:44:32 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id o9sm46425385wrw.20.2020.03.05.05.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:44:31 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: perex@perex.cz
Subject: [PATCH 0/4] ucm2: Add support to SDM845 based platforms
Date: Thu,  5 Mar 2020 13:44:00 +0000
Message-Id: <20200305134404.7690-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

This patchset adds UCM support for WSA881x, WCD934x codec and two platforms,
DB845c DragonBoard and Lenovo YOGA C360 Laptop that use these codecs.

Tested on Ubuntu 20.04 with pulseaudio 13 along with
with this fix
 https://github.com/pulseaudio/pulseaudio/commit/cabd387e26b5fe03661f4b894826c7c6b58d7efa

Thanks,
srini

Srinivas Kandagatla (4):
  ucm2: codecs: wcd934x: Add Codec sequences.
  ucm2: codecs: wsa881x: add codec sequences
  ucm2: DB845c: Add ucm for DB845c board
  ucm2: Add ucm for Lenovo-YOGA-C630-13Q50 laptop

 ucm2/DB845c/DB845c.conf                       | 11 +++
 ucm2/DB845c/HDMI.conf                         | 33 +++++++
 ucm2/DB845c/HiFi.conf                         | 46 +++++++++
 ucm2/Lenovo-YOGA-C630-13Q50/HiFi.conf         | 98 +++++++++++++++++++
 .../Lenovo-YOGA-C630-13Q50.conf               |  6 ++
 ucm2/codecs/wcd934x/DefaultDisableSeq.conf    |  5 +
 ucm2/codecs/wcd934x/DefaultEnableSeq.conf     | 14 +++
 ucm2/codecs/wcd934x/HeadphoneDisableSeq.conf  |  6 ++
 ucm2/codecs/wcd934x/HeadphoneEnableSeq.conf   |  6 ++
 .../wcd934x/HeadphoneMicDisableSeq.conf       |  2 +
 .../codecs/wcd934x/HeadphoneMicEnableSeq.conf |  3 +
 ucm2/codecs/wcd934x/SpeakerDisableSeq.conf    |  4 +
 ucm2/codecs/wcd934x/SpeakerEnableSeq.conf     |  4 +
 ucm2/codecs/wsa881x/DefaultEnableSeq.conf     |  8 ++
 ucm2/codecs/wsa881x/SpeakerDisableSeq.conf    |  8 ++
 ucm2/codecs/wsa881x/SpeakerEnableSeq.conf     |  8 ++
 16 files changed, 262 insertions(+)
 create mode 100644 ucm2/DB845c/DB845c.conf
 create mode 100644 ucm2/DB845c/HDMI.conf
 create mode 100644 ucm2/DB845c/HiFi.conf
 create mode 100644 ucm2/Lenovo-YOGA-C630-13Q50/HiFi.conf
 create mode 100644 ucm2/Lenovo-YOGA-C630-13Q50/Lenovo-YOGA-C630-13Q50.conf
 create mode 100644 ucm2/codecs/wcd934x/DefaultDisableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/DefaultEnableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/HeadphoneDisableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/HeadphoneEnableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/HeadphoneMicDisableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/HeadphoneMicEnableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/SpeakerDisableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/SpeakerEnableSeq.conf
 create mode 100644 ucm2/codecs/wsa881x/DefaultEnableSeq.conf
 create mode 100644 ucm2/codecs/wsa881x/SpeakerDisableSeq.conf
 create mode 100644 ucm2/codecs/wsa881x/SpeakerEnableSeq.conf

-- 
2.21.0

