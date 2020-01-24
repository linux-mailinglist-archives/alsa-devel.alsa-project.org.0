Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E4A14779E
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 05:30:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 185EA167F;
	Fri, 24 Jan 2020 05:29:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 185EA167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579840247;
	bh=smQfODvTpLoo2t2yrgpaE3XV2DHm8BXcs1EBN1nWUqw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aR2nhC5vpF5vOvVrFHL90wuAZnuoOVALM5N9poP2235V3MYC0BQeov64A0GZB/Z7Y
	 jcmBX/MNNqVE0TN5zxJIIdAvT7SA5D9UsNG+bcf7kkNywOQpUv5/mDpoFKWgL7JLh/
	 Mdl00gY9z7MdGSenCAHeSsntKuzBHhdK5aC+SxiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9862FF8020C;
	Fri, 24 Jan 2020 05:29:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0EA2F8020C; Fri, 24 Jan 2020 05:28:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CEF9F800BA
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 05:28:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CEF9F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b7VL69Al"
Received: by mail-lf1-x143.google.com with SMTP id n25so309056lfl.0
 for <alsa-devel@alsa-project.org>; Thu, 23 Jan 2020 20:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VLtJqd9n8iEGWWWwFYJk44IhKuekuFlbjkOOSjbK4Ug=;
 b=b7VL69Al4Q3TfIx5Glo4Lk/mg/RMvnYyJKH/l2Yzy5Oex07mnDpixdToqeCBQaoAWK
 B9nzH8IJcDmQd26XXA66TJkZfV7/u9aW1PcLZlg43tTjKlDt7O6av3JfuZa8oW+kOZbT
 PiSjuNcQh+X8/rsAroz+7FMrjT+mrpQBUdUGUxR4QvetWX9Z5OW+6b0vIZoky9V0BvZh
 14IHMkUS21cds/eS9GcYG3UndNtA+LoWyAnB9lw4IHvNJDW188GKTHaJ58/0Z8bY4J0L
 7o1xo3iI45c56/LRLxwcXsTcoo1Ys0YXF9MmCgeQ7+KWP+9bvL8b0DK0NiUxUKPRubbG
 5ONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VLtJqd9n8iEGWWWwFYJk44IhKuekuFlbjkOOSjbK4Ug=;
 b=dLEaouaIiN/IwN2qTiOoR7wORTyp/Tgwa2yGIuBLssDx9D9JmQiYRoL7uu6mp1tgRe
 AjbtE1FFREnVtURgc4dNJfd1jugg02c/nJAkzaOB7cmw3WcqbB+K8YN0dpuBP+2S+3e0
 IVsD9QHCIOB0rGxNnF5pN5YteTpT60BWylwAt8oXB558Xn88l8KuEog1NgsFXBC8dG/S
 XRAat0AisJ1foe6ubVRFWgWZQbFjCmn29zk06tn1yrsrdDKDjzgwBqODdy7i8c9kG3Ym
 1xoCTuKEzMB39IOVSSuCoLLQNy1BSmrhtFqnSvGMd7/rgyrgB4mh5PAINmc3r9IGYer4
 wBUg==
X-Gm-Message-State: APjAAAXQiYst1JGRF118uCOS7xGuI0XU9JJSr/P9ieD3B9+KyJbqSf00
 8hE/Go66WJhwuTC9GhZRi48=
X-Google-Smtp-Source: APXvYqyRExhBqqvbAcTEoPhTfbxzuj7kgwI599mLqXvMCeAtJ/7luyFkKBpeGBOzIDDLGas1DcH8rw==
X-Received: by 2002:a05:6512:3ac:: with SMTP id
 v12mr496446lfp.205.1579840134560; 
 Thu, 23 Jan 2020 20:28:54 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id e20sm2302728ljl.59.2020.01.23.20.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 20:28:54 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-6-git-send-email-spujar@nvidia.com>
 <5ed7482e-e874-9e11-c84e-7418e4b5162e@gmail.com>
 <d160fa01-27d0-6290-cb16-07d159d6fbb2@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <37669247-daaf-c6cb-0ef2-464e61db9838@gmail.com>
Date: Fri, 24 Jan 2020 07:28:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <d160fa01-27d0-6290-cb16-07d159d6fbb2@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 atalambedu@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: tegra: add Tegra210 based AHUB
 driver
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

MjQuMDEuMjAyMCAwNjozOSwgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4+PiArc3RhdGljIGlu
dCB0ZWdyYV9haHViX3B1dF92YWx1ZV9lbnVtKHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjdGwsCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHN0cnVjdCBzbmRfY3RsX2VsZW1fdmFsdWUgKnVjdGwpCj4+PiArewo+Pj4g
K8KgwqDCoMKgIHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY21wbnQgPQo+Pj4gc25kX3NvY19k
YXBtX2tjb250cm9sX2NvbXBvbmVudChrY3RsKTsKPj4+ICvCoMKgwqDCoCBzdHJ1Y3QgdGVncmFf
YWh1YiAqYWh1YiA9IHNuZF9zb2NfY29tcG9uZW50X2dldF9kcnZkYXRhKGNtcG50KTsKPj4+ICvC
oMKgwqDCoCBzdHJ1Y3Qgc25kX3NvY19kYXBtX2NvbnRleHQgKmRhcG0gPQo+Pj4gc25kX3NvY19k
YXBtX2tjb250cm9sX2RhcG0oa2N0bCk7Cj4+PiArwqDCoMKgwqAgc3RydWN0IHNvY19lbnVtICpl
ID0gKHN0cnVjdCBzb2NfZW51bSAqKWtjdGwtPnByaXZhdGVfdmFsdWU7Cj4+PiArwqDCoMKgwqAg
c3RydWN0IHNuZF9zb2NfZGFwbV91cGRhdGUgdXBkYXRlW1RFR1JBX1hCQVJfVVBEQVRFX01BWF9S
RUddID0KPj4+IHsgfTsKPj4gU2hvdWxkbid0IHRoaXMgYmUgezB9IHRvIG1ha2UgYXJyYXkgemVy
bydlZD8KPiAKPiBJc24ndCBpdCB0aGUgc2FtZSB3aXRoIGVtcHR5IGJyYWNlcz8KCkxvb2tzIGxp
a2UgaXMgc2hvdWxkIGJlIHRoZSBzYW1lIGJlY2F1c2UgdHVybnMgb3V0IEdDQyBoYXMgYW4gZXh0
ZW5zaW9uCmZvciB0aGF0LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCg==
