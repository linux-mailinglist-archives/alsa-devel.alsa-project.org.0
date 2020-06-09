Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A795C1F36F3
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 11:20:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC6251698;
	Tue,  9 Jun 2020 11:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC6251698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591694409;
	bh=HVTAM9dOuGm4CHnxBb2zwcF1+Teg5TsnaqIW83rajp0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=okbQaY7saBtCr/Rv16lOZB/AmbyzIhfj+hpVpnuAVbNeJg4i/zve+Sx1YeWdRlO75
	 OnC6AgsYa2B5byI0WFaMWm7zgfdcAVWl2qxxYOEBjInYO3Grsst5H+eEuV/Apsw06a
	 B3Q9w/iMdd+NqobDpkYsW1T6j2/pVx5ovqWjbnsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52AE5F80291;
	Tue,  9 Jun 2020 11:18:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CB3CF80292; Tue,  9 Jun 2020 11:18:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF749F80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 11:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF749F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xxllwIBF"
Received: by mail-wr1-x444.google.com with SMTP id q11so20458229wrp.3
 for <alsa-devel@alsa-project.org>; Tue, 09 Jun 2020 02:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Lmml4M7Z4ziTfNEmNEtKQKmy1BckR3tOh87Yi/zhEI=;
 b=xxllwIBFPa9hy5DLrW6cRSoDJI0zz+5+HQdj5tH70yCDS4JGPOjiCzCG6cM0MiYQPj
 EfN+FWLXPHOhUhSVOJapOg05fq93VbU4BX4NmShGrkt1vdWGQLaUqxaxUkNSmfMcrr/R
 UIcV6z++/l1r1r9i5WD8Y4LH1Xkb/b5mrdmyQJYPWnsHXgyTXYcpEMZqtgTtoAkqTRcq
 uMZ2c6JH8Ayy6em7FDrIY5UikVpiGgFfvK/PmsJPxhv8cTwSt0xTcjYncQXEl295c0aw
 j0dzuvh0i+jvSatnu6RkKNPgKeMMYyectdUBldh8SwODrFVWkbJM50vg1JCeBjZsa99s
 DWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Lmml4M7Z4ziTfNEmNEtKQKmy1BckR3tOh87Yi/zhEI=;
 b=A1OGOy3wYrn98BBKelXyonq2oPnNu0GXHV75u/JX0KeB7TBoPXT29jdIP2sCSltYX/
 +QOiHIroQF94kwzUHcumutlIecFE8nj/Z8qeeSLRJ77wsdJsQoAb5MFCNBUBLZZCwU53
 YdhXt1YgUlcp3NC0QE0isqRjBFO8tLxlT5gxqeUf15/i/29qN2NyiS12t930OWw7jWn6
 ORMfVKtbjiz0JWenldMhYnf+Xjs6BaTwIQ9cWFQSI+GPzELC7FjBSjlU+vZvjiSAxdSk
 EzTzgBYqp/fSVDwfzXRKLIMcc1np7GYC5Zv9fzm2BJOaVArVP8D10P+0XHwb7H50KQWK
 NpwQ==
X-Gm-Message-State: AOAM531fmq+k1OY1dOAergIn+USj7z0GbeOoxSVQ94APgGlLgbq3lJa6
 Kh7OWGLuvyWSFKQzw71xjwl/uw==
X-Google-Smtp-Source: ABdhPJxCzTpJcd7FYZjv+tgHBCwJsyM/1n0vfBmpn5hNpRsPMUzZfa8W58KoFUQGFjFAjaNdUdircA==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr3302320wrt.322.1591694311979; 
 Tue, 09 Jun 2020 02:18:31 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id z25sm2238686wmf.10.2020.06.09.02.18.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 02:18:31 -0700 (PDT)
Subject: Re: [PATCH 1/5] soundwire: qcom: fix abh/ahb typo
To: Jonathan Marek <jonathan@marek.ca>, alsa-devel@alsa-project.org
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-2-jonathan@marek.ca>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d5dfb83d-eed1-ed09-e305-781cf5a84afb@linaro.org>
Date: Tue, 9 Jun 2020 10:18:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200608204347.19685-2-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
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



On 08/06/2020 21:43, Jonathan Marek wrote:
> The function name qcom_swrm_abh_reg_read should say ahb, fix that.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   drivers/soundwire/qcom.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a1c2a44a3b4d..f38d1fd3679f 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -114,7 +114,7 @@ struct qcom_swrm_ctrl {
>   
>   #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
>   
> -static int qcom_swrm_abh_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
> +static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
>   				  u32 *val)
>   {
>   	struct regmap *wcd_regmap = ctrl->regmap;
> @@ -754,7 +754,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	if (dev->parent->bus == &slimbus_bus) {
> -		ctrl->reg_read = qcom_swrm_abh_reg_read;
> +		ctrl->reg_read = qcom_swrm_ahb_reg_read;
>   		ctrl->reg_write = qcom_swrm_ahb_reg_write;
>   		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
>   		if (!ctrl->regmap)
> 
