Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F87C11807C
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:31:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B51211C;
	Tue, 10 Dec 2019 07:31:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B51211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575959517;
	bh=ewEZbqpClwSvBYYZcOLcwbAoQqp10oua+FJ3pmTIDxs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ge0VVdMJvgrVyXkYINwOe6R2HIVNAEY2otxRyHW5VTzsnhtzEK8aBq7ve3zREQzyD
	 CYFfOOdEEgIsLNaTSho9d3WRVvdhAOLnJKmIhkxSqPyklKU3vqrgPb8jk/7D01hBSY
	 UNwF5S6ZQyksWCe39TQKIGu8Zqsqr/Nf4G0N1lsE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A37EF8025E;
	Tue, 10 Dec 2019 07:28:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89746F80234; Mon,  9 Dec 2019 21:32:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22DABF800C4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 21:32:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22DABF800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XnoB37SZ"
Received: by mail-lj1-x243.google.com with SMTP id c19so17137958lji.11
 for <alsa-devel@alsa-project.org>; Mon, 09 Dec 2019 12:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7izI5yySW8HJDMLC7WRv/sy3ibH99uzphJXtJkJddJQ=;
 b=XnoB37SZ0a/YxpyqAi9dQGwkTb0afAZoZxp1yOZoPehpJzvD0R8gCMMhe3Fl24vHgF
 UOcSqopMJwFKgkiAL6lSqyUShBFC3Ux4Q+ZjsAW9dEyeiurg1bY+1jf2AgNE8hIVosZy
 BunkJgj/TaQvjFwcpiKmchdtn88nYXylH01axcN+lAmU7onGGYXAklcwQWjmKXmFnZqj
 eIiE4bwUxWeFgCimel2+Iu0VH3rKcgg8RegRyu8FpaPV/ptkIu+Y00kCC/xU2C7Q2kbI
 bybns2WZRfdVw6aReHfKMrw8Bn82yY86eRLYRaEqiaCf0aXiLQUU8E3Oqdmhp92qwWOj
 K7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7izI5yySW8HJDMLC7WRv/sy3ibH99uzphJXtJkJddJQ=;
 b=Gr1eb3b2uWTrLTUtbdBQ0Wy5YLv9xICOIpShXWuBoZcN9qIYAblQpjYO2tLF39wH7I
 kZsi1jIpo6WREDpUAsosojgfdpmK7zfEjSC5IS+5oAevK560L/YYPLUN4cy+Lhh74P1y
 4Rq7cfhbg9x09ai/2eJNoajSFr4+OR38VknhZ3MkKCUm1N5busbtVNl/YkRrt7wy2LU+
 EP8yxedvRN4G5i9KOFtNX2h7PmlxWXKT47FrofY2VDAhI81ff6yGPPLPuHdWF7Hrpl7U
 VTuu7fowjYOJXc71IrdrJl+DjKUhlwa0Q0chF/3WCVZCZW3BdbR6TQIoLXD7Y7gtDnrt
 kXiw==
X-Gm-Message-State: APjAAAVundjEnoImGPxnSiO0s8aFfWr2eYKSExRdkvzWhbclo/bAPlkd
 /bQsSDaVw5fEi7cILaErr48Edmt6
X-Google-Smtp-Source: APXvYqw6Z3Y4rpulNU8ccGeKOMeq0qRcIep/L2gJzf/UAE2VbwUX37q+bKKC5bmFhvBRfIijYPPyHQ==
X-Received: by 2002:a2e:8953:: with SMTP id b19mr16426695ljk.249.1575923521486; 
 Mon, 09 Dec 2019 12:32:01 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id z9sm475423ljm.40.2019.12.09.12.31.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 12:32:00 -0800 (PST)
To: Mark Brown <broonie@kernel.org>,
 Sowjanya Komatineni <skomatineni@nvidia.com>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
 <20191209164027.GG5483@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7fe879fd-dae3-1e64-1031-cd9f00e31552@gmail.com>
Date: Mon, 9 Dec 2019 23:31:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191209164027.GG5483@sirena.org.uk>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 Dec 2019 07:28:27 +0100
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, pgaikwad@nvidia.com,
 lgirdwood@gmail.com, spujar@nvidia.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com, josephl@nvidia.com, linux-clk@vger.kernel.org,
 mmaddireddy@nvidia.com, daniel.lezcano@linaro.org, krzk@kernel.org,
 jonathanh@nvidia.com, mturquette@baylibre.com, devicetree@vger.kernel.org,
 arnd@arndb.de, markz@nvidia.com, alexios.zavras@intel.com, robh+dt@kernel.org,
 tiwai@suse.com, linux-tegra@vger.kernel.org, horms+renesas@verge.net.au,
 tglx@linutronix.de, allison@lohutok.net, sboyd@kernel.org,
 gregkh@linuxfoundation.org, pdeschrijver@nvidia.com,
 linux-kernel@vger.kernel.org, vidyas@nvidia.com, Jisheng.Zhang@synaptics.com
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

MDkuMTIuMjAxOSAxOTo0MCwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIFRodSwgRGVjIDA1
LCAyMDE5IGF0IDA2OjQ4OjQ5UE0gLTA4MDAsIFNvd2phbnlhIEtvbWF0aW5lbmkgd3JvdGU6Cj4+
IG1jbGsgaXMgZnJvbSBjbGtfb3V0XzEgd2hpY2ggaXMgcGFydCBvZiBUZWdyYSBQTUMgYmxvY2sg
YW5kIHBtYyBjbG9ja3MKPj4gYXJlIG1vdmVkIHRvIFRlZ3JhIFBNQyBkcml2ZXIgd2l0aCBwbWMg
YXMgY2xvY2sgcHJvdmlkZXIgYW5kIHVzaW5nIHBtYwo+PiBjbG9jayBpZHMuCj4+Cj4+IE5ldyBk
ZXZpY2UgdHJlZSB1c2VzIGNsa19vdXRfMSBmcm9tIHBtYyBjbG9jayBwcm92aWRlci4KPj4KPj4g
U28sIHRoaXMgcGF0Y2ggYWRkcyBmYWxsYmFjayB0byBleHRlcm4xIGluIGNhc2Ugb2YgcmV0cmll
dmluZyBtY2xrIGZhaWxzCj4+IHRvIGJlIGJhY2t3YXJkIGNvbXBhdGlibGUgb2YgbmV3IGRldmlj
ZSB0cmVlIHdpdGggb2xkZXIga2VybmVscy4KPj4KPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPiAKPiBXaHkgd291bGQgdGhpcyBuZWVkIHRvIGJlIGEgc3RhYmxlIGZpeD8gIFByZXN1bWFi
bHkgcGVvcGxlIHdpdGggc3RhYmxlCj4ga2VybmVscyBhcmUgdXNpbmcgdGhlIG9sZCBkZXZpY2Ug
dHJlZSBhbnl3YXk/Cj4gCgpQcmVzdW1hYmx5LCB5ZXMuCgpBdCBsZWFzdCBSb2IgSGVycmluZyBp
cyBhc2tpbmcgdG8gbWFpbnRhaW4gYmFja3dhcmRzIGNvbXBhdGliaWxpdHkKYmVjYXVzZSBzb21l
IGRpdHJvcyBhcmUgdXNpbmcgbmV3ZXIgZGV2aWNlLXRyZWVzIHdpdGggc3RhYmxlIGtlcm5lbHMu
CkknbSBwZXJzb25hbGx5IGFsc28gdGVuZGluZyB0byB1c2UgdGhlIG5ld2VyIERUQiB3aXRoIG9s
ZGVyIGtlcm5lbAp2ZXJzaW9uIHdoZW5ldmVyIHRoZXJlIGlzIGEgbmVlZCB0byBjaGVjayBzb21l
dGhpbmcgdXNpbmcgc3RhYmxlIGtlcm5lbC4KUGVyaGFwcyBsb3Npbmcgc291bmQgaXMgbm90IHZl
cnkgaW1wb3J0YW50LCBidXQgd2lsbCBiZSBuaWNlciBpZiB0aGF0CmRvZXNuJ3QgaGFwcGVuLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVs
IG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFu
LmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNhLWRldmVsCg==
