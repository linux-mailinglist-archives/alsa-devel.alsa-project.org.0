Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 278A910450C
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 21:28:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC62816B2;
	Wed, 20 Nov 2019 21:28:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC62816B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574281731;
	bh=KNSTfSCN6Yb7Mt01LSjNfnzV+n+/aAzP8tJIrTAFFFQ=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FQBzlcoAU5atzia63Zsu6V9Yx8zQDItz9HBAoG3NN6ETEcwOLgjPOxBNGVqbtb4oe
	 0xc8T9pOwoj+NkEpV2vIjqJeWJ2ro2cN8tdpAGXjdCswS6ps/NfvmmvN22Q/0FNf7W
	 tzu5d2CuY4uJL7Z3vWzidQRV42UBU/78nk5M4eC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3152F8013C;
	Wed, 20 Nov 2019 21:27:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5F2BF800FF; Wed, 20 Nov 2019 21:27:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7781CF800FF
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 21:27:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7781CF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rFgeQxvO"
Received: by mail-wm1-x331.google.com with SMTP id b17so1128164wmj.2
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 12:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ez86y3zGeGQ1/0hFk+Dnspe8cwa5XGGVYpwbdPQlhks=;
 b=rFgeQxvOwejG1c3FQ5pSd0O0J7/MIi3otOaF3aTRXuGmIkwTsot42gB9D52SbS4GdH
 9fnzv0WCUZM34UwPF3WcgU0BvSkzWC68Lqp2DvyZOAKap2freqORZujDf/g98mqG5L78
 Vw0fnL2mF8yGp9u5HeulU3MiaaOQuzWfT2rqOREZ4/W3zk3n5RVUUYTAXVr64B7IfMsU
 cgH2b4HmHoaWIYKjrHCAO7Y3Q4IG0uWQsy4O5MzfvV8doGUBNg8uLNEZGs+QGL37H4tr
 60dGtg6LyjbSiIKqx5TW1y3wnAYO1tDuzGqFWC9VPK82RMcUzcgX8KrHbM7JLRzq3ILc
 LDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ez86y3zGeGQ1/0hFk+Dnspe8cwa5XGGVYpwbdPQlhks=;
 b=CQzhx3rZx426LILsgx/amsgwbR/rZy37dDjQnb45znObPpBv88SITSTpnzPApkg/mj
 Tj/uG+ulRGRqzu5IRUrAGU44Ln3hsNMum7JbC63g/ebvJQv0LNtWRAXim48Xo1R/zwpT
 ygR06mWM6+8UwgPciM6VhcyWNYszJ8rVWx/GRD+Dq9u9XaPXnQia/iH4B/G6+A8ki0Yw
 OpRzXwf/BK9i8i+HtRwEtewhXKggsn5IYKPZpUjXjo5WptqornCqmzzjwwseR4aD2i2P
 ZKJxlPSbJSGi9MZ3UPy3HBeI3+bWen1ZbKW1hVV2DF+8USb38Mve5x18tYFpoPbfALey
 5j3A==
X-Gm-Message-State: APjAAAUa21TormVUQZaKy+B66htsuAl2Mqxwdup9Q4wi56FTX+Q3b1N0
 4UOhJLKod96xYVG7WfJ5i4E1TdKqkWzYsYNOav/2xXHH
X-Google-Smtp-Source: APXvYqw9WoGLEXCgYn9v3EDOeDIdMp8plphB7TmLvKVbgd+Su+fqP2+D9lFNw9VVomVuXfjmujwADgInhdJp4UG37LU=
X-Received: by 2002:a1c:2745:: with SMTP id n66mr5594100wmn.171.1574281622536; 
 Wed, 20 Nov 2019 12:27:02 -0800 (PST)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 20 Nov 2019 22:26:51 +0200
Message-ID: <CAEnQRZD4n3aOe+w8T2EahmRAFb8eRk==XR66QRj-gbxL_FzpiA@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Linux-ALSA <alsa-devel@alsa-project.org>
Subject: [alsa-devel] simple-card with platform component
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

Hello,

How should simple-card work when we define a DT node like this:

sof-audio-cs42888 {
      compatible = "simple-scu-audio-card";

      simple-audio-card,dai-link {
           format = "i2s";
           cpu {
                sound-dai = <&dummy>;
            };
            codec {
               sound-dai = <&cs42888>;
            };
            plat {
                sound-dai = <&dsp>;
           };
};

Is there any example with platform?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
