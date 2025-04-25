Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 436D3AB7F5C
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 09:54:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B48C61C14;
	Thu, 15 May 2025 09:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B48C61C14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747294547;
	bh=Ons6fbZ/ZBBSkZ0lCnRlE60mRw4vXN50ao9l15AnCic=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LiQtpClX4fHSpR3P4GGPpJ7lIRoPobkRE/CS/gUBNByKRxhJI9HCsWyxndSzXaJTP
	 rEIwQ/k2kLzJBJ5yfMK33IYy6Y5apEOKikjg/UvQLabEgm2rUtIYdVsPTUL79p+aKR
	 OTArp3qYnHXAZQ2wpD0+M3MeYjsS0VQXeXskBkkE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64CADF89760; Sun, 11 May 2025 16:32:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F089F89760;
	Sun, 11 May 2025 16:32:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C9BAF96B3A; Fri, 25 Apr 2025 22:47:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE044F8ED40
	for <alsa-devel@alsa-project.org>; Fri, 25 Apr 2025 22:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE044F8ED40
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=fairphone.com header.i=@fairphone.com
 header.a=rsa-sha256 header.s=fair header.b=VGPWYIxL
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso25655835e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 25 Apr 2025 13:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745614064; x=1746218864;
 darn=alsa-project.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ons6fbZ/ZBBSkZ0lCnRlE60mRw4vXN50ao9l15AnCic=;
        b=VGPWYIxLk435unL5Ko5n9wznJTb8QpzWjQnbe5f+LWHVmNyMBQuUP7Bb+nxfe3mPQX
         TsrXfj7e1SajnPiYyOqSfNbA6h6FvU5GaLqlxJXBLrzc2R6F3AnnXUScZvE4g1kwb+KG
         5VQbwmK4BkN4M63cyNLoQv+mPFnoXMLble577SVRa4LsHgIv3fhkoz+JJgu8RYid97DH
         m8mmRXG947JyM1dzJPgqxN/7J5w6E/OunxIiee/N1Eoqo8OedLYjW0a5SEv/xp5oyjHL
         uLp+DUrjBKXGcrSs8yvmH59vH79NHx3n0kSlhYVobJorztey5yhMZXunHJb1eMnxbkor
         iPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745614064; x=1746218864;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ons6fbZ/ZBBSkZ0lCnRlE60mRw4vXN50ao9l15AnCic=;
        b=PSHfkwnsOAFteMrnlGHwpR3ZIJZ35wyKkPtL52eTAKRNUTsvQWaPdLZWO9UdP3PrMs
         Ve1A4dauB4PiUVvYHC3eNwGpUQ1y+VyjuMyClOcWafkpn0ggRpfkx/VFGgD36B2AmuQO
         A4Q/dGHqDTn5tfv5xWrHBXXuXqr+SQXCkXiQFENQyOFrkLfOsAXgfgqq4gfARHcYlhss
         UhwVFbH46Wa/CTB6WDEZjRDwDaFgWgd8LixY4/pVaT07u8lLTEU1bzuayrGbi8dJve1G
         qfwnuBlNp3qDNdDHZaYb03N7DsyIY9VS/ae+5FzBCvP/J1CeWFq70MKMBX3Y4g45Fzxh
         CQXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURsGwPJwY7yLevy2K/dgIlP8QCXLr9L10FGAkiSz5umAtjUJ0O+38OLM4Fum2bFfTRalOpGuAJuksG@alsa-project.org
X-Gm-Message-State: AOJu0YxwYqxZ2w86WflCLRvVyQtmR1IqefHROduBV0TnaUiGY8tDcq94
	KbnmssWVdvt9QvNp08nWFZ1QTOr5eUWwIMHeK9J+cXiBzWkK2q3LOPl2qq6Kc6k=
X-Gm-Gg: ASbGncsAuXmM9wNL7C12hWsCb3Je/1l/NfiNMJ0dDg4/aXua95zmtkwZi83FJrzvZMp
	4qbFlvbiZ+HcbZ7y2/iTN56W/mK9hdCDinx2qYQrHfeGVan+bmsw55q+F2uYb+ci/466z4ssmjR
	xVhFX/cCf1aDcEI4Q5sd0pKNp4+iui6Bc7ibiu3R2g4NdIa4kyaUKRelSASp69+022pzPcBvNvO
	I12B6I8l9Eud+wCCmpTyYbuJ4sW2RNn9Rz/SqcdsWHNSEIcWLP3R2nRpkRTkIhn3JIIlcsPqk3B
	V+mCqnOmD3y2z0VZwea/oMxw/nOh5NtJUFhFmIWSginHdPoVqeLaCAT8JLOO8VDx8iKPrhGts4n
	CGPjOUELske8YCWjZALdTuww4bZFr1/YRq/EaBOyNX1LvoVZjj1DE
X-Google-Smtp-Source: 
 AGHT+IHc2IGV1cabuJnO+f6tRyRq8tFSNKSMn/0EAuS9gCgWsxP2W699M+Xi8my9zfWANmox2FyRWg==
X-Received: by 2002:a05:6000:18a8:b0:39f:a553:3d98 with SMTP id
 ffacd0b85a97d-3a074f89292mr3119425f8f.56.1745614064100;
        Fri, 25 Apr 2025 13:47:44 -0700 (PDT)
Received: from localhost
 (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at.
 [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e5da0dsm3245891f8f.88.2025.04.25.13.47.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 13:47:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Apr 2025 22:47:42 +0200
Message-Id: <D9G0JHKZ0RXB.3LI5UGS7QTVQN@fairphone.com>
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
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
 <36904d64-68e1-43b2-baed-50b5fddc2bcb@sirena.org.uk>
 <D9FXE4TJ23QB.1CS3D6PU2FGMR@fairphone.com>
 <ccca5e19-5a4e-423b-923e-ea0de6682752@sirena.org.uk>
In-Reply-To: <ccca5e19-5a4e-423b-923e-ea0de6682752@sirena.org.uk>
X-MailFrom: luca.weiss@fairphone.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6NAJPKU26CILOAUKQYDPM5DEEGKPVS4Q
X-Message-ID-Hash: 6NAJPKU26CILOAUKQYDPM5DEEGKPVS4Q
X-Mailman-Approved-At: Sun, 11 May 2025 14:32:15 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6NAJPKU26CILOAUKQYDPM5DEEGKPVS4Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri Apr 25, 2025 at 9:03 PM CEST, Mark Brown wrote:
> On Fri, Apr 25, 2025 at 08:19:39PM +0200, Luca Weiss wrote:
>
>> I've based this series on next-20250417 tag, so this is probably due to
>> the changes from the USB sound offloading series that Greg has picked
>> up.
>
>> So either Greg also picks up these changes when they're ready, or we
>> wait until 6.17?
>
> Or base it on my tree and let things get sorted in the merge, I don't
> know what the conflicts might be?

For this patch here it might be okay but patch 3/5 from this series very
much depends on the patch in Greg's tree, given it refactors/expands on
the USB_RX if there. Resolving this through merge wouldn't be very
pretty.

Regards
Luca
