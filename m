Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FB811E34D
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 13:07:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ACC01784;
	Fri, 13 Dec 2019 13:06:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ACC01784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576238868;
	bh=lbMcEKdgZ6ae6A2ZnTqTrCxVNrL2l8wAxkNGbd8wXAI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sKSFhvQjGATBClYiLxHrhU///4Wi/WfTalWE/AAVk4jBZKW5Tzqltsjmn8wGUkzol
	 3q8/oE+gwF4EMcQrsUTTYDdof7wK+xP2mHmYZvkWS51RPT7Lv85OiI6lJpruLY75jO
	 LYqAQW0FuArRds1pQyFJGEsNoBt7No7GrxmiWCcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE7BAF801F4;
	Fri, 13 Dec 2019 13:06:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C1EBF801F4; Fri, 13 Dec 2019 13:06:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF51FF80139
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 13:06:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF51FF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MUFdr87b"
Received: by mail-lj1-x242.google.com with SMTP id h23so2356317ljc.8
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 04:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8vy2WG4RuHa5f2z6LjbeaeW56JXxALVqQpIH2hCQzJo=;
 b=MUFdr87bdfxATCI3TuO5k2GqC/HU8Dsml0uQw9V53Jd/55Qbe3TvFTuiiwhLJvYgw5
 zfDgBf6GFZ4jSjt5tZVAQnxttYhw1lPR5WOrhifw5AkqsmSyFoHL++kCK4j/FeeRJ3do
 4g2t1TYCAu0OCa6zVUR67UF+ejkN1IJ+hDkrM2SJbHadqHPABW5tDrg6QrhGpFz7Rr8L
 F8Nf1nMaB4Ufr0urTRFjUd+WPj740mF3iCcP2SUsZIToizfiuaRXfW+oOjeyYYdcINk8
 eMPSdHWD6uWpfVbvr/3r0xpjNZqG1QHnDfpxc0eFB3Noq77MyEHZUOgyuDflLkOk8Ri3
 B5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8vy2WG4RuHa5f2z6LjbeaeW56JXxALVqQpIH2hCQzJo=;
 b=dSGtAYE+5pGyDGhYEIZhbENmL4bdDyO0psjJRBEViejQCnvlqH0mSMWFko+7o2X7gc
 ePBYO8jcy8K/nBZioeEuJPteiaRa0JB67CEolFLZksPURIXiOrK9jJq5TRjYSs5xfrsX
 3sk53muge/sY+CiIRqdJwvb1JF92ecHClRjYsMu+mJ8/YXzWwGOOX/uLtf/jOkGibsvp
 b7v8Sk3/j5hAocgpR5WjHhX6dRZ8aOzFzZzm3aHKLxC27Y+tJr4OtXEgVTz2Qmssf60a
 sQfTnpd35fXD9eZZKP+OwC6fNcaeTs1tCImn4Ell84MjEhpUburuRj98hWvBYBnb9vFb
 WYlg==
X-Gm-Message-State: APjAAAUbr6VAU11eLkDqdQM3tcatSsZd2K4g8Hjcy0vEBd8ySstqJh9p
 0qPliNcJYVxRH6Eif3yGlxYOwZ+txFgtyMD/Wpk=
X-Google-Smtp-Source: APXvYqwBfVKH9QpfEnk02Am4ccGlNAh6cevgsF9QJIkcB8wjW9gjMc2o7+gzwuf/6YRf3nWwcpblq5xp3R3uXjjTd9I=
X-Received: by 2002:a2e:b4b5:: with SMTP id q21mr9269515ljm.17.1576238759501; 
 Fri, 13 Dec 2019 04:05:59 -0800 (PST)
MIME-Version: 1.0
References: <1576065442-19763-1-git-send-email-shengjiu.wang@nxp.com>
 <20191212164835.GD10451@ediswmail.ad.cirrus.com>
 <20191212165311.GK4310@sirena.org.uk>
 <CAA+D8AP4XNNmQ72xG6gNevtu8i8TJ7AaQMMgXJMCPmv2VO0_HA@mail.gmail.com>
In-Reply-To: <CAA+D8AP4XNNmQ72xG6gNevtu8i8TJ7AaQMMgXJMCPmv2VO0_HA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 13 Dec 2019 09:05:49 -0300
Message-ID: <CAOMZO5AHRWbgn0U=FsF7a1Ux1vu2_zhga5j6Z5p=6K86PSm1Xw@mail.gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 guennadi.liakhovetski@linux.intel.com,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 patches@opensource.cirrus.com, Thomas Gleixner <tglx@linutronix.de>,
 allison@lohutok.net
Subject: Re: [alsa-devel] [PATCH] ASoC: wm8962: fix lambda value
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

Hi Shengjiu,

On Fri, Dec 13, 2019 at 12:10 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:

> We encounter an issue that when Integer mode, the lambda=theta=0,
> the output sound is slower than expected. After change lambda=1
> the issue is gone.

This is important information and it would be nice to have it included
in the commit log.

Thanks
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
