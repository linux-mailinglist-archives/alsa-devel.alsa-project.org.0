Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9A47F5CE5
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 11:51:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B8FDEC;
	Thu, 23 Nov 2023 11:51:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B8FDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700736678;
	bh=jy9w09chNfTgbuISwkPfseakzS4uRSoBipRLuk9ZcTk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kaiZ3DrJLT3VDeQlW5mivKepLyJrhYxxzMvShXAqcSbSi+TkrExSztMtKzFCVXO8L
	 FEJ6LVo938RE5Cl2D2uC+bQ7pVk3hqttxNllXgLsmP8H7ILOcjmLqvcp2L81Exb41F
	 SEdfXKrywJ16/nN0hZ5UiubcyzT2rWExiAs8Et5w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24F5BF805C8; Thu, 23 Nov 2023 11:50:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CB2AF80588;
	Thu, 23 Nov 2023 11:50:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48236F805A8; Thu, 23 Nov 2023 11:50:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51584F80589
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 11:50:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51584F80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hqOssCPk
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a00191363c1so97367266b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Nov 2023 02:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700736623; x=1701341423;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWmsEY1Lz0iuLAhKZp25wl97iTeJOnsV2iHbTLKdd7A=;
        b=hqOssCPk7yvBq/2hFT73SrwJb/1bTcV79sleBjg3llYAd/uv4WcPs2e4mcdM0J7Pim
         DhfTbveu+uC6DPABzM5RoR//1HVZm/A3/Gtyuw6Fl2pDh0rPK5y0nOGUGEoENNQuWW8l
         8xsU8zDsJ2FKaA/7w6214L6foS+efqxq9hgLsQ1U/FkSy7JE0bPxz8KQAO0xQXu7OJFh
         APWFQhmAiZoRN8syoiKb3me5d7jMhtsf9m0gvC/VqY24uscOnGIumPqs2z3jXCP6j9aX
         Sv2yjrXsafh8k8knPQx32XMbhQTvcWqg09N/9UrJgWnKAhUdfdH0N4gw1D1VbA+jd0Uo
         Q61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700736623; x=1701341423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWmsEY1Lz0iuLAhKZp25wl97iTeJOnsV2iHbTLKdd7A=;
        b=DRMsCfVGQtzFcZrjrjvdzALk2KFo4O5t1QpVCAGh8mt4pWY2YMmlMPK3+cboO4bRWr
         9amCh+1I8kB2w+86I714FBtJyCZxE2cm9KtEzUh0UqB2XiKAWnNKHWO9vX3pK6WLmjHA
         dibHal3Tih7N1QE/R7+647VYRRBZETPR7ssRHIYMLbNnhPyVUN1/Dm9ks1nY/5ggg5Hm
         OF4qaoceAqlWEcdtuAS2nXD51tIOZYLmZURSqXCzWYJDenAwsRD9EDKgqAWgujupFwWX
         u8znY4l3Htd0zjo1hy4sbfCT8C/xV44xlMnjuGI65ZaRQEnkN6EXe5s5AEuDIThMJZTw
         yIIw==
X-Gm-Message-State: AOJu0Yz5DootjdWA6M2BuPaSAfaKAa0Uf9ITwq2/vNngZbHaAulNindA
	NR3FDepf0Iujpn9iep9nQZYPJA==
X-Google-Smtp-Source: 
 AGHT+IEraM1i8wpahcqSKpNjXQf1ubzx9722VwGXlJdd0hjgZjfDv9ahWVogiErf9rtLA+YfTT4uCA==
X-Received: by 2002:a17:907:d046:b0:9b2:6d09:847c with SMTP id
 vb6-20020a170907d04600b009b26d09847cmr4337532ejc.10.1700736623254;
        Thu, 23 Nov 2023 02:50:23 -0800 (PST)
Received: from [192.168.86.103] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 j27-20020a170906255b00b009e5db336137sm619208ejb.196.2023.11.23.02.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 02:50:22 -0800 (PST)
Message-ID: <11e09282-186b-43bd-b7ef-a179a4fe8f03@linaro.org>
Date: Thu, 23 Nov 2023 10:50:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] soundwire: bus: introduce controller_id
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: tiwai@suse.de, broonie@kernel.org, vkoul@kernel.org,
 gregkh@linuxfoundation.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Philippe Ombredanne <pombredanne@nexb.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
References: <20231017160933.12624-1-pierre-louis.bossart@linux.intel.com>
 <20231017160933.12624-2-pierre-louis.bossart@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231017160933.12624-2-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NC5Y27WSA2WV5N5DKKHEJFZ7CWCUXIHA
X-Message-ID-Hash: NC5Y27WSA2WV5N5DKKHEJFZ7CWCUXIHA
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NC5Y27WSA2WV5N5DKKHEJFZ7CWCUXIHA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks Pierre for the patch,

On 17/10/2023 17:09, Pierre-Louis Bossart wrote:
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 55be9f4b8d59..e3ae4e4e07ac 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1612,6 +1612,9 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> +	/* FIXME: is there a DT-defined value to use ? */
> +	ctrl->bus.controller_id = -1;
> +

We could do a better than this, on Qcom IP we have a dedicated register 
to provide a master id value. I will send a patch to add this change on 
top of this patchset.

--------------------------------->cut<-------------------------------
 From 78c516995d652324daadbe848fa787dabcede73f Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Thu, 23 Nov 2023 10:43:02 +0000
Subject: [PATCH] soundwire: qcom: set controller id to hw master id

Qualcomm Soundwire Controllers IP version after 1.3 have a dedicated
master id register which will provide a unique id value for each
controller instance. Use this value instead of artificially generated
value from idr. Versions 1.3 and below only have one instance of
soundwire controller which does no have this register, so let them use
value from idr.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
  drivers/soundwire/qcom.c | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 8e027eee8b73..48291fbaf674 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1624,9 +1624,13 @@ static int qcom_swrm_probe(struct platform_device 
*pdev)
  		}
  	}

-	/* FIXME: is there a DT-defined value to use ? */
  	ctrl->bus.controller_id = -1;

+	if (ctrl->version > SWRM_VERSION_1_3_0) {
+		ctrl->reg_read(ctrl, SWRM_COMP_MASTER_ID, &val);
+		ctrl->bus.controller_id = val;
+	}
+
  	ret = sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
  	if (ret) {
  		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
-- 
2.42.0
--------------------------------->cut<-------------------------------


thanks,
Srini
>   	ret = sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
>   	if (ret) {
>   		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
