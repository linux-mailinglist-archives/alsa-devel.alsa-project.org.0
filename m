Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B970D5393D6
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 17:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63927205E;
	Tue, 31 May 2022 17:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63927205E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654010470;
	bh=Ipj4nPCK8RkCYC5h5PcpoOGCClPevPbvo419ZLheQp4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sqgplrO5YCZcmpPsawBWP6wyEqVuq2/xIjg8BYKBG5X+Z7KgsMNjD98VoKeDDpfMw
	 c/9nOa/vHOrNlHXNJaJK05n4wKquiR9tIyh0fKXFKccBl/OczmwKWBce/MSJKZoLa3
	 HVdk6Bpsp1b1EV/4n5g9Y4pKHan64X49rezuwfHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3D22F8051D;
	Tue, 31 May 2022 17:20:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC23CF8051C; Tue, 31 May 2022 17:20:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7652DF8019B
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 17:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7652DF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="c6Ae5QN8"
Received: by mail-lf1-x130.google.com with SMTP id h23so344698lfe.4
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 08:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zyn6e1US8ccClCxgNYZvrboG0bEidzCIkVGJWCN9jQE=;
 b=c6Ae5QN8eAahsJuLaINslQOerCHTGmQcqQHoXuAo4xsKORzNBOQrZVpNTyL5gRTbD3
 Cs3F3OIDfzmGeoB3lGCddQp64As50NGyNynI/u6StR3PDisyavBrJQTYIboqKiEPnQIV
 8kOsdEAW0lq4j/WdX0sh0K8xEcQG6DUHg9m4kaQ8BJGbRH7O8eAdG+bVR8/XI20cEnLz
 WIT1J49PUMaGDa0nV8xj7eSmgXj1agYIhkGFpAONj+uJy85XxS4SlMn2oLjVeLUBMAog
 vO5kiWvo7T9bKAsNKV9bHeTTNYfxCLnZrIyulPhXVMgNnDWE5Rf9mxKGPuy5UFhVGwKq
 PfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zyn6e1US8ccClCxgNYZvrboG0bEidzCIkVGJWCN9jQE=;
 b=JHDtxN3tihX1kF8T3UBioVCKlaYXLwXrbFSkxRTNr8pMyxOGPS5QktCIVNjZNuE4wH
 KY0ae1RxRvV3qfK7iiQ4n/PwNlL4tuXIqWSlLxGDA37ruhNOo0r349pI55rrO6608YOJ
 8o80zchblfMqJBsdwHScl5y44vp5PMQRhhaggdi3VwV8P1r4lndpT2F8YVsfThZK8YAY
 N6lVbU6mi1YDBeytERpXZEs+SqGeOM45IftHDha8jV11SF/MoacY3DP1pBW7pxOXCx9T
 2lE1fKfFV85S+HSXlg6je/vssnnJxUIpcQMbD/Sbqhp4nImxTp9ye5jHKOh99sq8G79+
 X0RA==
X-Gm-Message-State: AOAM531QVTHC/2aJrciAPICCnVuGaP/MQ1oqHXMt1Q/F0lda+O2YtWLW
 Ow85WyUaiJTd49h9eTYzkwT9qMOo9IckbCekqRc=
X-Google-Smtp-Source: ABdhPJy7sxOjj2MDT6TRhsNs7+BA6oveUqYuOGxM9xqJBGpneEXr5aYjdrdyOmri5+sWCPovNSqUKi9S+nZEjdWOgRo=
X-Received: by 2002:a05:6512:3f0e:b0:478:67ff:9083 with SMTP id
 y14-20020a0565123f0e00b0047867ff9083mr34392517lfa.96.1654010400961; Tue, 31
 May 2022 08:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAHhAz+iuAYpxkpVGWp1g6u_j+wyB+vsFR8FGz1i_8G5TQhOVZw@mail.gmail.com>
 <9a68a02a-d724-8475-e6a0-082b20e93956@linux.intel.com>
In-Reply-To: <9a68a02a-d724-8475-e6a0-082b20e93956@linux.intel.com>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Tue, 31 May 2022 20:49:49 +0530
Message-ID: <CAHhAz+ic-3QzcGqfTTGWeqc2=s_bg=HSZEKrnJYuJgOdbrxg1A@mail.gmail.com>
Subject: Re: soundwire: user space test utilities
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: vkoul@kernel.org, sanyog.r.kale@intel.com,
 alsa-devel <alsa-devel@alsa-project.org>
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

On Tue, May 31, 2022 at 8:44 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
> > I am looking for any existing user space test utilities to test
> > SOUNDWIRE SUBSYSTEM in Linux kernel. Can someone please point me to
> > this.
>
> There are no specific userspace utilities to test the bus itself, you
> can use existing alsa-lib/alsa-utils applications to play/capture audio
> and check for events, i.e. aplay, arecord, speaker-test, amixer,
> alsamixer, evtest
Thanks a lot for the clarification.
>
> The Intel manager driver provides a set of debugfs features to e.g.
> inject a parity error, bad command or test for signal integrity with the
> PRBS data generation, but that's low-level for hardware integration
> purposes.
>


-- 
Thanks,
Sekhar
