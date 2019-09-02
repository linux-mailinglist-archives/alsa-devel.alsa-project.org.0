Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9ECA57C3
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 15:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 884E916C3;
	Mon,  2 Sep 2019 15:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 884E916C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567431478;
	bh=L0bxZ4gvytQ/eFnS75x6N6HDdPvQrV4bcQPJ02OytKs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nJ9dURpNQJ6W2lKNcr9DOT1TBbwe9jHp2SPLEThV6KpJxhV6IAe4j/MUym7P+hHev
	 enmXLld5SzsyPXq8/mkE+ONfWT2zxqwxxBmPvXsw+jY91BMHD1fteEGuBL1uWSDkIG
	 p6lvthDVZe9irdjPFh9xACQL5CoYcqs9hik7xnoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECEF5F80392;
	Mon,  2 Sep 2019 15:36:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33E68F803D0; Mon,  2 Sep 2019 15:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF0A3F80392
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 15:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF0A3F80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UlCl3abu"
Received: by mail-wm1-x344.google.com with SMTP id t9so14640430wmi.5
 for <alsa-devel@alsa-project.org>; Mon, 02 Sep 2019 06:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lgluUPyzTE3k7AyBs9nIV6ho5+oXFx0a+s2dE+u1Fk8=;
 b=UlCl3abuuJFpLnHk0GD3eI2rM9n0Azzsrf1m9RwHiYwS5Exwkvc49cN6lZTg4HtDf7
 te3wGTJ/Q7Wy8QRj0FtydbX8PZLAfGrl8vo+++PDn7mkgS4TL0jgQ8+bXY/N6sFSQR3M
 x0K8Ptix0M+imYJ3mhqS5fJkHGT7j2yIVNZAkfhf0gYNF27aoG1kW2R+jzzT9GQG+BTU
 /vd3Ju6jWcKst2NaTlSZuIDgXKK13QwQqMJNF8Isx+KN9LAtfuCbQfAPBoEmmM5r8hsX
 uKBnW3Nmo8MVLpnhW97mSpcRSvhQ1UBMILml1T2Gdw/Kt2s825Bz4yoJXO3Nff6npHJR
 lCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lgluUPyzTE3k7AyBs9nIV6ho5+oXFx0a+s2dE+u1Fk8=;
 b=RWrbh0N7Y5w6FKdayPb3T5eV/DeWENex41yTTk/BeugWh7e8A3Klx55flUTtxjUVIP
 cEv27ZnYyQdQItP5CYaDSEnp17YIBtrhrHSNbeABqaXC64h/gCSl4PpFbP+dqpxkwAI0
 aqNUdUQjb0z5tyE0cUn+a6VvAoXYQ/aTfEsgjK6R/dWEk6yLJTfaoukfLIOAuLA0FFPI
 nxLlfFcbaBKXYp92GvLda8kpIsExmm9kmX+rtthsrrfxCfdq5SKhXC7AIIsFBrltGOJP
 py8ZHfa65y4Kt05cvPI2lZKseSE/GsTo8B0t+C32G+uUhgsCNSZ+AlRpmldGjym/NkVS
 ifkg==
X-Gm-Message-State: APjAAAWcwTYhXn1WBbQcsKhTTb9kMlv37an4rrZm0ovLaBZP/1S6wU9u
 QQfGfXn2k2PxaYjb/pTNJPCOD0IsMbiVcTS+Nq0=
X-Google-Smtp-Source: APXvYqxXTnz3j1+58ZXipucuYWcIzBAoeW6774ATixJZMau34AMCKmrFZUDfhSF4cmAZHiIFE4a5YsMhxy4Bn6/LgVQ=
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr9324398wma.171.1567431367725; 
 Mon, 02 Sep 2019 06:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190830225514.5283-1-daniel.baluta@nxp.com>
 <20190902123944.GB5819@sirena.co.uk>
In-Reply-To: <20190902123944.GB5819@sirena.co.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 2 Sep 2019 16:35:56 +0300
Message-ID: <CAEnQRZDmVoSkpf47mTHeEKodX9_x4Y_9EVrkS=ta4sWU8tD3Zw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Cosmin-Gabriel Samoila <gabrielcsmo@gmail.com>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: Set SAI Channel Mode to
	Output Mode
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

On Mon, Sep 2, 2019 at 3:42 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Sat, Aug 31, 2019 at 01:55:14AM +0300, Daniel Baluta wrote:
>
> > Fix this by setting CHMOD to Output Mode so that pins will output zero
> > when slots are masked or channels are disabled.
>
> This patch seems to do this unconditionally.  This is fine for
> configurations where the SoC is the only thing driving the bus but will
> mean that for TDM configurations where something else also drives some
> of the slots we'll end up with both devices driving simultaneously.  The
> safest thing would be to set this only if TDM isn't configured.

I thought that the SAI IP is the single owner of the audio data lines,
so even in TDM
mode SAI IP (which is inside SoC) is the only one adding data on the bus.

Now, you say that there could be two devices driving some of he masked
slots right?
I'm not sure how to really figure out that SAI is running in TDM mode.

RM says:

When enabled, the SAI continuously transmits and/or receives frames of
data. Each
frame consists of a fixed number of words and each word consists of a
fixed number of
bits. Within each frame, any given word can be masked causing the
receiver to ignore
that word and the transmitter to tri-state for the duration of that word.

Will try to ask IP designer about this, thanks a lot for your comment!

Daniel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
