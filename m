Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5B58A9F0C
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:50:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08A72EDB;
	Thu, 18 Apr 2024 17:50:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08A72EDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455441;
	bh=lb+10Z0IsQP6fdKaH27sy53CFmYG4HdNoIjZt107yr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XqTTaHUwGoChoogImWaMQP9hTOhCyzoe+9Is4T61h6xOhJ71RxYLFlLjv2Tge9LU8
	 N2ZtmjiyKtm0ipq+NSJa+WGEHj6pwyHt1Iv8iJ93RElVGSvznU7KrHo/4h/hYZ9qvK
	 /4f/ZEoZkaneXlqz/4OEIjSLU5kymR0pK0Xo6a3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D085EF80CBB; Thu, 18 Apr 2024 17:46:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27613F8069E;
	Thu, 18 Apr 2024 17:46:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 515CAF8026D; Wed, 10 Apr 2024 16:54:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31D9AF8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 16:54:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31D9AF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=wGHQuqdJ
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41735439872so3877205e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Apr 2024 07:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712760849;
 x=1713365649; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UE+4Y18rqT6MP9pTdsa016UUd/maawQyVReuqUWJA2U=;
        b=wGHQuqdJ4BybuSORKKjGxQ27RZzt4lnDoGTi4B5FF3aon1oJR0qlTshx+I6zV5vdPc
         ftAAIz/UXRVuGaIbBZ0PD3bnzLrP1URfQKGR6LLOE8BfpdtZMS2WTnWZoEj3X6F4ZI3J
         eWthwhnZPMvWTjH+1fu0R2UxB2NZzPpqtEkm+RbFf4d9Imu96gwR3lpAoYUX9B8GmYhq
         F8G1MLYERkZxKWChtAWXUObsRwoTIuPSQ530a6BrI6lBcM0dKlOu4Mh+wyBNc3uK/ORk
         bjc9XiRNYbadOv/YiTvUvPcgmCs7IdJ8e1cMJS2mVDlvtkjgMizB0MZETh1qGoXXgeOs
         srnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712760849; x=1713365649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UE+4Y18rqT6MP9pTdsa016UUd/maawQyVReuqUWJA2U=;
        b=kXb/zuzHPts9qtAo5/Zy/+hNvQuhdblSOpXbV7pY4E4pjJqZRR/bGJ4MnX4ghCS0lJ
         XBXSoCSTGNakDv/XMnsLm8C9/nN56D52aCawPSM1qtUivcpQ2RfMMrNXvtePybFU9UJ5
         cd7pv8hAx6EfzrAXrrEuHf7eIE+7Cr+L53mqXs+3dkSN/A95RFQFQwnD0FVTXzhPdIOe
         McJi7QdlwOWS1duS55dYhbuh+37PxK3p7nJi4yaTcIERFjAq0xfzBJQ8YkoyGBEFViUc
         vjasRAAUdQbv4Xgi0lyZySHMBz9x8Xb2O4YvOYCIj7lQe8x/PRAsamQ1NttXtZ2D+jWj
         WwSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhpy5WZZ2wX7Vnhnl2UeZukwhm263EO5EAAWtEIhNiJro/YVRYM+FUyGBvncnXgR50LQ4jh4zMJxuu3uMRR1bL+HSxrElMN/3VeUE=
X-Gm-Message-State: AOJu0YzVhwnKnsfH7mUtzeamk3uN5M/Ig4v+8c0bDS3h6Ollxar8rQWA
	U1GxU9Rcy7Z42r6/98hG6u8JQx/wzffHxIlPuanN5krzZfE4F+TeImowfiuyRrU=
X-Google-Smtp-Source: 
 AGHT+IHCUNg5SsYHXd3cnIQYa7aR4oDCUcNCW6UqXLuavJoCReIkeODB8539jlTtqakTtMbi5H4ORw==
X-Received: by 2002:a05:600c:4f44:b0:416:6abe:2975 with SMTP id
 m4-20020a05600c4f4400b004166abe2975mr2002047wmq.15.1712760848874;
        Wed, 10 Apr 2024 07:54:08 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 gw7-20020a05600c850700b004146e58cc35sm2526850wmb.46.2024.04.10.07.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 07:54:08 -0700 (PDT)
Message-ID: <6506db51-121b-4579-bf14-0ab6e33fb048@baylibre.com>
Date: Wed, 10 Apr 2024 16:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/18] ASoC: mediatek: mt8195: Migrate to the common
 mtk_soundcard_startup
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
 <20240409113310.303261-9-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240409113310.303261-9-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FIRHOK6CWXCLLQN2NDI7WM72M24MXDQI
X-Message-ID-Hash: FIRHOK6CWXCLLQN2NDI7WM72M24MXDQI
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:46:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FIRHOK6CWXCLLQN2NDI7WM72M24MXDQI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Way better with common stuff ! :p

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> Add a const mtk_pcm_constraints_data struct array with all of the
> (again, constant) constraints for all of the supported usecases,
> remove the duplicated functions and call mtk_soundcard_startup()
> instead in all of the .startup() callbacks.

-- 
Regards,
Alexandre
