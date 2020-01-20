Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2133142F1B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 17:00:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50D84166C;
	Mon, 20 Jan 2020 16:59:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50D84166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579536006;
	bh=TXL4hv1wYAA4n5teKCKVWK9hmw528kvtheFSP3jOs2U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hhu7iKXTXvJnnYvEWm+4jCpAEkonnWo2h4xzzgF2LsGfUWShkDfeKZLN+ENGFKTXf
	 jLP+eY0wHN9JvSl0t8rok+TBOFfQq+hJ3xo5Di7xtfU/j61Odxl0LkJKMW7TutgmiK
	 alseaRFE8BnnTemx9V+87D74YCqK0EkzHxIMFSCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5A02F8022D;
	Mon, 20 Jan 2020 16:58:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1100F8020C; Mon, 20 Jan 2020 16:58:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71CA2F8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 16:58:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71CA2F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fP/G9x+L"
Received: by mail-ed1-x542.google.com with SMTP id r21so9386edq.0
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 07:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hCx0FkOyPUAD6FImSxkekqB+LP9ak15a5zOVHzRkbmQ=;
 b=fP/G9x+L9PkgABveHZWoY9IaNc5ecTNODt99ULgbvz4WSGj+RnBE9AphLW93GtkZ3F
 1JJaEFbixiJRZPRtcGTck/aS3dEh5qIPQaxMRxB2EgifHFzu9s6KQfhgI9PzfbSboilB
 IXo01B8GkrtVd7FFkOOl3Up1RM4ZRrWx+OJ/9NSKwrc9AngKrSVo/8izMGXL+UvzS3Vd
 8LvD+ure5A3IoxOcaX7RuFrYapJxo/1o86BbhRX+6EtEA167ic6Ecytm9lh9h2EJWyP8
 px4zrGg8O6XS7YbF8EQTkILa04SzPKDDcjT9b8yvTyKs/0yLzcZZ2s/azXsJbH20itbq
 zN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hCx0FkOyPUAD6FImSxkekqB+LP9ak15a5zOVHzRkbmQ=;
 b=bsP6U8m/rIQr2dQmksmk/pj7t7R8A9/DfKG0RnxZ9Zdfb8by+89i1f4NsC1ZvIzRGp
 CoHDV1dTpsYtem8y9FdWoIgUSPZbXdVXpnwUXfXfCnxYNiD52CywR5GRMPcmfzNpJz01
 4GqmiYktEvnnnv7B68FZQclmy2m73BIrXIiF59i4merm0BZQQeEBJlmVTCiLXzggZrdt
 0oCopaiDnc+mVqaSm7ctawwwEzEUW/L8AkKfj69FIS86yiGHxLntLcF60nmKVX+MK9f+
 Au+kIbUIMVSukgwpi+etAKydWwrnMb+GqYZk7x4cGRvGYWMX6Cq7db4fdUPkw6bc+JZO
 1VuQ==
X-Gm-Message-State: APjAAAVOs+MQGGiRfkpqJ9xUlcJb6wQemDOYe7Ub7J/IuwUrbvA0fE/9
 75crq75P+LJib6oAecoY4+4=
X-Google-Smtp-Source: APXvYqyWbXRB0TX6y0VmIJ7AAivnItgalHZTSGnWc7Y6DX1cBKxWX2c1pdhOcKTxeWIEECp/nlZ/zA==
X-Received: by 2002:a17:906:7006:: with SMTP id n6mr53213ejj.1.1579535893494; 
 Mon, 20 Jan 2020 07:58:13 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id r9sm1162950ejx.31.2020.01.20.07.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2020 07:58:12 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1579530198-13431-1-git-send-email-spujar@nvidia.com>
 <1579530198-13431-3-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d01ed171-d949-19b2-3390-ee30eada2779@gmail.com>
Date: Mon, 20 Jan 2020 18:58:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1579530198-13431-3-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, jonathanh@nvidia.com,
 viswanathl@nvidia.com, linux-tegra@vger.kernel.org, broonie@kernel.org,
 atalambedu@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH 2/9] ASoC: tegra: add support for CIF
 programming
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

SGVsbG8gU2FtZWVyLAoKMjAuMDEuMjAyMCAxNzoyMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6
Cgpbc25pcF0KCj4gVGVncmEzMCBhbmQgVGVncmExMjQgaGF2ZSBhbiBpZGVudGljYWwgQ0lGIHBy
b2dyYW1taW5nIGhlbHBlciBmdW5jdGlvbi4KCltzbmlwXQoKPiAtI2RlZmluZSBURUdSQTEyNF9B
VURJT0NJRl9DVFJMX0ZJRk9fVEhSRVNIT0xEX1NISUZUCTI0Cj4gLSNkZWZpbmUgVEVHUkExMjRf
QVVESU9DSUZfQ1RSTF9GSUZPX1RIUkVTSE9MRF9NQVNLX1VTCTB4M2YKPiAtI2RlZmluZSBURUdS
QTEyNF9BVURJT0NJRl9DVFJMX0ZJRk9fVEhSRVNIT0xEX01BU0sJKFRFR1JBMTI0X0FVRElPQ0lG
X0NUUkxfRklGT19USFJFU0hPTERfTUFTS19VUyA8PCBURUdSQTEyNF9BVURJT0NJRl9DVFJMX0ZJ
Rk9fVEhSRVNIT0xEX1NISUZUKQo+IC0KPiAtLyogQ2hhbm5lbCBjb3VudCBtaW51cyAxICovCj4g
LSNkZWZpbmUgVEVHUkEzMF9BVURJT0NJRl9DVFJMX0FVRElPX0NIQU5ORUxTX1NISUZUCTI0Cj4g
LSNkZWZpbmUgVEVHUkEzMF9BVURJT0NJRl9DVFJMX0FVRElPX0NIQU5ORUxTX01BU0tfVVMJNwo+
IC0jZGVmaW5lIFRFR1JBMzBfQVVESU9DSUZfQ1RSTF9BVURJT19DSEFOTkVMU19NQVNLCShURUdS
QTMwX0FVRElPQ0lGX0NUUkxfQVVESU9fQ0hBTk5FTFNfTUFTS19VUyA8PCBURUdSQTMwX0FVRElP
Q0lGX0NUUkxfQVVESU9fQ0hBTk5FTFNfU0hJRlQpCgpUaGUgQVVESU9DSUZfQ1RSTCBiaXRmaWVs
ZHMgYXJlIG5vdCB0aGUgc2FtZSBvbiBUMzAgYW5kIFQxMjQsIHdoeSBhcmUKeW91IGNsYWltaW5n
IHRoYXQgcHJvZ3JhbW1pbmcgaXMgaWRlbnRpY2FsPyBIYXZlIHlvdSBhY3R1YWxseSB0cmllZCB0
bwp0ZXN0IHRoZXNlIHBhdGNoZXMgb24gVDMwPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbHNhLWRldmVsCg==
