Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DB56A33B4
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Feb 2023 20:40:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C6B839;
	Sun, 26 Feb 2023 20:39:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C6B839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677440400;
	bh=LN5QS8CyXsifENjAxl7Jy3Wfu1vOQAjkQUD9fiiVLNw=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ls6G6mK3GFxggesJT/IBpCp9Q+t9AvWGv5ik387T/Wp005+O8MIMf2V9ii1oTwKtc
	 2cfYpa1g2IEfV+9utTnS6G01TN77edqPvimBxCRLrr2LduZFdQx7u1ZaXElxXydHeb
	 OYczDob4RgyJVWOYZfitsvpCgTz30V3t1peEv6FA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0845CF802BE;
	Sun, 26 Feb 2023 20:39:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CABE4F8049C; Sun, 26 Feb 2023 20:39:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B0B9F80236
	for <alsa-devel@alsa-project.org>; Sun, 26 Feb 2023 20:39:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B0B9F80236
Received: by mail-io1-f49.google.com with SMTP id q6so1781440iot.2
        for <alsa-devel@alsa-project.org>;
 Sun, 26 Feb 2023 11:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89W8sQtkd61sVfaU10t/qKgr0MKiSQvzQZkuL6seV7U=;
        b=F1jvbnz7yHkPZSAnQHajGnpDhyRu/7105Pxs/e0KpdbsQqse/gLX+WroDUKLcB0GAJ
         8WKYRSkran9MlQvaO3u1Lu3xNpA9SS/8lJ5WKvvjt4zOb2p3K1xpbi+Ns+X/aQEHVZXw
         xBUeknNZCNRVMsoC7IezKs9cZrygqLbIGTjP0pGzP/3GxD3JufZOCv28TQd4rejInw98
         pGRXGHaChi69y3PQKTk8YkxoMezrnyLmaCpfd7dYruRWshOI531qvauf7ZKbtVI6/ie8
         BN4ya9XK6COc8Djh47c5QbupXmBwpe74huHQS02q1K6uSHJ0HUEt0YWeJPs2yn3mp7vb
         Rqog==
X-Gm-Message-State: AO0yUKU67+0Unypf5vgPp2yuNHUKbBpAAG4VqtQz9N6lwNmGAoor3UEi
	qXQiFoNnG/JUGwlSy1w/pg==
X-Google-Smtp-Source: 
 AK7set/5nBIZVAj/LVt6z9Ors0aU51Gq8OePJvNbEIYYnG/6pe8XlIx9yljAd/4a/CPHttVJgHuDsg==
X-Received: by 2002:a5d:8e01:0:b0:74c:822c:a6ac with SMTP id
 e1-20020a5d8e01000000b0074c822ca6acmr14735248iod.15.1677440342580;
        Sun, 26 Feb 2023 11:39:02 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id
 v22-20020a6b5b16000000b007453a11bdf5sm1635543ioh.13.2023.02.26.11.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 11:39:02 -0800 (PST)
Received: (nullmailer pid 192292 invoked by uid 1000);
	Sun, 26 Feb 2023 19:38:58 -0000
Date: Sun, 26 Feb 2023 13:38:58 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 05/10] dt-bindings: sound: nvidia,tegra-audio: add
 MAX9808x CODEC
Message-ID: <167744033766.192237.14439523199147830921.robh@kernel.org>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-6-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-6-clamor95@gmail.com>
Message-ID-Hash: BVDGBJ6DJMMQ3VRDP6BGQFNEHH2LG4OQ
X-Message-ID-Hash: BVDGBJ6DJMMQ3VRDP6BGQFNEHH2LG4OQ
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BVDGBJ6DJMMQ3VRDP6BGQFNEHH2LG4OQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 21 Feb 2023 20:32:06 +0200, Svyatoslav Ryhel wrote:
> Add dt-binding for MAX9808x CODEC.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../sound/nvidia,tegra-audio-max9808x.yaml    | 93 +++++++++++++++++++
>  1 file changed, 93 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

