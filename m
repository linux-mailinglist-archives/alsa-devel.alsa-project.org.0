Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 162E0AB7F93
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:03:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BDE461CDC;
	Thu, 15 May 2025 09:50:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BDE461CDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747295436;
	bh=IpSFoh4pYOY/HGqg1pleHeuH9QFifSvgR7QoQN+jals=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HQqlXOdWiLVWq3+trkzBmplduG7a0gaFqsT7N+MrNebyDa2I+Ve50URwYJQfC91W6
	 GScfpwTjsmFpr51gB6c+SzPeRUrFxPPBRTdJon+qi2E8QFURIACcl8o9RRoyi1kII5
	 hg8dN7pzl8LTSsM6jC4pIevdAXdTCITFuG+HViKs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9C44F89753; Sun, 11 May 2025 16:32:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEEE7F89742;
	Sun, 11 May 2025 16:32:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59DC9F8F13C; Fri, 25 Apr 2025 20:19:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3387DF8EB13
	for <alsa-devel@alsa-project.org>; Fri, 25 Apr 2025 20:19:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3387DF8EB13
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=CVVAuTQg
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so18096955e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Apr 2025 11:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745605193; x=1746209993;
 darn=alsa-project.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IpSFoh4pYOY/HGqg1pleHeuH9QFifSvgR7QoQN+jals=;
        b=CVVAuTQgj7W8btRD/tYRWAIRMWzvlgt1f7QUIomllSI8INZWTEgcogqROaCpnH7fHP
         euaXSDbpYz8hsBCUfYBXZ1Wmf0sV8VGVD80QCDdUTAWj8pMuDsb4v7tRFwJBJ6cgFMhX
         3Xfdw3abGs+PoAk3Eqkf/K4jGry64d+npn9LPVNxFs4t24uJQv1HeN07YcSbN7YmHw6W
         ahu5w9bzz//Ec2VWPHaT3MVzm43Vn1omyGVwp9YSq/3Nu9TvfKg03MrD9FZkUUOKeyve
         YatMSK4tZa5xGNiGBpKcSpit8s5DeT5ekIPSEki0djp9XCxDoqmTu8QYHLcx7jPX+mpl
         /QCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745605193; x=1746209993;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IpSFoh4pYOY/HGqg1pleHeuH9QFifSvgR7QoQN+jals=;
        b=wn1uujb5Z8zBdoEy2n+Rv+LiCRdD8jB0t4hmj07Bq+KBjOcg5RF107Nudo7ZT3ukjR
         1cVEn5E2HTF9qhE85NKaWB8AnOLIMX7FteSyBraEBpTJlJp5phaYsWGzaMBccbgUhDBf
         PXyK9vmR3cWttZeOSdf0XvqX7aKyjJ6qkOYG5b9mdEYBWotpwBeiqCL8Nux6em/VYPcL
         cjVrT1dzRxdVjDEVvMFV8/qsd5AOVbV73wGQo8pbHH1Wj1klqHV5eqyy2rg0w4eIhYlz
         dhSMA4YVobthY3hTS08BsO3ZPwtTHta72wlC8V8BuaITuxyQmVqq1GGSVD/TiUNJN9ZY
         xsYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVw6vrfphsmDq0rPJ/8cI65WhPNDyO3Go1Prv8xhqgWJ48ddy8pgmWJ5zbOkkRD+m2MIvwFdblfi/gC@alsa-project.org
X-Gm-Message-State: AOJu0Yz+2Ibza6PK2gIzLiBG5cA9kSzJG2qBfPY5XPN8jLx+nfNLXtzU
	WeYsEYgOL2k65aJAQjuOP6AaULvcG8eYQPoMjBp3A8pIJx5onP5eTPKF/5MvHlc=
X-Gm-Gg: ASbGncuW5JghlaGqkMpqT2EiGuU9U+rwys+dgB1bhe6Wo5AeNwCF/b/PEUYabN3iiFE
	CTAmbLWsVuNi0MmEQ44yUwuJ+MfH2N/MxPl+xb1VEOl/UlUvGTRo2JgAPFf/KAcRIFTwLce+nwq
	vYfLIbKhGqHuuzQXeRTCbOd2hzTHx/PqxsIIvJzI1e5OOA+H8Jif0kYPqcSEemwDCAnkVvlK5Q2
	Sp5FN60Uh1wJsYVQquCmmN9yHtjbdaLuC97ILIFk1p5NlK6wtLv+J0RdFnRWbMV0Hr1mNbEbXNz
	XjG6S0LMdb28aJAvDHNLW+iUEptcvjFzOwjScihtPDtYzq+UqyHis1/c+3NBWlwB0bt5s74AtAt
	fXhRf05/Af9wMfk9t3KZEv2dbNO1wFw1BV4UCs0+CNtrpOa0nhhFM
X-Google-Smtp-Source: 
 AGHT+IFJByfdmWek2xSwsLT86f5MrKiJHwIbsxI4YxA+BfoGu8K395c02Fr79u8UPzgvjnNg9CP1eQ==
X-Received: by 2002:a05:600c:1e03:b0:43d:24d:bbe2 with SMTP id
 5b1f17b1804b1-440a66b7b14mr25609255e9.28.1745605192764;
        Fri, 25 Apr 2025 11:19:52 -0700 (PDT)
Received: from localhost
 (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at.
 [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a536a02csm32734525e9.27.2025.04.25.11.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 11:19:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 20:19:39 +0200
Message-Id: <D9FXE4TJ23QB.1CS3D6PU2FGMR@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mark Brown" <broonie@kernel.org>
Cc: "Srinivas Kandagatla" <srini@kernel.org>, "Banajit Goswami"
 <bgoswami@quicinc.com>, "Liam Girdwood" <lgirdwood@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
 <36904d64-68e1-43b2-baed-50b5fddc2bcb@sirena.org.uk>
In-Reply-To: <36904d64-68e1-43b2-baed-50b5fddc2bcb@sirena.org.uk>
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: G3LPE5PXSAPVJU5ZQVTPYK7VEWUMHUA4
X-Message-ID-Hash: G3LPE5PXSAPVJU5ZQVTPYK7VEWUMHUA4
X-Mailman-Approved-At: Sun, 11 May 2025 14:32:10 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G3LPE5PXSAPVJU5ZQVTPYK7VEWUMHUA4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

On Fri Apr 25, 2025 at 2:12 PM CEST, Mark Brown wrote:
> On Fri, Apr 25, 2025 at 10:07:26AM +0200, Luca Weiss wrote:
>> Sound machine drivers for Qualcomm SoCs can be reused across multiple
>> SoCs. But user space ALSA UCM files depend on the card driver name which
>> should be set per board/SoC.
>
> This doesn't apply against current code, please check and resend.

I've based this series on next-20250417 tag, so this is probably due to
the changes from the USB sound offloading series that Greg has picked
up.

So either Greg also picks up these changes when they're ready, or we
wait until 6.17?

Regards
Luca
