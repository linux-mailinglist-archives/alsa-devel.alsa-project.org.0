Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AED76CC3D
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 14:03:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B058A1DD;
	Wed,  2 Aug 2023 14:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B058A1DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690977830;
	bh=LQhPj/XtoSSGI0idFrIBNzSzRlDw30Zj2odg83GN+WI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O9nBBAoX3DHQkbscgWpAFF2dJgpBMtugE9NdUn32pzuFyCdd1WGCLChgh0leB7pan
	 OkH765hWsF6wOIKi+YXme+38Pz9kIqbW6nlkLjsMJ5MshgzNAwVt3E9/whHXOX/yP4
	 V8/PpzdryZeXRZ9gvfoRyJr+22S52L7yorWEzXgc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A2DDF80149; Wed,  2 Aug 2023 14:02:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BD4FF801D5;
	Wed,  2 Aug 2023 14:02:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 900B6F8025A; Wed,  2 Aug 2023 14:02:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEC91F80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 14:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEC91F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=U8PZHqu5
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-686be3cbea0so596160b3a.0
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 05:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690977761; x=1691582561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZ819GwVCo9zR5ZzAiYSpFVr/sz2KTIAVN8PAALo4bo=;
        b=U8PZHqu5zyydy1mgddoFG96L9VW8L25yjDa/lyNEO64ddWZ33KemFAEis0ddxf/nnj
         IzU5ZRpsCImPTyezgGd7zS1yY3i/OnsPjP4evLfghD7NT6SOddqlW88ztwBDlvIHEENC
         pHhiwFrPAayjmeq6e0/mdL0Hr6x3h3ystMpFTt94VESAkM86o0k2zKJAHap0jZBkBhi5
         +jdI0W3//hHvQOspRYgjhvXtgziuuLO/YVbrv7uLzXp4HrWWc2DpHe1XqWbUMgWa7m/U
         +/dyWeT0JVoeKPgsSVi3YQA4Pgw23byHNoJCX9MDb9ozZUwx3ltbr4Sr4V6VUCpBrpbb
         wknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690977761; x=1691582561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZ819GwVCo9zR5ZzAiYSpFVr/sz2KTIAVN8PAALo4bo=;
        b=XaPdxq+qRLuFqw7tvsw6ik3Y4AkplZy0jcjmDiNWJ4j5ZYUEutJt+OLeAORw84UnA/
         pkS3X2mICyt840OglUv6vokii0+72122yY8TQAJN9qpm3vE5Ag/zMeChWvRwn6/JHkrn
         teyX9eVASFKO1ONYgW0ej9CDj3JrFke/QlH6CWr6NXJLAP39laH1lQXsUAmaD7gzC1Rk
         ifChIA3jgmWEqd+G2xyce9CcKFovKg4kdAGamQ1CMVbN232gH9NxcNlhJc+vZBfvy1WC
         JRsHbiL/n4cjrxSop0ryCSluA+qv/cq5Fqrze99h8JMhtsHDFIZny2xulBUNb6ywuCB8
         O/IA==
X-Gm-Message-State: ABy/qLbV8YApFrksLEpx0zBR7qnXmpCVSr277PwDCh4mD9g7q2TKmGyD
	DmkLzqd18UV795OScPw1ZC7vhTfAh6oLDAlfoHw=
X-Google-Smtp-Source: 
 APBJJlHuloA0HTsPSoNz24gU6TOurNeBITpKadl1FpEMN3ek0OYWAF6+FL7hx/VdWb7RYwujlTuWhOvWXMHfDiFVaSw=
X-Received: by 2002:a17:90a:c210:b0:267:f8f4:73ab with SMTP id
 e16-20020a17090ac21000b00267f8f473abmr19375725pjt.16.1690977760816; Wed, 02
 Aug 2023 05:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
 <47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
 <87il9xu1ro.wl-tiwai@suse.de>
In-Reply-To: <87il9xu1ro.wl-tiwai@suse.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 2 Aug 2023 20:02:29 +0800
Message-ID: 
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
To: Takashi Iwai <tiwai@suse.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 sakari.ailus@iki.fi,
	tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: UCHAG6JR47ZU4M5ZRBKM7B3AKYWG7C44
X-Message-ID-Hash: UCHAG6JR47ZU4M5ZRBKM7B3AKYWG7C44
X-MailFrom: shengjiu.wang@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UCHAG6JR47ZU4M5ZRBKM7B3AKYWG7C44/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Aug 2, 2023 at 7:22=E2=80=AFPM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 02 Aug 2023 09:32:37 +0200,
> Hans Verkuil wrote:
> >
> > Hi all,
> >
> > On 25/07/2023 08:12, Shengjiu Wang wrote:
> > > Audio signal processing has the requirement for memory to
> > > memory similar as Video.
> > >
> > > This patch is to add this support in v4l2 framework, defined
> > > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > > for audio case usage.
> > >
> > > The created audio device is named "/dev/audioX".
> > >
> > > And add memory to memory support for two kinds of i.MX ASRC
> > > module
> >
> > Before I spend time on this: are the audio maintainers OK with doing
> > this in V4L2?
> >
> > I do want to have a clear statement on this as it is not something I
> > can decide.
>
> Well, I personally don't mind to have some audio capability in v4l2
> layer.  But, the only uncertain thing for now is whether this is a
> must-have or not.
>

Thanks,  I am also not sure about this.  I am also confused that why
there is no m2m implementation for audio in the kernel.  Audio also
has similar decoder encoder post-processing as video.

>
> IIRC, the implementation in the sound driver side was never done just
> because there was no similar implementation?  If so, and if the
> extension to the v4l2 core layer is needed, shouldn't it be more
> considered for the possible other route?
>

Actually I'd like someone could point me to the other route. I'd like to
try.

The reason why I select to extend v4l2 for such audio usage is that v4l2
looks best for this audio m2m implementation.  v4l2 is designed for m2m
usage.  if we need implement another 'route',  I don't think it can do bett=
er
that v4l2.

I appreciate that someone can share his ideas or doable solutions.
And please don't ignore my request, ignore my patch.

Best regards
Wang shengjiu
