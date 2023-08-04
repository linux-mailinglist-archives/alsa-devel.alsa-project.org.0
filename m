Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AF4770158
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 15:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDA506C0;
	Fri,  4 Aug 2023 15:20:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDA506C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691155250;
	bh=aVevoRH/zRsAEvs3H2Zcva4HG1R7N5bpvTy+bXxQy94=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ntY53Sf1whe1v+RNO/2h0JltBzGyWrFctxNu8aORS9dO8XOPB6TFKfRFtf+sFqnc3
	 qcCjABTVxZyXSZoU0Qt3YefHeH4+omwpjFqSwF9ETiiEUBC4nFVyK/QxJspa6pFXLO
	 kc1nY9owBV+sHAeDpXDGrEXR0h0OjGu0PtCSeNW4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E62D6F80425; Fri,  4 Aug 2023 15:19:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F2E4F801D5;
	Fri,  4 Aug 2023 15:19:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2852DF8025A; Fri,  4 Aug 2023 15:19:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F262F80087
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 15:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F262F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=iPhJejNr
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1bb893e6365so14571065ad.2
        for <alsa-devel@alsa-project.org>;
 Fri, 04 Aug 2023 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691155187; x=1691759987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e6hpRsVCce4RnHz/Z3fP3W+DwdjM90pnF8UifpN2OMs=;
        b=iPhJejNrhhzG8zVMYezC4gkylcG+fHxVXtBVrgeOa1Z1/HPBboEMdub+16UJObLBmj
         fJMOX5FQSUkm5OBIb0KoccNZG93SrqxexDD+dCjDmCZinOh7VmN9k12ffjwGTkX2DAb9
         6li7cgRPT7AYokQwb2wSK9BLlsOfT5XuZNT6NmDKyUd78E3k5RqiZDX/HlINZoa3Qp6+
         L3+dxR2GeHWnKdD/1CmNgbuC9jh5oqEsUDmP+WjytK5r4pPeVTEPP7ZJw4FlROev0jpq
         ePJf3ltxvOeMVaP4F61iK1xzh+3iW3EoXcZ3CuEW+HN0mWaAVNO6NUKF1PW0/iWGOtS+
         pnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691155187; x=1691759987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6hpRsVCce4RnHz/Z3fP3W+DwdjM90pnF8UifpN2OMs=;
        b=GIkWjcOABUuY9mNomFh26rSxSeKl3ZXMi7e8uIYqHoKTm3Ypw9767nioVlMMkmXYhJ
         wk1p0yMP7QsgilDwG70ZdO7C92HHbg5E2ivLX8wXlKGA7BkDjRdylsd5A8sovkSf8PDa
         AiSTyI5CXl1atkYB6dPOknGZE5UZ3QKvFPkossSbDLkPEWdqo0Ep+16T84DaWqhx0Q5F
         UKawoo43I6E6QIstY+idV71oVzao04a7ag99P34CgVUbMWrDPyYP3K7wC4LvgtH7bJgX
         rj3df/SBusdU6vbDM0CbJMPV28yxDeC7uUUXnS8MeqPlJlT5kOD7NGd2fqnDc/AWVZ48
         WDAQ==
X-Gm-Message-State: AOJu0YzhHObB1UAA7ClqEl5eZSgLrESq2fSBnxtPCTOD7Omx8SLKpGct
	ZRwweCtknFZzB1/0Jmiovrg=
X-Google-Smtp-Source: 
 AGHT+IGisXvEl+fbn12qhq+M3FWOG3viroz5i3RITcOwWH8GPg1+bnjpB4HUzTiyFOghbvpVyCqn3g==
X-Received: by 2002:a17:902:b611:b0:1b8:35fa:cdb6 with SMTP id
 b17-20020a170902b61100b001b835facdb6mr1382017pls.13.1691155187486;
        Fri, 04 Aug 2023 06:19:47 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id
 be5-20020a170902aa0500b001b5247cac3dsm1740067plb.110.2023.08.04.06.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 06:19:47 -0700 (PDT)
Message-ID: <3d6794c9-60d3-b8f3-99d2-afdc69593d9f@gmail.com>
Date: Fri, 4 Aug 2023 22:19:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/27] ASoC: amd: acp3x-rt5682-max9836: Map missing jack
 kcontrols
Content-Language: en-US
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>
References: <20230802175737.263412-1-alpernebiyasak@gmail.com>
 <20230802175737.263412-5-alpernebiyasak@gmail.com>
 <277be798-9bd0-baa0-9e0d-8a7a9ac67f02@gmail.com>
 <a0ba4144-7763-4d55-8517-f1c44fa4257e@sirena.org.uk>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <a0ba4144-7763-4d55-8517-f1c44fa4257e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HFF2VEQHJ6XUPFITJ6J6V4LPE2P7WP2O
X-Message-ID-Hash: HFF2VEQHJ6XUPFITJ6J6V4LPE2P7WP2O
X-MailFrom: akihiko.odaki@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFF2VEQHJ6XUPFITJ6J6V4LPE2P7WP2O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 2023/08/04 22:11, Mark Brown wrote:
> On Fri, Aug 04, 2023 at 05:04:52PM +0900, Akihiko Odaki wrote:
> 
>> Mark Brown has a raised question if the jack is really not driven as a line
>> output[1], but I never answered him (sorry for that!) I don't know if the
>> hardware is capable, but I think we better to remove it for now since the
>> codec driver does not handle it.
> 
>> Mark, does it sound reasonable?
> 
> Sure.

I see. Alper, can you add a patch to remove SND_JACK_LINEOUT to your series?

Regards,
Akihiko Odaki
