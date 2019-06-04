Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9690533E95
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 07:49:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F3DA166C;
	Tue,  4 Jun 2019 07:49:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F3DA166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559627399;
	bh=inUj7rPApH++iq9sVHyHkAMwoaaYCXBA5YupSscI3I4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=elgdgVE9mYwEx7r/hZezrf7d169BXP22e20eOR+cBzzk7pl4bXVXltuOMMSQ0bzZC
	 LpKsxhMQsboS5kXUQ7fzyV9UsK+1+u7HL+xT9WzyiajhFY9fp61TUfp44vyPXZcAga
	 CJo3gUcLlWoaT+zkNRAioCMkY4QKkTM4eMQhp0NY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68113F89673;
	Tue,  4 Jun 2019 07:48:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D7D7F896F7; Tue,  4 Jun 2019 07:48:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4651BF80054
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 07:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4651BF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AprUw2fU"
Received: by mail-wm1-x341.google.com with SMTP id d17so5684684wmb.3
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 22:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=d0PHWADGUTRHP3RbtVmcCFQIV5Xx7EXkRTIqij8bmTU=;
 b=AprUw2fUY0LjS5Diu/tR2Pmn7vwhaxX8wO278qS0E1kpmPhfqoJ0SXgBwesswQaVj1
 8PK7CdzlaqoLFTCdNpyPgYKJiTifXUzb7GhCqfnJ6N/EE9NUs7tNdhJ2uxK5+rDjUaBJ
 t2T42Okzeb79umghXaLPG4nfl0wp2e7t7KThJk2vD2Y6jbt5zzprKHpoAdfhMCbn1WcR
 v2cr1nwtmyUGeQfjsfAab/OslH0UZawmNrfbyyqZ1s1NEfYWnumslps++LeCw3VIhhyp
 sjPlWOQ75u6UuUF6C9guxJgimDoB9IPQFkMSHf9aYodOQwamPQubvdlKUlGoeisaMxAh
 Kwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=d0PHWADGUTRHP3RbtVmcCFQIV5Xx7EXkRTIqij8bmTU=;
 b=obcaYngcgs4qJffY3Y1ciuuZdpIhbVcO4tUudvRNFrWImVLNYIVFQkjlQm0zCXze7n
 TosjMxdALJYFZLI+yYXm4oqiNbRqZxO7T2toWKqkKszWKac7tLZIbEdmP2kNDcNaOoDh
 Gl73glrRHQ5TVWlxO8YKdpNtL5Phmv1zET7ZvKASrqZ4Vj+lb7T9FaNbdHx9Q4aZRHHd
 h47htzgs4bySW03Ed+g27CY+cNCu9btaDaipMINLUfLx4G15/w2eSB0CsAiS81b+Hmjl
 pV0vGGQshoY0SYWSO+sDq2tg04tDuZ3UzxkLY/XVLZ1CR8aQAyz15VCWBEMLX4L17Ru5
 HEWg==
X-Gm-Message-State: APjAAAWyUw2JDOBkKsEopO3zbes3/cRdnhjTlmW/nOOOTaROefQA3rrS
 QAr/CuzjFpFSm01nmSGb+fcdBA==
X-Google-Smtp-Source: APXvYqwIIlQozIHS1omANt46ZYA1k5oV3Ls5bT0crSJhfYkQnCeDPC78T92R6f4ncEyKrlsTMbBaHQ==
X-Received: by 2002:a1c:305:: with SMTP id 5mr17363067wmd.101.1559627287208;
 Mon, 03 Jun 2019 22:48:07 -0700 (PDT)
Received: from dell ([2.27.167.43])
 by smtp.gmail.com with ESMTPSA id x8sm5149737wmc.5.2019.06.03.22.48.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Jun 2019 22:48:06 -0700 (PDT)
Date: Tue, 4 Jun 2019 06:47:56 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20190604054756.GZ4797@dell>
References: <20190603183401.151408-1-gwendal@chromium.org>
 <20190603194249.GD2456@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603194249.GD2456@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Gwendal Grignou <gwendal@chromium.org>, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, fabien.lahoudere@collabora.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, groeck@chromium.org,
 enric.balletbo@collabora.com, bleung@chromium.org, jic23@kernel.org,
 cychiang@chromium.org
Subject: Re: [alsa-devel] [RESEND PATCH v3 00/30] Update cros_ec_commands.h
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

T24gTW9uLCAwMyBKdW4gMjAxOSwgTWFyayBCcm93biB3cm90ZToKCj4gT24gTW9uLCBKdW4gMDMs
IDIwMTkgYXQgMTE6MzM6MzFBTSAtMDcwMCwgR3dlbmRhbCBHcmlnbm91IHdyb3RlOgo+ID4gVGhl
IGludGVyZmFjZSBiZXR3ZWVuIENyb3NFQyBlbWJlZGRlZCBjb250cm9sbGVyIGFuZCB0aGUgaG9z
dCwKPiA+IGRlc2NyaWJlZCBieSBjcm9zX2VjX2NvbW1hbmRzLmgsIGFzIGRpdmVyZ2VkIGZyb20g
d2hhdCB0aGUgZW1iZWRkZWQKPiA+IGNvbnRyb2xsZXIgcmVhbGx5IHN1cHBvcnQuCj4gCj4gSSdt
IG5vdCBjbGVhciB3aHkgSSBrZWVwIGdldHRpbmcgY29waWVkIG9uIHRoaXMgc2VyaWVzIG9yIHdo
eSBpdCdzIGJlaW5nCj4gcmVzZW50PwoKTm90IHN1cmUgd2h5IHlvdSdyZSBjb3BpZWQgaW4sIGJ1
dCBJIGFza2VkIGhpbSB0byByZXNlbmQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCkxpbmFy
byBTZXJ2aWNlcyBUZWNobmljYWwgTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRl
dmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWls
bWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
