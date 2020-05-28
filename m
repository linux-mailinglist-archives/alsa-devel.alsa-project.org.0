Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0441E5D66
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 12:50:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F142C17C4;
	Thu, 28 May 2020 12:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F142C17C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590663024;
	bh=kJxvYxY7qAD/E4sCQX9gs3unJOOBjQv9KpGMzz2t5Vs=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bmuApcL0PyJms0Cs19nV7GXmNew3MBtInexCqfMnPX97ccjYGVE8Z1LlW8sC+TCFj
	 sIYXGcESUAxJlbuThsRKAYqDsBULcK7hQ3PaO644drzcRwnO7jJVNccla9grFurl89
	 1QuFXi8yQxoE85HWKe6cp+t5tzOMjcEzcHOiCov4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B104F80240;
	Thu, 28 May 2020 12:48:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E290F80150; Thu, 28 May 2020 12:48:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B451F800E4;
 Thu, 28 May 2020 12:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B451F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pcOkMo3W"
Received: by mail-wr1-x444.google.com with SMTP id j10so11758908wrw.8;
 Thu, 28 May 2020 03:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=iB7egcoUn/ltLxIQvZEICOa88xOAYo+Hd3EmE/CIH4E=;
 b=pcOkMo3WDp8MOvTc4BrX43aN3ON0Siak5lkSpKlu9rSVw/R5T+oFdHTmG3EGOsZ09g
 RFenI1IIUBRDR2qz6Z/0ch0NuYMviQXRfZiXO4Ao7wz/4iWpRaIxsqDl1ionbqYb9szD
 83RCdvmpOcbjFZZuqJ2P11VH40YVYKU40sKsAsXIs+bpb7gdtY7/+VdpDz3Gm5VRVTf7
 nzdUNwu+B6mKWzxe5TGY526t4cKqgAdEIx+paJsEnhdUMRUdp3NevPKOtunkxp2820hJ
 B5rB4EvVfkFc+NUPgslNU3dKDA5ulv9CdPcrjp7WVs1fdwmlpOQ1dLvFDNniZIZ2R7wJ
 Ywvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=iB7egcoUn/ltLxIQvZEICOa88xOAYo+Hd3EmE/CIH4E=;
 b=hAyaaqhNtmLC8CIHcdKHDU6XDak6gm/wc3WK6JFYYMQWwQSi7MxmGktQsaqglFPZ6S
 UvT0V4DX6gTLSjc0bBY+kH9mgHX9VH3K74stBlof8H/znxdEFqMUpnXfP4kYF4ZLTLRr
 vldr+mIEMUZPBwb1l51rx//K4Nf1Lg8PtbiQ37qlkP2bkJ2hkH/9hEG1lG4NotFQVtp1
 IOQnVFJ5roaW4GFORqjo9QVaLt6i4KSMfQOxyHIQqe6BcXKilRyriDNG2i9j2oj0GHv2
 2cUWRu2fi9AIDRYIUJFLZASqK/pfFLtseVkEIrzEonmyq0lOSTy6jOHd3lL/imZpBHQ/
 PADA==
X-Gm-Message-State: AOAM533n3fuAoXhpqqbYPNJ3s1Tz+3OSNbckcLl5rnQZLJnnVXUTyi3m
 +TlkoCxWq32ZV88W2ZaIeNFeJrhnEeHYGplJ6gxfffuv
X-Google-Smtp-Source: ABdhPJwj6ZpifVwmzeCr9J9x8SVPRascLCpkFDpDmRanIQt3aeZgL8jJ9Kvs7rZRDbQriOb5JhtQDyjVpW4zQeVOVZI=
X-Received: by 2002:a5d:4e03:: with SMTP id p3mr3051141wrt.350.1590662913530; 
 Thu, 28 May 2020 03:48:33 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 28 May 2020 13:48:22 +0300
Message-ID: <CAEnQRZCthvJkNgi-bW2P63X8PuhfSN5p51-JFUPMU6ZAzRQ2cQ@mail.gmail.com>
Subject: How to specify that a non-DPCM DAI link is bidirectional?
To: Linux-ALSA <alsa-devel@alsa-project.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

Hi all,

For uni-directional  dai links there are these fields of snd_soc_dai_link:
* playback_only
* capture_only

But what about bi-directional DAI links?

Is it safe to assume that if playback_only = 0 and capture_only = 0
then the link is bi-directional?

We need this in sound/soc/soc-core.c: soc_check_tplg_fes
where a non-DPCM link is converted to a BE DPCM and we
need to inherit the directions supported.

For reference see: https://github.com/thesofproject/linux/pull/2143

thanks,
Daniel.
