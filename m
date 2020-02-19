Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BE5164BF3
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 18:32:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A34F016A1;
	Wed, 19 Feb 2020 18:31:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A34F016A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582133544;
	bh=7DvGNIBb0cyHFlIWh0Xfi3DvLnCsL6xP1amv1+iU6Xc=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MAJXLVo9X2Z5Aod2iKGUBfFIYmIfSID77vaLGvlqijmYXSvDaDghwvznNJx1RI0vB
	 hcsJKERkVCGjXuQRlWQO+bMfbIfUPxYIQJxMpYF/NZls6lcjzvhDr1g/fUzVh9eZ8L
	 5cC6xkFNxIw1Z/HWUog0MTATFGDm00kGOI7aAu4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F242F80142;
	Wed, 19 Feb 2020 18:30:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9F61F80273; Wed, 19 Feb 2020 18:30:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1B6BF801F5
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 18:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1B6BF801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="rTS8Mo3O"
Received: by mail-wm1-x341.google.com with SMTP id a9so1565001wmj.3
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 09:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=Vzj5fYuKhjSJIX8LLdjrzndSdJzkfLdinYyCt3Ld6uA=;
 b=rTS8Mo3OfNleBFSAn1y54h2JccThE9WwvMh1CPzzw8Yv/pYj4cc9te+MrhhNmIfNNC
 yfMLNteGG2e0ZAG+BLaoho4eshauB17hHBJVUTQUMShg50KLiriDQfNh8KH3ZF8uc1dZ
 WOUriIwI7kgYXc1ltbH177D3QQ6VSgG6tpZAbDp+kvoBwLCodiK0/tTVNyjFghyem1Pv
 MKMcF4HEcr+GlYtisjzch3biOCeX3/FJjysohqklTAVaEM6UUBQAOcoszVsj9eHalJOv
 hsk9E+Bb5gW7eR8kkEABhXOQvYd2l6jdyRDi91HdpmBNdmK5Il+GGcqBVVBeONfFY/gk
 +0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=Vzj5fYuKhjSJIX8LLdjrzndSdJzkfLdinYyCt3Ld6uA=;
 b=ZMR+IQjHbeCT839w56nzw+8Z+5HuSQS2Hs8C5mG/BHIPLq6+XjKnTyS42GOVerh50l
 9qTT3Ttdt3rA0rb3ci7d6u6BT4yYdXA2/RdCKveoaZ5S4MWZiXZUgyZ/dFKJBS8ZFXGO
 KEWVHQxWPgmq0aBuJtcGl01OBWDjR9n23fZqXeExKxO+uVcPDUBV2O9cfKW9/zU0EDWL
 8mpstAVyQ2ekDNm8iYcOb6BRu2Yyk+iAcVgO7GIinH5ykNsp9QZVGfNeEeojeuxDxzyu
 4JRqqzzq+M8wY13nw3GWo5BgxW0T6kQCvkWYcFeBEDSWTLuDdpVC0ozU0N8sFZfs75DA
 QQDg==
X-Gm-Message-State: APjAAAUqtEgHxvdRVnV7ZqI23SJNGuVf1isksVOh0I7Gfhysz928oldp
 ap2qgE9Z3Zs3/UfD6HjcdIA6LA==
X-Google-Smtp-Source: APXvYqz8SvtcLoz81n/o1JvdjzZKZJ/qf8otl/+1C1BQrR5Z5QNE8zns0Qa9uLXu/e2c+diOPxnt3g==
X-Received: by 2002:a7b:c3cd:: with SMTP id t13mr6145330wmj.88.1582133435029; 
 Wed, 19 Feb 2020 09:30:35 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id s65sm600755wmf.48.2020.02.19.09.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 09:30:34 -0800 (PST)
References: <20200219161625.1078051-1-jbrunet@baylibre.com>
 <20200219161625.1078051-3-jbrunet@baylibre.com>
 <20200219162000.GF4488@sirena.org.uk>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/2] ASoC: meson: add t9015 internal DAC driver
In-reply-to: <20200219162000.GF4488@sirena.org.uk>
Date: Wed, 19 Feb 2020 18:30:33 +0100
Message-ID: <1j8skyxz5y.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
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


On Wed 19 Feb 2020 at 17:20, Mark Brown <broonie@kernel.org> wrote:

> On Wed, Feb 19, 2020 at 05:16:25PM +0100, Jerome Brunet wrote:
>
>> +	SOC_SINGLE("Playback Mute Switch", VOL_CTRL1, DAC_SOFT_MUTE, 1, 0),
>> +	SOC_DOUBLE_TLV("Playback Volume", VOL_CTRL1, DACL_VC, DACR_VC,
>> +		       0xff, 0, dac_vol_tlv),
>
> Sorry, that should just be plain "Playback Switch" - this can be used by
> applications to present a combined mute/volume control together with the
> Volume control

Ah, Ok. I thought it was important to make difference between Mute
(Playing silence) and a Stream stop ... I guess the app does not care
about such detail. No problem, I'll fix this.

> (though as in this case there's no per-channel control it
> is possible some applications will struggle with that).

alsamixer seems happy enough with it :)
