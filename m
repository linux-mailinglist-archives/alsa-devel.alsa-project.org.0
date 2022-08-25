Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4CF5A0FF0
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 14:05:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04052823;
	Thu, 25 Aug 2022 14:04:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04052823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661429148;
	bh=+CMZ0FvLzdtVuLkFyTi3IqHhUGrcRoY/oIYR22emB+k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QK+G2O5Znc7jSjq41khjO6kEoqDh+IYYEtOIi4wMFaIF3EqF1dLDRvS+NzrvTyKCY
	 cEp4z2hVb8JK4NXldsZVAENDP3xakZplRl3excbiF/BeDgJ0fRDGNkV61y75pdCiNe
	 3mmxmkbpGmOLvJ9qAleXWVV+ZA2miS1pjVB7EuhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5464CF80271;
	Thu, 25 Aug 2022 14:04:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA9F6F8025A; Thu, 25 Aug 2022 14:04:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34CCBF800C8
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 14:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34CCBF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AC7iwM+I"
Received: by mail-lj1-x22b.google.com with SMTP id x10so19220616ljq.4
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=/aAGWIDmltGqXOS1ncXoIYBBvj6+VUj5xGoOzvsU0MA=;
 b=AC7iwM+IU6rZ2DikNLEp56ucV1olYMqe5wPpPx5IJcqfDfIwnjZsXq/r18dgvyR9gy
 VpZuBNdAqojv/7IkgmQLq2E8XyGHApvRu6J8P2q3nEPrFKj1UkdMqnL5TP6VdIY7j6Mw
 uORdf9m7tt4x4PGKy0ZA3snFXrGETle6kJDRZWR/RNcj/fawcnaYbOOzJgfBBzJbvYBy
 tQRDi9nBlFRZB7FOip+qeTQdHflXlM5s2JaZfH60KNK60c7aujOfOuzs++8nIWce4lSk
 /oJ/keczT8JhhPHJ1ybwzx4sm+o79v5xZU3u5Z+JzrJOTkQyTjYcX4vzv3P6u7aAnUpM
 41Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=/aAGWIDmltGqXOS1ncXoIYBBvj6+VUj5xGoOzvsU0MA=;
 b=iTHtvor2oTPY+NOvE3QDsXZ1Bc1oAvnzVxyWudU51HmCcqiwnd5bpNkX9PJoNiatr+
 9ECTNRZ8tv7SLmA/nTQdaLnoqDk4n2bVvfYjp6jJIXvh44WzW/nx9R6td8+sdErBbqAc
 MwAdwp51clxz78toFTqg38r1WOQDUzTOmfrMMINbbRx05iIoje+ZAk+AthjuhrPmH2mG
 WiU9AW7ZW77Jt/dnTdfQdzrR5v0LE0uKvoRmkWPJF3OXaKxIUem4OF1T9mB3J02qKs6H
 e7uiJYx4thMefyOBhgMcqpxVlXCAVuJmDr0mjLJN/EqFCz3CSTNzZck7tNMBVr+Rx1c1
 jFcg==
X-Gm-Message-State: ACgBeo03BLGB+UxTr7hhmRq+Bzd7GmtvqJZ4ZDBFa81EMQekzqxmt/Rv
 TU7sa2hMZNCa5b6SpxnyitnU8w==
X-Google-Smtp-Source: AA6agR42/GKcvjXHoKZTIcWaMOnISvqmUCz5H3K5w7VvlWmt0SgXX+Q+rpIDqNHTEiSTnkRLIymPBg==
X-Received: by 2002:a05:651c:2112:b0:261:b9c1:509 with SMTP id
 a18-20020a05651c211200b00261b9c10509mr1078828ljq.39.1661429076514; 
 Thu, 25 Aug 2022 05:04:36 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a05651211eb00b0047f647414efsm460280lfs.190.2022.08.25.05.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 05:04:34 -0700 (PDT)
Message-ID: <99dfcc39-ab1b-1b24-c6b2-67de5509f5ac@linaro.org>
Date: Thu, 25 Aug 2022 15:04:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: iio: Add missing
 (unevaluated|additional)Properties on child nodes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>
References: <20220823145649.3118479-2-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823145649.3118479-2-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

On 23/08/2022 17:56, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
