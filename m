Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D4F154A59
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 18:37:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C22EB16D6;
	Thu,  6 Feb 2020 18:37:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C22EB16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581010673;
	bh=8blrsPWTeEAwreTC5NdocbroiUy5zG+ia9LmG8SDVas=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h0NSYYTl9TuRxuB9KMIiAmujvMEEIh88BBCDHr5krxBJqLr3i2SoRfyWYDBf0/P47
	 eFmP/66bNFGkyG8/aCoZuOs7WMYsHHel6Zr3sK+yvtmxN51V/1oWpl7qtnfKs2uueY
	 gz/QLMlGcXh9O86wusDp6c6ollO2V82uzdQA7F8g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC619F80162;
	Thu,  6 Feb 2020 18:36:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 704D3F8015B; Thu,  6 Feb 2020 18:36:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE83FF800AB
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 18:36:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE83FF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BPHy2zld"
Received: by mail-lj1-x243.google.com with SMTP id o15so6991589ljg.6
 for <alsa-devel@alsa-project.org>; Thu, 06 Feb 2020 09:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=99COUShDb8aW8HJQ86DZUh+rAFpSeu/Mbihks46FJLY=;
 b=BPHy2zldSziVYVCUKXNFslpdpUmxMJCyizD6jhE/aCDcuC7x8UUBKGA/UK5pLK3LkS
 HlkYo10eHEbI9t6ikDq/9rbtORbcWJgipP5cvfETYPSn7ubHJ60AiYykp9WWHie0ZMr5
 L9HMghLYgv2Vnm0KvHUWZSGer4Pa69mbVQf7/4lM/EC1ycQHInmiHU3QBgeftthoZbgH
 tX2q2U1qaRiXNcmBQDCwUBeuI9P6xcyV6k8QFQcrQQXNkRm826iczGsJBUMrjrMmnyjq
 cDzHUrE1Zeu17OyMjX1Lm/wFrlS/2E85GyXSQ6V5NWpswbqpLgOMVomJQR4JHrUy1gOh
 OegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=99COUShDb8aW8HJQ86DZUh+rAFpSeu/Mbihks46FJLY=;
 b=elhf037wiVHZHsU4GbHpALFLk4OAZf78Bg6+IkEAiJeyCKPE9aQ/Xr+N/GRyWknieS
 /bkaxymz36Ymn0V7t3mhxBOAm22rgifXEOK1e8MCGVP1wE6cSjnwYG0zYCHk0GEDHjUd
 lk4aZCHeqZG+SRWZQNU+JYS6yC37/IzOPqwjbWTu+1xaQhBAOor4pgF2tc4hGwOUuKSo
 D4/129HUQa7VjvCpS0g/Kdcz8QCURxu7BsK27wCpUFLtOOapSC9QVvL5CvUykKM3aXOG
 sJTSztrA+oo5eLAoVR5TrGLCp1LUyqSB7n2f9g5kqr6mKZyUTRbmQ+YLXbapk6FRA6jr
 aUyw==
X-Gm-Message-State: APjAAAVi50qNI0Ha+LDCsUXRMO4YOOtMW5/4rYAAPweTVFM8mZU4rTtH
 Ba8i+j5Qvovp902YSoCgo4M=
X-Google-Smtp-Source: APXvYqy8VlPo21S7t8VY9LztJyOrQWk44mVu443sV8IZkmAYtKR96arFx6ZYroi+0UqGtHS0U0bKvg==
X-Received: by 2002:a2e:761a:: with SMTP id r26mr2776605ljc.135.1581010566382; 
 Thu, 06 Feb 2020 09:36:06 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id u9sm364lji.49.2020.02.06.09.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 09:36:05 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fcab0af1-fe84-6028-701b-ab101feaa8de@gmail.com>
Date: Thu, 6 Feb 2020 20:36:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, atalambedu@nvidia.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 0/9] add ASoC components for AHUB
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

MzAuMDEuMjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Ci4uLgo+ICBzb3VuZC9z
b2MvdGVncmEvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1NiArKwoKUHJv
YmFibHkgd29uJ3QgaHVydCB0byBlbmFibGUgdGhlIG5ldyBkcml2ZXJzIGluIHRoZQphcmNoL2Fy
bTY0L2NvbmZpZ3MvZGVmY29uZmlnPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJv
amVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbHNhLWRldmVsCg==
