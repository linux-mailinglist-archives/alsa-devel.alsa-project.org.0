Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE921F7B9B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 18:28:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C4031675;
	Fri, 12 Jun 2020 18:28:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C4031675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591979339;
	bh=4DsMfLJMQXVxy/R7t7qAHX4wz0S2PMFYbo1tNTv9gNc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fE5R/2Frr8375yPMQ95s/CdwB7HbwLcC5OTavrtrzh16MQ90LceIergUP+r3VllA2
	 pRumouyd3tA64UQHwRrDzVWnZRfXYDQisLQetTv1ceb8u9hPJP3dPfovj00zcIq4ux
	 hUKE7ZwAhco6zsE/n2/dz/knmTIG6KO6ZrceXTfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4643F800CC;
	Fri, 12 Jun 2020 18:27:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10C51F8021C; Fri, 12 Jun 2020 18:27:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 048DEF800CC
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 18:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 048DEF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nRvp5ktR"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05CGRAm3015312;
 Fri, 12 Jun 2020 11:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591979230;
 bh=Fkgey716kLKI5iJmQP/27R3X8I0hgKSTact+Z6ZhrrA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=nRvp5ktRa3UD52SFpinmzJWjGxRQgF6w36M+Y5QezRyrFu+O77uOkdTRy5rYRC/9T
 2HAjkKHhYeD82VhVoUaw0508z3QU8ZX8aATV+IiDjNm0gUjY5LPcdFuseNoUtICQjV
 J8WiQ/nQSDELSHTB4ouX2r/5ye2r0+hoM8Y/Czk0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05CGRAOA025356;
 Fri, 12 Jun 2020 11:27:10 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 12
 Jun 2020 11:27:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 12 Jun 2020 11:27:09 -0500
Received: from [10.250.52.63] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05CGR9nZ003371;
 Fri, 12 Jun 2020 11:27:09 -0500
Subject: Re: [PATCH v3 2/2] ASoC: tas2562: Update shutdown GPIO property
To: Mark Brown <broonie@kernel.org>
References: <20200612160603.2456-1-dmurphy@ti.com>
 <20200612160603.2456-2-dmurphy@ti.com> <20200612160922.GL5396@sirena.org.uk>
 <0e482167-71c2-a128-b8b4-a054557d30e9@ti.com>
 <20200612162200.GM5396@sirena.org.uk>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <432c41fe-8afa-2ccb-8917-fd64f4895144@ti.com>
Date: Fri, 12 Jun 2020 11:27:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200612162200.GM5396@sirena.org.uk>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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

Mark

On 6/12/20 11:22 AM, Mark Brown wrote:
> On Fri, Jun 12, 2020 at 11:18:57AM -0500, Dan Murphy wrote:
>> On 6/12/20 11:09 AM, Mark Brown wrote:
>>> On Fri, Jun 12, 2020 at 11:06:03AM -0500, Dan Murphy wrote:
>>>> -	tas2562->sdz_gpio = devm_gpiod_get_optional(dev, "shut-down-gpio",
>>>> +	tas2562->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown",
>>>>    						      GPIOD_OUT_HIGH);
>>> This also changes the name from shut-down to shutdown which will be
>>> incompatible (IIRC we do try -gpio as well as -gpios).
>> Yes the non-standardish name was highlighted by Rob[1].
> Yes, but we released with it so it's an ABI now and we should still
> support the old name.

Well should we then just revert back to the non-standard name and just 
fix up the code?

Or should we support both properties?

Dan

