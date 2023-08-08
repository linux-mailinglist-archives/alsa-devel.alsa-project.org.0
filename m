Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD67739BE
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 12:43:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 644FAE7E;
	Tue,  8 Aug 2023 12:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 644FAE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691491386;
	bh=DCgWqWxIgC/QGgpeKhlmnT6LHiSdKBypWHClJbrKKxI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pj6aDWig/68VzVyu/iHutdug2rCvdjg7iH/1+So3Oisfb5CfrlkkOWjpmyv0vGPCM
	 WhkSYJQK4kEXvVvxr59i3fpywyWDRiVyrjo71J3Xtu1MjgDmjQ/owvD3QaziNDN3WW
	 uvbdYI1BLX2HD6p8TEUk6GkD8X5Iyh3aS0sdtzYw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73D17F806A1; Tue,  8 Aug 2023 12:36:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BA0B5F80696;
	Tue,  8 Aug 2023 12:36:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A046F8016D; Tue,  8 Aug 2023 09:47:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2AE1F8016A
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 09:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2AE1F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=daynix-com.20221208.gappssmtp.com
 header.i=@daynix-com.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=TQrk/50T
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bbbbb77b38so33291565ad.3
        for <alsa-devel@alsa-project.org>;
 Tue, 08 Aug 2023 00:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1691480834;
 x=1692085634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltz12NOpHyjZqCIkd2IaVupLAgjkSMjjrx877B/cAhU=;
        b=TQrk/50T928qD4rCMQDbJwUQbSUIrzvEPcABFX/px9nUTEHI7aJmagbUkN+2J2Ndd8
         0Bz8BL4V2tQcrtairgd/J8oMZP8wlJ4HEQKZsyPuworm/h4iLGdWIGxPUJLJjdhrO1Ve
         6uc6khuDt2M1R4w/eaFoPyrDEYeB7G0cZH3vs10MaFEw8HD3VDJIY1KyOAcOcJE+Cu2T
         p03GV8qQkg3ESFzQC5RiZrxg0VBNXBruh/2V0gwWYzRzBJzRPR5K8wqT5ewG/nkddkp3
         vwXl+4LQ3Tkpt5NhcwQ94D2v2r41H8TshoHHpalb/hXI+jLZ9BKIX5qxKCJuLnfyUDme
         MbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691480834; x=1692085634;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltz12NOpHyjZqCIkd2IaVupLAgjkSMjjrx877B/cAhU=;
        b=MmH0xuBDUItJQbOl9z2ycrlShE5qEwzcMRtY3OhCz7g3kuS41CrZVRCgrEVPMeLZGV
         KvbByQJGunTKtdL3b8ntEaV8CNpImbWk4hofN115S4NeQrIOSoEvxge8L6J7u1SKV7pW
         o23nfkcYecZjqsvtdVFASDY3BMjN0mJVne1bcZJt6jRPpl59WJ9ErGRvXGpJNs+FpTpY
         zSwfHgmpVf/5y7gQ5CvDMKpu/BtFRiWfz0GHxj/31B3TWzrNSVP/oQz61ezSVW6dUYqY
         Digtsm3efhG0R8crNsofoIG2VhFCwuQNJPzlVYzbWCEOnavsRZzI2wn2Oe89bbDHPHcs
         Btmw==
X-Gm-Message-State: AOJu0YylkttBlNkTRiXzvLLv82vMfb3xTJty8Ss7KQWkF6Moj9LY5QWd
	yg9KAIjU4R+yPPFdqPKyTXcFtA==
X-Google-Smtp-Source: 
 AGHT+IFsCZuYChk39itTcm/6BoMiS9/hbTzdPl3afaAVttOoLE9K+8dZStY23z3dSbf8ALVaBEkYPA==
X-Received: by 2002:a17:903:41d1:b0:1a9:40d5:b0ae with SMTP id
 u17-20020a17090341d100b001a940d5b0aemr12365211ple.12.1691480834133;
        Tue, 08 Aug 2023 00:47:14 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id
 q10-20020a17090311ca00b001bbdd44bbb6sm8235828plh.136.2023.08.08.00.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 00:47:13 -0700 (PDT)
Message-ID: <1add0731-8e3b-438a-88b0-3334d8b35dee@daynix.com>
Date: Tue, 8 Aug 2023 16:47:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/27] ASoC: amd: acp3x-rt5682-max9836: Map missing jack
 kcontrols
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
 <20230802175737.263412-5-alpernebiyasak@gmail.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230802175737.263412-5-alpernebiyasak@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: akihiko.odaki@daynix.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3P3AGMZWHT3V2M2FFRCJQMUK5AQBSCWN
X-Message-ID-Hash: 3P3AGMZWHT3V2M2FFRCJQMUK5AQBSCWN
X-Mailman-Approved-At: Tue, 08 Aug 2023 10:36:06 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3P3AGMZWHT3V2M2FFRCJQMUK5AQBSCWN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023/08/03 2:57, Alper Nebi Yasak wrote:
> This driver does not properly map jack pins to kcontrols that PulseAudio
> and PipeWire need to handle jack detection events. The RT5682, RT1015
> and RT1015p codecs used here can detect Headphone and Headset Mic
> connections. Expose the former two to userspace as kcontrols.
> 
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
