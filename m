Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E0562B19A
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 03:58:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 124031681;
	Wed, 16 Nov 2022 03:57:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 124031681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668567482;
	bh=/Ew2//99NB9UvkhCPB1N+bY3qId3b/eLWsTimEeJxDA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VLXonS/ed98COU0mPp1xsAyb7TKd55yX/CH+evaBvpXoI0AYByOZIgUSB6NKXg2fd
	 wSc1md9QyNWRnehNuKo35eWwTunB16r9FlS4814Hai9GeavubVS+IJGcP42+5U9prk
	 08g/40JJEY4Wn+pVTsOhb2ZfSzo44UYhK6sCd0PY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6815FF80238;
	Wed, 16 Nov 2022 03:57:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7956AF80089; Wed, 16 Nov 2022 03:57:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 331B1F80089
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 03:56:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 331B1F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="JRYrEo6l"
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3876f88d320so27151587b3.6
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 18:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/Ew2//99NB9UvkhCPB1N+bY3qId3b/eLWsTimEeJxDA=;
 b=JRYrEo6lXdGs/v03hJixrujqnktmfudPNZmSklp2IkyuPr2udfW0bnqCHA0zH3Vsnh
 VIsNJaWo1L+eB3OX1LRwhXyL/LUP9N5veYTVjaoG75NyC2eZK5N8c1sHoknneiVo+4y7
 RgGvTyaV5nsEUEQ5Onjm6C2BMkEPN2DHFfTPAsaHHHl9Wf3CJqHtOlE4S2q9uco0RZem
 8CXJI4aC+A0dYjXQ8abPmih0jK5nR1O6aOa0+BGN11Ma+XJOuoy1z6/EatVHlU0iZXFP
 tBaxCLPANGlYiJRNMCcymEbm/GN+Hyvsm+RoCHa8HZuHInx4De+t6KYy0indqRr7WYSG
 bA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/Ew2//99NB9UvkhCPB1N+bY3qId3b/eLWsTimEeJxDA=;
 b=Y+kmNcZYo3AyhAmYCW/a7oeeFiVF4qpaC83Gwblzru8iCzyRYkk8X5CMsYRTnlIUFE
 TCv35RIZxaIN71tDYwfX4ZVz9bDi2n5NG9KN2HYgH8I3e6laA/RmNpiefx1f0iOke+fS
 UzDvHR4L28fCXr+iRUoXHLFsuyLXl4VRz2IvjkOWQXmV1DU2WwskNVxIxtT8d2ECJEaF
 Y69wrvMSEgwWzqv6CbI+DW7hERJ6FCG0fxy/YNyxIcGSl+XgWoYk0svC+UqgTCKHnT6J
 9ksVcJuFdUGpjsWfIHe73C8gGR/07zrI3YojRs7RhFxkWTXsFXTSbPUrxYvRZNrQa46a
 rw/w==
X-Gm-Message-State: ANoB5plXgMoZ2m6XHKVp6wIUm2sTzZiYtPeRQVGXpzkKboLbahdpTf6x
 8XKaKZbRlJjCvmeysB3b55mR0Z9a3sBjK7cvhhHRZw==
X-Google-Smtp-Source: AA0mqf7UowKnr3ZpVmpHeJUlD8a+sWF4HxNtgbNICT7qFVic/bvEZqjsVgUi/EbtzlZJOOFQbpTGFuKIjadEpPAPicI=
X-Received: by 2002:a81:5702:0:b0:368:ba4f:dd9f with SMTP id
 l2-20020a815702000000b00368ba4fdd9fmr20616166ywb.155.1668567416909; Tue, 15
 Nov 2022 18:56:56 -0800 (PST)
MIME-Version: 1.0
References: <20221108042716.2930255-1-ajye_huang@compal.corp-partner.google.com>
 <20221108042716.2930255-2-ajye_huang@compal.corp-partner.google.com>
 <PH0PR11MB58329B470ABC721F95EAC6EA84059@PH0PR11MB5832.namprd11.prod.outlook.com>
In-Reply-To: <PH0PR11MB58329B470ABC721F95EAC6EA84059@PH0PR11MB5832.namprd11.prod.outlook.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Wed, 16 Nov 2022 10:56:45 +0800
Message-ID: <CALprXBa1NETwy-4v3j8rR0w7Oi-8A28CLH2HF8U-5TAqE4P58g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: Intel: sof_rt5682: add support for
 ALC5682I-VD with amp rt1019p
To: "Chiang, Mac" <mac.chiang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "Yang, Libin" <libin.yang@intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, "Reddy,
 Muralidhar" <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, "Lin, Chien-Ta" <ctlin0@nuvoton.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, "Lu,
 Brent" <brent.lu@intel.com>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>, "Zhi,
 Yong" <yong.zhi@intel.com>
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

Dear Mark,

On Mon, Nov 14, 2022 at 3:37 PM Chiang, Mac <mac.chiang@intel.com> wrote:
>
> As per discussed with Ajye, the board co-layouts 5682VS and 5682VD and verified.
> Hi Pierre, could we have your reviews?
>

First of all, I apologize for this letter of inquiry.

I got "Acked-by" from Pierre for the series patches, (
https://patchwork.kernel.org/project/alsa-devel/cover/20221108042716.2930255-1-ajye_huang@compal.corp-partner.google.com/)
Please you have a look when you are in free, thanks
