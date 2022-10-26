Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A384860E900
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 21:28:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4289738A0;
	Wed, 26 Oct 2022 21:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4289738A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666812491;
	bh=GGmY+Tp0PCWgfcXh6CFFXtUnB9FaG+fCvf/13WVSk0w=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VOVt+Wczp+exrWyEMNmExx6q0MYQ423g6YAew5K0pNvI+oRtZZkTQs7d/tr+WwD/m
	 1Bzb3gk/DEUAZa180J8Djh00Nq2zyaNNTxVcq2o5yD/eIDVT1anlW6TQtnKm+3QwYS
	 t/962wMC8QPsPoCnaNPe/GGg40J+u8gx4H0pbHso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B05C2F800BB;
	Wed, 26 Oct 2022 21:27:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38C23F80240; Wed, 26 Oct 2022 21:27:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20627F800BB
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 21:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20627F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WF0x0DYf"
Received: by mail-wr1-x429.google.com with SMTP id h9so17043433wrt.0
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 12:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:from:to:cc:subject:date:message-id:reply-to;
 bh=GGmY+Tp0PCWgfcXh6CFFXtUnB9FaG+fCvf/13WVSk0w=;
 b=WF0x0DYfw1EI99+cBa5oo2iwSMWXe2cHrN+NQTQWWhx3YAjYadG+nCo8pOKXeTv6ER
 kdsVNLpzsIugaP0uY9u7cxWLIVrzKRylGKo7jIJapbyRzJ0Q/iP97n+E7mTBOuhIlrIm
 R5ZyuDLHloa6t6WmBeaW+xVELUsisof0vhNXv0JcDoHQzOEkuyaKKHklOnM+YQIA8jy5
 kw/ipuY32LTF6BEUgZhvBpVkihdst96J4YFyq13kpH6GtITdEq/8KlcYcoLPRdDihg8B
 kRuTklblvwf0eTIwWgirSPMx2ZD4Yb2A7qCWaYkjdcHMaGAxOqi4ZFW2tpRIB+VNcUwd
 s8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GGmY+Tp0PCWgfcXh6CFFXtUnB9FaG+fCvf/13WVSk0w=;
 b=jUc/9X8NtHzp9R6dsB3HUm2rXZKBxOO144hJWQmpjXnJ8j5CtnKLFrwdnblYMHw+FY
 I413D2WFG1yw19gApjeugjZfD4anrRYQhsJnC6HAAY1XvYjgBCncsFHDo43VCGIOWSjn
 ZM4YeoouzLtDwWvopCY27Sq1ba4Pqs8e0dYGQqIvrFlFReQSTuTUzab9SNxjr37iZ8Bg
 IpREJ+mqANaTEdqhTzEXHyD+KkAO560/pBppyaK4JEubIZa0cfj9GuNajVZyquIN0sR8
 1AjJzF1UJDb+PibWaAAdH0uK49qcn/GLuvpDh2VTD6a9kbPFih30lvcePbp6860pbThD
 02iA==
X-Gm-Message-State: ACrzQf2OXGl5MkAu35M/0TKtYbUPSbSCO3vXtqWDIaKvtTQHZrMIpOo8
 HUxgtfyUNtw9B92pp3F4P/s=
X-Google-Smtp-Source: AMsMyM7vylDfJxSJa8D8rTUC1YTGqz2fYScD5Gm+yB1SSIakSHtk+3ViLyMzAIt8dcdPdH+0SDGKaQ==
X-Received: by 2002:a5d:4b51:0:b0:236:88a2:267f with SMTP id
 w17-20020a5d4b51000000b0023688a2267fmr4789242wrs.461.1666812427161; 
 Wed, 26 Oct 2022 12:27:07 -0700 (PDT)
Received: from localhost (188.28.0.84.threembb.co.uk. [188.28.0.84])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a05600c4e8c00b003b95ed78275sm3082902wmq.20.2022.10.26.12.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 12:27:06 -0700 (PDT)
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <20221022162742.21671-2-aidanmacdonald.0x0@gmail.com>
 <ef6a326b-5c61-988b-2ec2-cd8e233e5d28@linaro.org>
 <GMvEU8xVTkjIoQ518XWAaLkhldSZHlk7@localhost>
 <4ef59d94-d045-55fc-d531-c84e7edb8333@linaro.org>
 <hXRpArckbrXUelDdaJ3Y2SErmKiuycXt@localhost>
 <66c1a100-922e-4a33-e80c-fc80866acf03@linaro.org>
 <jZCUALhj8PoqVkuWdtLf8LnPAj1wDakF@localhost>
 <38205667-d36f-e7a9-21b0-2e8597a662ff@linaro.org>
 <qNdQQJRLFWJ6gNfwM73oJ8EH56Y5nWgd@localhost>
 <874e74ae-86bb-7950-1615-36e1a326e177@linaro.org>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1 2/2] dt-bindings: ASoC: simple-card: Add
 system-clock-id property
In-reply-to: <874e74ae-86bb-7950-1615-36e1a326e177@linaro.org>
Date: Wed, 26 Oct 2022 20:27:07 +0100
Message-ID: <PkzdCCuz9l2wB7cV6ioHPIEYBXflo86N@localhost>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
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


Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 26/10/2022 10:48, Aidan MacDonald wrote:
>>
>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
>>
>>> And the remaining piece I don't get is that these are not bindings for
>>> codec, but for sound audio card. You want to set "system-clock-id"
>>> property for audio card, while putting clock from codec, which will be
>>> used to pass back to the codec... so it is a property of the codec, not
>>> of the audio card. IOW, NAU8821_CLK_* does not configure here the clock
>>> of the system, but only, only clock of the codec.
>>
>> The system clock is controlled at the DAI level, it's specific to one
>> DAI on one component. The simple-card device node has sub-nodes for the
>> DAI links, and each DAI link node has sub-nodes for the DAIs within the
>> link. "system-clock-id" is a property on the DAI nodes, so it's not a
>> card-level property, just one part of the overall card definition.
>>
>> Since the clock ID is something defined by the codec it would naturally
>> be a value defined by the codec, but the *configuration* of the codec is
>> part of the sound card because it depends on how everything is connected
>> together. If you used the same codec in a different machine it would
>> have a different configuration.
>
> OK, that sounds reasonable. Thank you for explaining this. You still
> need to convince Mark :)

No problem, thanks for bearing with all my explanations! Mark raised
some good points, and I have to agree with him. This could create too
many future issues, and the problem might be better solved with the
clock API -- but unfortunately that's not yet feasible.

Regards,
Aidan
