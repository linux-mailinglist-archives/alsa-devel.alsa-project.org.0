Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A52C60E3B9
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 16:49:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC8922456;
	Wed, 26 Oct 2022 16:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC8922456
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666795766;
	bh=+0mLvxSPXOxhgnQzcFMi44GsxzESgWZ7ht0/PY/f89Q=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MR1PsWweX247kKU8En6Qc+pCQMkrVTbFvBgvLN3ATQDE2MpJbKCeSnKFjpAxttUC9
	 NPCv2zPvAhuxBU9iORwI8DZBXL8wzQj5W3I/xMxhGZYj8QOcysv0WGMEWniXIvlDAS
	 rJJn+TFEllqVCxu2BYH4qTYlIz0W4MLzIXPR2q94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61768F80100;
	Wed, 26 Oct 2022 16:48:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 048E7F80271; Wed, 26 Oct 2022 16:48:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13E06F80100
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 16:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13E06F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EizPam+f"
Received: by mail-wm1-x32e.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso1765679wmq.1
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:from:to:cc:subject:date:message-id:reply-to;
 bh=+0mLvxSPXOxhgnQzcFMi44GsxzESgWZ7ht0/PY/f89Q=;
 b=EizPam+fpHG85pFQytUCkvubWoOhztt1iDv7VIlV0p3BBuAKUvT9hosMERDmg/DVSX
 rGgPIUdwttDbqz65VTg+selFcbgULI2Ugxc4PXlZRe19qetJZFv0GbuGVRjxj6YB8Wkt
 olkVowxyzveNPp5DDAnfgIZXT1+1GTWoNsW6J6pLq8787yhJ4/tGI/syWZ3M95EUWw/I
 t3LwED8PUSp9hmsR30iIzkeLkgwgBWWJXqKq1TmYj/U2sui2cmX614eukMR8mLViyKe8
 mefhw2zImZlMn06SPxWgCKWJUWFbvaJQbJHChdLqJF+KWeQKyqFTg/bDxRZdukQVfduJ
 TsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :references:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+0mLvxSPXOxhgnQzcFMi44GsxzESgWZ7ht0/PY/f89Q=;
 b=1BH40WYakHiRzPsdrmqX+BzIQN1qjL8wfJ6y3UCytqQW/iPBn9kpkoXh3R5mVqVex9
 nkJPtpZvE7o1rc9oVEnJmOchn+f1FcKCNS1gov8L+MviVkDRc65VMN9yzpqQmSvEsVEI
 I8dej9yaqdUpwtDW5B39DewEtitgxL/bdPFiwLZlXsiV//pFuNO5RUVt34h8mn8r7kFw
 F7z3ykHJ7KzrM+J9Bv0bnVtsMYsjE5SYMEmVEq/Ljy6vD1MCh8ewToPWw5pd/28R8kDp
 PRG2CfFCquRDy5Bf5P4BqxzMxwZrABCOLDfQagDHVDRwTJKAki/+gokheeiHvFSAScQs
 Youw==
X-Gm-Message-State: ACrzQf1gk6UVNNwhLTL+aNCRh1po+KZvemsbJzDgBa3nqqK4wHSEUZb/
 WAyjGMVcleOWcisT0lntmmo=
X-Google-Smtp-Source: AMsMyM7/vD0TkY3/qBDwvfDXp6IepRYUm5MsPEZ2Jot0Pj+rXJATGYpR57v7l1I9iMk6NOBsUPoGMg==
X-Received: by 2002:a05:600c:35cf:b0:3c6:e957:b403 with SMTP id
 r15-20020a05600c35cf00b003c6e957b403mr2893717wmq.162.1666795702227; 
 Wed, 26 Oct 2022 07:48:22 -0700 (PDT)
Received: from localhost (94.197.44.200.threembb.co.uk. [94.197.44.200])
 by smtp.gmail.com with ESMTPSA id
 l3-20020adfa383000000b002366eb01e07sm5455698wrb.114.2022.10.26.07.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 07:48:21 -0700 (PDT)
References: <20221022162742.21671-1-aidanmacdonald.0x0@gmail.com>
 <20221022162742.21671-2-aidanmacdonald.0x0@gmail.com>
 <ef6a326b-5c61-988b-2ec2-cd8e233e5d28@linaro.org>
 <GMvEU8xVTkjIoQ518XWAaLkhldSZHlk7@localhost>
 <4ef59d94-d045-55fc-d531-c84e7edb8333@linaro.org>
 <hXRpArckbrXUelDdaJ3Y2SErmKiuycXt@localhost>
 <66c1a100-922e-4a33-e80c-fc80866acf03@linaro.org>
 <jZCUALhj8PoqVkuWdtLf8LnPAj1wDakF@localhost>
 <38205667-d36f-e7a9-21b0-2e8597a662ff@linaro.org>
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v1 2/2] dt-bindings: ASoC: simple-card: Add
 system-clock-id property
In-reply-to: <38205667-d36f-e7a9-21b0-2e8597a662ff@linaro.org>
Date: Wed, 26 Oct 2022 15:48:21 +0100
Message-ID: <qNdQQJRLFWJ6gNfwM73oJ8EH56Y5nWgd@localhost>
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

> And the remaining piece I don't get is that these are not bindings for
> codec, but for sound audio card. You want to set "system-clock-id"
> property for audio card, while putting clock from codec, which will be
> used to pass back to the codec... so it is a property of the codec, not
> of the audio card. IOW, NAU8821_CLK_* does not configure here the clock
> of the system, but only, only clock of the codec.

The system clock is controlled at the DAI level, it's specific to one
DAI on one component. The simple-card device node has sub-nodes for the
DAI links, and each DAI link node has sub-nodes for the DAIs within the
link. "system-clock-id" is a property on the DAI nodes, so it's not a
card-level property, just one part of the overall card definition.

Since the clock ID is something defined by the codec it would naturally
be a value defined by the codec, but the *configuration* of the codec is
part of the sound card because it depends on how everything is connected
together. If you used the same codec in a different machine it would
have a different configuration.

Regards,
Aidan
