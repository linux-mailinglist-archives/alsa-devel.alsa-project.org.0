Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D37881444
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 16:13:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0276722A6;
	Wed, 20 Mar 2024 16:13:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0276722A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710947613;
	bh=lujk9lU125wCesb290Yfcege4U2BvoIEq9CjFfIpdGo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HPa+oDi+WpMoPc4Rot1G/fl0iHblDoxONKUlSGKniIpsLA8ZXiMHVNT24WOT7CUXm
	 qOwXrJbXkM2MaB0hgI1OJ6lHR1LVKlVR6V7BnxF6hAHGLeSGEtENJoLcgnzPF+QJzK
	 Mub111YvBf9xagxfAeDHQvvaW48MhN6Idm8KzyIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 380D9F8059F; Wed, 20 Mar 2024 16:12:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6E61F805A1;
	Wed, 20 Mar 2024 16:12:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB315F804E7; Wed, 20 Mar 2024 16:12:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0879AF8010B
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 16:12:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0879AF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=T8zl03zF
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d49f7e5c2cso53897531fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Mar 2024 08:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710947563; x=1711552363;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VKDCvcnWgS98kbw0fYidYmjqYC/LQ8RqbNoxwppD2oU=;
        b=T8zl03zFFscXKIjS7jlvPJ7mUxb6jEL7NLRKbqvcqXnCh7NTBCrCFScfj7ANKgLZty
         cr0RaEFHo1s0AwnWYHkdlDluRcSqkeyAXG11WlWia0ivE+oPmH1m6blWEBz+JU9qNNZw
         2D9iRqB0XdsiUgwKp++FAJ70m0EaKOV5FUjrKskLfBG/i7amcTk5Sr7VgW+gbs66PWLW
         XZspc3y/O5hBjBbdUMxTLoy6qRK0qpuzomyJHDjon6xW+0pNagdKXER+kCdQgwcwDhs/
         qjeqvgwo+tD9ByxfF7QWWt5RuB1IxrH2rp9KPv84K6o5+3C+ZvJCFwroRbTce1pxKs7M
         CkNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710947563; x=1711552363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VKDCvcnWgS98kbw0fYidYmjqYC/LQ8RqbNoxwppD2oU=;
        b=sb5NYjX7V9MFZgSLMuF2ZnTrycmEZ8s8DcAzHDthBUTFzRqJ+jBRJYenCS6/adR/Ai
         xuT/5kyzd1cbeeZ4e/VmNJIwYhNiLh4SxF7mEueak91ju0DzCI6FHNUCd+QECKcoOdm0
         EV0pmtaN2JTe1IxTEoi5unu2v8jw26Vh3Y8u+dntAqGMskJD2AvS+93L8tSYGP0yrEHO
         d8Wbjb1wK4+exEl2odeSxCOF5/zfIUhepCZROtOyST8IJ6cI3Qj6aNY1HcJN+zdcADf7
         SiN30+NkMPQLtW5Nywk6OVgclh87LyaQ+XKOZL1Qksq2+0Qo2tFX4mJwQqY7yOzcZ97j
         HOEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF/azBLgUTe7PiEy1mBxEIFR9vSEJcg5hJTWcmFfwlnvMmyK94MAmWOns4dmGghbntVD0OOAjEQRAd43TGdFzgRX31P17PG/ZGsx4=
X-Gm-Message-State: AOJu0YwWDpCSQMlg1iqCgaRuRNszKpIQXPhg9dCp822Z1LuiPZOi+GpM
	CH8b3wnPWkOAsZ7awaXnpVLggHiFk6mLuf3TP+Xv/fMpdxjttTkd
X-Google-Smtp-Source: 
 AGHT+IFT9VgVVUGrEsXx4hdX1Xure9Rf4dbvEDYWuckKrrAkroGtk3moQU6iBZ09MUSIgYCXGLSHqQ==
X-Received: by 2002:a2e:be09:0:b0:2d3:f095:ff2a with SMTP id
 z9-20020a2ebe09000000b002d3f095ff2amr12648201ljq.47.1710947563034;
        Wed, 20 Mar 2024 08:12:43 -0700 (PDT)
Received: from ?IPV6:2001:999:708:5b57:30d6:2195:bb7b:bb94?
 ([2001:999:708:5b57:30d6:2195:bb7b:bb94])
        by smtp.gmail.com with ESMTPSA id
 u22-20020a2e8456000000b002d51e0b73aesm825619ljh.25.2024.03.20.08.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 08:12:42 -0700 (PDT)
Message-ID: <24792e21-afcf-489f-a47b-01f88721ea5a@gmail.com>
Date: Wed, 20 Mar 2024 17:14:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] ASoC: ti: davinci-i2s: Add TDM support
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-8-bastien.curutchet@bootlin.com>
 <9d123584-1feb-404b-890f-2da694cf56d5@gmail.com>
 <f2d8715d-a1ad-45a4-952f-a702b29740be@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <f2d8715d-a1ad-45a4-952f-a702b29740be@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2EQ7NBGSA6UNRGPX2BYLCECMYK64T2OX
X-Message-ID-Hash: 2EQ7NBGSA6UNRGPX2BYLCECMYK64T2OX
X-MailFrom: peter.ujfalusi@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2EQ7NBGSA6UNRGPX2BYLCECMYK64T2OX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

HI Bastien,

On 20/03/2024 09:31, Bastien Curutchet wrote:
>>> +    if ((dev->tdm_slots || dev->slot_width) &&
>>> +        ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) !=
>>> SND_SOC_DAIFMT_BP_FC)) {
>>> +        dev_err(dev->dev, "TDM is only supported for BP_FC format\n");
>>> +        return -EINVAL;
>>
>> I think this is not a valid statement, Fsync can be generated internally
>> or coming from external source in TDM mode also.
>>
> 
> My hardware allow me to only test BP_FC so I wished to put some
> 'barriers' in front of untested things.

I don't see restrictions on the other changes affecting this to be lifted.
I would allow TDM for full clock provider mode also.

> 
> 
> Best regards,
> Bastien

-- 
Péter
