Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCACA2BB0D1
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 17:43:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66DC917C0;
	Fri, 20 Nov 2020 17:42:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66DC917C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605890619;
	bh=RsU56jrCTRWv4W91wOKbnibTHglkZi7P7QfGXIPhqpA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbjWhVVnU0SR2BN64sHpa5c4Hkaa2WAVR+37k7CAnegi53z57xIqupd8VCS1i+RM+
	 X3MuXte61f0248KLKtoA8sqITknToAjNkJcpEIkOAYuo+/61pCBJvRUbT6Wjw6HOIq
	 3CwMrKK09+LAkLtjid/WuhBnh+biwrxg78AdhJDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBAE4F8016D;
	Fri, 20 Nov 2020 17:42:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DFCCF8016C; Fri, 20 Nov 2020 17:42:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DA19F800C5
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 17:42:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DA19F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gJLOhvR5"
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99E482225B;
 Fri, 20 Nov 2020 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605890519;
 bh=RsU56jrCTRWv4W91wOKbnibTHglkZi7P7QfGXIPhqpA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gJLOhvR5L5VgwE7TZnkHSW4qrYnNWQ3fXTc25doOGPDRRdRWM6O+TLfG3+fFkU9jO
 8iYrkx0KgVOtEAIajKdMvqYFqXiolSPDlZNoGIvIKqg9Voyn3ChCG9UI9glRsANZ+g
 5H4KKLgNW934lKUFbc3lTVL8ZWoWVuT6F8VpPKLo=
Subject: Re: [PATCH 34/38] ASoC: samsung: i2s: mark OF related data as maybe
 unused
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
References: <20201120161653.445521-1-krzk@kernel.org>
 <20201120161653.445521-34-krzk@kernel.org>
From: Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <d4387617-bdfe-e80c-8d8a-5597d3bf67f4@kernel.org>
Date: Fri, 20 Nov 2020 17:41:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120161653.445521-34-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.com>
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

On 11/20/20 17:16, Krzysztof Kozlowski wrote:
> The driver can be compile tested with !CONFIG_OF making certain data
> unused:
> 
>    sound/soc/samsung/i2s.c:1646:42: warning: ‘i2sv5_dai_type_i2s1’ defined but not used [-Wunused-const-variable=]
>    sound/soc/samsung/i2s.c:1639:42: warning: ‘i2sv7_dai_type’ defined but not used [-Wunused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski<krzk@kernel.org>

Reviewed-by: Sylwester Nawrocki <snawrocki@kernel.org>
