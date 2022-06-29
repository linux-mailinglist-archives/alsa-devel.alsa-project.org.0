Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 244A655FD29
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 12:32:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B74D7163C;
	Wed, 29 Jun 2022 12:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B74D7163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656498723;
	bh=ZmOUnHIpOX2r6TGL0u/z6eyuK5XUHkG24fvr2IYPnlM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RS3/o3lLqZ44L0tjlseolOx4gEuw8+Cnf7tbESHxkCFs/iTNsVzjZ4CafUXMDnP7H
	 c9QFZnQb/nsGm4pWB+7SNOdE7yzpp+n782AinjrLhwrp3tVZ5Ve8n+iMKfaNoN4ki2
	 cCwtiMZO2ykils0DCQxz8ympoCAvZatpFBe3V8nY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DD97F80245;
	Wed, 29 Jun 2022 12:31:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5F89F8020D; Wed, 29 Jun 2022 12:31:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED3D9F80115
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 12:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED3D9F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZRXo/mzI"
Received: by mail-ej1-x62a.google.com with SMTP id h23so31575356ejj.12
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 03:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AKUBDZoE/jvXM2oq8qe7PZHH+/UTyEsmP4FXnOhfAlU=;
 b=ZRXo/mzIwR4NbglFfMzMKqwfK/xTZxfEsZO10kcCW22biN5F930DKToHUO+2ckttkj
 9EMLOKq/8ELduHQr+tDpCKoLJgh3w6vXB85mhD3/CX4vCxMCI4qTXw4eNHg9kHrpfX0x
 NXWCDcGBrhkQ5ZzTLUruHvztzjzHQqGN9fldjzF+r3ZdZbnoiWBNxqaJ3eL7UjlqQEWr
 /XWWd2W2xv4T7JVs0wzrXT9XMK+adcZ0HC/aGqVt7AtRqZpBMT0GH4QtcdHw5FIk6y/k
 q0dz6pSLFCTBlyxSQ+uua7/Fl4zonstATCEhOpcAmX6f8/sFBNuwZFUiwwXLghAkk2md
 X22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AKUBDZoE/jvXM2oq8qe7PZHH+/UTyEsmP4FXnOhfAlU=;
 b=wU2Afm5/UHaDaA21i4SSEYmbrJ3YA7zMeM1INcEZj5olC32XzmuwLzZhZHyl5bvCBj
 8kEH9Vnis2dFbWoTWwGtE2RbdPOXEbCZdWii6HotqkSkr1ogKuW/vgdNjKj5guN0SCc6
 VWN/bA4WXgwJZe8IBbyOAt5DYvH3PSzVXj591f/YMSD2xKyxSLqGIGwCRIiAoAjjv3dA
 h7igpNdqefXlZwtb9bnq0YDK9zjLJdI2Qn6goNfWtE5aVikd2Gr1cQnJiJAybRz6P2X7
 rb+FNK5gnmqEBulmU1CaSe76NITZ2SZfesEKOU01Efkj6CWyIr0CLzkOao5aLiIsc0Ey
 To+A==
X-Gm-Message-State: AJIora+s83XSAAAij4et53LungukOmJ6HnUa0BPui8cCEa8TFCRLUkhD
 811LtEmbElJJbnL0edm8GwX9mQ==
X-Google-Smtp-Source: AGRyM1vR9Bfc4Cn78gAiU5c5r+g5latY1NcXNJRE71q/O+RjUbLzca9egV2jhf6YZ4IqQ90HkFrG1Q==
X-Received: by 2002:a17:907:1b06:b0:6fe:b48d:801f with SMTP id
 mp6-20020a1709071b0600b006feb48d801fmr2572523ejc.322.1656498656240; 
 Wed, 29 Jun 2022 03:30:56 -0700 (PDT)
Received: from [192.168.0.184] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 g5-20020a17090613c500b00722fb3c99bcsm7550249ejc.203.2022.06.29.03.30.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 03:30:55 -0700 (PDT)
Message-ID: <de5a9756-50d6-2a09-d357-6e419b57dd5e@linaro.org>
Date: Wed, 29 Jun 2022 12:30:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] ASoC: dt-bindings: fsl,micfil: Convert format to
 json-schema
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1656386005-29376-1-git-send-email-shengjiu.wang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1656386005-29376-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: shengjiu.wang@gmail.com
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

On 28/06/2022 05:13, Shengjiu Wang wrote:
> Convert the NXP MICFIL binding to DT schema format using json-schema.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
