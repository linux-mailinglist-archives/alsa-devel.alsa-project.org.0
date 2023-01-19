Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CCF673A64
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 14:34:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 692E2809A;
	Thu, 19 Jan 2023 14:34:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 692E2809A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674135296;
	bh=9fRUhLaiFZ8BORFF5LiOcuI1miyZfTirJjpWdUGbMNY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ITnT7oTmy8UYCboMIUQrb3g0xbrTkRfSRrQDygsGVhZ+QtYoXvBapKOzGjBiaA32Z
	 +hLmZ2KNz6836WGFgtPSYYnhhJ5Aiu5MTfYE5aZcnNg3MDjs+zJrLRji58ITcdoWpu
	 96NqHbFURthUBApm41ryQFZgtR/xPdJmzOG/r7oY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4EE3F80543;
	Thu, 19 Jan 2023 14:34:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2C94F804F2; Thu, 19 Jan 2023 14:34:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6A31F804DE
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 14:33:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6A31F804DE
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CCw59ZE4
Received: by mail-wr1-x42e.google.com with SMTP id b5so1924273wrn.0
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 05:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RjThMdha5LNwL1tIcbTJcnP9YVuxnfVPyJu5t74tMoc=;
 b=CCw59ZE4sZFlC5z+0Xvd1NqLmD1Rtb6Vsr/EigP/UoiEqBqz+4ClMcrfcGPvzeIMLg
 gke1TuWjpacEm1gA2dA/W1Sa71BH78wxBOffwE+J2XdxbXeZvdd0qno8KmU9W0C9qsol
 46oB4xNoOYkwWLG8DFQy+SeyIvbbTusxkTA/wueVPaeGF/3Jt3duS8zDYLySonBKQIoh
 FBxM38H7y61X2JC+8vRC0S8pw9gPlYQEkrsxRPL6ytFUpqGCcxXNzD1UyHVeFA3RVxyz
 5TZCMf1KekC1ko6pQPS3ttcivi1bVea3XerJVhXb5ElpDjwNa+UYhXxVqwgMYJWbYfYM
 yAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RjThMdha5LNwL1tIcbTJcnP9YVuxnfVPyJu5t74tMoc=;
 b=fkrJHrSNemJpa5LvitAx/e5Rjq4q16AZuK+YYJdRpaBHLd8sxD2uLSmOJOGHkJzOgo
 xFAmCJbrbiD1vY94wyWDYFwG4L2IuUSTPI2AwTLrZ+NERAtWCon/bpkCj90c0y5X0rd2
 rjs4t/F4Unr4GqWFdKsDbCPnCs4mledufn5KqR4sfIdsR1Xe42A9JcXJS9jDx3+qQ2NT
 duBq9cMurYS0TLUS46jtXIkOyEzu4eIR8mBdk6EsjT8AH+9J2GTuQ+UWn3yuvGlERJEA
 5/SD1AbNEDvJC0Dygga5am3Qd61Z+tgPLWXhqMXWYLKFV7TupOFR1yEiq1gNJq4eKzp3
 09rA==
X-Gm-Message-State: AFqh2koMzs/zGZAgGe6F80bfhguYPnBCdErnqaL13wgq1j5ySf56Se5R
 f4EwGoB1VKFMu0RFdmEz22iXpg==
X-Google-Smtp-Source: AMrXdXuKkqjOj/Snuxtk6R5TZv/J/HGKQ+nDtuYpPG1Dg+MLbpR6GJU1qnsPUo5Ge44k67XChHhpQQ==
X-Received: by 2002:a5d:5a96:0:b0:2bd:fedc:38fb with SMTP id
 bp22-20020a5d5a96000000b002bdfedc38fbmr10355818wrb.3.1674135234101; 
 Thu, 19 Jan 2023 05:33:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 t18-20020adff612000000b002be2f18938csm3906606wrp.41.2023.01.19.05.33.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 05:33:53 -0800 (PST)
Message-ID: <8c3b7821-72ba-41f6-a362-527b73c33cac@linaro.org>
Date: Thu, 19 Jan 2023 14:33:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 6/7] arm64: dts: qcom: sc7280: Update
 qcom,adsp-pil-mode property
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
 <1674131227-26456-7-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674131227-26456-7-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
> Add "qcom,adsp-pil-mode" property in clock nodes for herobrine
> crd revision 3 board specific device tree.

Why? Each of your commit msgs should answer to this question.

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> ---
>  .../boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> index 232e1dc..e4afce6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: BSD-3-Clause
> +

Not related, drop.


Best regards,
Krzysztof

