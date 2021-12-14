Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EA54749DE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 18:41:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E3C51F16;
	Tue, 14 Dec 2021 18:40:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E3C51F16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639503677;
	bh=OU+lCqVgf4GCrpqVoOGA6vvPrGVDTMZaACD5Vuguynw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FMPUQimSmCINEZxJ5/RPtwNPX3WnNCYLZmzM2AfbHejmcLl+TYkJnjulBKvNKde/8
	 imZU5vKqI8MN/CpkxVZKqO1iWqosi6MMhhLyoNK/a+a91uh6oAVrVewQaJh2m96sqm
	 mSM81s6zkHTPjnVpbS+suGuRv/2v9N4vgnY5gM14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6E5FF80271;
	Tue, 14 Dec 2021 18:39:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B375F8025A; Tue, 14 Dec 2021 18:39:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A653F80271
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 18:39:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A653F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="e1SoDw3p"
Received: by mail-ed1-x52b.google.com with SMTP id y13so65370944edd.13
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 09:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LxAuJbLvvTcbumNHXWVkWEBJhfQUVBNZ5jnWFkaTSsc=;
 b=e1SoDw3pmy2JdP7IPrREK0jG2cn8uEHq3kXD6m0PSAb9xnBxyMJyQpXBuTIRSFH5vr
 zyVEsFVTqd8MSQXyp/MfyJksmCCFXUXB3qV/Bd+PLR+/NTMM/ADSF7xFeohIHOGpC9pC
 1B6mV275t3/L/9afXznLmVGlBQImU+BRr3+n5eA21JyFwyPeXmog12j6S9Yzg2bWa6Aq
 ObcgC3XZAAwTmxxPyK9EO4f2TaErwdSTGDwH9EGwFNkvfiUGH9oQBnMJZ3VHG96cKHrE
 fp4YSAkbRfctF07IF/z2x+J7CaDV+15TqPXg62JDKZZtjF8pE3JfNgMFqDcoH+Gb3PkO
 il4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LxAuJbLvvTcbumNHXWVkWEBJhfQUVBNZ5jnWFkaTSsc=;
 b=fSD8cFggCaW7lI+1PqcjafYdVZ5H7IZjCR7JhSOY0sJlArpnrKHoR9hZkV1iCNW54I
 vNl6W/CY4/xnGysdlAm+o1BbookO3kTrj7YG0U7bQ/owpdvlpPR5ahrcxNXxQd7NIY6F
 GOrtBVxp54i08hOUHbWhlVUP5toPCHvwpBf7yI1egQBpKDVKcwpb1TSqYck67iYmmlYx
 QzNpVlcpujaY7jUWd2V0NAXfkijvnQ1P3cNfxWX8smje64CADBwK9+Ps/h67WVZgTAgy
 0yakgZNdJIFF1tRX1/JgoFLs6EDLLRVcW4tXqU8CGSZkgx9sglnLeaXRgV80qzAU5bZk
 ruLw==
X-Gm-Message-State: AOAM533BPfqtdh2Ty0VQtsDZlfPWzGQmqPBsCeLQIvNycMm8Pq9TmbHm
 Be2P0KjIA0EhKBPu32/2ZzI1YoAR5p9lAWEhcO0=
X-Google-Smtp-Source: ABdhPJyfe+m1TWfKEDr/wqXpFTcnF2opPxqMTsYASJHjTvEd+Gg2pPTfJJac6JIWJDSG3LI8qCeW4TcStTKIuDs6H+E=
X-Received: by 2002:a17:906:a3c6:: with SMTP id
 ca6mr2672214ejb.639.1639503556811; 
 Tue, 14 Dec 2021 09:39:16 -0800 (PST)
MIME-Version: 1.0
References: <1638891339-21806-1-git-send-email-quic_srivasam@quicinc.com>
 <1638891339-21806-4-git-send-email-quic_srivasam@quicinc.com>
 <CAHp75Vd=47Tv9Sf+styPhxS2=O1H2KUDeKQXTULUYU5fDgGwwA@mail.gmail.com>
 <0f6621e5-f014-27c9-be8b-6c32ab994304@quicinc.com>
 <CAHp75VdL3hmr23CcJLDpvbHaKv5HrDZjmVQpCnRNmPM7nEx6WQ@mail.gmail.com>
 <4bcfadd0-8abb-e9e9-ad18-a5b1d3d46308@quicinc.com>
In-Reply-To: <4bcfadd0-8abb-e9e9-ad18-a5b1d3d46308@quicinc.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 Dec 2021 19:37:47 +0200
Message-ID: <CAHp75Vcnc96QYy5_mzYCbhrsJ=iEghKR0Z8XaX+DnVeNN3DthQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] pinctrl: qcom: Extract chip specific LPASS LPI code
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 Takashi Iwai <tiwai@suse.com>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, rohitkr@codeaurora.org,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, judyhsiao@chromium.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Tue, Dec 14, 2021 at 7:22 PM Srinivasa Rao Mandadapu
<quic_srivasam@quicinc.com> wrote:
> On 12/14/2021 10:46 PM, Andy Shevchenko wrote:
> > On Tue, Dec 14, 2021 at 7:15 PM Srinivasa Rao Mandadapu
> > <quic_srivasam@quicinc.com> wrote:
> >> On 12/8/2021 11:58 AM, Andy Shevchenko wrote:

...

> >>>> +struct lpi_pingroup {
> >>>> +       const char *name;
> >>>> +       const unsigned int *pins;
> >>>> +       unsigned int npins;
> >>>> +       unsigned int pin;
> >>>> +       /* Bit offset in slew register for SoundWire pins only */
> >>>> +       int slew_offset;
> >>>> +       unsigned int *funcs;
> >>>> +       unsigned int nfuncs;
> >>>> +};
> >>> Are you going to convert this to use struct group_desc?
> > Any comments on this? It sounds like further improvements.
> Actually this also needs as separate patch. these patches will do as
> separate series.

Of course, that's why I put  the second sentence after the question in my reply.

-- 
With Best Regards,
Andy Shevchenko
