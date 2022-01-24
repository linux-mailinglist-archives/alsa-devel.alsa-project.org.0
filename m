Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F09549931C
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 21:33:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A26AD23BC;
	Mon, 24 Jan 2022 21:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A26AD23BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643056409;
	bh=EcSc5NGWQWYVTuB7MnoRf3rQ2LAOnZ2MYQlWCYRDxV0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lDUKn1686nt/5FnCCY/qJh8ngFJdAh3WU5lA/IgJejte2K9+tzbyK/T2a6pLydPY5
	 ntolX0hToIGR5SO25zlfbyYEyJBgRH2tsmQHWhjqdTG9yhj7B9BXOzP9QoFA6KCnJA
	 6NJhc1YzNU6OSnAt15qAIx1v59IrkhzuNXcTtZh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BD15F802BE;
	Mon, 24 Jan 2022 21:32:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A923DF8027C; Mon, 24 Jan 2022 21:32:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0385EF80161
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 21:32:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0385EF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mi6gIXyr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CAEBC61595
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 20:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D080C340EB
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 20:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643056329;
 bh=EcSc5NGWQWYVTuB7MnoRf3rQ2LAOnZ2MYQlWCYRDxV0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Mi6gIXyr/tKOn8rTTMqwC2IFZMFu3q7Jf2dhA+dYuOZmtpv9SY4EsrPVBiimrJ2ml
 QtUY6gVvWqrsPU6CyiX27p9eK7YhbmPtlFJyCxYOIsN5cobstj32OJhBjeA42lmTX4
 EeW5FqUXvc/sK1GWdiJiD/hgwxto2EPNLyhXUD1kMJRvCrOeXSK2m9IDxlQ/IIJFtK
 XqmnpliOD3ZCsoHNywC2pEqyY2TioUwNlG4w0zlFTu0LrT5Jr6A8f/LyQ1AMGQSba9
 /AdrRN1RrsWfDEVGITTMcJiFH6Kk0cSBzyg/2u8Pbvlofo6kt+B5qph/vNx/cQ3yv7
 WVuYV9qk85D+A==
Received: by mail-qt1-f174.google.com with SMTP id o3so1537923qtm.12
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 12:32:09 -0800 (PST)
X-Gm-Message-State: AOAM533B0FGNsoZ68NZgK4fdpjDg7BxZYOkHH5Vl53Ox1ARzW4FM0EmQ
 BOcs9nSyKuoEzPq6dh6/vZ2evEgKps4JsemMaA==
X-Google-Smtp-Source: ABdhPJxhfE3hNbKeQnW9wjko8Ek4KGnAVOUwl4hpmRLOwvce8D+R+2d0iKBHLgo1PXB3c+kB2arYv9PAoJ1m15VdEl8=
X-Received: by 2002:ac8:580b:: with SMTP id g11mr14053696qtg.478.1643056328171; 
 Mon, 24 Jan 2022 12:32:08 -0800 (PST)
MIME-Version: 1.0
References: <20220119015038.2433585-1-robh@kernel.org>
 <CA+Eumj4HjM8SPoOUo7_eLBOHFYXTPPPgmx_YDYdEXDyaT67Rrg@mail.gmail.com>
In-Reply-To: <CA+Eumj4HjM8SPoOUo7_eLBOHFYXTPPPgmx_YDYdEXDyaT67Rrg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Jan 2022 14:31:56 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+jg=2svsVsNY_kd8vQ+b9mM77t8ua8omCRT5rHRFcrUw@mail.gmail.com>
Message-ID: <CAL_Jsq+jg=2svsVsNY_kd8vQ+b9mM77t8ua8omCRT5rHRFcrUw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Improve phandle-array schemas
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Mon, Jan 24, 2022 at 10:55 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On Wed, 19 Jan 2022 at 02:50, Rob Herring <robh@kernel.org> wrote:
> >
> > The 'phandle-array' type is a bit ambiguous. It can be either just an
> > array of phandles or an array of phandles plus args. Many schemas for
> > phandle-array properties aren't clear in the schema which case applies
> > though the description usually describes it.
> >
>
> Hi Rob,
>
> I have few questions below.
>
> (...)
>
> > diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> > index 095775c598fa..3a4df2ce1728 100644
> > --- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> > +++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> > @@ -21,8 +21,7 @@ properties:
> >      type: object
> >      properties:
> >        sound-dai:
> > -        $ref: /schemas/types.yaml#/definitions/phandle-array
> > -        maxItems: 1
> > +        $ref: /schemas/types.yaml#/definitions/phandle
> >          description: phandle to the I2S controller
> >      required:
> >        - sound-dai
>
> This passes the example only because the example was simplified to
> hide dtschema errors.
>
> The cpu dai node is like:
> cpu {
>     sound-dai = <&i2s0 0>;
> };
>
> and this fails with errors missing phandle tag in 0.
>
> I am converting rest of Samsung audio bindings to dtschema and have
> trouble expressing this. How schema should express such cpu node?

The above hunk should be reverted. I'll drop that hunk.


Rob
