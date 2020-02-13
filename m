Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D357715BFA5
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 14:45:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 647A316A9;
	Thu, 13 Feb 2020 14:44:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 647A316A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581601509;
	bh=cdBM37qBgry5uKmAw4Ar7iDdiSx2PAuzN4801SWZpQ8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U2R+D/Zi1aF336T73F7zoVj2IGAifomm+w9/jTMJV5zXqKWZw/BumQGKFQ+zgwvIb
	 UMNY6AsjrlLD7aI82lXXXMNhxcwwa1u+sL9tTffj3NqIK6svXZcDjHc5UtN8xw2sNh
	 pSnWpE4h7/A3Fsgn5yewmE50DWPV906Qnx/tuf/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90F62F80218;
	Thu, 13 Feb 2020 14:43:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD378F801DA; Thu, 13 Feb 2020 14:43:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B911F80146
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 14:42:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B911F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="BWvRESFW"
Received: by mail-io1-xd42.google.com with SMTP id z8so6522432ioh.0
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 05:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JixNVZPfaxw28v2GWTDVEkWm5e7Z+yfB9QhN7sWRc14=;
 b=BWvRESFWNuwpu+LiV4vfYqyS6/iy8+fypXiO3hqT32XzRbTU0qZP/lMjGujKcIleol
 wvhUCWsaZcwTdxa2K6/dmWxjdKvqIpZd8wyRCRdyV3VadmBZDM6NuZ3/d6KjkJmRWGJb
 TVcfrWQ78gvVR+PS7CEg+DDkd6dcWWvFmAAU5EZrozUjAW5kjdOoX1FY8DtvqxqvOor8
 w92J1nbcPVmNT3j4AG19geWDWkftzfZsvLLoWy6jHTQx88rAsDhOSRaG87nnl1dqrZ+S
 dfQmc6qKKXKn6JMuzZAt8Ka0HkxXagP82bhpBywAn9YyWk8yTQw45+7eejwq5jYpHOUg
 R0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JixNVZPfaxw28v2GWTDVEkWm5e7Z+yfB9QhN7sWRc14=;
 b=Ew6NVFtGmXIbN3Zz0Xx3jQoBRjliQx8gXwcEv8vGTwZcX2axL/yLykbo1z/SEakQRA
 nt5sE30FgH2u6glQc08PoRBJ/+wJiTs5Et08c7nhvcJvy0Pgy9MCv3L1L74LjbaWzRpW
 KtGS+k4pyL8H/81mzLJFrwtMqF4Nrea60GSP5L07y4QJGobvHc9/On7eSUtqOjQ4lKZF
 uvLazxB9VhOHRzsK1L0NSaEhKkQM/FBIZZT2mCjNwBtEBjIbYVijrtET5ufQXvweHT5x
 GuNk4/pGA+PvTDJaI7GTylOy0RSmYPmjTaR9i0Y/1QXALfyvfDLdiCdjOZUPstwl2MdQ
 Tj0w==
X-Gm-Message-State: APjAAAUbd87GI010xZp8ybkhOU8rWq+BCVUENGHZVYO1x6jDdRsXu+2g
 mTPLLwPjfrdkijBJYX6Vtk/1huzKdWyrxh5I60IbEA==
X-Google-Smtp-Source: APXvYqy5xoGvURXQ5mKlvI1PTr50d2rw0jQcWB4kD3QNbeLAFbEdhWTc8hfz64qHPp7ao8YaiTAAKZhJWrLoApChauI=
X-Received: by 2002:a02:2101:: with SMTP id e1mr22999258jaa.29.1581601377939; 
 Thu, 13 Feb 2020 05:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20200213032728.199462-1-tzungbi@google.com>
 <20200213112003.4.Ia542007f51d3de753a9e0a83135ee074581dbf71@changeid>
 <20200213122708.GE4333@sirena.org.uk>
In-Reply-To: <20200213122708.GE4333@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 13 Feb 2020 21:42:47 +0800
Message-ID: <CA+Px+wUkmUZ=boWtXoNQfe+7ieGdwXCvsfL=tXHQTQ=otO6h=Q@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Dylan Reid <dgreid@google.com>, Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [RESEND PATCH 4/4] ASoC: mediatek: mt8183-da7219:
	apply some refactors
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Feb 13, 2020 at 8:27 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Feb 13, 2020 at 11:27:28AM +0800, Tzung-Bi Shih wrote:
> > 1. Moves headset jack to card-specific storage.
> > 2. Removes trailing blank line.
> > 3. Moves card registration to the end of probe.
>
> I'll apply this but it feels like it should be at least two patches - if
> you're writing a changelog with numbered changes like this it's a big
> warning sign.

I see.  Will pay more attention and won't squash small changes next time.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
