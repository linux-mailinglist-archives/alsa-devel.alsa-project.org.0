Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC0F36C52F
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Apr 2021 13:35:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44C3D16DF;
	Tue, 27 Apr 2021 13:34:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44C3D16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619523335;
	bh=NILGFNTQTHr+s2XX/khm6R44dEEBWTF4JMVNpWszCpw=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NfbykuKJAj9IChjbEZrRaW9itVyqEwS0mybg9D1MEvM9SBpJED0MQWhfeYYX8QFGN
	 Dv4sco116oafcYqMGRqOmXQ1NTiZ7KQLWGd4AWuFbqfMWCrpKChNopmGldAdE7uhSr
	 IjYf1zrfJnNMiyTWrWLhSGV6lQw6W5gTOGkLM98g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3CE6F8012A;
	Tue, 27 Apr 2021 13:34:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D2BFF801EC; Tue, 27 Apr 2021 13:34:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C2C8F800C0
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 13:33:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C2C8F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="mgQK1UKy"
Received: by mail-wr1-x432.google.com with SMTP id h15so6861720wre.11
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 04:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=NILGFNTQTHr+s2XX/khm6R44dEEBWTF4JMVNpWszCpw=;
 b=mgQK1UKys7c/CR7IlmkslGjxU+v65W7xorF9mhuWXeLOgX8y59vj5aqkHcEvwZUtk+
 0QEUD+IFA3OK6vexGOu9Q5sMC2MLDe1m7RbUsY/zQ4WAk4rHlOsDdr0ElagFLm3hvNi0
 x2Ve6B4SAmAgpDEfzRGRaezxRpqUOwkK2SM/PowJxnEpc3HDNEs5Z/QXVklsAE90mEcu
 AJrgFws5f8azx3GtcMQX2i25x2pKdxIsIxAeHz4b0vvRnI0YoFLWhUyfWZbUS489+PY1
 Ftq2K3YndhBhZn/GE+Olzd68yC5zMJxC//4pcOF7+EGLADwZhIS8SHFVl8sHu8lQTQoN
 nIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=NILGFNTQTHr+s2XX/khm6R44dEEBWTF4JMVNpWszCpw=;
 b=rIr4hj+lR9UPKuKE9tn+mOSjab9Sygs/0+gz4b7rUyNPhRLZoy0xqKtJq6ZPe2Lu+c
 EaX/lgbE8w8TjaK5DGzgDFm+YOiQ7qo6dd9nrMWpEa48TIrjrJbnmYbA+ohYoun8ZoPG
 uIsWi9FWPBO2QPOlcsobvNAfQwBtuUh7rifwd97n4KAranOetc6xbl4zyAHHOv5blTut
 qkh6vg72dhSuhgEbp9zhG3bCwLmqmCNqbsBI77UE6TcYhx9G0erCXU/a1SHp5t3Vbfgd
 uKQuY+jGAUVL3mLlm1VZFSadybhNKglW9uGqJ1uLl26MuYtJVvMlr0NLcXMuKE2iGjQU
 ENOQ==
X-Gm-Message-State: AOAM531Pa85ZvPSmL2B0tuUgQDKNVRx7fCJEGvPCWKrXqWLuOYmKYaq6
 iYEy/93Vwy1hCm96J1n6HOi7yw==
X-Google-Smtp-Source: ABdhPJxA5Iot94vDDBN7Sbie44++7Hv5kGSYXsGnyBGRKKU9id3d4U3JbhOg060c3YWzvw6vId1sNQ==
X-Received: by 2002:adf:e412:: with SMTP id g18mr16024362wrm.205.1619523231717; 
 Tue, 27 Apr 2021 04:33:51 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id f6sm71130wru.72.2021.04.27.04.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 04:33:51 -0700 (PDT)
References: <20210421120512.413057-1-jbrunet@baylibre.com>
 <20210421120512.413057-6-jbrunet@baylibre.com>
 <69eaa840-ed77-fc01-2925-7e5e9998e80f@linux.intel.com>
 <1j7dkon8jy.fsf@starbuckisacylon.baylibre.com>
 <1jim48jdee.fsf@starbuckisacylon.baylibre.com>
 <20210427102711.GB4605@sirena.org.uk>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 5/5] ASoC: da7219: properly get clk from the provider
In-reply-to: <20210427102711.GB4605@sirena.org.uk>
Message-ID: <1jfszcj71d.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 27 Apr 2021 13:33:50 +0200
MIME-Version: 1.0
Content-Type: text/plain
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org
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


On Tue 27 Apr 2021 at 12:27, Mark Brown <broonie@kernel.org> wrote:

> On Tue, Apr 27, 2021 at 11:16:25AM +0200, Jerome Brunet wrote:
>
>> Mark, at this point I think it would be best to revert patches 1 and 5
>> while we work this out in CCF. The other patches are not affected.
>> Sorry for the mess.
>
> Sure, can someone send a patch with a changelog explaining the issue
> please?

Will do
