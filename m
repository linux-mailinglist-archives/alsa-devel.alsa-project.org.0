Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBE32BB0A0
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:34:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DF2C17AB;
	Fri, 20 Nov 2020 17:33:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DF2C17AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605890053;
	bh=Y6vkKTfYIQzNWhogQPJAuBk5Mfxc7zpqf31kYefZmvI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=alqwU/Fn7G8jHaVhimsUghM5Msu9aWEV4EiTMl6wp9RLMjXcTpSzsnDV0TR1i/53z
	 Q28KoapRxRKv7g4cMqZSO5PKg7NGtM6xx4aT4IvEGHf4Y/qVd44+sQlDA/Ab5cswU3
	 aHTKprPtt/XUtnyg1XsXG+um2tuCHk9dWO+bj+5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DB3BF804D8;
	Fri, 20 Nov 2020 17:22:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 459F9F804D2; Fri, 20 Nov 2020 17:22:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94983F80276
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94983F80276
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DE8YPTTA"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AKGLxI3099103;
 Fri, 20 Nov 2020 10:21:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605889319;
 bh=SED0EgoaZJAwVnlKBinfvNnqRxNjjlAXaMmJe99UIAw=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=DE8YPTTAqhBUxvvFp81BwkV/Z2TnqYh79N0FeO3YBANRU0GpHiagJpzegDSNJfZJ+
 pnn/BU/4VipYGDeQyFVQ+lS7OlwqZiNE82uleRq1pxxRnlkVOAwLmx1HvtHpeI0ax7
 r47NnnQQLJWIixPdoArkCisEaQGNZHHFEyRn9oPQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AKGLxvG111484
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 20 Nov 2020 10:21:59 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 20
 Nov 2020 10:21:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 10:21:58 -0600
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AKGLu7C011150;
 Fri, 20 Nov 2020 10:21:57 -0600
Subject: Re: [PATCH 29/38] ASoC: tas2562: skip of_device_id table when
 !CONFIG_OF
To: Krzysztof Kozlowski <krzk@kernel.org>, <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 <alsa-devel@alsa-project.org>
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120161653.445521-29-krzk@kernel.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <cacd0acf-708d-0b56-8229-b76690b2d289@ti.com>
Date: Fri, 20 Nov 2020 10:21:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120161653.445521-29-krzk@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Jonghwan Choi <charlie.jh@kakaocorp.com>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

Hello

On 11/20/20 10:16 AM, Krzysztof Kozlowski wrote:
> The driver can match by multiple methods.  Its of_device_id table is
> referenced via of_match_ptr() so it will be unused for !CONFIG_OF
> builds:
>
>    sound/soc/codecs/tas2562.c:805:34: warning: ‘tas2562_of_match’ defined but not used [-Wunused-const-variable=]
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>   sound/soc/codecs/tas2562.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
> index f1ff204e3ad0..19965fabe949 100644
> --- a/sound/soc/codecs/tas2562.c
> +++ b/sound/soc/codecs/tas2562.c
> @@ -802,6 +802,7 @@ static const struct i2c_device_id tas2562_id[] = {
>   };
>   MODULE_DEVICE_TABLE(i2c, tas2562_id);
>   
> +#ifdef CONFIG_OF

Should we use #if IS_ENABLED(CONFIG_OF) ?

Dan
