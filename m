Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B342C729D51
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:51:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27251822;
	Fri,  9 Jun 2023 16:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27251822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322277;
	bh=XUs3tA6Gdk7D8LdQ0riVolUxgA/Agk0/zvbPAgG6xiU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gjZ7sbWG0Dkpt4goswJjJXeiPJfHNEHHZjmHIIO3djEugitxxc2FR33Du7Xvhx3sK
	 Xo0YFCeoZQv51lHS6b5QH8ilCgyaZCi4RF3P3pJsvrloXWszhGAr/6mJPaT1BoKNyZ
	 oP0D2vwedwIJe0dsN6Bo7bWOrbqZzMCUnKOyBSFg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDC46F805ED; Fri,  9 Jun 2023 16:47:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5008F805EE;
	Fri,  9 Jun 2023 16:47:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 961B3F80199; Thu,  8 Jun 2023 11:31:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F4CCF80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 11:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F4CCF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=ZjkbQBZm
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30af86a96b4so253579f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 02:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686216709;
 x=1688808709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K2nCVCrZOkwudtPdu8IfLznRzJa7lQBEe+KUEz9jSjI=;
        b=ZjkbQBZm7Dw969pcsyWCSsJ0MnYKqEAQbXFJU/2sVFXKohiH6CJEfMUuOF4ObEDdQU
         go/8wjrFCceGpauw8oxTdLhFGSVRBS1tep/cUye9RPDK1KXSaUUnBUZn4eT9x/3E9hqK
         KUqBHec+rGdQmlhmzLJAH5Bwy15Fx6HWdvU6YcV55HwzcG1Z4lFR5nnZdFQoskea1uoi
         LgjUYR/eIfkKyCCyHsikPfm9BeZeM/dVdifqlLMFI4N6F89SwU5lVL868pt6Fd6j8qOR
         ftpRlCewejJ40XYXibu/GvzJZ8j1NvCp5o+5i4gBE205mGaZhCMXMVXpSwrB5fFOEqxW
         GkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686216709; x=1688808709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K2nCVCrZOkwudtPdu8IfLznRzJa7lQBEe+KUEz9jSjI=;
        b=Y8XgAgZmX+JSzwJVbvSpd4qS2rPvTceFIq+Y0ryuLK/cvxRU1L+X1U9fMLp9PBMXgo
         fmHVraX+1/w8evH/K55rxAADbUqQGzZfbaYaiIDYSScgccryENqqpdcSmDsDO1/vwxtR
         VazSBljRgoxkmUqH/DOGqGAR8HGCuoNSpLwIVRtQv1j4nFLoBhGO3thUvzE1DzX/+TPV
         2euu7AqVuENmzPWa8uNOR3SZtuozSfjqYtaQQFoUvSTMHmvHGrY72qPVQKBAh9CXAosH
         Ik9sfMmzJbHt0ClJJeut1lozhICKtwyWHrU2WEH/gwEXlMBTmow4sbWrftUxZhR0wf/2
         VaTg==
X-Gm-Message-State: AC+VfDxUROJNm6eU/nxxb8ZKUzcM1YWGrwcBWPjiCkRv/bx9J+gWZCVt
	fekQAet4nxmsu5bK2zF+a3D49A==
X-Google-Smtp-Source: 
 ACHHUZ40NzTTDqWA9zTHhxTdub04YOLlEmvfv0QlDvpHjEWVBGENTRh9QrlohidOCVV9ZUBd14W1nQ==
X-Received: by 2002:a5d:490f:0:b0:30a:ea8b:447d with SMTP id
 x15-20020a5d490f000000b0030aea8b447dmr6135595wrq.40.1686216709383;
        Thu, 08 Jun 2023 02:31:49 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 t1-20020adfe101000000b0030e5a63e2dbsm1018641wrz.80.2023.06.08.02.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:31:48 -0700 (PDT)
Message-ID: <adb0c4f8-f2f6-c587-9452-2205d0180ad7@baylibre.com>
Date: Thu, 8 Jun 2023 11:31:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/5] ASoC: mediatek: mt8188-mt6359: Compress of_device_id
 entries
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, dan.carpenter@linaro.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
 <20230608084727.74403-2-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230608084727.74403-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 62ZOXYBZRGK5V7VQD77MFZ3L6GKKIOCQ
X-Message-ID-Hash: 62ZOXYBZRGK5V7VQD77MFZ3L6GKKIOCQ
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:47:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/62ZOXYBZRGK5V7VQD77MFZ3L6GKKIOCQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/06/2023 10:47, AngeloGioacchino Del Regno wrote:
> Those entries fit in one line: compress them to reduce line count.
> While at it, also add the sentinel comment to the last entry.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

