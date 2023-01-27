Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E2567FD99
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Jan 2023 09:24:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C63FE73;
	Sun, 29 Jan 2023 09:23:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C63FE73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674980679;
	bh=CIl32mTcQHV5EHQmKnAyR2IkAxK+xsOkcApFBk0n/yQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FLtjUfIjAtM9ZP9qyhxdahYVatIxIDEVvh93S5RpaYN0w6rdTMm64YqDLWHB247Lr
	 DsczuVGz2kY9Sr60H0cnqG+xuYjM0TaaLJBC493+2EmxIfulyCwFW0X4W64OXCLnB7
	 byuqO+/XntTJalR0qSmiHUqfaDiEMRwhR+CIgUFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60677F80519;
	Sun, 29 Jan 2023 09:23:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A57BF80272; Fri, 27 Jan 2023 18:01:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B90BF80074
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 18:01:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B90BF80074
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256
 header.s=selector1 header.b=aWrFglN6
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30REGmZ8019692; Fri, 27 Jan 2023 18:01:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QNH1ux7cYrF5KW+Ey5DCbKnkWudemJAed1CdOisOzwU=;
 b=aWrFglN6WN9lJ9UfkuNRCOf+eZLqOK/K/MwebDvkvlJ9BbraR7IaDQjfWJsuxG3qEl+w
 /zcbla1ATkb34/cgfv+jY98hV15W4tnl5ImuyPNlwMV+YJAdJjbH1aopG15aLRkh8wmM
 l4dhdDRjV+hC6xAWQteP9ugkWvZRUn+2SbiSOelz6JrhmEzzjMybo5hBxA3Bcimg9qnY
 zdsENVEPxj6CymobQqyNOE70uQpKyrM9lu7NqbOzhejcg3jASSLXeSHG2+UOFLtTC114
 gDpaZ6/KFUEeQG46+8MaDOHr4QDhzeheFE/3snJXRXDYFzO0erPQuMETrlvse78cpBw2 ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n89chde7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Jan 2023 18:01:06 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8FD5D100039;
 Fri, 27 Jan 2023 18:00:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F28D21F0C6;
 Fri, 27 Jan 2023 18:00:43 +0100 (CET)
Received: from [10.201.21.177] (10.201.21.177) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Fri, 27 Jan
 2023 18:00:40 +0100
Message-ID: <179fe90c-0ac9-bb43-6e49-8b1d7ec520df@foss.st.com>
Date: Fri, 27 Jan 2023 18:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/6] dt-bindings: Document common device controller
 bindings
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
 <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <alexandre.torgue@foss.st.com>, <vkoul@kernel.org>, <jic23@kernel.org>,
 <olivier.moysan@foss.st.com>, <arnaud.pouliquen@foss.st.com>,
 <mchehab@kernel.org>, <fabrice.gasnier@foss.st.com>,
 <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-2-gatien.chevallier@foss.st.com>
 <1e498b93-d3bd-bd12-e991-e3f4bedf632d@linaro.org>
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <1e498b93-d3bd-bd12-e991-e3f4bedf632d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.21.177]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_10,2023-01-27_01,2022-06-22_01
X-Mailman-Approved-At: Sun, 29 Jan 2023 09:23:11 +0100
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Krzysztof,

On 1/27/23 17:49, Krzysztof Kozlowski wrote:
> On 27/01/2023 17:40, Gatien Chevallier wrote:
>> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
>>
>> Introducing of the common device controller bindings for the controller
>> provider and consumer devices. Those bindings are intended to allow
>> divided system on chip into muliple domains, that can be used to
>> configure hardware permissions.
>>
>> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>> ---
>>
>> No change since V1. I'm letting this patch for dependency with bindings to
>> avoid noise with dt/bindings checks. Therefore, it should be reviewed on the
>> appropriate thread.
> 
> There was a v6 already, this is v3 and I don't understand this comment.
> What do you let? Whom? If it is not for review and not for merging,
> please annotate it in the title ([IGNORE PATCH] or something).
> 

Sorry for not being clear in the previous comment.

I meant I'm letting this patch in this patch set so the dependencies on 
the feature-domain-controller.yaml file are satisfied.

I will annotate it with [IGNORE PATCH], as you suggest.

> Best regards,
> Krzysztof
> 

Best regards,
Gatien
