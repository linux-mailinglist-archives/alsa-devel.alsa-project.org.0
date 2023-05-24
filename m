Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4395B7125C7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 13:43:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B87D207;
	Fri, 26 May 2023 13:42:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B87D207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685101414;
	bh=L5HsWOJhf4uuyE/s+4e2prnAL4YmHAOjyIg8rlSb5iw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MAmVBs0Au68oCFS5yC2zHQc7nMiwahOZatc/GEkZ8NwvMfYkDsazAxgRJc0WIme3U
	 P5EFUXD7c9VjaFm5oJcUJQWmGvQjV8PdGhCNTfrHGpvnFymKoSfa2vWXVVGetf9XL4
	 KepUoU7yx+88Vphzijozk36l+DotliplTsdovBYE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EFBEF8016A; Fri, 26 May 2023 13:42:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 541ACF8016A;
	Fri, 26 May 2023 13:42:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B510F8024E; Wed, 24 May 2023 15:28:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08019F8016A
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 15:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08019F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20221208.gappssmtp.com
 header.i=@baylibre-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=RRpnCjpj
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3095557dd99so800954f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 24 May 2023 06:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684934921;
 x=1687526921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpaEDaEMiz0twNyfrOrBugRFe4goGloP1Qpqk47QwlA=;
        b=RRpnCjpjHBTwE/i8foXECp1howHpUJB08S3RDHVRKvOK+eeAwsKC3x39tLqwNhysca
         cI/sZp9eC0H8WA5MnMR3Wck3kwLEVf86vv/q5HMBHGSWy4KCGj8fcAyYih8bFlYz+sdD
         pxEo14qjxYnXZIROoJUVb/epU2pySWQZPM/UhVVhdK+inP5pxhiZDg0rcJ8490MDOf2D
         lFZHi9cri7PBUqx0937e80otPcYbB6cxD6Aov9gHkFGDb0QFamRLyqrj2Ycmk3UH1NrR
         hoc4lFkin632699KFRBucYZo/CD34eAaRYyFXiPx/o7vUmZC9N/i30ORAGH8AuOAj9jx
         oGnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684934921; x=1687526921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dpaEDaEMiz0twNyfrOrBugRFe4goGloP1Qpqk47QwlA=;
        b=VC6ycPeJaiOQUXhBdWE0N0li1rwNgxuunK2vQj5h1CplRQWCBu2GGBJrjWbKN4/762
         MYFyAoasLzEsJqrQC2bCCYfV7gyZNesP121i8aq9HYhIIcO4UdgrizIQdFOSIBuFJAdo
         rZcUNvOsBMnJT0A0xF6hlC6UZF5BWrBOCIpKj27qG/lDqo/AcJIMiv3bC8XISeKxkyvn
         ydcKD5Myh5UrDmFYT5fTeFab6RRW0s2ErdKUjk/ttxqqts1cPZI5Fkz7rOENtC/EV9eN
         1Svpal9D/lWGMHYr8Byf/wUbFSAbMqM4PdzbeCRmGKqQVFMOnheDdK5Tnjee9/nbRjig
         2+pw==
X-Gm-Message-State: AC+VfDwXS+Bzm+v6CCrzdfKnlRSEUjb3kHOLsb5/NRFuzSYF6xv5ECbH
	VWRSH16ksMtmtW9SbBZp7QYEWw==
X-Google-Smtp-Source: 
 ACHHUZ5UxTF7Ty4Ha1qHIPwkF1euAKvGxSLopaZQrr7mrvaQchq5F7/btnqI5+pGB6je42At5/7vFA==
X-Received: by 2002:adf:ff90:0:b0:309:ccad:b2fb with SMTP id
 j16-20020adfff90000000b00309ccadb2fbmr10813993wrr.5.1684934920688;
        Wed, 24 May 2023 06:28:40 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 j3-20020a5d4483000000b003062b57ffd1sm14483595wrq.50.2023.05.24.06.28.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 06:28:39 -0700 (PDT)
Message-ID: <56b892cd-977e-5b24-55f0-df25e187308b@baylibre.com>
Date: Wed, 24 May 2023 15:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: remove
 ADDA_BE from link-name
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-3-trevor.wu@mediatek.com>
 <cb69dbab-0966-8ecb-d9b9-017f430fd7ea@baylibre.com>
 <b9eecdf886b6496131e51e1e2f49536c782c3b67.camel@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <b9eecdf886b6496131e51e1e2f49536c782c3b67.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3K7PFLOHW2AP32TVNV2FXTHBFBAGTHT2
X-Message-ID-Hash: 3K7PFLOHW2AP32TVNV2FXTHBFBAGTHT2
X-Mailman-Approved-At: Fri, 26 May 2023 11:42:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3K7PFLOHW2AP32TVNV2FXTHBFBAGTHT2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/05/2023 04:25, Trevor Wu (吳文良) wrote:
> On Tue, 2023-05-23 at 18:26 +0200, Alexandre Mergnat wrote:
>> On 23/05/2023 04:19, Trevor Wu wrote:
>>> ADDA_BE is used to connect to mt6359. For machine mt8188-mt6359,
>>> codec
>>> for ADDA_BE must be mt6359 which are configured on the machine
>>> driver.
>>> Besides, ADDA_BE is divided into two dais, UL_SRC_BE and DL_SRC_BE.
>>> As a result, remove ADDA_BE from items of link-name.
>>>
>>> Signed-off-by: Trevor Wu<trevor.wu@mediatek.com>
>>
>> I don't understand how "DL_SRC_BE" and "UL_SRC_BE" links are done.
>> Why these dais don't replace "ADDA_BE" in this binding ?
>>
>> Regards,
>> Alexandre
>>
> 
> Hi Alexandre,
> 
> Because the sound card is mt8188-mt6359, the codec for these two links
> must be mt6359. Thus, I specifiy the codec in machine driver directly.
> If the codec is changed, there will be a new sound card and binding
> file. In conclusion, the codec won't be updated via dts, and that's why
> I don't just replace ADDA_BE in this binding.
> 
> Do you suggest me add some information in the commit message?

No it's fine, I'm just trying to understand.

When you say "I specifiy the codec in machine driver directly", you
are talking about this change ?

+		} else if (strcmp(dai_link->name, "DL_SRC_BE") == 0 ||
+			   strcmp(dai_link->name, "UL_SRC_BE") == 0) {
+			if (!init_mt6359) {
+				dai_link->init = mt8188_mt6359_init;

I'm asking because the equivalent was done here:

-	[DAI_LINK_ADDA_BE] = {
-		.name = "ADDA_BE",
+	[DAI_LINK_DL_SRC_BE] = {
+		.name = "DL_SRC_BE",
  		.no_pcm = 1,
  		.dpcm_playback = 1,
-		.dpcm_capture = 1,
-		.init = mt8188_mt6359_init,
-		SND_SOC_DAILINK_REG(adda),
+		SND_SOC_DAILINK_REG(dl_src),

So I'm wondering why "ADDA_BE" & "DPTX_BE" & "ETDM3_OUT_BE" are in the 
enum list of the binding since the codec is already specified in
machine driver too. I probably miss something but I don't know what.

-- 
Regards,
Alexandre

