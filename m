Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6A594CC36
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 10:30:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E831BE67;
	Fri,  9 Aug 2024 10:30:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E831BE67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723192224;
	bh=rRzR7Rhb6KTpSoOJoC/MP6DtbgV1G83HjbsiHEJJe+I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m15IBWcTvFutndfiwsw8ZvgH+WZRnBfOiETQH9+VPkzO+CrRFL4jAzpBybmi92usf
	 57ID4vCmMbkhsLQbBBELmP9awpoNrWC5wrn9TTvpjoEmXwnJGbSUWyN88DLV4PwTW4
	 UrydoMJNnze+Etn1VaxBw+S954cYZKrITwZzgTuY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6AE2F805AE; Fri,  9 Aug 2024 10:29:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE625F802DB;
	Fri,  9 Aug 2024 10:29:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68889F802DB; Fri,  9 Aug 2024 10:29:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14B37F800E3
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 10:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14B37F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=mRZZxbMF
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-428e0d18666so12801915e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Aug 2024 01:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723192146;
 x=1723796946; darn=alsa-project.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=M9XgrXqJt0/9CkMxHNu45QhllGaF2W8Tzkt4pRfBbFk=;
        b=mRZZxbMFzePortNlB8Pt2ejY9H+A/6CDDpcB6MRIqhtwUBTKx+c3nWhKg5M/enGZVs
         SN6CvIgqjgJSSRdIVd4snMCfAwIGHY/xN4zdr5UZcinEIe1qY4Kg5Dsbf3JzT5nxrvTw
         W21WStPqPB9XvRcdDF0eIGjdKLWQDNI7sOaLXsyJmW99+Mtf0sKZXDEO/6+bOTrVGW45
         rJ032/1tnSMDBjJlAE4jZ5iwCx8h//t56cPjP4Etp/RwLvjk/zICJ6Sg19PcK+O0N9mu
         IZTWbxu62uv4pXI5lVGh7mK9+2AyNkkiuGbyv/Fdr81spkeC4pW7/MZwoPPwJclXV2P/
         WJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723192146; x=1723796946;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9XgrXqJt0/9CkMxHNu45QhllGaF2W8Tzkt4pRfBbFk=;
        b=ATGhPE4AViDgfoq6e2bDX4fFHnCaDKPednqxv8pSIKUUQIxT87AS7kNI8k45aZVzfv
         ipgEBlSA2gNIV3LZyQINBDrXW3dvbDFbWNbEK9oybQTocFvgi+GHsDcrdS8MENNp92QT
         pALiZZym2RNiBCX2Ers0ITlkp7xqC4fH6GZgLyxT1rTC5xwjVFhLm1o5ulp2EgR9wqhI
         73CPok0QKyZFk0gyTXKs6mKJGFwjL7WjaeN5e6Z2gkxUjVZLfLhkF6p8oNrDCqMDQQEa
         k6eZSGTe2wiYQ3eEgH3jtBRsav5l5AvGlMYzqZVBBUUMrqboquRSXSP2IS27W86j2ydK
         eeNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUoBFIGZpGy4IR0pYOO8MP6UInuDk7IjTy27sIg73p68Tfb0qTayAIJ2gE0ndiZlpSnxBnmjuRuCCVDAmlzy1GrmivQ9fiqtuxvQk=
X-Gm-Message-State: AOJu0YwzIEBdQn6cmCt5QcMkSjri/GizV9uR2lOtjSXQPhG21P+oKHZs
	PAPz9ku5JplPrXA8ESVr1z9Bn35mSEcYiF3kIsFyjPVpXPuGV2BezHfqD/U1vuQ=
X-Google-Smtp-Source: 
 AGHT+IHe4KRBbn78xJ+uhzDvBdPlN0FDRDNiUwGsnx4SLammGg6F32dtNQbopsE3P9TfIiTwaOcj/w==
X-Received: by 2002:a05:600c:4514:b0:426:5fe1:ec7a with SMTP id
 5b1f17b1804b1-429c3a58c23mr6422525e9.31.1723192146423;
        Fri, 09 Aug 2024 01:29:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f0cb:cecc:348d:4d08])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4290c74a855sm63260855e9.25.2024.08.09.01.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 01:29:05 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>, 	Mark Brown
 <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>, 	Takashi Iwai
 <tiwai@suse.com>,  Jaroslav Kysela <perex@perex.cz>,
 	alsa-devel@alsa-project.org,  linux-sound@vger.kernel.org,
 	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ALSA: pcm: add support for 128kHz sample rate
In-Reply-To: <87ed84rnk7.wl-tiwai@suse.de> (Takashi Iwai's message of "Mon, 08
	Jul 2024 16:00:24 +0200")
References: <20240628122429.2018059-1-jbrunet@baylibre.com>
	<20240628122429.2018059-2-jbrunet@baylibre.com>
	<326792b9-e706-4ab0-a1e8-cc48943e357d@linux.intel.com>
	<874j99434a.wl-tiwai@suse.de>
	<1j4j90hurv.fsf@starbuckisacylon.baylibre.com>
	<87ed84rnk7.wl-tiwai@suse.de>
Date: Fri, 09 Aug 2024 10:29:05 +0200
Message-ID: <1jcymixfou.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: PBKYDKG3LW5UCYO4OTDBAH7ROHYOHVEM
X-Message-ID-Hash: PBKYDKG3LW5UCYO4OTDBAH7ROHYOHVEM
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBKYDKG3LW5UCYO4OTDBAH7ROHYOHVEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>> 
>> Apart from the problem reported in sound/usb/caiaq/audio.c, is there
>> another clean up expected ?
>
> The change for caiaq/audio.c is rather a "fix" :)
> As a cleanup, I meant, whether this extension can be applied to the
> other existing drivers that already use 128kHz with RATE_KNOT and an
> extra list.

Grepping in sound/ for 128000, I've found only 3 files which could
benefit from solely adding 128kHz to the defined rates:

* sound/pci/cmipci.c
* sound/pci/rme9652/hdsp.c
* sound/pci/rme9652/hdspm.c

The rest are unsing other rates which require the use of RATE_KNOT.
The most regular rates being 12kHz and 24kHz. Adding those as well could
help in:

* sound/soc/codecs/adau1977.c
* sound/soc/fsl/fsl_asrc.c
* sound/soc/fsl/fsl_easrc.c
* sound/soc/intel/avs/pcm.c

I admit that's a fairly low number of drivers, maybe it is not worth it
at this stage.

Takashi, Mark, what is your preference ? Should I:
 * tweak the spdif codec to use RATE_KNOT ?
 * add just 128kHz, fixing the 3 file above ?
 * add 12 and 24kHz as well ?

I don't really mind one way or the other.

>
>
> thanks,
>
> Takashi

-- 
Jerome
