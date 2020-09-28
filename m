Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E12927A7F4
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 08:53:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DA0A1ED9;
	Mon, 28 Sep 2020 08:53:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DA0A1ED9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601276030;
	bh=XphzwiB62aADzo7H5xKbNzFDZU+uUK4UzX7X79ljoMQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ceTd6N2yYKkMhKxurK6kJGiRp+igEpk814fgqJ2fBdwP3ioWp2wdXV1E+yrBuIGAf
	 f9t20ZtvkNeaS+JX6CSueekK3Vtxumu0ZRobpvx5T3ksxGK2YsQgUxrUatXrcVn36j
	 3It9Kv7lul2oBKUAo/BV7fy82m+AhRdb9n9NXM3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D26F9F80115;
	Mon, 28 Sep 2020 08:52:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83DC1F8029A; Mon, 28 Sep 2020 08:52:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CED4EF80115
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 08:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CED4EF80115
Received: by mail-lf1-f65.google.com with SMTP id 77so9830033lfj.0
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 23:52:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XphzwiB62aADzo7H5xKbNzFDZU+uUK4UzX7X79ljoMQ=;
 b=aTQcZ6JmAsE+kaBxGAU3s8QYFSw0hzglADWa2VtwrDhdxCVCsUWtIFEJJl95YzlkcJ
 YP6WS91eBStWp3HX6bFSYxXRW5EBRyH0ayR9t1f5cPqn3AM2XKAUWFsEmhTzigjLbZKM
 as698hjCR/B/1rCZ8nSuJH4yWG2xyfMREzsj5QmNFhsZd0HsZnD6Q7TJYsXC6vNYQGWs
 acuPDmUY86TZNWpoNdZu8IvvXCQFDuF6jG5XhKeiBnh7MfC7IZ4G+68aikr/EKZL6MC1
 fgfkWmcJsrVaDWCC9z0ZWK4Yj9zHggFGgjpNcYcxKj3u7rgyXUaz254yVPRs8C6jhhd+
 KB4Q==
X-Gm-Message-State: AOAM530pLEESTov0vkjUGZdfNFdRJp1zPKNQIQ/dP6XaPzk3Wq2fAJvj
 8Dm4D5CpEgCj50fhubAbX6GN4rHM+u7y/g==
X-Google-Smtp-Source: ABdhPJyaRY5gv7DJvvmE16GoyqjSZMC5EZdLTNllgsZxnKHHKLmLkL+lbhgfMgpGkZRhM9uzQLhwPA==
X-Received: by 2002:a19:589:: with SMTP id 131mr3511315lff.229.1601275938110; 
 Sun, 27 Sep 2020 23:52:18 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id i11sm7886ljn.119.2020.09.27.23.52.17
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2020 23:52:17 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id u21so108143ljl.6
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 23:52:17 -0700 (PDT)
X-Received: by 2002:a2e:760e:: with SMTP id r14mr4132627ljc.331.1601275937498; 
 Sun, 27 Sep 2020 23:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-6-peron.clem@gmail.com>
In-Reply-To: <20200927192912.46323-6-peron.clem@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Sep 2020 14:52:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v66vJpCUc3xAHt7sHXKguc7ma+0kSjX=5Wp5VTdHeYQa5Q@mail.gmail.com>
Message-ID: <CAGb2v66vJpCUc3xAHt7sHXKguc7ma+0kSjX=5Wp5VTdHeYQa5Q@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 05/20] ASoC: sun4i-i2s: Set sign extend
 sample
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Mon, Sep 28, 2020 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
>
> From: Marcus Cooper <codekipper@gmail.com>
>
> On the newer SoCs such as the H3 and A64 this is set by default
> to transfer a 0 after each sample in each slot. However the A10
> and A20 SoCs that this driver was developed on had a default
> setting where it padded the audio gain with zeros.
>
> This isn't a problem while we have only support for 16bit audio
> but with larger sample resolution rates in the pipeline then SEXT
> bits should be cleared so that they also pad at the LSB. Without
> this the audio gets distorted.
>
> Set sign extend sample for all the sunxi generations even if they
> are not affected. This will keep consistency and avoid relying on
> default.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
