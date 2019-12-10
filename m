Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B0B117D35
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 02:34:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92A671615;
	Tue, 10 Dec 2019 02:33:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92A671615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575941653;
	bh=bNwUO3UHsD2JLvP84ikF3A6E7gL/t9g+lyOVEN6KAlg=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=heVPwT8nIuDgJHl7SOycjuIN5o9YkZtyzRVwW6Nz+qjNjJVldUAOSlExifjmOdVgf
	 cV3nhiD/MY7RhD/Ow/uMhwAX2q1BFDxNbDhBH8fjAycoQMjMQWYL6t2QSFnrAo26q+
	 oJSgsqg+oPi1yRllpQRteKs28bpwCb8DjnUUPssg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECBD9F8023E;
	Tue, 10 Dec 2019 02:32:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB64EF80234; Tue, 10 Dec 2019 02:32:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96281F800E1
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 02:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96281F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bc1Zhe8i"
Received: by mail-ed1-x544.google.com with SMTP id j17so14514193edp.3
 for <alsa-devel@alsa-project.org>; Mon, 09 Dec 2019 17:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UqpJfCF3D37VJfuOPskNhpW2JeHH9pFB4KOKdtTwdyQ=;
 b=bc1Zhe8iLIdRObEFSjlQQuOohVLEC8vKyYzA1AhMpnkg23ydBYOsTXGqxbFY2BnzZv
 sDJHcRuH1dvhGlYTlPEewsWKTo2ey87r/5x/TgaLjuTIdd98v3lyMyQ90PqM1ccoTEXM
 ez06WR/C+KGLRP5Kkh2nSd12PRi9jGaxnX7Q65kagz5nGUJxFc2j2cf33vOdjVgwCtsE
 SdeC3hWh4UqeV4QiaW7rfTJYI+mlbJ8V/4J7YDVC/EL4JK8XOZISzqQhgtbulLgWi+Ph
 X2sZAh3bFx7U1xwuf4u4XDsMeHYLQ4WXI/dOF2/7VmXvL9NXOo4AS3FMruNACmkup0PA
 LJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UqpJfCF3D37VJfuOPskNhpW2JeHH9pFB4KOKdtTwdyQ=;
 b=iq9pn1Lp+EVbbqjVtgjvWPIGEPetmLGHKsmp/ceIv9wn3kryVjmrVeSVLV0+Sn9ES6
 bv6RtHltr2xBq/rnE3vLVvQ46Z1+t8n3/nhtfJbTT2oi+GNRNk1fc/ATXvuitQ9RPoGd
 6mwW3SSerPmkJiHIRQ927zSt4nUCmNkS4vjvrhwsp+7Em1dPJdxP80WTOfBx/vftmmiB
 TbDK/OGsetO4pMf5zOJkYtQhNiFj9CjkzQEM+mU6+j6EVxdnn5ebfGoPOy5che3b/PtI
 dsNoGAgMVjEXZV3jDX5Dhg4H1irg53BVyCtt6GStHElUpzsONCISI6tRE8D6j84IoPwN
 nK6g==
X-Gm-Message-State: APjAAAUULyAW2OQbcR7YjHufc+1GzlB6BYCM4W7JDO0sG3U68EXSRtx+
 dn40SW/pxXDAWAYrZqKgHMf1KGSXIwqhFHVWA5w=
X-Google-Smtp-Source: APXvYqzoQKcEO+//0TtUd5SF6PyfOZAfzGEaD7PMtndDhtaaPIzXRivESHfO0JOWC2PfFXQDLLBG/Nu+5s9k46RmiOs=
X-Received: by 2002:aa7:d345:: with SMTP id m5mr36626481edr.149.1575941542654; 
 Mon, 09 Dec 2019 17:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20191206075209.18068-1-hslester96@gmail.com>
 <20191209162417.GD5483@sirena.org.uk>
 <CANhBUQ0zwQG-=C12v02cf5kfvJba=5_=0JkZA45DDhxOzTBY6A@mail.gmail.com>
 <20191209170030.GH5483@sirena.org.uk>
In-Reply-To: <20191209170030.GH5483@sirena.org.uk>
From: Chuhong Yuan <hslester96@gmail.com>
Date: Tue, 10 Dec 2019 09:32:12 +0800
Message-ID: <CANhBUQ0-jEG2W=sby1SyPphxK3CSPinFF5zkLq9jsKCZM5hYjw@mail.gmail.com>
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

On Tue, Dec 10, 2019 at 1:00 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Dec 10, 2019 at 12:52:30AM +0800, Chuhong Yuan wrote:
>
> > I have a question that what if CONFIG_PM is not defined?
> > Since I have met runtime PM before in the patch
> > a31eda65ba21 ("net: fec: fix clock count mis-match").
> > I learned there that in some cases CONFIG_PM is not defined so runtime PM
> > cannot take effect.
> > Therefore, undo operations should still exist in remove functions.
>
> There's also the case where runtime PM is there and the device is active
> at suspend - it's not that there isn't a problem, it's that we can't
> unconditionally do a disable because we don't know if there was a
> matching enable.  It'll need to be conditional on the runtime PM state.

How about adding a check like #ifndef CONFIG_PM?
I use this in an old version of the mentioned patch.
However, that is not accepted since it seems not symmetric with enable
in the probe.
But I don't find an explicit runtime PM call in the probe here so the
revision pattern of
("net: fec: fix clock count mis-match") seems not applicable.
So I think adding a check is acceptable here, at least it solves the problem.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
