Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2303D3B3D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 15:31:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4D891712;
	Fri, 23 Jul 2021 15:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4D891712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627047094;
	bh=qaN728SPjkmKMcMkhQD2YNEAKYdpRVXGPMb4NJ7N3NA=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=Maz9jVoIsH+oo0PwH+5nRewftzxcHEEIQe8R2Ix6zk58kGmCvM2bXmPX/wMlJ9VI5
	 Hswg8jsJkwNz6916wNGT1F2gDI61+w1wCw+XkRhCr+6NbK14KI3JBHkRi0jTAeh+jy
	 U+8G4PH5ynQrGH+kGUe8XS/FTXTuhzKYu8LIxPK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3005FF804AD;
	Fri, 23 Jul 2021 15:30:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40E87F804AC; Fri, 23 Jul 2021 15:30:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36ABBF800DA
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 15:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36ABBF800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LaD62IdZ"
Received: by mail-wm1-x32b.google.com with SMTP id
 o5-20020a1c4d050000b02901fc3a62af78so3510971wmh.3
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 06:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to:cc;
 bh=dpLzFei5Cvx6LLyH0OT3XvCHB2+UX/GuEh8ien0K9Yg=;
 b=LaD62IdZDSuQQKQFHS6w7a/PtQxRbayQaqf3solCuL8Pd25l8FEpFiH6KbTm97ccp4
 LKORpxdr8EVQbzq+g27x1cwxLlkRcurS2p8NbKyzuKY4tsOULh8UitggGjAYVBiDVHlA
 BvcRyeqWMlUMmHDFho9fpxZysilPDoqb/lNJ67C2sOGNx7JDexlqif58hIjIFSQpDIwG
 nkAwIUgGYiojz4gR6PUfpJRso8QmLgOJ0WuGWZKwpR9VZNAipCpsX6fv144ikQ/AtZKq
 mIGbRoas/avmBZThZofEtU8GXEXXgrPre8i9TPj1fKmSNDO8w7Dxwd0EoAFxhb3CgndA
 CB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to:cc;
 bh=dpLzFei5Cvx6LLyH0OT3XvCHB2+UX/GuEh8ien0K9Yg=;
 b=mnEDHomk3q3nUN+nfNgC97ryGHq9WNP+CW2R+hf+Rhnc9SjEJ19h8n+VcgQRT7OuA8
 xqdItD2FxcKxhxwAUDf7F6KwWCPaVmLxc269zkw5F0FVOH2TEJtjAYOhzcGRQAF3er/P
 nYrJ7vBRQIG3gIuLDN3m1JNYs1+YFkpC9kXpDVoT+ll55YcvRSYTsI6Oy1c9yCNChvf3
 nWcdp4cBySnil2WeVzJK0W7z9De6P2USykJRDJXeSumnMwd11+W/JWyOs/d4pHbU2LNE
 dTiU7XN3ApvvweCKLAItOKu1EmVqli1hqKzcWVCf5UYfmGDdY3BZLJiz7tQv5kroeehp
 gl/Q==
X-Gm-Message-State: AOAM532hMAe12Q382VzdiACulFSjdH+yyqJlmcDZW6CLPwAClj0xdM4g
 CaAVYI7JOeZrA/UEvcm/aHcyK1aWOGsVNIj9LDF9qRqew8Y=
X-Google-Smtp-Source: ABdhPJwcCpE0vbcscAHlZYD1Vxej3/O5MMSitmcknpGLe0sPZwmvpLCRq3KuaEhgLP00pQAY3M6BJdqZdG9VdWRn3Cs=
X-Received: by 2002:a05:600c:2189:: with SMTP id
 e9mr13807184wme.35.1627046991997; 
 Fri, 23 Jul 2021 06:29:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:d0cc:0:0:0:0:0 with HTTP; Fri, 23 Jul 2021 06:29:51
 -0700 (PDT)
From: Frederick Gotham <cauldwell.thomas@gmail.com>
Date: Fri, 23 Jul 2021 14:29:51 +0100
Message-ID: <CALtZhhNG9LrZM69_gjZV5d37ygyfZPtL0GMNZd3-5j_EOL3mKA@mail.gmail.com>
Subject: tlv320aic3x audio driver -- possible bug
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Cc: broonie@kernel.org, lgirdwood@gmail.com
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
Reply-To: cauldwell.thomas@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In the C source file "tlv320aic3x" in the function "aic3x_set_power",
when the argument for power is 0, the hardware registers are saved to
the Linux computer as follows:

    regcache_cache_only(aic3x->regmap, true);

And then later when "aic3x_set_power" is called with power set to 1,
the previous values are then restored back to their hardware
registers:

     regcache_cache_only(aic3x->regmap, false);
     regcache_sync(aic3x->regmap);

When the device is powered back on, the previous setting for
microphone bias (MICBIAS) is lost. If it was previously set to 2 volts
or 2.5 volts, then when it's powered back on it becomes Off.

I'm not very familiar with audio codec chips and how they work, but I
think maybe the order of function calls in the "else" branch might be
incorrect. Right now the code looks like this:

		/*
		 * Do soft reset to this codec instance in order to clear
		 * possible VDD leakage currents in case the supply regulators
		 * remain on
		 */
		snd_soc_component_write(component, AIC3X_RESET, SOFT_RESET);
		regcache_mark_dirty(aic3x->regmap);
		aic3x->power = 0;
		/* HW writes are needless when bias is off */
		regcache_cache_only(aic3x->regmap, true);
		ret = regulator_bulk_disable(ARRAY_SIZE(aic3x->supplies),
					     aic3x->supplies);

However I think that the call to "regcache_cache_only" should come
before the soft reset takeS place. The setting for MICBIAS is lost at
this line:

    snd_soc_component_write(component, AIC3X_RESET, SOFT_RESET);

And so I think that the call to "regcache_cache_only" should be moved
up above "snd_soc_component_write", as follows:


		/*
		 * Do soft reset to this codec instance in order to clear
		 * possible VDD leakage currents in case the supply regulators
		 * remain on
		 */
		regcache_cache_only(aic3x->regmap, true);
		snd_soc_component_write(component, AIC3X_RESET, SOFT_RESET);
		regcache_mark_dirty(aic3x->regmap);
		aic3x->power = 0;
		ret = regulator_bulk_disable(ARRAY_SIZE(aic3x->supplies),
					     aic3x->supplies);
