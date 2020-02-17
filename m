Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B60AD160C10
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 09:01:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D5D8167D;
	Mon, 17 Feb 2020 09:00:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D5D8167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581926496;
	bh=pJwqAWbOBA3E4CXw8zIu5UkFe3Y6jSpW1BJO3Z+1gaI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mMHetvEogoUuHpLaneuXjySUbQ3QevdCR1jdwapFIEpzMLy/adqVyilqyWGDQEy5o
	 ywRwP28wFFrZThCPyZs3q/5+Lj4yI50FCsLluIawX9cyLyGitp9y81YfKDg88YQnMe
	 G7HQyMOiTJKnuFVqEEQfWCprbicSLv4ssUcUfYb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A10D0F801F4;
	Mon, 17 Feb 2020 08:59:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42E2BF80172; Mon, 17 Feb 2020 08:59:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1803CF80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 08:59:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1803CF80096
Received: by mail-ed1-f67.google.com with SMTP id f8so19612318edv.2
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:59:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Diza8Cc5Cpy+OVsRi4P0IsWcjJ4gPjcUytSTU6gocRQ=;
 b=ZxzmMqjZvxIk8Gy4L8UElzpbnd0nV+mdi4UirHw7Jh5yakpinZzRlIxxtge9K5hxN7
 cmPK2CEs44wjs8KA2/jbgHOfRMqgoC3LnXA3MtL6x+bOyz0KaqEBZbeiFRjxTWHWuCKS
 K4jcgSniblFZUZmcSvmw1yGZQfTU9PJL2Pm+Ptcx9UY5zfwFaIAj52PUjdJTVtMecPtl
 UuLHIJTqe86FNSOFOw1BSVRkcn8HfuRG0s0THntP+8lY9ck9ROulGOWZJcfRUXPzw0KS
 hdqMpMCP7KN1wjoDHP9hSDDBPD5TD8WCeHxVQ+/z6QsjSMxZ3e0oO/WZ2duMhX7O0UtY
 nzbg==
X-Gm-Message-State: APjAAAVxIAAhzEB6JGBkFvLjx+XPbpqfg5wGqmwbGAn1J3bFPOrHYR1x
 VqUPVFV+7fLYh+g1SetyfEkRJzH+718=
X-Google-Smtp-Source: APXvYqylFi8DjI1HqKZ7r2d+5TyfwjWM4MQtkvuxrdyfTNBzEucUnX5etH9I6cVJDznwUmcAHqVITA==
X-Received: by 2002:aa7:d811:: with SMTP id v17mr12625347edq.277.1581926388383; 
 Sun, 16 Feb 2020 23:59:48 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42])
 by smtp.gmail.com with ESMTPSA id u13sm819305ejz.69.2020.02.16.23.59.47
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Feb 2020 23:59:48 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id k11so18389903wrd.9
 for <alsa-devel@alsa-project.org>; Sun, 16 Feb 2020 23:59:47 -0800 (PST)
X-Received: by 2002:a5d:484f:: with SMTP id n15mr20431084wrs.365.1581926387451; 
 Sun, 16 Feb 2020 23:59:47 -0800 (PST)
MIME-Version: 1.0
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-18-samuel@sholland.org>
In-Reply-To: <20200217064250.15516-18-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 15:59:37 +0800
X-Gmail-Original-Message-ID: <CAGb2v65jWNCss88961zXT5is4LQQFh=Hcxx9ydn_bGqR7Sig8A@mail.gmail.com>
Message-ID: <CAGb2v65jWNCss88961zXT5is4LQQFh=Hcxx9ydn_bGqR7Sig8A@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [RFC PATCH 17/34] ASoC: sun8i-codec: Sort masks in
	a consistent order
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

On Mon, Feb 17, 2020 at 2:43 PM Samuel Holland <samuel@sholland.org> wrote:
>
> All other definitions are sorted from largest to smallest bit number.
> This makes the AIF1CLK_CTRL mask constants consistent with them.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
