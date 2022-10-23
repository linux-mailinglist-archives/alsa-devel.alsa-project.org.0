Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5016093B2
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Oct 2022 15:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4EB8ABAB;
	Sun, 23 Oct 2022 15:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4EB8ABAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666532228;
	bh=dWHUxbwkKtIXDbPXQwH6MR6kb4B3mXRbfHRakWny3T4=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GFEz5+v6R3PiIv9JmsNEn2eIWSC6BVKb3D3M8eNTqhubSy4LJFKamwfJsqrOqAjdG
	 HRqx1yt12HB0zElQ+Bb9Nf4fbhjqA/Q/cuvsaZRk7OTEIJV7ImN0VI2JT3R8TCPOtT
	 Rp166gobs2bNsKNsn24iQTDYN5iNaUMV9rT7+c4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34D99F803DB;
	Sun, 23 Oct 2022 15:36:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97BCDF80254; Sun, 23 Oct 2022 15:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55A81F8011C
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 15:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55A81F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NEg55mCB"
Received: by mail-wr1-x42a.google.com with SMTP id bv10so11782187wrb.4
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 06:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:references:from:to:cc:subject:date:message-id
 :reply-to; bh=MoVvCB1hQ8h8zDnqjfbOWIK1oHoE24MiFfun5t1upMI=;
 b=NEg55mCBKWVDjo1kRCfYA7EY4H2EQEKh4Gl4eI1jB7DDDdO7CXlXwFZUyrFc9kU9hj
 A8vziP1KkGF1mzhP/xlCKLHMuXX49jwpb6tftQqHjZPyIR4qOB/ng/5D/KXe5GbAeKvv
 OL5sYbR8wrUB0oKBeWCrnKhffMc8bdpIBsJXdROnNLU+7idU/jhWuPV3R7kzRRtvx4G1
 38qw2uWSn94M7qCT90MCAYEHjhpr9zdfWhU2D5KbyVRQBbmu4AW2XfvbaKvuYWdxq4Gh
 GCURUtzHBBi8IFjVrF0cTlJTvCSSx2UFqthe8+fSjRIizIhCNol4pN4RQc/FrP9uLoHw
 UfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:references:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MoVvCB1hQ8h8zDnqjfbOWIK1oHoE24MiFfun5t1upMI=;
 b=mVI7f1YcZgcibjq5Xhun4Ol31+9VtGcr8BpQcrrsIo9TF0VJXEKFgFAvV+QkTaTMOU
 VhP6OcmcDbdDjaywA8jBfOXFLNN9PJ9ANui73SpFLTI8zv7aNTC9WdTiTr/sZCFEQOAo
 kJ7WbrCJ2VmotK5u31VJkY/UBKzL0PQtGviDWRSkyQnyGelix90ngEsktjaHC6sOlMQJ
 H8yLu35fFtb4Zd5Fir3jt3QXY6cIOoW+Ww1hsHOQuRdg7LS1g4XXy/Iqipz+3ciWDN5S
 DCqZlM6/LYKF3KUq6TY5c4zrsPS0YAeTjyR/AZqMv6Qmy6K31s9OG2SOaLajfOiNsds3
 jpdw==
X-Gm-Message-State: ACrzQf1TOE1sFm0PwjFbOynF/np20cBUyBq8tbJ5B3nykOSKTc/gS19a
 4Rgy1C+7SYiaKsHZSYQeVJ8=
X-Google-Smtp-Source: AMsMyM4mIr8LjXfQVnRa7MLd87e5HsCXWHz50muclsSe9aXcKOfO16SurXYwJroewlShnZ3tBmFUWA==
X-Received: by 2002:a5d:47c2:0:b0:22e:4911:6925 with SMTP id
 o2-20020a5d47c2000000b0022e49116925mr18217396wrc.403.1666532163122; 
 Sun, 23 Oct 2022 06:36:03 -0700 (PDT)
Received: from localhost (94.197.10.75.threembb.co.uk. [94.197.10.75])
 by smtp.gmail.com with ESMTPSA id
 j18-20020adff012000000b00228fa832b7asm23675246wro.52.2022.10.23.06.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 06:36:02 -0700 (PDT)
References: <20221022191308.82348-1-aidanmacdonald.0x0@gmail.com>
 <GU66KR.0W1UC5ES8HSL1@crapouillou.net>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 0/9] ASoC: cleanups and improvements for jz4740-i2s
Date: Sun, 23 Oct 2022 14:29:34 +0100
In-reply-to: <GU66KR.0W1UC5ES8HSL1@crapouillou.net>
Message-ID: <Nzxf3qjE8JgcBzxULU2xE5br4OnbgBVC@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, zhouyu@wanyeetech.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org
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


Paul Cercueil <paul@crapouillou.net> writes:

> Hi Aidan,
>
> Le sam. 22 oct. 2022 =C3=A0 20:12:59 +0100, Aidan MacDonald
> <aidanmacdonald.0x0@gmail.com> a =C3=A9crit :
>> This series is a preparatory cleanup of the jz4740-i2s driver before
>> adding support for a new SoC. The two improvements are lifting
>> unnecessary restrictions on sample rates and formats -- the existing
>> ones appear to be derived from the limitations of the JZ4740's internal
>> codec and don't reflect the actual capabilities of the I2S controller.
>> I'm unable to test the series on any JZ47xx SoCs, but I have tested
>> on an X1000 (which is the SoC I'll be adding in a followup series).
>> Changes in v5:
>> * Drop 'mem' resource removal patch already upstream.
>> * Update FIFO flush bits fix to address Paul's review comments.
>> * Drop PLL clock name patch, that needs a different approach.
>> Link for v4: URLHERE
>
> Forgot something? ;)
>
> -Paul
>

Ah, sorry, that's why you shouldn't eat dinner between format-patch
and send-patch... :)

Link to v4: https://lore.kernel.org/alsa-devel/20220708160244.21933-1-aidan=
macdonald.0x0@gmail.com/

>> Aidan MacDonald (9):
>>   ASoC: jz4740-i2s: Handle independent FIFO flush bits
>>   ASoC: jz4740-i2s: Convert to regmap API
>>   ASoC: jz4740-i2s: Simplify using regmap fields
>>   ASoC: jz4740-i2s: Use FIELD_PREP() macros in hw_params callback
>>   ASoC: jz4740-i2s: Align macro values and sort includes
>>   ASoC: jz4740-i2s: Support S20_LE and S24_LE sample formats
>>   ASoC: jz4740-i2s: Support continuous sample rate
>>   ASoC: jz4740-i2s: Move component functions near the component driver
>>   ASoC: jz4740-i2s: Refactor DAI probe/remove ops as component ops
>>  sound/soc/jz4740/Kconfig      |   1 +
>>  sound/soc/jz4740/jz4740-i2s.c | 455 ++++++++++++++++++----------------
>>  2 files changed, 243 insertions(+), 213 deletions(-)
>> --
>> 2.38.1
>>
