Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A90DA5116E4
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 14:42:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DFC11720;
	Wed, 27 Apr 2022 14:41:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DFC11720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651063338;
	bh=a7TD6N0NJNeX0H34sslwEVoctiZTbr5NDz9Rb9P2bX4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i+hnwV1DFTlC291t75pBHMKWUzLGcNlaP9Pbb1FSwLOL/MtUVPiSjOsNHtDyNWQzn
	 JAF7DteB0XY3vIdoqqhcMW7JhArbY0F/IcCJ6ITnAvPAZZu0neZu//j0aT/nwZQGjb
	 hqj+Itttj/tJfl1V+pmZ/AfvhhzowCfk2lkQpFQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0372AF80256;
	Wed, 27 Apr 2022 14:41:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 968C0F80155; Wed, 27 Apr 2022 14:41:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE9D5F80100
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 14:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE9D5F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="DW3Rqq7s"
Received: by mail-pj1-x1033.google.com with SMTP id
 j8-20020a17090a060800b001cd4fb60dccso1670334pjj.2
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 05:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Wq28PJtFp2ZXhRI034iH1Qnz5afUUU3Bl0HP6yTmjKs=;
 b=DW3Rqq7sdovtPYzb0tjAqJdwFSepX2FFO39TgI2LCNcd7ZBq1OttA9K9M+yYB9VX8q
 0QB72cRgDQlGcnlw3z/2O/qiGlUEs7ekEmZ2Rf+/YTdqgIBJ4QAHsaIP22O0XnEVWjpm
 NFB8zuMl6gO/CTxPFxyBIqVxOiJAjh7G6yr6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Wq28PJtFp2ZXhRI034iH1Qnz5afUUU3Bl0HP6yTmjKs=;
 b=dRpahOEB4FleHYyGJdFUEJdu6VRVJ8KrQxCfurNcbBdLoUNv0WQoy0gCVVJetjd/XV
 z9HHteCSlsJAjAgPD1whV02pgM8Tk3tdBVrbOGDrQXv+6Ti9KaVxHm3Aatllt62P2Y8b
 VbBRF0slSUcPygn/n+ix1nKiv/REVjmtBOGitOZ996kDljo2FtaOYOYOexIoGH4VC0PH
 ZnVfMo2fxphnIHiUGPX18f9OLhjB+sVth9sYknbiwZrv0DDnkqNiH5PA+CfTox7PooEz
 tUGFNPR3kSzFcem2YGafMfs7PusWA48Rpf3JOI6OhIEza310e/Nz+qr45GSH3H4dOFuv
 NxBg==
X-Gm-Message-State: AOAM530Smhvg1xR+IR48fTtG4j4Jtax9HxhBz5mBfz1HCxdbWUwDzObi
 JaPj1cXQGpFpdqc6yo4iXoSa0g==
X-Google-Smtp-Source: ABdhPJyKqchzIfscFubVswNDkjUM9U4zaIRXMAoOdaQFTE+AoK5T6ID2J7IVFkZJOJ0f+Pc4UF41XQ==
X-Received: by 2002:a17:902:7897:b0:15d:318d:706b with SMTP id
 q23-20020a170902789700b0015d318d706bmr9712210pll.16.1651063272455; 
 Wed, 27 Apr 2022 05:41:12 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e2d:263:26e7:c039])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a635845000000b003aaba2d78c2sm15733630pgm.71.2022.04.27.05.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 05:41:11 -0700 (PDT)
Date: Wed, 27 Apr 2022 21:41:07 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: ipc3-topology: Correct get_control_data
 for non bytes payload
Message-ID: <Ymk542TrKrLTiBO8@google.com>
References: <20220427105253.16640-1-peter.ujfalusi@linux.intel.com>
 <YmknCrJKihRkpyTq@google.com>
 <83698b90-855a-f5e0-11ba-94aba393a7b1@linux.intel.com>
 <YmkvBAgBrxRAMUcO@google.com>
 <03a5d9ee-90ef-e4b9-5117-e59e81407453@linux.intel.com>
 <Ymk3jYPd1lpvfjBE@google.com>
 <6b8e7ef5-d5f2-b691-e493-2ba2d8ef783b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6b8e7ef5-d5f2-b691-e493-2ba2d8ef783b@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, cujomalainey@google.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 Sergey Senozhatsky <senozhatsky@chromium.org>, broonie@kernel.org
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

On (22/04/27 15:35), Péter Ujfalusi wrote:
> >> Hrm, uhm. clang is right. The check is (and was) bogus...
> >>
> >> cdata->data is a pointer (to cdata->data[0]) which is always:
> >> cdata + sizeof(struct sof_ipc_ctrl_data).
> >> Checking if it is NULL or not is irrelevant and wrong. If we do not have
> >> additional data then cdata->data points to memory which is outside of
> >> the struct and it can be random data (might be 0, might not be).
> > 
> > Yeah to be honest that's what I'm thinking too.
> > 
> > Does sof_ipc_ctrl_data have to be a var-sized structure? Or can that union
> > hold pointers that are allocated separately?
> > 
> > 	scontrol->data = kzalloc(sizeof sof_ipc_ctrl_data);
> > 	scontrol->data->chan = kzalloc(sizeof chan * mc->num_channels)
> 
> Unfortunately no, the data/chanv/compv needs to be flexible array as it
> is the IPC message itself.

That's what I suspected.

> >> I think we can just drop this check as we would not be here if
> >> additional data was not allocated for the payload prior?
> > 
> > I don't have enough knowledge of this code. ->data check doesn't do what
> > it is expected to do so removing it shouldn't do harm.
> 
> Let me quickly send v3 with dropped cdata->data check.

OK. I'll remove if from the backport, run another test and will call it a
day. As you can guess I was puzzled by that ->data check but it's another
very long day in the office for me and in the end I just dropped the ball
and decide to suppress clang warning instead. Very smart! (NO). My bad. (YES).
