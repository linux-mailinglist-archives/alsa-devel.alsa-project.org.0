Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB704680B6
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 00:39:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF21D2572;
	Sat,  4 Dec 2021 00:38:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF21D2572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638574788;
	bh=ugjl0H7vwIDAKErgbbl0nHdANyCUHl1G37yscnbU5YY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sem+fV3ebxxtx4oagn4jyHiZrgIPfxZIDPl4Si6azGAPofvFP6hCl9mhZhWh9706I
	 GFV8Q8IEK347gMOd5Kcj6PPng3ixcCYhVKHAGPgCh+2+rFcFIdok+IDEsnuhlrFMB1
	 BQRdm7qnV6j3+wnJmpVWV3USxwnwphsrW37Sf6SA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17482F80085;
	Sat,  4 Dec 2021 00:38:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62BB7F80246; Sat,  4 Dec 2021 00:38:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AF86F80085
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 00:38:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF86F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X6r9KGXE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 289B562D3F
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 23:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D878C56748
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 23:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638574700;
 bh=ugjl0H7vwIDAKErgbbl0nHdANyCUHl1G37yscnbU5YY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X6r9KGXEbceJ0Up6Zpwiczm/NBz1vJdPLKlKmw7rcXBkFMqH0o7YkVaWlccMMdQ6a
 EA8EmX77KnwxPXtzbIqgWoZj9quNOcjXGXGkKawHekDwCarjZmrDto8iz15Vuk/ESB
 +0bS/DWq/epaBlE7NepAatAGNylv/vUrXvDtY2WnWyooZFavy8tXg1I0JwUme/LGTo
 5oPyOKv0ofbANpwqtgiy6E0RoGRdwj93fPnoWHO4nhDibSU6YOhsWctZ4fr1bdsd6m
 1WsA5bnbHOF0TmZueQ6N9q9j1CGZTi9i7OjCJkn2mLcoX87yjzh9xCbyUVE2W4RW1t
 AaymrUsj6eDIA==
Received: by mail-ed1-f45.google.com with SMTP id l25so17619809eda.11
 for <alsa-devel@alsa-project.org>; Fri, 03 Dec 2021 15:38:20 -0800 (PST)
X-Gm-Message-State: AOAM530Y9tkR2prcjeqlwgzJ7BOTZA0edXvi/brUxydQg8TpEtRi3evC
 cz3Hm0fQRQebNlhveRDfrareaJbycOPzoDI8pg==
X-Google-Smtp-Source: ABdhPJw+XO3cjO5SrZ8n1uXXjNbXhXGWsrFPtegxV4Y0/WHLg25PF4V8x+BXMIt5VKVNdrF0HCq7JUvus1wH1rof8RI=
X-Received: by 2002:a17:907:16ac:: with SMTP id
 hc44mr26234009ejc.363.1638574698507; 
 Fri, 03 Dec 2021 15:38:18 -0800 (PST)
MIME-Version: 1.0
References: <1638547658-22032-1-git-send-email-srivasam@codeaurora.com>
 <1638547658-22032-10-git-send-email-srivasam@codeaurora.com>
 <1638574455.248037.1043006.nullmailer@robh.at.kernel.org>
In-Reply-To: <1638574455.248037.1043006.nullmailer@robh.at.kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 3 Dec 2021 17:38:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKf4Y84+_PQqhwMEEiJNrR92urMUYSqYTEU0_c7fYnyhQ@mail.gmail.com>
Message-ID: <CAL_JsqKf4Y84+_PQqhwMEEiJNrR92urMUYSqYTEU0_c7fYnyhQ@mail.gmail.com>
Subject: Re: [PATCH v8 09/10] ASoC: dt-bindings: Add SC7280 lpass cpu bindings
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.com>, 
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com,
 Venkata Prasad Potturu <potturu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 plai@codeaurora.org, linux-kernel@vger.kernel.org, swboyd@chromium.org,
 tiwai@suse.com, agross@kernel.org, rohitkr@codeaurora.org, broonie@kernel.org,
 bjorn.andersson@linaro.org, judyhsiao@chromium.org
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

On Fri, Dec 3, 2021 at 5:34 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 03 Dec 2021 21:37:37 +0530, Srinivasa Rao Mandadapu wrote:
> > From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> >
> > Add bindings for sc7280 lpass cpu driver which supports
> > audio over i2s based speaker, soundwire based headset, msm dmics
> > and HDMI Port.
> >
> > Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> > Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> > Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> > ---
> >  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 70 +++++++++++++++++++---
> >  1 file changed, 62 insertions(+), 8 deletions(-)
> >
>
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml: lpass@62d80000: reg: [[0, 1658351616, 0, 425984], [0, 1659895808, 0, 167936]] is too short
>         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml

Are you running the checks before you send out your patches. Because
it seems like you keep sending things with the same errors.

If there's errors, I'm not going to review this. If you need help
getting it to work, then ask.

And what's with your email setup? codeaurora.com bounces.

Rob
