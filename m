Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4170625296A
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 10:46:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAD971719;
	Wed, 26 Aug 2020 10:45:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAD971719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598431581;
	bh=7J592fv4l56MMhdV1K6dgEabYkI4YReqH3O97ymPe1M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nErHLUv3HdKq8ekoBm5fsCSQVwivK/EaEGVGuhcNwq9ATLOQujxVGpKe3oMtbXX1M
	 CkKgdV/Es1bTs2ZRxzQYmj9Pwev+Kob08/MPrB0Xm7fw1IggHg6nnz5oYj8AoyoSkE
	 nfKUWccksS6JoCLkH+cGL5HKA4fSeq030feR2koA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF208F801EC;
	Wed, 26 Aug 2020 10:44:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26689F801D9; Wed, 26 Aug 2020 10:44:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0925FF80105
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 10:44:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0925FF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WJI/0uz1"
Received: by mail-vs1-xe44.google.com with SMTP id x2so282559vsp.13
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wBMGp8rbDr2WRr2+87AZIST8n8c/hVzyRRCdGHF/SI0=;
 b=WJI/0uz1TS8QCEvTA7u3/XREOtUdhew/zKb2AdwYWhR8hJB/OH2lZ0H4YFYG5hEwA2
 Ve8ut3Fy8Y9CQNKOwfU96COO/hP/4LpVrNOvK80pZ87Ujj6EDIARR7C7E+RxrqpKPNWB
 9S1fWD9aR6pPuCsUBrVe7491xwUkEbsrUeVGCb8diNAEX/pbs6gAmUUF3iRZ8ceFL7PP
 SpRgqro7mamTVZyaJX9R6E/jMk3DV6ID/lg4gRqg+qCIajfxRazld3GNH5gG2G4EMfFv
 VHKMg9uabDT+ELMnusKxTgOOCvhirglOs298LAgx+lLo0eR8JF4iOiGaO43O9ZuujMNu
 PVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wBMGp8rbDr2WRr2+87AZIST8n8c/hVzyRRCdGHF/SI0=;
 b=Jyq8CJAHG89RCTJ7nydgRSOXR+WQS6CJKtrIYilSGZYwfWQVcl/Xei1IAGR1LvIyE4
 2cFWbn3x8IosThck91AugvfGpoMuCvxZD5d5Hds1UnQy7l8WQTM6fZ9NNurKCTmhfNJi
 Fm+DVjr1w0xcfzaocBQSU9BvfQUWLs1Xwe4NOhioFl1+uTWhZz5p0bX59PnqW9i55YZR
 aPrm1ue4236IvFG/+zcES8HFg/IEUXNW/u9nY3oRoej72mUkWhQ8nEYUi+Pf9AthSLuK
 m6AFwY+RiwAYimGg0qKFNs5Z3EMjr0KBYqZOaAfNp+JCNvmOSvcy7kg0bLwOoD/tcIB+
 EeAw==
X-Gm-Message-State: AOAM531vGncOQQvxxZH0ID9GwCXcYxMrmWSyWeZJTd5hLuhnt57KB+TT
 6X9F2XYFUPF2MgGRAVOhT4ldAqKlTnTmhsd53k8=
X-Google-Smtp-Source: ABdhPJy2blMglUXNosCNV+le9AZVwZA16dv+slPm+ZV3+oZlnU5VxuLkpUDR1dI0MF/YDuaVcDCnYLEzlA9kYYcqLxk=
X-Received: by 2002:a67:ec3:: with SMTP id 186mr8104358vso.163.1598431465177; 
 Wed, 26 Aug 2020 01:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <7210c752-0a1f-3985-91f0-b70facf0293c@gmail.com>
 <30693624-744d-6971-1dc8-8ffe4df6082c@gmail.com>
 <s5h7dtn6tpc.wl-tiwai@suse.de>
 <CACjDtnKEGf_z3_wvP5Y_55UgqdPuNRWtONefBXtg0tq7f=ArxQ@mail.gmail.com>
 <s5hk0xm4vk9.wl-tiwai@suse.de>
In-Reply-To: <s5hk0xm4vk9.wl-tiwai@suse.de>
From: Adrien Crivelli <adrien.crivelli@gmail.com>
Date: Wed, 26 Aug 2020 17:43:58 +0900
Message-ID: <CACjDtnKcU-5a=B2ka-faOeQtXqZE=noS-rszPo4p3twY5NjXyw@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for Samsung Galaxy Book Ion
 15 inches
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Alex Dewar <alex.dewar90@gmail.com>, linux-kernel@vger.kernel.org
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

I just submitted the new patch.

On Wed, 26 Aug 2020 at 00:03, Takashi Iwai <tiwai@suse.de> wrote:

> On Tue, 25 Aug 2020 16:36:13 +0200,
> Adrien Crivelli wrote:
> >
> > [1  <text/plain; UTF-8 (7bit)>]
> >
> > I believe the code is correct (even though the diff is confusing), but I
> can
> > edit the commit message to also mention the model name.
> >
> > Should I submit the patch here as a reply ? or should I create a brand
> new
> > submission in a new thread ?
>
> In a new thread please.
>
>
> thanks,
>
> Takashi
>
> >
> > On Tue, 25 Aug 2020 at 17:00, Takashi Iwai <tiwai@suse.de> wrote:
> >
> >     On Mon, 24 Aug 2020 14:31:17 +0200,
> >     Alex Dewar wrote:
> >     >
> >     > My mistake -- I didn't read your changelog properly. Sorry!
> >
> >     Would you resubmit the corrected fix patch?
> >
> >     Also, better to indicate the device id number in the patch
> >     description.  It's confusing which entry you've corrected
> >     intentionally for what, and documenting it would help understanding
> >     it.
> >
> >     thanks,
> >
> >     Takashi
> >
> >     >
> >     > On 24/08/2020 13:30, Alex Dewar wrote:
> >     > > There's a mistake in this. The ID numbers are the wrong way
> round.
> >     > >
> >     > > Alex
> >     >
> >
> >
>
