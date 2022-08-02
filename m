Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F98587E55
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Aug 2022 16:47:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB56441;
	Tue,  2 Aug 2022 16:46:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB56441
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659451635;
	bh=m3oMUJ39z21VR5DPOUewd604g1HQhk4ONsg7OSyzUWs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sG39aBBmmlcyGtJrVFZFOBRYs8UNQGAoCJqyqxIbBzzJfDIirYehS6Ft1r8WrAz8a
	 /kBvEqCUg29ZN0Vvb2PeuROaeZYQdnQzmo4qHOu1I5A8zji77KtQ3TVHvzpt75Vwde
	 pnpPe0YbHEhVaaqr7HRDc31ix/k0CzS2y+xqTB/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34BD7F80115;
	Tue,  2 Aug 2022 16:46:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F8E1F8026A; Tue,  2 Aug 2022 16:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CD36F80115
 for <alsa-devel@alsa-project.org>; Tue,  2 Aug 2022 16:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CD36F80115
Received: by mail-il1-f181.google.com with SMTP id z6so6116647iln.13
 for <alsa-devel@alsa-project.org>; Tue, 02 Aug 2022 07:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=YWdMhY/w6xJGnTNrD3+yPIQp9IMoWMfQJOwkWlFi+RQ=;
 b=zCBy7UiFj5q7zKylKCDI9ZDY4ZM3k3M0Y1V40+PmbB1ZmxFTxwbSXxTM0tLHJJktLE
 VNP/mWW44NlbB44jUQtGygRQabjdgw0VcXLCVSdO6Hj5fcFAu43Til8HA6F4hPhpPnPT
 cE4ulRP+JGaTqK8CV2ZsBolM5kmDTqEbuQiWuqGtUzfF9wXRhV2eT7+dUGHWT/xVLu0q
 mOD/M4/VORjUSIRoJooGR/GwYeCEeRF1/bdzg2Ao9vbWaMhMPGEDBCoTakbmD91v/JoS
 MN1ZyboK6e8WMahsbNtR6Ycr+5sAjatehFrau0ZmjAUIOy3sGbIEAfOghGvBMF3ot/Yn
 zCwA==
X-Gm-Message-State: ACgBeo2zxf+Ukup1otKRt8WonIymplpEDkyqI0iRhdelEXQSfnHS/vU+
 osbur2WGEMOkDjmO0dvMKQ==
X-Google-Smtp-Source: AA6agR5WgaywX71Mi/tssUPXgR+p0/h9FgYemIjJDIjmuwbCJAULertTvwumkbhjtOaFmgv9kXdbvQ==
X-Received: by 2002:a05:6e02:1d18:b0:2de:b805:99f1 with SMTP id
 i24-20020a056e021d1800b002deb80599f1mr3169607ila.61.1659451564182; 
 Tue, 02 Aug 2022 07:46:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a026304000000b00341d7c43ed5sm6405840jac.73.2022.08.02.07.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 07:46:03 -0700 (PDT)
Received: (nullmailer pid 79583 invoked by uid 1000);
 Tue, 02 Aug 2022 14:46:02 -0000
Date: Tue, 2 Aug 2022 08:46:02 -0600
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Add schema for common DAI params
Message-ID: <20220802144602.GA30116-robh@kernel.org>
References: <1659370052-18966-1-git-send-email-spujar@nvidia.com>
 <1659370052-18966-2-git-send-email-spujar@nvidia.com>
 <1659382247.124005.1380281.nullmailer@robh.at.kernel.org>
 <982b3f0c-0b6c-d531-3d75-27d5ca1aabec@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <982b3f0c-0b6c-d531-3d75-27d5ca1aabec@nvidia.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, broonie@kernel.org,
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

On Tue, Aug 02, 2022 at 04:15:28PM +0530, Sameer Pujar wrote:
> Hi Rob, Krzysztof
> 
> On 02-08-2022 01:00, Rob Herring wrote:
> > On Mon, 01 Aug 2022 21:37:30 +0530, Sameer Pujar wrote:
> > > The "convert-channels" and "convert-rate" bindings are provided for both
> > > simple-card and audio-graph-card. However these are separately defined in
> > > their respective schemas. For any new binding addition, which is common to
> > > both, there will be duplication.
> > > 
> > > Introduce a new schema to have common DAI params properties and these can
> > > be re-used in other schemas wherever applicable.
> > > 
> > > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> > > Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > ---
> > >   .../bindings/sound/audio-graph-port.yaml           | 13 ++++------
> > >   .../devicetree/bindings/sound/audio-graph.yaml     |  7 +++---
> > >   .../devicetree/bindings/sound/dai-params.yaml      | 28 ++++++++++++++++++++++
> > >   .../devicetree/bindings/sound/simple-card.yaml     | 16 ++++---------
> > >   4 files changed, 40 insertions(+), 24 deletions(-)
> > >   create mode 100644 Documentation/devicetree/bindings/sound/dai-params.yaml
> > > 
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.yaml: properties:simple-audio-card,convert-rate: 'oneOf' conditional failed, one must be fixed:
> >          'type' is a required property
> >                  hint: A vendor boolean property can use "type: boolean"
> >          'description' is a required property
> >                  hint: A vendor boolean property can use "type: boolean"
> >          Additional properties are not allowed ('$ref' was unexpected)
> >                  hint: A vendor boolean property can use "type: boolean"
> >          /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.yaml: properties:simple-audio-card,convert-rate: 'oneOf' conditional failed, one must be fixed:
> >                  'enum' is a required property
> >                  'const' is a required property
> >                  hint: A vendor string property with exact values has an implicit type
> >                  from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
> >          '/schemas/sound/dai-params.yaml#/properties/dai-sample-rate' does not match 'types.yaml#/definitions/'
> >                  hint: A vendor property needs a $ref to types.yaml
> >          '/schemas/sound/dai-params.yaml#/properties/dai-sample-rate' does not match '^#/(definitions|\\$defs)/'
> >                  hint: A vendor property can have a $ref to a a $defs schema
> >          hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
> >          from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
> 
> I am hitting this error if I use properties/definitions from another schema.
> If I define it locally, it works. I see there are examples where properties
> from different schema are used. But not able to understand why errors are
> seen in my case. Am I missing anything here?

You either need to use 'properties' with actual property names and 
reference that schema from the node level. Or you use '$defs' if you are 
going to have references from the (DT) property level. I think I'd just 
leave simple-card out of this and do the former.
