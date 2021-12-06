Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC5746A5DC
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 20:43:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 053D7230A;
	Mon,  6 Dec 2021 20:42:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 053D7230A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638819824;
	bh=2JPLFeHYulo8+mpqPVstJ3uXBzxXXav1SANZAkAkb+c=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oOgl488HdQlqdQh6BLywAR93ef5lpp2OOSecgie5jMQ4gl0bhXCI33nUs8QUffALk
	 c+9RM6MT5cFiVLgatFtpdy9Y7QUSN+z0dvvFr2Xgpg0lVr/XO+8JvCQXaxVz1HRTEn
	 uP1j66nJddUZPKQmIZ/3FwWG/uZU8nPF6mPDqRaU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65A8CF804ED;
	Mon,  6 Dec 2021 20:42:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0CA6F804EC; Mon,  6 Dec 2021 20:42:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05FD8F80118
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 20:42:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05FD8F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="w8sZ41kE"
Received: by mail-wr1-x435.google.com with SMTP id q3so24678699wru.5
 for <alsa-devel@alsa-project.org>; Mon, 06 Dec 2021 11:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=XoyDxWHFfkkShprB5fi0ZtCpkIroCq2M/CcUOnfbOhA=;
 b=w8sZ41kEdX4SRoPkzKCBKIOpzSsDrjyDTmuhgrbbcp5zpmFSvfGY7gNpZK0p0dMxAa
 uWrDVGdLjErc8kI0vHKRLdvR+xas3quAw8WLQmicLbCVcrujBGlSxKW5v4tNRzh5Rsld
 PbPH7ba+Ou0DcR+MLaSif954Gu9KWrAzQrbAJ9dnM20t0XW2ozYroSORAQOs3yEGfsWc
 0b8NifhWMgxwmzcAJ8vTR/83pq61hWtl1y1Me57+Y0zioTVaZzNksWyql3KdwajCCzjI
 pEOgp1cAfmONXrGWtiC6RzGuyMrHDMhZRencZZIde+pIeMZPjzNdS45FL5neth6TXFke
 HUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=XoyDxWHFfkkShprB5fi0ZtCpkIroCq2M/CcUOnfbOhA=;
 b=FrNOZj/+ogbTCXS7M4VGCoZLyEaFjsBEbMeWHv03repnCFsjLoGV9KYyBJ8CT+Z+wE
 b9jbWt6+MUgjiBMfHrbU+78UF+pN2uaqF9UPfcRjO0CNxoCHlNTelkZGdXxb+Lv8xDNZ
 2A/CSKJE25M6YgClQRUtSmvgWIgh6eswsveSdrAl6uMFWYn+jmlZ10iW+ucqvT/JiyUB
 7ur2OoaxfLlpAcBRh5UtM4XyqFJddmYydTIGLuoVaIf2C9ggmzH4wRX7Wcrqs5X0CCFj
 MsJCY61K3up1Kdhf7NUsHm/DxxU2s8bRaL7DH2am8/m6sz4NCUEroUaZtf9fiQAE6gx6
 +INQ==
X-Gm-Message-State: AOAM5316dYLsgtqw7+C9X0UHqmbsEuIc55Et+YU42H1O3eV/oNlQ35Xn
 m9H4TJGJdRpNjP9BaxPwfLthQI5u9+wu9A==
X-Google-Smtp-Source: ABdhPJx8pLA553HMWI1HuMsyxL4boJMISHN0MO4UL5wXFAniqnUsOICkxQ/hPb/2AWWD4Mll3NrfjA==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr44894938wrq.44.1638819726062; 
 Mon, 06 Dec 2021 11:42:06 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id o9sm12332737wrs.4.2021.12.06.11.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 11:42:05 -0800 (PST)
References: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
 <20211205180816.2083864-3-martin.blumenstingl@googlemail.com>
 <1jfsr659v1.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCAceRkO86bXfUYnDwup3At9MaN-PnOiLxa-1fYO5SwOQA@mail.gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v1 2/2] ASoC: meson: aiu: Move AIU_I2S_MISC hold
 setting to aiu-fifo-i2s
Date: Mon, 06 Dec 2021 20:36:45 +0100
In-reply-to: <CAFBinCAceRkO86bXfUYnDwup3At9MaN-PnOiLxa-1fYO5SwOQA@mail.gmail.com>
Message-ID: <1jpmq9ed0z.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, Geraldo Nascimento <geraldogabriel@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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


On Mon 06 Dec 2021 at 18:28, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hi Jerome,
>
> On Mon, Dec 6, 2021 at 11:02 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>>
>> On Sun 05 Dec 2021 at 19:08, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>
>> > The out-of-tree vendor driver uses the following approach to set the
>> > AIU_I2S_MISC register:
>> > 1) write AIU_MEM_I2S_START_PTR and AIU_MEM_I2S_RD_PTR
>> > 2) configure AIU_I2S_MUTE_SWAP[15:0]
>> > 3) write AIU_MEM_I2S_END_PTR
>> > 4) set AIU_I2S_MISC[2] to 1 (documented as: "put I2S interface in hold
>> >    mode")
>> > 5) set AIU_I2S_MISC[4] to 1 (depending on the driver revision it always
>> >    stays at 1 while for older drivers this bit is unset in step 4)
>> > 6) set AIU_I2S_MISC[2] to 0
>> > 7) write AIU_MEM_I2S_MASKS
>> > 8) toggle AIU_MEM_I2S_CONTROL[0]
>> > 9) toggle AIU_MEM_I2S_BUF_CNTL[0]
>> >
>> > Additional testing shows that when AIU_I2S_MISC[2] is set to 1 then no
>> > interrupts are generated anymore. The way this bit is managed by the
>> > vendor driver as well as not getting any interrupts can mean that it's
>> > related to the FIFO and not the encoder.
>>
>> Not necessarily. If the encoder stops pulling data, the FIFO will going
>> over the DDR. Since it generates an IRQ after reading N bytes, IRQ would
>> stop too. AFAIK, if the pipeline is stalled, the IRQ stops anyway
> ah, right. so I think you're right: it can be either way
>
>> ... but this is not really important
> I'll remove that section from the description in v2
>
>> >
>> > Move setting the AIU_I2S_MISC[2] bit to aiu_fifo_i2s_hw_params() so it
>> > closer resembles the flow in the vendor kernel. While here also
>> > configure AIU_I2S_MISC[4] (documented as: "force each audio data to
>> > left or right according to the bit attached with the audio data")
>> > similar to how the vendor driver does this.
>>
>> I understand the part of HOLD, not about FORCE_LR.
>> Is it necessary to fix the problem ? Have you tested without this change
>> ?
> On my Le Potato board (GXL / S905X) FORCE_LR is either enabled by the
> bootloader or being enabled is the default value.
> All versions of the vendor driver are also setting it in some way,

+1
Would you mind adding a comment in the code saying just that - so we
know why it's there ?

> including the latest one that I have access to [0].
> I prefer to keep this explicit write in for two reasons:
> - we're not hit by surprise if some SoC/bootloaders don't set this bit
> by default
> - the code in the mainline does not skip anything that the vendor
> driver does

You can bet I've skipped a fair share of what the vendor driver does, on
purpose.
>
> To specifically answer your question: I have not tried whether this
> bit needs to be set and if unsetting it manually breaks anything.
>
>> > This fixes the infamous and
>> > long-standing "machine gun noise" issue (a buffer underrun issue).
>>
>> Well done ! It took us a while to nail it, Thanks a lot !!
> Thanks - this took a while to figure out but it's great to finally
> have it solved!
>
>
> Best regards,
> Martin
>
>
> [0] https://github.com/khadas/linux/blob/khadas-vims-4.9.y/sound/soc/amlogic/meson/audio_hw.c#L194:L202

With this, feel free to repost without the RFC tag and with my

Acked-by: Jerome Brunet <jbrunet@baylibre.com>
