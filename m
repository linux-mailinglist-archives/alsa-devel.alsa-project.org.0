Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C12770F638
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 14:23:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CF573E7;
	Wed, 24 May 2023 14:22:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CF573E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684931001;
	bh=bWBxlRhVRN0nxAB20VSF5AlxLKS4ovRI/Co16HTIS2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RaQzV1DjX5VRFQAGlNO9qDi4+1asdNMzMh82JSkLOy9wgh5FZCFYCfwD2TZ4QMmL8
	 7xunuWW7TYNTqiSjUgVr1d4ED0fsqdL6ak6YTRKu/Bi4PdugciiTIazsjIq/938YQo
	 DU583LAreNmymvdA+5HUsVoWjKOLE4e70yMz+tPk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CE79F8055B; Wed, 24 May 2023 14:22:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 734F8F80425;
	Wed, 24 May 2023 14:22:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8237F8024E; Tue, 23 May 2023 16:22:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E03ACF80086
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 16:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E03ACF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=lXbZ/4cY
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3093a7b71fbso7179271f8f.2
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684851751;
 x=1687443751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EranyCDg/9rde0AKk+TrYZhj6TXyu+KiL6HFMU6m/Vc=;
        b=lXbZ/4cY6bh3L0O0vsZya24TPX5PgkE3gNjG7MnLWafEXib47/oB4qvLn8NJ3Cvy9O
         65gp5VUR4VVO6Rb0xlq2zRNsqII4bD43n70CHWLWCANEMe9NEko3ozAjAvl+ZMTVCivi
         vPB3nRNrXEQKWin+2CNqHRyZTqmocNsH56DN7czvai7Gcv4zzNNhzMlwwDul6rXI4NcS
         UhaZn8CBqR7iUbyoSXuNxRnYRnep4ylMm+9cBuPcwAx7S3QBuyIFmw7CbsuU/iCeg4mk
         a42rjwNgz9owQe47UF31HD8u8a/8lxNXrj4GS7S9qijb1i2fo9ph//NRGaG+4lK0xKxI
         IJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684851751; x=1687443751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EranyCDg/9rde0AKk+TrYZhj6TXyu+KiL6HFMU6m/Vc=;
        b=V9QrYq4ycxv3lO6nxEAx3nhUrIHS+GPSZGa/XDsMolZDxF87SMQGl2LdMkTRve1n3Q
         B01e65VFcS2TMIWUE2Xx/Y/2lShIBeboecoKvizw+cCEA2ZuS9Lwjmk3OV79bF9sBM+9
         Id+mk+yg4aep93nQ3WzQexZdsZ5deuxYWRFIPQatL49egC+AV+U+N6thQYeLwYFK/24r
         LQnJvChMfNnOPKW3qtzOrJxnCDa06GAn4dEiQpUdJGw7csZnSe74TjnqRPoEEu6Crria
         LmuGkYINwJcxi1WqGJ0R8SOFMw8xZtViWoa4P2gTR+XRwrB3QEAQKpqPdIwN49rjVuzO
         MZ9w==
X-Gm-Message-State: AC+VfDwfdhAjE7JBNr6y/7wd9AFXYscJIloWiKslh2oWHH9JgmSyJqe8
	KKPHyRvHCPsDqwzQoXE7eYqlOQ==
X-Google-Smtp-Source: 
 ACHHUZ4CeNjN6dEni8tyfgYEbyM8ejjEVm8OHV/gr0I9cOmBWMG6V5ywEC801CZKE/maISgSoiHhrQ==
X-Received: by 2002:adf:ee49:0:b0:306:3b78:fe33 with SMTP id
 w9-20020adfee49000000b003063b78fe33mr11199720wro.32.1684851751343;
        Tue, 23 May 2023 07:22:31 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 10-20020a05600c024a00b003f423dfc686sm10083928wmj.45.2023.05.23.07.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 07:22:30 -0700 (PDT)
Message-ID: <1d3ba1d6-ff91-eedf-90e1-4ef5b16354c2@baylibre.com>
Date: Tue, 23 May 2023 16:22:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/7] ASoC: mediatek: mt8188: separate ADDA playback dai
 from capture dai
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-2-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230523021933.3422-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WCADYE3YLLMBBXNX4D3Q5N6RGT5SWSXW
X-Message-ID-Hash: WCADYE3YLLMBBXNX4D3Q5N6RGT5SWSXW
X-Mailman-Approved-At: Wed, 24 May 2023 12:22:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCADYE3YLLMBBXNX4D3Q5N6RGT5SWSXW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/05/2023 04:19, Trevor Wu wrote:
> MT8188 will support SOF. In SOF, be_hw_params_fixup callback are used to

Can you write what is SOF please ? (Sound Open Firmware I guess ?)

> configure BE hardware parameters. However, playback and capture stream
> share the same callback function in which it can't know the stream type.
> 
> It's possible to require different paremters for playback and capture

paremters => parameters

Code looks good, after the commit messages fixes:

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

