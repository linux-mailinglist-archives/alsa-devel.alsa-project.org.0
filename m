Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D6827501
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 17:24:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E560826;
	Mon,  8 Jan 2024 17:23:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E560826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704731048;
	bh=nRlGjB6MLEPuVqKHt0cbyigi8lxe0Du61ognLit7izw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ubNOhQzIM6l3ImhmUbxSIKZees7A35AqeC5GCrxPPV6XfoL7ZOjvEmBRvo/xlvT6I
	 7JRajWCLnvtQE4MJyL+0Nbfa7ar/URX0G0F5Rh7gFoY9PF3rk3FzmOuOPMCilQ/SL3
	 8tuFf6N6C9KpXTkyqlFxInBHYPPLaIwgGaAGZBtk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A163F806AA; Mon,  8 Jan 2024 17:22:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBB13F8069C;
	Mon,  8 Jan 2024 17:22:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 720ABF80254; Mon,  8 Jan 2024 11:03:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD18BF80086
	for <alsa-devel@alsa-project.org>; Mon,  8 Jan 2024 11:03:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD18BF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MTHEHF/j
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40d5a41143fso19230835e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 08 Jan 2024 02:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704708233; x=1705313033;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4ZGUazryB+36ZjwWsoSkOiJeHXguphjqlafJdYJv/Do=;
        b=MTHEHF/jTgXDHGLr7m9//KrrqVfqAAINZHZlFqYJFgIpfIFb4KuRhepb7R7+cqR+6L
         vvgwpy84iHrYWqlY1enWbQ4efQzY//Qc9of880sqjaCDERTQor+AhHjiMm2TrdVH8TbJ
         8pMZRlbYG818apy5Mg6n64RZVdqj5vVatdRxGYLjM4iUjIKWs6JlVimeRXx6XHzRkEfN
         77JDrHGqhAfHTnib/zIshwurtRjdCFHKAFzNjUuwglU9626Ls1PsGlvFyPV9z3HER/Su
         wFQdOQDswXSVvd8e/16RPb77afeMJPmatGV1PT03EUSQMbQalsfw6u4bIyi1zfEuDHYt
         VZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704708233; x=1705313033;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZGUazryB+36ZjwWsoSkOiJeHXguphjqlafJdYJv/Do=;
        b=hdaA7+bj1ZpdByCHMAu4vA/dY0pe6LvhwSxyR7VQ/woqeOTBVWv5jb5AC/awNG75JA
         WsOB7cYiKHhM3kVEfTRUGeMjRA/Voy2LHz9RoTd8ilkXpMAjzKGLhevGbHVY0UQM0nbU
         U6U0LTNIVrKBVuutzIgZN0gNiq+hL9ziWA0jrBNSy5wj7xYpt0uo1UX2/jNfrg/PBdbr
         lLcC4fy5ZKuQjclawEwrtM4/t/Qx0k4KHw/LS6I7X7Y5XiECIXYUlvjQnwLnsCMYjc3h
         BXc8o0dbq7x5imx0OkJ2fxcest8HNmMaNoI2pNd+ZxrznIT0nedzf1CztKAwQ7L4y03y
         UNcg==
X-Gm-Message-State: AOJu0YwFn8o3LmOICuoWe7FpYrobEF4Y37QWm1PmLTEHYuvjB02l3FFK
	jOe41gs8jeoCHNEc7CQeQLDv1xOZ99roow==
X-Google-Smtp-Source: 
 AGHT+IHCWbr9BEW6un50JdypT5XyBEDWjQledTpxWGMlZP7aLBqGkJRtQUqcJ2+pinmXtc0gXQQI8g==
X-Received: by 2002:a7b:cb10:0:b0:40d:5e74:89e8 with SMTP id
 u16-20020a7bcb10000000b0040d5e7489e8mr1695620wmj.55.1704708232796;
        Mon, 08 Jan 2024 02:03:52 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id
 h11-20020a5d504b000000b0033739c1da1dsm7347942wrt.67.2024.01.08.02.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 02:03:52 -0800 (PST)
Date: Mon, 8 Jan 2024 13:03:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: cezary.rojewski@intel.com
Cc: alsa-devel@alsa-project.org
Subject: [bug report] ASoC: Intel: avs: Path creation and freeing
Message-ID: <8b6690a2-4a92-404a-a846-5b099e34a7a2@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YRBTT6ZU6E4FLHPE2OU6SJWBWJWNLLOR
X-Message-ID-Hash: YRBTT6ZU6E4FLHPE2OU6SJWBWJWNLLOR
X-Mailman-Approved-At: Mon, 08 Jan 2024 16:21:53 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YRBTT6ZU6E4FLHPE2OU6SJWBWJWNLLOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello Cezary Rojewski,

This is a semi-automatic email about new static checker warnings.

    sound/soc/intel/avs/path.c:110 avs_path_find_variant()
    warn: variable dereferenced before check 'variant->be_fmt' (see line 105)

sound/soc/intel/avs/path.c
   104				variant->fe_fmt->valid_bit_depth, variant->fe_fmt->bit_depth);
   105			dev_dbg(adev->dev, "check BE rate %d chn %d vbd %d bd %d\n",
   106				variant->be_fmt->sampling_freq, variant->be_fmt->num_channels,
   107				variant->be_fmt->valid_bit_depth, variant->be_fmt->bit_depth);
                                ^^^^^^^^^^^^^^^                   ^^^^^^^^^^^^^^^
Unchecked dereferences

   108	
   109			if (variant->fe_fmt && avs_test_hw_params(fe_params, variant->fe_fmt) &&
   110			    variant->be_fmt && avs_test_hw_params(be_params, variant->be_fmt))
                            ^^^^^^^^^^^^^^^
Checked too late

   111				return variant;
   112		}

regards,
dan carpenter
