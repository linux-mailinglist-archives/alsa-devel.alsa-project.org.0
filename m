Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E658C26AC1B
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 20:37:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EF741675;
	Tue, 15 Sep 2020 20:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EF741675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600195027;
	bh=ZhkHjCvkkQec0ktrAK4d5jZtmrV31bUtcWfdnilBtcY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ofrhi+mc2mUFxn4FsNeeB3bPGMC+iH4K3PW5lDxL1EbKwvWtqxLmDGoEVgg5Atw7G
	 sSY1784bqbLwrGdKjtKVmkhCRE4Blv6eIBivf8ucIlIjCainz5yA4GJTHf7dKtvFg+
	 bSIbr7tkUFgh/XKxPzdbwEQ9KMRh1gcjNn07Aams=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69309F80212;
	Tue, 15 Sep 2020 20:35:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2C14F80212; Tue, 15 Sep 2020 20:35:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D51CEF800E5
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 20:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D51CEF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tTHNFN4J"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08FIZ9UQ123866;
 Tue, 15 Sep 2020 13:35:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600194909;
 bh=UszCv9uVkM6PK+sqMVwp2CVdUVj7Jk1RWLM5JKbHtRM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=tTHNFN4JihS0CL8pNA5AtMiow+W7m0/rEwdt/WutzZFbJxcLQit9bDrECs3eeUD1E
 8/IYTQug8A+EiKRdJGHau64Ae2VfdIwhDixgD8u8OzQ/KiqIY7GI8N2u4kTNYZtQ3l
 Uds6yndxSfcqBFLZeRpGvwKEpx2YS6okpfxIe4k4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08FIZ9jm052646
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Sep 2020 13:35:09 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Sep 2020 13:35:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Sep 2020 13:35:09 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08FIZ9xv013241;
 Tue, 15 Sep 2020 13:35:09 -0500
Subject: Re: [PATCH v2 1/3] dt-bindings: tlv320adcx140: Add GPIO config and
 drive config
To: Camel Guo <camel.guo@axis.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <tiwai@suse.com>
References: <20200911080753.30342-1-camel.guo@axis.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <3ae63976-1e78-df28-9c76-d8f74c733eec@ti.com>
Date: Tue, 15 Sep 2020 13:35:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911080753.30342-1-camel.guo@axis.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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

Camel

On 9/11/20 3:07 AM, Camel Guo wrote:
> From: Camel Guo <camelg@axis.com>
>
> Add properties for configuring the General Purpose Input Outputs (GPIO).

s/Outputs/Output

There is only one for the x140

> There are 2 settings for GPIO, configuration and the output drive type.
>
> Signed-off-by: Camel Guo <camelg@axis.com>
> ---
>   .../bindings/sound/tlv320adcx140.yaml         | 44 +++++++++++++++++++
>   1 file changed, 44 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
> index f578f17f3e04..7b0b4554da59 100644
> --- a/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
> +++ b/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
> @@ -134,6 +134,49 @@ patternProperties:
>          4d - Drive weak low and active high
>          5d - Drive Hi-Z and active high
>   
> +  ti,gpio-config:
> +    description: |
> +       Defines the configuration and output driver for the general purpose

s/driver/drive

You capitalized the General Purpose Input and Output in the commit 
message but kept it lower case here.

Beyond these

Acked-by: Dan Murphy <dmurphy@ti.com>

