Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1905F27A694
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 06:39:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C44F1AF2;
	Mon, 28 Sep 2020 06:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C44F1AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601267984;
	bh=PmQd7B2UV3XNWq1r+fcYwXvafyTylCt2+L6Qyv0W31k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ejIZmrGbkAG/2379WiJ60vVuRD92oNO5EtoxKYWySYt6f265Y2qswMRcypKHzxqQ7
	 CTftyWHrVmCkzcB5h0XWOOW+y7V1i5eJbwmC9TDWW3+QXqLomrgXniW5VMCUJ+8Ojr
	 nzuqqYG5cMHN60BysPm9JrusxDSV3heQQTadV2Gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F63FF80228;
	Mon, 28 Sep 2020 06:38:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E224F801F9; Mon, 28 Sep 2020 06:37:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02019F800FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 06:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02019F800FD
Received: by mail-lj1-f196.google.com with SMTP id a22so7138601ljp.13
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PmQd7B2UV3XNWq1r+fcYwXvafyTylCt2+L6Qyv0W31k=;
 b=BMXuZaNbLLpDmu/gqeeJ26bIXX72JL4EFdZ7MWS1MpTZHbERTTzx+lkSe8HJ52OnA1
 cFd7q7DTitbtZGJJfECQHzPKVqmmvUAHhdffw7QSBKdTwzMW/HIy5f+4PqftU+2U/Jmu
 F7yIGGDaIT/HcQmzYxD9kHkoj6MKFtFFMbQ4aAqfhR1DPyKvtQdF7hQqWIkG7ijvwH7E
 Y7s2isoQdeqtreVoaOvicVdfo0qF489rS1pf6IVN1c47WzclV6/ftCT/5eSon4a8mcqH
 ssq01Im9yCohRYK+LKGxFMXTaEjObOJeGuhTcCvOg7MIjfhATEcMfgRzraoLazFzP5F8
 RJBw==
X-Gm-Message-State: AOAM532AjIxgjZiM7ZL5V6tbSdUJ87ZACjP6oqsWXKotV9x/7SAdsJNM
 cv+YMHsRCOtqr8n0V3GTd81zm/VQTH2S6w==
X-Google-Smtp-Source: ABdhPJwK1XIF0eMN8R6z4lXxiSWsenq9XQXXNnfs3YjOY9eiGpRxQrwL6fphvIB2mlFTlrc9fgHM0A==
X-Received: by 2002:a2e:898a:: with SMTP id c10mr3987986lji.4.1601267867110;
 Sun, 27 Sep 2020 21:37:47 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com.
 [209.85.167.43])
 by smtp.gmail.com with ESMTPSA id s8sm5745835ljo.11.2020.09.27.21.37.46
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2020 21:37:46 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id d15so9486533lfq.11
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:37:46 -0700 (PDT)
X-Received: by 2002:a19:c6c8:: with SMTP id w191mr2875289lff.348.1601267866731; 
 Sun, 27 Sep 2020 21:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-4-peron.clem@gmail.com>
In-Reply-To: <20200927192912.46323-4-peron.clem@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Sep 2020 12:37:35 +0800
X-Gmail-Original-Message-ID: <CAGb2v67gFTrGVs3pw5ospdSoogaA15cbuWjPQK=-Z2f4nMd9Rw@mail.gmail.com>
Message-ID: <CAGb2v67gFTrGVs3pw5ospdSoogaA15cbuWjPQK=-Z2f4nMd9Rw@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 03/20] ASoC: sun4i-i2s: Change get_sr()
 and get_wss() to be more explicit
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
> We are actually using a complex formula to just return a bunch of
> simple values. Also this formula is wrong for sun4i when calling
> get_wss() the function return 4 instead of 3.
>
> Replace this with a simpler switch case.
>
> Also drop the i2s params which is unused and return a simple int as
> returning an error code could be out of range for an s8 and there is
> no optim to return a s8 here.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>

Fixes: 619c15f7fac9 ("ASoC: sun4i-i2s: Change SR and WSS computation")

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
