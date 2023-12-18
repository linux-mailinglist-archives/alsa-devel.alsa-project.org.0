Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2E817122
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 14:54:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE6B8839;
	Mon, 18 Dec 2023 14:54:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE6B8839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702907698;
	bh=CbtU5Dem8n1ByRGdHfRIcdaXiqJKIZaXjO9MiKCPxSw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AQJIocPBZS52/LeTLQlQKu3rWPW4HzZ0JYcQvhydwiX8xvsKunhPJSwkedMmtWvOA
	 y83nNJ0hZRqWysopgt/oq7Xz7+hGpUQL+x7luH3tx1GGbbPTcyaH+7GeK2xiTW5l7N
	 qIzSYYGs8DSVbDghRlKtrln1hxfonS0dX28rHYhA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDAB6F80568; Mon, 18 Dec 2023 14:54:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C747F8057A;
	Mon, 18 Dec 2023 14:54:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03475F80425; Mon, 18 Dec 2023 14:54:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A82B7F80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 14:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A82B7F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YIEBTH8D
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a23566e91d5so136848166b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Dec 2023 05:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702907655; x=1703512455;
 darn=alsa-project.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CbtU5Dem8n1ByRGdHfRIcdaXiqJKIZaXjO9MiKCPxSw=;
        b=YIEBTH8Dm8IxmF0FBQZeW6MOWXHrRcoVkbyb2i3h4HCOJKjnE9eA8ho8WCe1ur5vqG
         aQ5U+zHEjIF2ZUPX2npUkwP8La6JENdg99qT7x65LIHKpsAViW8lIJTIznZnhtk7OjRA
         eNE1/rhMzXyHDmvro6O06et1DQR01fdLAWR0TI7amfqSvVoZP3dbuFIkUvmCej0H5R3a
         Gn10YDF/6+smf/mWA8gO2b8oUkBNIlI0bshsdJpjmh8hWDZOrarcv6sAUXizlD6TvThI
         DvYPF5Bt5PRLjL5mm8NMAS1v8lw21wXJsjumezztt1bYQn+m9QnrwqvQW9NYvfF+11ct
         t5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907655; x=1703512455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbtU5Dem8n1ByRGdHfRIcdaXiqJKIZaXjO9MiKCPxSw=;
        b=BvtQ+8e8rr7fwcMSSwJTQI2g4jyF1GVOaxAAXexDcL7Y58G7XnCrtg0vHbNKeEA6Qi
         FwDVVbk6LK5JnR4aGC/T5t2UDOuoNYRTEL8j3srBzMRb02GuOKl+9lZYAapewdpkUqza
         0CP7rVw6t/b6XF0vCYq6+loXIsJIiuiWlcjz+DfYksRiYMRLIY6b3fb0SEyE9ubgarm7
         VX/2oBVljqRoQg6LZJTezcbN+P1ABMnRZlR4jE3IqcR6dWoEln6Ip994BEXASC7bYxyW
         PqG+7fxDdthpyKm3Ast7t6EV9IK0wr6u5fYwn1Cfj+mf+vnMoRojx6WfZzljKwiyb8H8
         s/zg==
X-Gm-Message-State: AOJu0YzJNnJ7QXtFt6q74E5vBAuYIaPNNx09AJQz28EhEftRlnLQQmmu
	8SYwrcJIblwMQSXISl5eeJTkKMwhkiCCACjfI8E=
X-Google-Smtp-Source: 
 AGHT+IFccjuA7oI4N2vZVaD408zkZGajffjClRfWqmjz7HiPSzp9vIfLO0uacCVtWGKz7UbIXxVfUaYcwBaZqHng/s0=
X-Received: by 2002:a17:906:1083:b0:a19:a19b:426a with SMTP id
 u3-20020a170906108300b00a19a19b426amr4772325eju.213.1702907655325; Mon, 18
 Dec 2023 05:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
In-Reply-To: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 18 Dec 2023 15:54:03 +0200
Message-ID: 
 <CAEnQRZAwk-USZqXwLOVuN3iTn7r-55BJH=Sqq5+2Od+DhrK0iw@mail.gmail.com>
Subject: Re: [PATCHv3 RESEND 00/10] ASoC: fsl-asoc-card: compatibility
 integration of a generic codec use case for use with S/PDIF controller
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
	Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: ILRDI72766OT24DWNSZ52XEK4TMIJA6C
X-Message-ID-Hash: ILRDI72766OT24DWNSZ52XEK4TMIJA6C
X-MailFrom: daniel.baluta@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ILRDI72766OT24DWNSZ52XEK4TMIJA6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>
> * fsl-asoc-card.txt currently follows the old dt-bindings format.
> Should we update it to DT schema format in this patch series
> before adding my new properties?
>
>

I know this is extra-work but we would greatly appreciate if you first
convert fsl-asoc-card.txt
to yml format and then add your new properties.
