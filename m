Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A69511CFB1
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 15:23:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1897F16F3;
	Thu, 12 Dec 2019 15:23:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1897F16F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576160632;
	bh=zHUs8C13mxcnHIbm7nn5cqR95SVeyCmfqnh7LBbOxno=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lCCK7LUvczCeVA/0DPm6Tv2maBU+CfGwMoBJF2pd0JEm0brRZGWw5FLoFBRZAdh9f
	 xn4fkWDmuzYIZokQeuu1hAuOcXCxVzO+wSb96eT+SmYC5Nnj8EgKM5mM+uAJblL837
	 fajButAbQ0t1akvD+Jolt5trg7PEUPdpR3HKP/MU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BAF5F8026A;
	Thu, 12 Dec 2019 15:19:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFF9FF801F4; Thu, 12 Dec 2019 03:17:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D850FF8011E
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 03:17:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D850FF8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Gzoy0jSI"
Received: by mail-lj1-x242.google.com with SMTP id z17so380586ljk.13
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 18:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KdekJit4TR3IPCfvOdjWaldHsRv3CP6xyOWik6J728U=;
 b=Gzoy0jSIMfRnlkLFprOT/8bSftgaE1XGMH2S11/bQyAYAgPyGLv7UfA3to2mBC9ahw
 lasT8Xz3//jxRU/sg1UwEqg/4uO/pMXddC8R6YpL2xv3nsNj/3Y2vkY7uXyAsAgJStyQ
 hejzY/DNisbA6BelKCv50AYKV8pkdocUm84rCnjpy/22lN4Bl5cdV0ea7n3hD9dh1gf/
 129rWL67ghxxsR7YAyw5UNsWuHCfbxHZmoweiwrnS20wIiWM5FN6Hnj9bclUIFxemkA9
 DRct4rFSvRA+zbkw7T2j7ectI//ARXOvmkDeG002BMved3WIj+FEXxsUKt0FCxl+J+KN
 LnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KdekJit4TR3IPCfvOdjWaldHsRv3CP6xyOWik6J728U=;
 b=GYaiwtJIoIMvPJWsTJFRvNBdnrZTJbpJD10GCt07lQaJprNzP7KTd3dvqjDywyKGX4
 ZZgxxcCBFpfyp62zz88U3Jk4k4ZpyBoRWvhpySXHa9uavVtTpghRNfsKBbq6T/NyfOUZ
 shueFrCwV3ta1ScCes5mu6pVl0m6xQvi2J74jIcmudQLqlLSU21zEBmAV1KszgBBvxXH
 IfzbImlk+/gFb8rUIwSj8xSQRZDiXO0PePClZeDzj0kFXP9xnc1Cbla+ZNnUIAOZDp4x
 SHwasf2VhG6GjTltJbtNj3U1gMi6x2n2OIeoImrrPQVHJQhnFkJwxOtzZQlFtCkL3Bxl
 /bhg==
X-Gm-Message-State: APjAAAW28wNvnrCmhjqjDDaHYbPFHp38UEN5srnqApRhhNVJvPfbzdiy
 ndSuqq1blj960X7ffnqcV4J8Uu7j
X-Google-Smtp-Source: APXvYqxocQ3Qzqf1VktbMSvmfBoQQJvSlcA7ebJXnc2n/qMpwM8OtMrx9qViLmWIbhcJSRtMR7Gk2w==
X-Received: by 2002:a05:651c:111a:: with SMTP id
 d26mr3878082ljo.153.1576117032279; 
 Wed, 11 Dec 2019 18:17:12 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id u21sm2041632ljl.93.2019.12.11.18.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2019 18:17:11 -0800 (PST)
To: Mark Brown <broonie@kernel.org>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
 <20191209164027.GG5483@sirena.org.uk>
 <7fe879fd-dae3-1e64-1031-cd9f00e31552@gmail.com>
 <20191209204735.GK5483@sirena.org.uk>
 <560185d9-32fd-a85e-5feb-105f79b953c6@gmail.com>
 <20191210185933.GJ6110@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <17cb9e87-e1bd-93a0-aa9c-0f30c2263ec0@gmail.com>
Date: Thu, 12 Dec 2019 05:17:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191210185933.GJ6110@sirena.org.uk>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 12 Dec 2019 15:19:28 +0100
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, pgaikwad@nvidia.com,
 lgirdwood@gmail.com, spujar@nvidia.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com, josephl@nvidia.com, linux-clk@vger.kernel.org,
 mmaddireddy@nvidia.com, daniel.lezcano@linaro.org, krzk@kernel.org,
 jonathanh@nvidia.com, mturquette@baylibre.com, devicetree@vger.kernel.org,
 arnd@arndb.de, markz@nvidia.com, alexios.zavras@intel.com, robh+dt@kernel.org,
 tiwai@suse.com, linux-tegra@vger.kernel.org, horms+renesas@verge.net.au,
 tglx@linutronix.de, allison@lohutok.net, sboyd@kernel.org,
 gregkh@linuxfoundation.org, pdeschrijver@nvidia.com,
 linux-kernel@vger.kernel.org, vidyas@nvidia.com, Jisheng.Zhang@synaptics.com,
 Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v3 09/15] ASoC: tegra: Add fallback for
	audio mclk
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

MTAuMTIuMjAxOSAyMTo1OSwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIFR1ZSwgRGVjIDEw
LCAyMDE5IGF0IDA5OjI0OjQzUE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAKPj4g
SW4gc29tZSBjYXNlcyBpdCBjb3VsZCBiZSBwYWluZnVsIHRvIG1haW50YWluIGRldmljZS10cmVl
IGNvbXBhdGliaWxpdHkKPj4gZm9yIHBsYXRmb3JtcyBsaWtlIE5WSURJQSBUZWdyYSBTb0NzIGJl
Y2F1c2UgaGFyZHdhcmUgd2Fzbid0IG1vZGVsZWQKPj4gY29ycmVjdGx5IGZyb20gdGhlIHN0YXJ0
Lgo+IAo+PiBJIGFncmVlIHRoYXQgcGVvcGxlIHNob3VsZCB1c2UgcmVsZXZhbnQgZGV2aWNlLXRy
ZWVzLiBJdCdzIHF1aXRlIGEgbG90Cj4+IG9mIGhhc3NsZSB0byBjYXJlIGFib3V0IGNvbXBhdGli
aWxpdHkgZm9yIHBsYXRmb3JtcyB0aGF0IGFyZSBwZXJtYW5lbnRseQo+PiBpbiBhIGRldmVsb3Bt
ZW50IHN0YXRlLiBJdCBjb3VsZCBiZSBtb3JlIHJlYXNvbmFibGUgdG8gZ28gdGhyb3VnaCB0aGUK
Pj4gcGFpbiBpZiBrZXJuZWwgcmVxdWlyZWQgYSBmdWxsLWZlYXR1cmVkIGRldmljZSB0cmVlIGZv
ciBldmVyeSBTb0MgZnJvbQo+PiB0aGUgc3RhcnQuCj4gCj4gV2UgYWJzb2x1dGVseSBzaG91bGQg
c3VwcG9ydCB0aGUgbmV3ZXIga2VybmVsIHdpdGggb2xkZXIgZGV2aWNlIHRyZWUKPiBjYXNlLCB3
aGF0J3MgbGVzcyBjbGVhciB0byBtZSBpcyB0aGUgbmV3IGRldmljZSB0cmVlIHdpdGggb2xkIGtl
cm5lbAo+IHdoaWNoIGlzIGFwcGx5aW5nIExUUyB1cGRhdGVzIGNhc2UuICBUaGF0IGRvZXMgc2Vl
bSBpbmNyZWRpYmx5Cj4gc3BlY2lhbGlzdCAtIEknZCBob25lc3RseSBuZXZlciBoZWFyZCBvZiBw
ZW9wbGUgZG9pbmcgdGhhdCBiZWZvcmUgdGhpcwo+IHRocmVhZC4KPiAKClRoZXJlIHdhcyBhIHBy
ZWNlZGVudCBpbiB0aGUgcGFzdCBbMV0uCgpbMV0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTgv
OC8yMC80OTcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
QWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qub3JnCmh0dHBz
Oi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxzYS1kZXZlbAo=
