Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B8817045
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 07:04:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AE261812;
	Wed,  8 May 2019 07:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AE261812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557291874;
	bh=cTvwfD3YcgdXLiImnaCwI6Lo0fnsbwqXz+XfFG/YAFY=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y9+B/fOvtKpqdZJErjyLQvD9cUMHdls5FlQGIEjaBPThA6tL01bKks7rOCNYxqJ04
	 u3avHUW2qhm0Tmvw4dEKgdFibL1x/iIF4CB/+9Q7bdaIW+0WwfiM1uftlPIwIKZ75o
	 VWQ8RQME1DOcl61CfC2bePF1T4oPCcum3BaPhirI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 993F1F896FD;
	Wed,  8 May 2019 07:02:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75A45F896F0; Wed,  8 May 2019 07:02:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_PASS,T_DKIMWL_WL_HIGH,
 USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF270F8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 07:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF270F8075E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="eQP130Vy"
Received: by mail-ua1-x943.google.com with SMTP id 94so4644339uaf.10
 for <alsa-devel@alsa-project.org>; Tue, 07 May 2019 22:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=daFrFv1D32Ni69i2t6zUXzOzARNtGEZsAU2KQjye52Q=;
 b=eQP130VyCfXQaqhYzKluKqdwy8h3l1r15gF1M3POMFnvBqgQWtFhTZZ35AVtoq/nCz
 OqxpvdLVGFPOu9k8CngJvEtVMuPBIe7Bk5TrJB2SLY/BEWZWwtG/Wt/ghKcoSvVmxHkY
 nbqj+ZBCVtt1PrqYhSLh4ruUyzbjyM30KPA9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=daFrFv1D32Ni69i2t6zUXzOzARNtGEZsAU2KQjye52Q=;
 b=uCHtG1St5kK8eeHcofvdui+F91RfIhy1B3Sm4vxJF199zD8Lkc6OkXVZEKQnLYRKl1
 5OK+l9deaGNZSqHTBMevsY60zcM7V52+1oIsI5TjUIoVr183rJQt+mqzsnjPqocZU5Hg
 LRruY1Ky8YsPTmnRp1Ffl8YqqgVVoozn2e6vGnSdSEZQnUy/IHklwSKAKrzYmr/wByX7
 mDaALazgOv9sSmTLCcH4+8OOZr7ThJwf6YRCrrW6TUHDA9puy5cmh8smBC+Khc4nmRGM
 4N86OryTl3tAyE5FSXhF04K/LA5KGw8UD5iMSqynb3eycBf0AHensJ6OSOO9kX7UW9NM
 XrUA==
X-Gm-Message-State: APjAAAWvGKJ0THq/IAStx7C1GN0VSepriPWFEkTUvA6El2Vl4Y4eYey2
 RF7UpUZOM7+ecvrvuoNMkiqee2+ddIsbA9Yi5hpNqZygmS1SWw==
X-Google-Smtp-Source: APXvYqxnTREtyCKnR79hgPmONRaSN2Gh8OPa4JSPoxzVfev1XAx9Sh5h4SzVNIkk/k5pTcsrG3J8yaRvSUFqylR1MlI=
X-Received: by 2002:ab0:c12:: with SMTP id a18mr5868286uak.69.1557291761510;
 Tue, 07 May 2019 22:02:41 -0700 (PDT)
MIME-Version: 1.0
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 8 May 2019 13:02:15 +0800
Message-ID: <CAFv8Nw+etFr6Wsd2WoXC+pzQ_rhcqTTzDSUOgWC-dETbvZ=iVw@mail.gmail.com>
To: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>
Cc: romain.perier@collabora.com, sjoerd.simons@collabora.com,
 Doug Anderson <dianders@chromium.org>, tzungbi@chromium.org
Subject: [alsa-devel] Question: Selecting one codec from multiple codecs
 using rk3288_hdmi_analog driver
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

Hi all,
I am wondering whether it is possible to selectively play to one codec
out of multiple codecs.

There is a multiple codec usage in driver rk3288_hdmi_analog:
https://github.com/torvalds/linux/blob/master/sound/soc/rockchip/rk3288_hdmi_analog.c
https://patchwork.kernel.org/patch/9554267/
I am not sure whether the driver supports playing to analog output or
HDMI selectively one at a time ?

I don't have a Firefly-RK3288 board to test that driver, but I have
RK3288 veyron board.
I followed the similar way like that driver does to support max98090
and HDMI on RK3288 veyron board. However, when I play to the device,
it goes to both max98090 and HDMI codec.
From rk3288_hdmi_analog implementation, I failed to find out how to
turn off HDMI codec when HDMI path is unwanted.
The DAPM pin switch "HDMI" does not help since that even if DAPM path
I2S Playback -> TX -> HDMI is turned off, the startup ops of HDMI
codec is still called from soc_pcm_open path.

Could someone please explain whether this is supported in the framework ?
There seems to be two ways to achieve this
One is to use TDM and select different channel for two codecs.
The second is to add mixer controls and turn codec on/off to disable
codec completely.
But those requires changes on codec driver and the capability of TDM
or mixer control on each codec.
Maybe there should be a way to bypass startup ops of one of multiple
codecs if it is unwanted ?

Any help or suggestion is appreciated. Thanks!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
