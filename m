Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D39219C50
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 11:31:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D79CC86F;
	Thu,  9 Jul 2020 11:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D79CC86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594287059;
	bh=Grm6wZZePn4PWeEcalv9//lHt2h79JYkeg3XIKfUGAc=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=leHJfnX/6zvBxtUlZL6+eOTY8K12E3QGx5s5BPQPcziJgyzoIoeZDbET/vEobUUdi
	 siBOv11tElDe3A6Tk42cOatalpDTpmTw1u/JBfqoyt4D4KvCe9a5vo/s2C+AlofFSs
	 ifYibUzenbXmxIx+4/SsWWHQI4/ZNkX0vrlw49Fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18369F802E0;
	Thu,  9 Jul 2020 11:27:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C058AF802E3; Thu,  9 Jul 2020 11:27:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20565F802DB
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 11:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20565F802DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="deM0ouJ2"
Received: by mail-wr1-x443.google.com with SMTP id f7so1602448wrw.1
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 02:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=9zbcH1ET6mTpiWM4s+enxGFR1R1N7AIvSGt4u+PK5Gg=;
 b=deM0ouJ2Ofrd/TtZmY2cqH50N6qrVDBpP6X8oXdeTC8ELze/OVs4b9MRfdyI9amfxJ
 VscnF7iCk7FvDwBtjoaErnn1TNbhfbniBxC+/cLmmZvzJeXDzbrHuDHBAyf6AHa0Q32e
 BR2UIfIOKJg0orXs/KZraI7loPPyUHAxfW4MllMfINw+nKmYZ2VyOl98aTbClfPquVu1
 87sneoL7eBQehOHrmyyYc597f4ZIyUshyuEI6fsiic8cE5tha5h2ZPnzOt/omBbM/KWz
 ChKvBgPzLvKpvuBQTl7GXwsjdKCkQKm09wwRW0phVPEOVLHYuRT+9XRdWyjprT+BeDou
 J0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9zbcH1ET6mTpiWM4s+enxGFR1R1N7AIvSGt4u+PK5Gg=;
 b=TU+0X6oduVZRTMGPkNS83xG/lb2AJdqfAmS0BmbOVv6aQmuWlESyU40fl0o/wgqA3Q
 gk/gL9mr93v01ojLpneRCj5FwTUNJFueWQzlyomoahwwcI8OtSHxeQjRZA9PJsp4NL6+
 PMaEaZPPdKx3DSesTI6bWX/0KBoL09iQvMzkua3ZV14v+9uZTfvNZPO9KkBd9T2ODkqM
 b/pT4PC+uJ+0CKvLDbMINcsCd7stzJfeLf9oUlzoLzvsgvDoxNZJNcbIRY5PzVR8VGK6
 auq9386wYcScdV1gsMXP3RgVZpUlPXr8N2XRAW7vNyk540q9pWbEXEKy3AECIqTZ2VCg
 Wqtw==
X-Gm-Message-State: AOAM530xSsxCHpUxHH5Itv6xnUHt512WfC4xSYaHTAvVWr3cYyrllLWu
 Xhjd9fu8ANFhTZSV8ml617Gtwg==
X-Google-Smtp-Source: ABdhPJzPjHBBz8yv52oXgA3W16ls5Wg2i8Tm7dIMYZJudQJQzVrpjfNq8dEzSUd61McW+eYmpbpeAw==
X-Received: by 2002:a5d:6a46:: with SMTP id t6mr64493990wrw.374.1594286827525; 
 Thu, 09 Jul 2020 02:27:07 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id c25sm3579138wml.46.2020.07.09.02.27.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 09 Jul 2020 02:27:06 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] dt-bindings: sound: lpass-cpu: Add sc7180 lpass
 cpu node
To: Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6b6b0e38-9c04-e065-8a43-ccfec260d60c@linaro.org>
Date: Thu, 9 Jul 2020 10:27:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1594184896-10629-7-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 08/07/2020 06:08, Rohit kumar wrote:
> Add dt-bindings to support "qcom,lpass-cpu-sc7180" node.
> 
> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> ---
>   Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> index 32c2cdb..04e34cc 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> @@ -4,7 +4,8 @@ This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
>   
>   Required properties:
>   
> -- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu"
> +- compatible		: "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
> +			  "qcom,lpass-cpu-sc7180"
>   - clocks		: Must contain an entry for each entry in clock-names.
>   - clock-names		: A list which must include the following entries:
>   				* "ahbix-clk"

Can you also list the clocks that are mandatory for this SoC.

--srini


> 
