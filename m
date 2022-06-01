Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ACF53AB61
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 18:56:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C8D16F6;
	Wed,  1 Jun 2022 18:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C8D16F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654102576;
	bh=U1y1OHEyLck5q5R6ya4mYQrl2vyQOeLItOKDDKrDVH8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=if0Ej8C9Hkj0SNjuPkgZB+GDiecWi69sJV0aDypjXkh19pSp9bFZcNzGs5tGg1Lcr
	 qS0zQ4PAKfoOsKqpZzvSqYCko/bT5a+e1i7gWpqhTzbbziNteXllt7k//mqGJzFuSk
	 j/u+2PHKgJJ4/z5MPbPa/oUTqKP7HaGBTuTHOdA8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B46C4F8025A;
	Wed,  1 Jun 2022 18:55:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18C0AF80149; Wed,  1 Jun 2022 18:55:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B18BF80149
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 18:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B18BF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="FlZ/UGKx"
Received: by mail-pg1-x529.google.com with SMTP id i185so2438515pge.4
 for <alsa-devel@alsa-project.org>; Wed, 01 Jun 2022 09:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bbckhJ9XlY3Nme+BPmiObgn0CQAdmt4CSl1wsZbSeV0=;
 b=FlZ/UGKxH5AQlCmDo/sE5CPr5JuOqd2r8n9Vi5nbW1KX/GjkV3/Gtn9S6TTaVs+TdM
 ev3zTuRFx8UNm1OCV/PSOOXMWgc36pGrvvKLw4PUY5kjp2WqC0RFVWZ4l7jKZrwRiVPL
 xaKITrvINKY1yyebYI+wZbnZ5O/vaFszXS5xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bbckhJ9XlY3Nme+BPmiObgn0CQAdmt4CSl1wsZbSeV0=;
 b=Q78rDVAHTZDA+Vdvldo96pkUjkm+7+kmcyATY6QIklo9NgpG2nNOXUaO9E0GVz91Zo
 QrtsKINvewWxwS+bGLIFIHmn2Y6ZvpcZmSP/6yDHAmmq5pkl6kYI39xkGnDoB0xkXpga
 haTYY3ozurndMdJoQkTe+++7HFcZ9zBhOWdLTC0NMrgBD42cj8tNUIfKMii7UylLumgh
 SgJi8W+LaLFV503X1rjwy0xlnz4efdP0M90KEdUnNlm17OBfEvNwBTuRUR7YOhgR7y96
 dSV7UvW3a/Bsf6gX8XfRb+LsrGNfe7/ul3ZEKGZWX3UZ0zsqmzheY5vEm5vQBvHjLgV1
 tzJg==
X-Gm-Message-State: AOAM530JCsP3MaGOMIl3Pv+XDpQwi0YTk+f4Aax5WYKRa4COnAgkY6kL
 Al0szYCvoxa18pwQw21En8jSkA==
X-Google-Smtp-Source: ABdhPJxvz006k4bCcMabU3sUioYhsFPS+sODZatl7Pq8O6MVnYLQ0t5SXSDd6s81fwyeDL690piJlw==
X-Received: by 2002:a05:6a00:168a:b0:4f7:e161:83cd with SMTP id
 k10-20020a056a00168a00b004f7e16183cdmr577037pfc.56.1654102511801; 
 Wed, 01 Jun 2022 09:55:11 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:e69e:f483:e751:7c7c])
 by smtp.gmail.com with UTF8SMTPSA id
 g10-20020a63e60a000000b003fab08e09e9sm1563351pgh.67.2022.06.01.09.55.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 09:55:11 -0700 (PDT)
Date: Wed, 1 Jun 2022 09:55:09 -0700
From: Matthias Kaehlcke <mka@chromium.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] ASoC: qcom: soundwire: Add support for controlling
 audio CGCR from HLOS
Message-ID: <YpeZ7TdHK20xiLz9@google.com>
References: <1652877755-25120-1-git-send-email-quic_srivasam@quicinc.com>
 <CAE-0n53g9rWks+euk5KHBzmJNEB3xLbJzMgCxN52DO5x+9-Wgg@mail.gmail.com>
 <51b8aca1-e038-4907-e973-ebdbebaf9b28@quicinc.com>
 <YpaXZ6KfApGebkBy@google.com>
 <7c74868d-624b-c18e-b377-026e70813fcc@quicinc.com>
 <1ec64a99-cfcf-c903-935b-d1bb0617c284@linaro.org>
 <61c151e2-c44c-3b84-9fed-a83abef83c17@quicinc.com>
 <2a520eaf-c1de-aa91-3029-83f5469cdbb0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2a520eaf-c1de-aa91-3029-83f5469cdbb0@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, broonie@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Stephen Boyd <swboyd@chromium.org>, vkoul@kernel.org, agross@kernel.org,
 bgoswami@quicinc.com, quic_plai@quicinc.com, bjorn.andersson@linaro.org,
 judyhsiao@chromium.org, linux-kernel@vger.kernel.org,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

On Wed, Jun 01, 2022 at 02:42:30PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 01/06/2022 14:15, Srinivasa Rao Mandadapu wrote:
> > > > > > > > +       ctrl->audio_cgcr =
> > > > > > > > devm_reset_control_get_exclusive(dev,
> > > > > > > > "swr_audio_cgcr");
> > > > > > > > +       if (IS_ERR(ctrl->audio_cgcr))
> > > > > > > > +               dev_err(dev, "Failed to get
> > > > > > > > audio_cgcr reset required for
> > > > > > > > soundwire-v1.6.0\n");
> > > > > > > Why is there no return on error here? Is the reset optional?
> > > > > > Yes it's optional. For older platforms this is not required.
> > > > > If it's optional then either there should be no error message, or the
> > > > > error message should only be logged when the version is >= 1.6.0. There
> > > > > are few things worse than a kernel log riddled with misleading error
> > > > > messages.
> > > > 
> > > > In that case, it can be done like below. Kindly let me know your
> > > > opinion on this.
> > > > 
> > > > if (ctrl->version >= 0x01060000) {
> > > 
> > > This is not true 1.7+ variants do not require anything as such.
> > 
> > I think it applies for all upcoming versions as Qualcomm Hardware team.
> > Here is the not from HW Team.
> 
> Am testing sm8450 which has 1.7.0 and it does not require/have such control.
> 
> I dont understand what is the issue in adding a flag to
> struct qcom_swrm_data.
> 
> This should give finer control rather than matching anything > 1.6.

I agree, a flag seems a suitable option.
