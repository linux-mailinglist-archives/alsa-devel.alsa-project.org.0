Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9466C6984E8
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 20:47:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3599DAE8;
	Wed, 15 Feb 2023 20:46:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3599DAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676490454;
	bh=0gY6fPU2wIKz3O7JKb5l+ZOzMIrxO+gU/Fm6ycOW600=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ejGIE5pnei5oLW6HmjdC/5ZOjJq465Z6pyXxqLmbeAPplR+ObcaIVjRVw7frCX4oe
	 btL0mihdz0Cyogp3r+vdk4Uu4gVOiXABwdzL8LbRNnQomXYqO6TjEJLZpbqO/7O30I
	 hH88HQUgkB4bXhztEzKNeOo/N3lI1Xu8Xbk8/wmU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D1C6F800E3;
	Wed, 15 Feb 2023 20:46:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88A1CF800E4; Wed, 15 Feb 2023 20:46:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9924BF800B6
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 20:46:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9924BF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CHXE1eU9
Received: by mail-ed1-x529.google.com with SMTP id w3so18152299edc.2
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Feb 2023 11:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0gY6fPU2wIKz3O7JKb5l+ZOzMIrxO+gU/Fm6ycOW600=;
        b=CHXE1eU9oJnw19JirsAUnDO3tkBMRfy1btendDMBP5AvRrQ0274GX5pCHVg7IW85Xl
         Y0kqwtXxmIT3Vla8GB5aF5QlCVLGN9Y+j8vIsdXZ6xhhetLg/qhA7nrwF666eFQy/ZYJ
         4N46YnXGiVfvZRwo1LP6ndb9jq0kCL1xXNTlK8feWZhgJxM46rkHNOCD1ZGUh4IgvE9g
         A7SE6tXe4M5bDAWr3LtRZRPlUv3/YDSTzjM4J8Au9ixcKNg9V7SNiGl/eTlPZkslqUg9
         K6lwqBminK/H7J3SMiR7JkR7ybvL8GdZyVcqfAQz2diVErk4UGA5xOouUohCzwC+pwDr
         767Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gY6fPU2wIKz3O7JKb5l+ZOzMIrxO+gU/Fm6ycOW600=;
        b=5+BQ0yseAK/X8Mzg3BKYTw28oWq+uZBN8G7O41ONGTJ+FQYAdYASi41OICF0AKdi0l
         OhUqyJPM/4//EcRcljpMeZU9fsUuYqYBR8pbQlzBz15brP2aR6jvVQg71kn4ZnO11fSe
         w5fnoSmCFuZ6P819YkKD+17gk7VRtePzxz8qTZh9KNpDdBgM5FSlacp8S/XuGe6oenRg
         LGrQ294fqPCHe1dtlmjUTTfjKG381yH13rqy9A3LuGhauPly5bG4mjUOCZEdl1+xcYdv
         CUzNwlnL6cVx19H42VOQ0aj3CyrPYq9KbDXHsUyvLZWuQdOhZKmMFFNuafyr/LreJNzT
         TLeQ==
X-Gm-Message-State: AO0yUKVo+6fDkkztgtY8nL/Ej6EKwHystl7WMMVDZOx1nI2jAyPt75T2
	lpzfkHUaiwry3pRjUkXkPeDiEB0ngZpeNCv/YZQ=
X-Google-Smtp-Source: 
 AK7set+5UINGYpxfOT+JqbbXrDGaMZhcao3eRocx2Q849cXbeJg5nU66qqezg0N3hP3F2iUPkmOt4fymeqb7uO0SUdE=
X-Received: by 2002:a17:907:68b:b0:877:747d:1112 with SMTP id
 wn11-20020a170907068b00b00877747d1112mr1645959ejb.15.1676490388540; Wed, 15
 Feb 2023 11:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
 <20230208101545.45711-4-krzysztof.kozlowski@linaro.org>
 <20230215192123.4ore7ac6tnedrsyq@ripper>
In-Reply-To: <20230215192123.4ore7ac6tnedrsyq@ripper>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Wed, 15 Feb 2023 13:46:17 -0600
Message-ID: 
 <CABb+yY1xHOac4C7fWHW6Cj67-O7nBWFP8LXbW-9V_F24b1SMTA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] dt-bindings: mailbox: qcom,apcs-kpss-global: drop
 mbox-names from example
To: Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: HZ74NWC2UWNGJ5YYWDAPF4M4S4GGSO52
X-Message-ID-Hash: HZ74NWC2UWNGJ5YYWDAPF4M4S4GGSO52
X-MailFrom: jassisinghbrar@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZ74NWC2UWNGJ5YYWDAPF4M4S4GGSO52/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 15, 2023 at 1:19 PM Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Wed, Feb 08, 2023 at 11:15:42AM +0100, Krzysztof Kozlowski wrote:
> > Qualcomm G-Link RPM edge bindings do not allow and do not use mbox-names
> > property.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >
> > ---
> >
> > Changes since v1:
> > 1. None.
> > 2. Previously was sent as separate patch.
> >
> > There are no strict dependencies. This can go anytime. The next patch
> > (glink-rpm-edge) should be applied in the same or later cycle (could be
> > via different trees).
>
> Jassi, I missed this note and merged the following patches, introducing
> the forecasted issue in linux-next. To remedy this, I took the liberty
> of merging this patch as well into the remoteproc tree.
>
No problem.

Cheers.
