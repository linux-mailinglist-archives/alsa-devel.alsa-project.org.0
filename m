Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E710117236
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 17:54:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA4C015E0;
	Mon,  9 Dec 2019 17:53:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA4C015E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575910470;
	bh=D/Qw7mXe5adUUPTepNQ5vz6T7L8paq/HOhorp59hmpg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eG1F/jKndlhz2gISYDmEAsy86AG3aFxPhhRTLgCqh7T8JIh7IBGzXNtGZQ64dPwsC
	 x/pGRdxmcAADzIip6Zfy7VJvxVeSxkD/HD+S+K6RxEIw1TnKR+5LIfA6g/ZtYtGaFf
	 loJwsBJOIIYHq6YNpKiis1T4MfBOhMau71J0+1fw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58847F8023F;
	Mon,  9 Dec 2019 17:52:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 373EDF80234; Mon,  9 Dec 2019 17:52:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 556E3F800C4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 17:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 556E3F800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R8DyC4SJ"
Received: by mail-ed1-x542.google.com with SMTP id v28so13231371edw.12
 for <alsa-devel@alsa-project.org>; Mon, 09 Dec 2019 08:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Zb0O7/LwKYH143X+6l5E3Fj6uEuU7EkNQVWfYFUfj4=;
 b=R8DyC4SJif5fVWBO524oVJpk1bTByjLg6rffPOe2CObHTVQVLs8DMD98fhCfTkxXrm
 BiRW/sMbj/zdF620Xt+OkKmi1VBpO6s+xM1T4sw4dAYBk9+7JEIv/XENB5TOfxqnVPTE
 QaiZFvFZu6tlZF+g3knX9LOGpEz+pNCD2OWFY15bNrsWCWWvRbWu4iuxBPMKshjCBjel
 1Dld7PWw/Bmr8tCJmX4Tdzx/cyD3ZzYrCvJKQKSdi3onCGroZNXxZLwUELqRS5CoSHVN
 2WV6O4JuMZc8f5S3saRx3gg/10fDV778lTPEEF7XWuHR7ROba6NcuHwrlSBDehdb3nAB
 L1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Zb0O7/LwKYH143X+6l5E3Fj6uEuU7EkNQVWfYFUfj4=;
 b=WcwX5uB+fi5JXHiyj9MqpZZc37WMt6oWH2LKvpRjvdHJl+opTN2xn5zZmXRaLH0xtZ
 4973xIsblns4oTXVl3UqENeOI/l8T7t8BOJp7A1w7Lg8jkgFMhEUxOdaQtnPeZ4nHn0x
 ILOD+sfdHPLqKNrSaRxIw77j4GgqeApftNaTavWWz+V+lqfe2rzp1x/O9fdJzPnI3ZyG
 IwjyqF47zlCHT9DZ030E4HwrEard+r9zU1XHvBjmrItXaPeWScdVXRZqPbdfeV2hc85F
 fEeM2XIf4vXIQp3r2OZXwJYevqyXOQdMCVkNGlqabc5nKBEFc5Z4Ogevdyd10MSBXdv1
 LW4g==
X-Gm-Message-State: APjAAAWyK64O8iPHbCn+NHTti1qUXcUzYnu+bEA24t7uYxmvFaBajJJw
 lptL9W7jmS3SCSYuyhB+YU0ZMyiveqexkPYHnEA=
X-Google-Smtp-Source: APXvYqyNsx38P1d/a+3EYY+Ki8O7R5tdU+IpHxRUnoVyPmu4I5pFVmX+12pzttLM5wSIGAzNEVL5CINVLP+IlewF0wI=
X-Received: by 2002:a05:6402:1a36:: with SMTP id
 be22mr33403291edb.202.1575910360149; 
 Mon, 09 Dec 2019 08:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20191206075209.18068-1-hslester96@gmail.com>
 <20191209162417.GD5483@sirena.org.uk>
In-Reply-To: <20191209162417.GD5483@sirena.org.uk>
From: Chuhong Yuan <hslester96@gmail.com>
Date: Tue, 10 Dec 2019 00:52:30 +0800
Message-ID: <CANhBUQ0zwQG-=C12v02cf5kfvJba=5_=0JkZA45DDhxOzTBY6A@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Brian Austin <brian.austin@cirrus.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: cs42l42: add missed
 regulator_bulk_disable in remove and fix probe failure
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

On Tue, Dec 10, 2019 at 12:24 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Dec 06, 2019 at 03:52:09PM +0800, Chuhong Yuan wrote:
> > The driver forgets to call regulator_bulk_disable() in remove like that
> > in probe failure.
> > Besides, some failed branches in probe do not handle failure correctly.
> > Add the missed call and revise wrong direct returns to fix it.
>
> Same issue with runtime PM here.
>
> Also please submit one patch per change, each with a clear changelog, as
> covered in SubmittingPatches.  This makes it much easier to review
> things since it's easier to tell if the patch does what it was intended
> to do.  When splitting patches up git gui can be helpful, you can stage
> and unstage individual lines by right clicking on them.

I'm sorry that I didn't notice this problem and these patches should be merged
into a series.

I have a question that what if CONFIG_PM is not defined?
Since I have met runtime PM before in the patch
a31eda65ba21 ("net: fec: fix clock count mis-match").
I learned there that in some cases CONFIG_PM is not defined so runtime PM
cannot take effect.
Therefore, undo operations should still exist in remove functions.

Regards,
Chuhong
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
