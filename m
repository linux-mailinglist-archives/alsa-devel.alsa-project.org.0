Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B889F68EFD0
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 14:31:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7919320C;
	Wed,  8 Feb 2023 14:31:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7919320C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675863116;
	bh=Md4TtD0DVUbDcYUPsE/jHzqnrpUrSX+osv8eELWNMec=;
	h=References:From:To:Subject:Date:In-reply-to:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TKzpjZ1BxFRmHujoY/z2+wHMxRiIiNwOLip6C3xZr0EZjmmQhBJCTzILSVTSy/C1E
	 goiiMQev4h/1M8WaK+A1t3euQak8zIGSvqPjF7mZyAbztHWh5F4aAUVQOwaVy3vbU4
	 I46Sj7nl6pPpYs6pI2V+Kugpl6ho9EI//sJ8W0TI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9FE0F8012B;
	Wed,  8 Feb 2023 14:31:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3241AF80152; Wed,  8 Feb 2023 14:31:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D307F800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 14:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D307F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=MhfzlfU5
Received: by mail-wm1-x32d.google.com with SMTP id z13so5855403wmp.2
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 05:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=HpCaN7lG8XCYSDYTiFmo0cVwl51EDo9X6coy6Wp5QmY=;
        b=MhfzlfU5sY+wGQQQMW/8ySS5pdzxzPH8iIv7OSSZT231doUM5Y6Z+M7u5cZYUTnHnn
         Nwgh+CHswYjnoy3o7x1tfV/CchtnC6DLHjliRK0UiT1fiIu/eK0ZpKuKN/zYBS0W89mW
         wzcipCsUFqyl24KpdhfQ7asj0yayRfi8CgmbZ7p8sMoh1y2AcxMkGdWRUdw5Vh5YV1AR
         aV3sW8WHGpQxRjaTOLEEpIMQa5vvJOzWaRXUAuWiEY1EMXmjmLrqXqzlqcxhDtV4l1m5
         UFafj6veS/za8W+FjVLmn8AgMj6iiavpbLYgM3jxhJzhSGEmeh99X+2wysIoM35ix9U3
         SLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpCaN7lG8XCYSDYTiFmo0cVwl51EDo9X6coy6Wp5QmY=;
        b=ASVW6hdxobXD+H1dosNwDV63RKk9at6tuiH20zvgp6erlt2NDz9bTYMyfuifk7Xk2C
         8L1QRHcir9FRDjE148bVTJlgjhJIXj8kBwlqy2yN1wkKNHwXE+s/RAi4lE0072WFadhG
         EfL98lb1HJRAEFwCwR/YmnHfjYc59DFI4FPsasxIghod4KRUOpNTN4nM4n6mLiUi3R70
         4Amd8gy3cW36HJCcQTlnden+hJUwiQODl1WLZGIBCdGqDBq6PWE4CyEAVNEH/jbYsPsY
         huJcjVWpBO0we1AK2gdhyDOG6Li/6yhIOYgDR9a4ecHwZKZvxzxCsQV+WABrn1x6lMJW
         LHsg==
X-Gm-Message-State: AO0yUKU6gedkDvV/bYVO83N3ZeK+0rWTWsxg77nvnMu3ipYi23wnZ/2i
	zYU7q/Tkz63mj8UZZhkDlP4iGw==
X-Google-Smtp-Source: 
 AK7set8gTMHZ1IftF10m4fVg8A2AOT5sLEQhWbPfE+atmk79589ys3Tl9ZLjMH61OGI0Otb++12oXQ==
X-Received: by 2002:a05:600c:13c8:b0:3da:28a9:a900 with SMTP id
 e8-20020a05600c13c800b003da28a9a900mr6401021wmg.41.1675863051197;
        Wed, 08 Feb 2023 05:30:51 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id
 be7-20020a05600c1e8700b003dff2b493c8sm2162895wmb.36.2023.02.08.05.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 05:30:50 -0800 (PST)
References: <20230208093520.52843-1-jbrunet@baylibre.com>
 <Y+OJB7OPABnPfeq7@sirena.org.uk>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 0/1] ASoC: dt-bindings: meson: covert axg audio to
 schema
Date: Wed, 08 Feb 2023 14:25:58 +0100
In-reply-to: <Y+OJB7OPABnPfeq7@sirena.org.uk>
Message-ID: <1j4jrwmghi.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: TFD4ZJ6WWZZQWQZ7MTOKVWQALZMYOS3I
X-Message-ID-Hash: TFD4ZJ6WWZZQWQZ7MTOKVWQALZMYOS3I
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TFD4ZJ6WWZZQWQZ7MTOKVWQALZMYOS3I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed 08 Feb 2023 at 11:35, Mark Brown <broonie@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> On Wed, Feb 08, 2023 at 10:35:18AM +0100, Jerome Brunet wrote:
>> Continue conversion of AXG audio dt-binding documentation to schema
>
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that 
> any important information is recorded in the changelog rather than being
> lost. 

I usually don't send cover-letter for single patches.

This was originally a 9 patches series and it dropped to a single one as
you applied them. I was wondering wether to keep the cover-letter or
not. I thought keeping it might be better to keep track of the series.

If the same case happen again, I'll skip the cover-letter.

>
> [[End of PGP Signed Part]]

