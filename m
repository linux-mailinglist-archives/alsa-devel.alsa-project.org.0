Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1956714DF0A
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 17:24:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A976F1674;
	Thu, 30 Jan 2020 17:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A976F1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580401463;
	bh=yHVT4lyRxeTRgMoqPh463EpojeXqF3jcbc85dxU0GUI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q2WAaEO3PHNMzaIU3SHe/hMQSPSlgko2WpjkzpLDCYKyLBu7Uvrri7ogQBDvJ7VhZ
	 Lqce+ogcfNW9JXAK7oT6ZUn4suxq4fH9BpX+CxLq7ZOayvXv01EmqO5ZnU+V+WntSC
	 u5CwhkWSVeqKQgdewkf+Ln4BB/3wyt1A6ES6p21g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBA81F801EB;
	Thu, 30 Jan 2020 17:22:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03978F80150; Thu, 30 Jan 2020 17:22:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36B6CF80082
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 17:22:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36B6CF80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YrRv+ayu"
Received: by mail-lj1-x22d.google.com with SMTP id h23so3998020ljc.8
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 08:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8ydSULXhpnS+IHlEO6mcIkif2rvznLkOx5g93ANwtj4=;
 b=YrRv+ayu7UpfrV7pGLy+a1wa+oHB5N0itiEYbS0LqezYldLZ/c5CbJ9JuJueg/ZIN8
 ejFl4HxejjDlj5znzvNDPmX7FC2r4Iq2JwbkdXdjxaX4mufNsu39LSXsuu02VtONt8bt
 gLq1RkSU5ixbkximWiTgdoFw1RLbmbdyCmoWbKBgUHvBb4TNbxHMhS4zG0ii7hJFt8xp
 GYF9XGi7MNZSrWpWESncKX6fFdJYOU3Jm2xgyB4zOgz52mwhUMOJV0S3Fw/bNdRoJp9b
 IHSgAcsDWGGN7BShK9aDO40u4jM8g+/MSRnAwcbW3rsXVkBXgvJvvLgHPH73WZTFvF+k
 SeGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8ydSULXhpnS+IHlEO6mcIkif2rvznLkOx5g93ANwtj4=;
 b=rk3JDKGNBrcqPlRhXoxwxQkz2kma2SFpjdhugi5xAYFilEc5Xb4whD0+cKHorXJ5sU
 kuyuBp3MZfqQKwYgJYJMbmFR2R//WYK/jC4gKyH4wAIIEQVkKet80qjuPZFA/wVimLUX
 7/owb6iCE63NtPTiwJJlsmR/2JPHNOMphDsCVcnvV9cO5wagcNCgRnJFH67G/B9a6LLP
 Z8Ewem+Z8ueQUKg3PhhLOcdoHgsraMRmGu3gNDkcUWZsMNI4gbxt6b/CSUdAXmPr7Dyq
 eYTkyomK8vzjAanyBHTwkOCT1NnQezWdOMIFavtR+W1R/W5F2QfAH68lxd+xKtYdn/xH
 Rdkg==
X-Gm-Message-State: APjAAAVZBqRUeyTnXYUNJj4z6L2+xq5YKbTNr2yNvIGXxAsY9QVAVelS
 BpRocxS+du/81WMC7ebWOVc=
X-Google-Smtp-Source: APXvYqygtCrUmUdUJMmbcfRWxioa9pHzvzUKG7bRsZbCukhjXSx3+2knDTwFGBmnS2g5idn/hQCveg==
X-Received: by 2002:a2e:9d0f:: with SMTP id t15mr3339882lji.171.1580401351910; 
 Thu, 30 Jan 2020 08:22:31 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id q10sm3258034ljj.60.2020.01.30.08.22.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 08:22:31 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-6-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ef701838-be43-e42c-9245-b28cda5ed9bb@gmail.com>
Date: Thu, 30 Jan 2020 19:22:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1580380422-3431-6-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 jonathanh@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 5/9] ASoC: tegra: add Tegra210 based
	AHUB driver
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

MzAuMDEuMjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Ci4uLgo+ICtzdGF0aWMg
aW50IHRlZ3JhX2FodWJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiArewo+
ICsJc3RydWN0IHRlZ3JhX2FodWIgKmFodWI7Cj4gKwl2b2lkIF9faW9tZW0gKnJlZ3M7Cj4gKwlp
bnQgcmV0Owo+ICsKPiArCWFodWIgPSBkZXZtX2tjYWxsb2MoJnBkZXYtPmRldiwgMSwgc2l6ZW9m
KCphaHViKSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIWFodWIpCj4gKwkJcmV0dXJuIC1FTk9NRU07
CgphaHViID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigqYWh1YiksIEdGUF9LRVJO
RUwpOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNh
LWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9t
YWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
