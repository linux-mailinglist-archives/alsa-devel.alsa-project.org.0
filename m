Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653871549C4
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 17:55:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F327C16CC;
	Thu,  6 Feb 2020 17:54:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F327C16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581008148;
	bh=q1LRmvmU3X76p6PuzjGj8Nb6/+nD8lW5uQBgldpPiok=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YgVMpzW2syw8SpjC3Tj743m8S+rgQmyOpx/zcQ/8fv4ceJ2b6gzt9LpSkrRLp26YN
	 dplGDruV+d2n/4U6VW8q/5QweDElY9S6dxOomvuT/rmuRtde1keEe0emomLpYHnGhX
	 FyNrCLxkRqT5NZorhMLS+gvL7Cj+ElnleEZyTfGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D118AF80059;
	Thu,  6 Feb 2020 17:54:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCFA2F80162; Thu,  6 Feb 2020 17:54:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 502A1F80059
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 17:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 502A1F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Oe19er23"
Received: by mail-lj1-x241.google.com with SMTP id q8so6816179ljj.11
 for <alsa-devel@alsa-project.org>; Thu, 06 Feb 2020 08:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aYjPID+86AwFTbXgWpB4ZDC6SCfeqfl8MOuO71FjWTc=;
 b=Oe19er23o00T0c4K/YdRf6LayjLgkdOVvy2wtLnqQzWAXAfyTipZh+ox7V2UmKx6uP
 v0O+9GwYp6MaPZ4fG8bbVJKzfq5tQaAotTOLA7S7x3zLRwQW7IfOJEunjOuYlghcSFzZ
 vE46F9MJMajetQcMCYySEqElf+1oto5+pquM9b9ZJSIdta4OgPfE5ru6PdJ6v1dOVNTO
 xvUsVYpHfBIL9iVPUfDOAXEawcjRnYqfts+UBmW68uj08B+vQido5r868WqCADKNy8aA
 yE3E/VyYyltjpCdgHdppLbXEIGK6aHLIdAmUOdydd+Cz/AwnesEX5xISEFKM9j3TT/Ks
 h6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aYjPID+86AwFTbXgWpB4ZDC6SCfeqfl8MOuO71FjWTc=;
 b=nUGdlqsbhT0A6zl+aTXJOVmnV79D64BmV5cUTmG8COtOgPO2TyDFKqNi006TXudAc3
 5lSg4vSHn4qsMehuRMPBW1+wKs7Umvr0SoJOS+dcoOT6K2JOzF6k3XAUjXraMb74SEJp
 kvC4loh1mOugMTmcjRwZqyAj8Mq2dZSOsCMmfjFuKHPlequtZ3kPGjTCYaZjMNwlIg61
 CCEE1uR0fxTO5fR+U8dmQJyajSzpVBJ2TYSiN/GLd+LJK7tfCl98FuZK5wCVvzmpZ2ZN
 SYyK1iM/hZekG2DTCaUX9amvqz2L+KvWTAkysKmK7PIB84xmHm0FJzp1hCPIWQW7VTcl
 YvJg==
X-Gm-Message-State: APjAAAWNkS0izfRwbd+/mP+4/REDyBj9ISWqYwqAUuXU6Jg9WLNvfLaO
 znbqtdyyFS9yCT8Bac6jJK4=
X-Google-Smtp-Source: APXvYqx0LdMbwbSEVNhUV1hE5Xi3kfdxfUnR07rFEeIfYMgYE+cPOQLkO0RNLi/10WFfpWxsuIWmLA==
X-Received: by 2002:a2e:8699:: with SMTP id l25mr2509962lji.137.1581008039144; 
 Thu, 06 Feb 2020 08:53:59 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id y7sm1649358ljy.92.2020.02.06.08.53.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 08:53:58 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-4-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9ada4090-169e-0767-db5d-739f6e621812@gmail.com>
Date: Thu, 6 Feb 2020 19:53:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1580380422-3431-4-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, atalambedu@nvidia.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 3/9] ASoC: tegra: add Tegra210 based
	DMIC driver
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
Y29uc3Qgc3RydWN0IHJlZ19kZWZhdWx0IHRlZ3JhMjEwX2RtaWNfcmVnX2RlZmF1bHRzW10gPSB7
Cj4gKwl7IFRFR1JBMjEwX0RNSUNfVFhfSU5UX01BU0ssIDB4MDAwMDAwMDF9LAo+ICsJeyBURUdS
QTIxMF9ETUlDX1RYX0NJRl9DVFJMLCAweDAwMDA3NzAwfSwKPiArCXsgVEVHUkEyMTBfRE1JQ19D
RywgMHgxfSwKPiArCXsgVEVHUkEyMTBfRE1JQ19DVFJMLCAweDAwMDAwMzAxfSwKPiArCS8qIEJl
bG93IGVuYWJsZXMgYWxsIGZpbHRlcnMgLSBEQ1IsIExQIGFuZCBTQyAqLwo+ICsJeyBURUdSQTIx
MF9ETUlDX0RCR19DVFJMLCAweGUgfSwKPiArCS8qIEJlbG93IGFzIHBlciBsYXRlc3QgUE9SIHZh
bHVlICovCj4gKwl7IFRFR1JBMjEwX0RNSUNfRENSX0JJUVVBRF8wX0NPRUZfNCwgMHgwfSwKPiAr
CS8qIExQIGZpbHRlciBpcyBjb25maWd1cmVkIGZvciBwYXNzIHRocm91Z2ggYW5kIHVzZWQgdG8g
YXBwbHkgZ2FpbiAqLwo+ICsJeyBURUdSQTIxMF9ETUlDX0xQX0JJUVVBRF8wX0NPRUZfMCwgMHgw
MDgwMDAwMH0sCj4gKwl7IFRFR1JBMjEwX0RNSUNfTFBfQklRVUFEXzBfQ09FRl8xLCAweDB9LAo+
ICsJeyBURUdSQTIxMF9ETUlDX0xQX0JJUVVBRF8wX0NPRUZfMiwgMHgwfSwKPiArCXsgVEVHUkEy
MTBfRE1JQ19MUF9CSVFVQURfMF9DT0VGXzMsIDB4MH0sCj4gKwl7IFRFR1JBMjEwX0RNSUNfTFBf
QklRVUFEXzBfQ09FRl80LCAweDB9LAo+ICsJeyBURUdSQTIxMF9ETUlDX0xQX0JJUVVBRF8xX0NP
RUZfMCwgMHgwMDgwMDAwMH0sCj4gKwl7IFRFR1JBMjEwX0RNSUNfTFBfQklRVUFEXzFfQ09FRl8x
LCAweDB9LAo+ICsJeyBURUdSQTIxMF9ETUlDX0xQX0JJUVVBRF8xX0NPRUZfMiwgMHgwfSwKPiAr
CXsgVEVHUkEyMTBfRE1JQ19MUF9CSVFVQURfMV9DT0VGXzMsIDB4MH0sCj4gKwl7IFRFR1JBMjEw
X0RNSUNfTFBfQklRVUFEXzFfQ09FRl80LCAweDB9LAo+ICt9OwoKSSdkIGFkZCBhIHNwYWNlIG9u
IHRoZSByaWdodCBzaWRlIG9mIGB9YCwgZm9yIGNvbnNpc3RlbmN5IHdpdGggdGhlIGxlZnQuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkFsc2EtZGV2ZWwg
bWFpbGluZyBsaXN0CkFsc2EtZGV2ZWxAYWxzYS1wcm9qZWN0Lm9yZwpodHRwczovL21haWxtYW4u
YWxzYS1wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Fsc2EtZGV2ZWwK
