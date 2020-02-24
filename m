Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E69C16AA77
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 16:49:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ED301684;
	Mon, 24 Feb 2020 16:48:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ED301684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582559356;
	bh=FV/FbruSqTsFgNK+6PHPS3ue11Hy7EZ45JuFHfFFzhQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LXdgXtklN4d4SSbQYYzSPg6e7QE5cVEaCqcLYP1PuiNnRWWDsdHMq4XQgcsSl7hvt
	 FPvN5oqcnLCEmJAfb2IMcXZVewohmtTn0PNU0iYEeozD8gVklFf1B4hhXA5PeLEl3B
	 zCd0i8WOJUODAk8HHVNU2MKhPjiNa2rdAHktmiWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFC7CF80137;
	Mon, 24 Feb 2020 16:47:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13542F8014E; Mon, 24 Feb 2020 16:47:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2541F800C6
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 16:47:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2541F800C6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Lk9ykImY"
Received: by mail-lf1-x142.google.com with SMTP id c23so7125924lfi.7
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 07:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J68bNrww2g5fZX/QqkWmtr83ergFOb19DegFP1dprEQ=;
 b=Lk9ykImYQG0sw4OJV0RU4biw1W76u0j3UgtryD1T8xYynDg96qDYLzo1zjSiKMZzeY
 Hd+ASrLyazUHVTfQFHR3lCBk8TAB/FSkAdEe++MT6B9UvOcbUfORzSmsmExe0Ms+cZxI
 URUx9i/RETGK1NZqkX68sZNQmoxCeuS8WAr5DVUNzZLlKcyypE6T7SPeVm0tIBJm4GP6
 qUuYyen5J4FVKZvwwt2dr3Bm9Oq0GjhjzlWexSVZ23EroJNtglpYp+ce4KJQrEyGpx18
 tIOUgy3jJ8qrmF/TItviXNivcqLPTRcTJxxc+quYb3QD0RxMk9/OrdpRvyoJ9DcV4nDT
 C33Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J68bNrww2g5fZX/QqkWmtr83ergFOb19DegFP1dprEQ=;
 b=ujuzMqe78ay8tIcQRQq+i5Rbm06g8N60dja+S7cKCJpxpTsYYbwsRWhj9js1g2zBgM
 prysdnAWSJc00lC2yWc5tgf9KVHMx72GL3mX+LcJmBwLvIxqxaYJEs++QOwC0Z+0G75p
 ec1VSQgVWIWEMjMUzVbPfCIyGhxC7ubLdMtcQpdu52+35I3m0k/rBg5Ox0JMX0lOtvlf
 Rw5BEFxHMkMpKjVbpR5+4NSuhpt4wrfJ9cppUXBsRL08RUOUCkp7xo2bflkuah4M8WOa
 j36gcpvaRrMnuePMWQpMDBzu4b6KfMuSZeL0AVT595M2mOFzFOIMhObkeXazuxjtBOkY
 T59A==
X-Gm-Message-State: APjAAAX3hSSkJbqrgHOtzbnU0UD/V5IucU8dTIx2v+4PxAeJBxSMLIlH
 S9I8omjvUhyUp3KuoL1Yq+kPSRJx
X-Google-Smtp-Source: APXvYqytQiZl3d3Cd4WpS0ERQsw6FeDIXXsxySOJ8Vnrn4v81MUI5ey2z52tS/OJ8sOquUncfj+AUA==
X-Received: by 2002:a19:8c4d:: with SMTP id i13mr27870239lfj.42.1582559248946; 
 Mon, 24 Feb 2020 07:47:28 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id b13sm5863559lfi.77.2020.02.24.07.47.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 07:47:28 -0800 (PST)
Subject: Re: [PATCH] ASoC: soc-pcm: fix state tracking error in
 snd_soc_component_open/close()
To: Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20200220094955.16968-1-kai.vehmanen@linux.intel.com>
 <20200224120157.GF6215@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a435d244-573a-4e57-362d-08b7e4a6d012@gmail.com>
Date: Mon, 24 Feb 2020 18:47:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200224120157.GF6215@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 kuninori.morimoto.gx@renesas.com, ranjani.sridharan@linux.intel.com
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

24.02.2020 15:01, Mark Brown пишет:
> On Thu, Feb 20, 2020 at 11:49:55AM +0200, Kai Vehmanen wrote:
>> ASoC component open/close and snd_soc_component_module_get/put are called
>> independently for each component-substream pair, so the logic added in
>> commit dd03907bf129 ("ASoC: soc-pcm: call snd_soc_component_open/close()
>> once") was not sufficient and led to PCM playback and module unload errors.
>>
>> Implement handling of failures directly in soc_pcm_components_open(),
>> so that any successfully opened components are closed upon error with
>> other components. This allows to clean up error handling in
>> soc_pcm_open() without adding more state tracking.
> 
> Do people have thoughts on this?  I do like this approach but can't
> really test effectively myself.
> 

I haven't tried to review this patch, but it works fine on NVIDIA Tegra:

Tested-by: Dmitry Osipenko <digetx@gmail.com>
