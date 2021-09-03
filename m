Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 967B63FFBFC
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 10:32:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D52D1718;
	Fri,  3 Sep 2021 10:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D52D1718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630657940;
	bh=XyR1K2Saapwjdv+YokvOxxxjAdtyUTPdgJwf7cgvrxY=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q5zal+9WidSjyoTeA5q1fpdPxQQQ++qEYx65G6UCiwY0oLRwyYdthFFdoWNLUN22x
	 vaWO72qrox3lJeca54Ol6fgNl0snaDuQ5czav3xDt5NmSHZb6CdOHznte3AdO5kvq1
	 7uxFZZFjRAb2RcPXzEKH+mMCgRjGmwZZerJYT86g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8069CF80256;
	Fri,  3 Sep 2021 10:31:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 982A2F80254; Fri,  3 Sep 2021 10:31:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59A65F80088
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 10:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59A65F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="K4wGE5iP"
Received: by mail-wm1-x329.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso3208190wms.3
 for <alsa-devel@alsa-project.org>; Fri, 03 Sep 2021 01:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=tSBoI24rmmAo/WWLDhLND6YxNYncWnjj1r5sALynAJ4=;
 b=K4wGE5iP441yxWa+TAQZ1VZZMZnv6OfvJKWEzE+MCQj7K2oMTS8aHeDQgL7IlCV5+r
 II5rICDjfU5wlQZmioHZXxoVszg5g1wTZIPmZf+V7KOVQKYfmuoowJ602eTn6HBmdjhR
 40Z5W0mxAnYB/D/m3H3U18iiaEtRB1XAs6OsSrvD75MTsAFVEgpJuvIWB45lquL4eZPg
 WHGJylo9CiP3ELxpw7rat1Y5lK4ARxd2H5aZyiP/QOH5s9LmA5oPmoO04VDfHoMMtTxu
 mwZcDDhHJY/GZrwjRiCTfmJmArcJ97MVfnRwjnpryjB2B5p2fewYpM6VuJPJjmAlvb6U
 L/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=tSBoI24rmmAo/WWLDhLND6YxNYncWnjj1r5sALynAJ4=;
 b=apl86EwKphscyBdnbw5+QNaVDnlbJtsv3JT9tR6OYWkC7Vnkjm5kZWT9awDilcqqlh
 L9pl+NNXgeJ3MxWB5aeTsDbkZ07iCANKZYFgeS41VNjmsaNBVQmI8i09Z6Lxq3/GMnLi
 OrXi853+YVZVv+o+BwEEdxsCzwdYxVGBdr4sZijTigInOsI+vtaqtzDglDhUNiLZko22
 MEeWlJZuMM8ivEfR28RRVgTBHpKwqkqjoCDnKS2lnF67bmxMexzkeRXOST4t6Jh0eGDN
 KN7qoflcBu7lFCd18GBSWpXsJGvGMTF9EEOtPURlknmmu2eIvQ7Lqk1qTzbnFaEq39d5
 IFWA==
X-Gm-Message-State: AOAM532mATlg6N6nHPV2Io8WTjjGnSYSJS2uJkYD4ohWp8lagTq1IebA
 QeP+jlFdXV6x9ZoPUCxZjZmTVg==
X-Google-Smtp-Source: ABdhPJzIVzeO9objMjNkGGwltqZ/D3PN/vMifRhZaWUZqUx5iRpM6g1pt+vfuZhIf9TYGOJSBH5HPA==
X-Received: by 2002:a05:600c:4ece:: with SMTP id
 g14mr2177689wmq.6.1630657843920; 
 Fri, 03 Sep 2021 01:30:43 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id r12sm4323542wrv.96.2021.09.03.01.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 01:30:43 -0700 (PDT)
References: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
 <1630562033-13231-2-git-send-email-spujar@nvidia.com>
 <1jpmtr5egi.fsf@starbuckisacylon.baylibre.com>
 <YTElQBgwF6xBFH9l@robh.at.kernel.org>
User-agent: mu4e 1.6.5; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] ASoC: Add json-schema documentation for
 sound-name-prefix
Date: Fri, 03 Sep 2021 10:29:37 +0200
In-reply-to: <YTElQBgwF6xBFH9l@robh.at.kernel.org>
Message-ID: <1jk0jyt617.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 stephan@gerhold.net, linux-kernel@vger.kernel.org,
 Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com, jonathanh@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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


On Thu 02 Sep 2021 at 14:25, Rob Herring <robh@kernel.org> wrote:

> On Thu, Sep 02, 2021 at 02:47:27PM +0200, Jerome Brunet wrote:
>> 
>> On Thu 02 Sep 2021 at 11:23, Sameer Pujar <spujar@nvidia.com> wrote:
>> 
>> > The 'sound-name-prefix' is used to prepend suitable strings to a
>> > component widgets or controls. This is helpful when there are
>> > multiple instances of the same component. Add relevant json-schema
>> > and is inspired from sound-name-prefix.txt documentation.
>> >
>> > Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> > Cc: Jerome Brunet <jbrunet@baylibre.com>
>> > Cc: Rob Herring <robh+dt@kernel.org>
>> > ---
>> >  .../devicetree/bindings/sound/name-prefix.yaml     | 35 ++++++++++++++++++++++
>> >  1 file changed, 35 insertions(+)
>> >  create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml
>> >
>> > diff --git a/Documentation/devicetree/bindings/sound/name-prefix.yaml b/Documentation/devicetree/bindings/sound/name-prefix.yaml
>> > new file mode 100644
>> > index 00000000..b58cc9e
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/sound/name-prefix.yaml
>> > @@ -0,0 +1,35 @@
>> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> > +%YAML 1.2
>> > +---
>> > +$id: http://devicetree.org/schemas/sound/name-prefix.yaml#
>> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> > +
>> > +title: Component sound name prefix
>> > +
>> > +maintainers:
>> > +  - Jerome Brunet <jbrunet@baylibre.com>
>> 
>> Since this file is referenced using "AllOf", am I going to be listed as
>> maintainer of all the drivers using the property below ? I'm not sure I
>> want that ... :P
>
> No. That's not how it works. You're maintainer of files that list you as 
> maintainer.

Thanks for clarifying.
You can ignore my comment then Sameer. 

>
>> Maybe it would be better to drop the above ?
>> 
>> > +
>> > +properties:
>> > +  sound-name-prefix:
>> > +    $ref: /schemas/types.yaml#/definitions/string
>> > +    description: |
>> > +      Card implementing the routing property define the connection between
>> > +      audio components as list of string pair. Component using the same
>> > +      sink/source names may use this property to prepend the name of their
>> > +      sinks/sources with the provided string.
>> > +
>> > +additionalProperties: true
>> > +
>> > +examples:
>> > +  - |
>> > +    analog-amplifier@0 {
>> > +        compatible = "simple-audio-amplifier";
>> > +        sound-name-prefix = "FRONT";
>> > +    };
>> > +
>> > +    analog-amplifier@1 {
>> > +        compatible = "simple-audio-amplifier";
>> > +        sound-name-prefix = "BACK";
>> > +    };
>> > +
>> > +...
>> 
>> 

