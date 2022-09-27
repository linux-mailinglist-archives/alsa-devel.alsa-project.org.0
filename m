Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C396E5EBCAB
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 10:03:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26DA8857;
	Tue, 27 Sep 2022 10:02:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26DA8857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664265828;
	bh=1Zxecg6HtIBfrd8/6T95b8ZbtsoyMVS8PqR/SU+TmhU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rOj4TtlJRdljGlVVyvhZL2vZtnhPPAzZxJD5NzqYmjFETAZjIr1cx8yXjVRjr8Ezt
	 xb3lr6oZoUAE7XETx4rxL5cmBNlUw7yCTktG+1BJ2pep+hb9vYk3032iPbUjh2p99x
	 ikh+10ejE3R2EezI7FPMDUA5oaEzINOt6ZcuJKcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86159F80496;
	Tue, 27 Sep 2022 10:02:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC298F8025E; Tue, 27 Sep 2022 10:02:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E88EF800AA
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 10:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E88EF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="MvvXRxGB"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R7k3vX015658;
 Tue, 27 Sep 2022 10:02:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=K8GwUiis6Jdql8ycWraGoz6gs4NTf04zXDxZqotFXaY=;
 b=MvvXRxGBqyb7c6M32ixvr8x3Sbpp9JciY/4ZSd/Mxr43HfzVWrlGe5UeGNju3KiiD+Qr
 WZO6g/DPaHXXVXvd58XR2pFydrIFils1AXG3sLF0HNJ+9UfPkBhkpVID0D4z8FJ54gm2
 MVZ13m1ie5KwCjDftB1+KWSDJeGmmRGf3/NNJ4j+X9no41Llh/ZHJP74E893e1gn+nsO
 d4wLUIgz3YKARW08yNF+uf+hE/AyrxQvIJcEqRCH7PiJjb9iO2f9V3Hjmaq3dHmQbdGx
 pd3qrhhPWK600LxItb3mVCDotV0NOy5oXrqAogdjNgKJKfAJDd2VIdgZeSdQuQYcYu5z Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjggjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 10:02:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 24D0D10002A;
 Tue, 27 Sep 2022 10:02:36 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8E0B5216826;
 Tue, 27 Sep 2022 10:02:36 +0200 (CEST)
Received: from [10.201.20.178] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 10:02:36 +0200
Message-ID: <c60a624a-6c95-8ccf-9afe-86ce568cea05@foss.st.com>
Date: Tue, 27 Sep 2022 10:02:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dt-bindings: sound: st, stm32-sai: Document audio OF graph
 port
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20220927002004.685108-1-marex@denx.de>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20220927002004.685108-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_02,2022-09-22_02,2022-06-22_01
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
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

Hi Marek,

Thanks for your patch.
You can add my:
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

BRs

On 9/27/22 02:20, Marek Vasut wrote:
> It is expected that the SAI subnodes would contain audio OF graph port
> with endpoint to link it with the other side of audio link. Document
> the port: property.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Olivier Moysan <olivier.moysan@foss.st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>   Documentation/devicetree/bindings/sound/st,stm32-sai.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> index 1a3abc9495055..56d206f97a96c 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.yaml
> @@ -122,6 +122,10 @@ patternProperties:
>           description: Configure the SAI device as master clock provider.
>           const: 0
>   
> +      port:
> +        $ref: audio-graph-port.yaml#
> +        unevaluatedProperties: false
> +
>       required:
>         - compatible
>         - "#sound-dai-cells"
