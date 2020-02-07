Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05050155E15
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2020 19:27:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D57316A6;
	Fri,  7 Feb 2020 19:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D57316A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581100050;
	bh=l/NAStvXHgzFoHjahnNWCyKBD4C3oYdvIqp84OSQLt8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MiDI5VVJ3cIUb1c66yRT/q7YVJkPmAjyBCrkdHfbSLyxN0pRKtRkuXF9UIYgA39Yx
	 t0IPVXjuf98Wgz00H2YMLdcw9VdGc5Mm8EJ8YLYbKkOubVKBUlqxhNgOEV0vflU26V
	 AhLrY0dAPpb2MRWzWH+6CqnF1fLPlTew7HfaGrVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8980DF80142;
	Fri,  7 Feb 2020 19:25:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75E2DF80148; Fri,  7 Feb 2020 19:25:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1DC7F800B2
 for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2020 19:25:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1DC7F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mUjft++C"
Received: by mail-ed1-x541.google.com with SMTP id j17so551970edp.3
 for <alsa-devel@alsa-project.org>; Fri, 07 Feb 2020 10:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GMiZo8m6MVwteC6MTZZKLG6FimFuIinamHp+P+KB9FQ=;
 b=mUjft++CBTt8AY80NHTjS5UiGF6uZzqJ3gy2o49fQU4PnoKfCu4IEwEQYdrXH+5XwP
 u7E2bN4mIOO/YZ88FwT0gmMwwabzhE7a96vAcQL+umRxmXlh3M0oaN7oJ7xyUF73rE5h
 nv0jIE5TZldSEs8X3pEHGG2LTUmmur5JgSsOT+YG5QAHKCqDtRPSQzmV2cSnHIumhhqw
 w1Gi2F4uIp4EItav1Verw+mqidD9pAf63TpEU45IFe0QxS7GyilJwXuZU/UX2/cvTE7X
 xT2eyZ3xEEpSiQyz/wfIXlcITyW250WsMg9Z9y/fgsnSYbmmaWC32pmooOM/yu5rQgNq
 C86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GMiZo8m6MVwteC6MTZZKLG6FimFuIinamHp+P+KB9FQ=;
 b=OnOwd1HjQ4ySv0SBfupq5wxxptFJqw4HxJQ87C5YVflwYqPiKu0mpIzqkzNQQWRNyG
 iYa/l8m0MUZTAZuGgo8I29Dq3VejKl+UNGahF6iATg55hCcBYIUQdMDPhEIRSZolAMMe
 fv61HzlEGBAvU5qQnVhcLt9zgun79Gl99e1Rcbp3Skb8uAkzo9UMrMu0u5AttY59k7ws
 qKlr6dUPuaMuMZlasOQE2LlAulIt3Gzd900PosrIAD3dbDo2j+3f5fxB9TlIZ8/JX5lD
 RciqbxdpqFJkUJwwBnxA0cZlIR46HCwue7ypNwW80eNvuVDiVLx3dW4CjvOlrU6mLPte
 nG7g==
X-Gm-Message-State: APjAAAUOZhmb6a5/V46Zdvhy4DWqFyOCa46/dH7KOIIColAvihPtwf7V
 3Yglh7B2IB5nrkk4d/rdfy0=
X-Google-Smtp-Source: APXvYqw49WYYptXF2zK5xUtZHkEq6r6YXGLC4FRv/vjzsmj8o/wuALuNtCAWaKdWWXv/Vj7W5EaEaQ==
X-Received: by 2002:aa7:c71a:: with SMTP id i26mr203017edq.300.1581099943747; 
 Fri, 07 Feb 2020 10:25:43 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id e24sm208276edy.93.2020.02.07.10.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 10:25:43 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <fcab0af1-fe84-6028-701b-ab101feaa8de@gmail.com>
 <d17b2654-a888-8251-468d-12ef1451cd4b@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <40a4d544-7c33-3f28-0b9c-384bc9fe3b53@gmail.com>
Date: Fri, 7 Feb 2020 21:25:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <d17b2654-a888-8251-468d-12ef1451cd4b@nvidia.com>
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

MDcuMDIuMjAyMCAxNDozMCwgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4gCj4gCj4gT24gMi82
LzIwMjAgMTE6MDYgUE0sIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gRXh0ZXJuYWwgZW1haWw6
IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMKPj4KPj4KPj4gMzAuMDEu
MjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4+IC4uLgo+Pj4gwqAgc291bmQv
c29jL3RlZ3JhL0tjb25maWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDU2ICsrCj4+IFByb2JhYmx5IHdvbid0IGh1cnQgdG8gZW5hYmxl
IHRoZSBuZXcgZHJpdmVycyBpbiB0aGUKPj4gYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZpZz8K
PiAKPiBEbyB5b3UgbWVhbiwgaWYgZHJpdmVycyBjYW4gYmUgZW5hYmxlZD8KClllcywgSSBtZWFu
IHRvIGVuYWJsZSB0aGVtIGluIHRoZSBkZWZhdWx0IGtlcm5lbCBjb25maWd1cmF0aW9uLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1h
aWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFs
c2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
