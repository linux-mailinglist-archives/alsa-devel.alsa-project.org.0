Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D599F1535E3
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Feb 2020 18:05:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7369E1614;
	Wed,  5 Feb 2020 18:04:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7369E1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580922303;
	bh=uURoSRqO4/LYbOLm898HxAboLUgWKoOP6qeMx8ZwPmM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BHAwhoqOywf2kbwdHkceof0XEtxwiGRqkqEC6+R9p3fr0QrGdLUVNAxQeN7Xks1YS
	 0MxbsRwk8igw1MBIkVxCUsREwr/zk1RpxZaombRGshvitJUnYzGSvT9Igi5kuPIBYN
	 n/hDe42D+20hwKbjvxfOBbnEAX0dDQyV9ZWXPe5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F01B5F80276;
	Wed,  5 Feb 2020 18:02:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 886E2F80274; Wed,  5 Feb 2020 18:02:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F13B7F8025F
 for <alsa-devel@alsa-project.org>; Wed,  5 Feb 2020 18:02:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F13B7F8025F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="grh0SIQX"
Received: by mail-wr1-x442.google.com with SMTP id t2so3670260wrr.1
 for <alsa-devel@alsa-project.org>; Wed, 05 Feb 2020 09:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pQL4z7TXHWq/sFcG+ZfVL1ooPqEtHyGn+vIefYNyNNg=;
 b=grh0SIQXYGMQHg5hvBkzqFu3DuYjrp9vBhwvlMljGOgbkfCumw1DJ4TTUAW0lDoQMc
 31RrLv1Z+srJRkH1JK2xMnRPyQ/k/SsvtZcHVvfGidxPVqDK9sutFb1WD5kNE37EebMS
 nsYPQCqM80h4/pezolZowWVLRFp4ENtOGUKuPOnQY8QOavgnMuicRSRtepla4OoW1jpc
 vxfYY6DP1aTEtau0Z33Hskp7Pk8Gw4gCV7lOwvDsF4/dPkNPx5ttEEnayeFlgVs7p9Jp
 OnkPT3r3B2neLR4xU2iEDDhr0N4vUeEZFLPE21TfuaRWBSXpWelP0D3uqoo7KRq75mQJ
 5ELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pQL4z7TXHWq/sFcG+ZfVL1ooPqEtHyGn+vIefYNyNNg=;
 b=El9rT27JpP+NtPc+/t2YGjvAlLN894VtZVAZ/prC6v7DmE/HcvjPeU8v2cmjAI+EPt
 bdRQrF0xtVEPbcgV4Vg8qPsWGuFHZ6XcWUGqjBpkDuIyKjB10bVjcBohTqL6TTqv9wmc
 XtLDbjNbeR1EsV2mnd1OHHgxBbAZNp/PfazGcxeYakJPTZHjrAOqObn9DM0ZZYk7bhBv
 8ekmpLgI2eoo4YRLCVYNJzIFTpAXmNi3v2ZjPRTwUJExQDwZQUfdX9b2qJZ4UkDe70ph
 kM8fjc1RNqioaCcsDMTilpnyVw5rQP8Ad9PP48LlJbdLRuWxp7vLl9ZFh+tpX+b8Wv6c
 p91Q==
X-Gm-Message-State: APjAAAV5OwTGg33ZjnlkcPltUpQOnjXP76VUvIlitY+031hTUBabAvyY
 Sk7Uv6SIcuOSgVOK4Vz1c7w=
X-Google-Smtp-Source: APXvYqynoyH2re39DhTeCk3EnXaqiL1bV3eoElmPeYE4VGss09frGcB2BvFdA4617Bo1yQU8QnyiDQ==
X-Received: by 2002:adf:c3d0:: with SMTP id d16mr27959062wrg.376.1580922150291; 
 Wed, 05 Feb 2020 09:02:30 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id 5sm531917wrc.75.2020.02.05.09.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 09:02:29 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>, perex@perex.cz, tiwai@suse.com,
 robh+dt@kernel.org
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-3-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7239e858-16b7-609f-c4e3-8135bee8450b@gmail.com>
Date: Wed, 5 Feb 2020 20:02:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1580380422-3431-3-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 jonathanh@nvidia.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 2/9] ASoC: tegra: add support for CIF
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

MzAuMDEuMjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Ci4uLgo+ICsjaW5jbHVk
ZSA8bGludXgvbW9kdWxlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPiArI2luY2x1
ZGUgInRlZ3JhX2NpZi5oIgo+ICsKPiArdm9pZCB0ZWdyYV9zZXRfY2lmKHN0cnVjdCByZWdtYXAg
KnJlZ21hcCwgdW5zaWduZWQgaW50IHJlZywKPiArCQkgICBzdHJ1Y3QgdGVncmFfY2lmX2NvbmYg
KmNvbmYpCj4gK3sKPiArCXVuc2lnbmVkIGludCB2YWx1ZTsKPiArCj4gKwl2YWx1ZSA9IChjb25m
LT50aHJlc2hvbGQgPDwgVEVHUkFfQUNJRl9DVFJMX0ZJRk9fVEhfU0hJRlQpIHwKPiArCQkoKGNv
bmYtPmF1ZGlvX2NoIC0gMSkgPDwgVEVHUkFfQUNJRl9DVFJMX0FVRElPX0NIX1NISUZUKSB8Cj4g
KwkJKChjb25mLT5jbGllbnRfY2ggLSAxKSA8PCBURUdSQV9BQ0lGX0NUUkxfQ0xJRU5UX0NIX1NI
SUZUKSB8Cj4gKwkJKGNvbmYtPmF1ZGlvX2JpdHMgPDwgVEVHUkFfQUNJRl9DVFJMX0FVRElPX0JJ
VFNfU0hJRlQpIHwKPiArCQkoY29uZi0+Y2xpZW50X2JpdHMgPDwgVEVHUkFfQUNJRl9DVFJMX0NM
SUVOVF9CSVRTX1NISUZUKSB8Cj4gKwkJKGNvbmYtPmV4cGFuZCA8PCBURUdSQV9BQ0lGX0NUUkxf
RVhQQU5EX1NISUZUKSB8Cj4gKwkJKGNvbmYtPnN0ZXJlb19jb252IDw8IFRFR1JBX0FDSUZfQ1RS
TF9TVEVSRU9fQ09OVl9TSElGVCkgfAo+ICsJCShjb25mLT5yZXBsaWNhdGUgPDwgVEVHUkFfQUNJ
Rl9DVFJMX1JFUExJQ0FURV9TSElGVCkgfAo+ICsJCShjb25mLT50cnVuY2F0ZSA8PCBURUdSQV9B
Q0lGX0NUUkxfVFJVTkNBVEVfU0hJRlQpIHwKPiArCQkoY29uZi0+bW9ub19jb252IDw8IFRFR1JB
X0FDSUZfQ1RSTF9NT05PX0NPTlZfU0hJRlQpOwo+ICsKPiArCXJlZ21hcF91cGRhdGVfYml0cyhy
ZWdtYXAsIHJlZywgVEVHUkFfQUNJRl9VUERBVEVfTUFTSywgdmFsdWUpOwo+ICt9Cj4gK0VYUE9S
VF9TWU1CT0xfR1BMKHRlZ3JhX3NldF9jaWYpOwoKQXJlIHlvdSBnb2luZyB0byBhZGQgbW9yZSBz
dHVmZiBpbnRvIHRoaXMgc291cmNlIGZpbGUgbGF0ZXIgb24/CgpJZiBub3QsIHRoZW4gaXQncyB0
b28gbXVjaCB0byBoYXZlIGEgc2VwYXJhdGUgZHJpdmVyIG1vZHVsZSBqdXN0IGZvciBhCnNpbmds
ZSB0aW55IGZ1bmN0aW9uLCB5b3Ugc2hvdWxkIG1vdmUgaXQgaW50byB0aGUgaGVhZGVyIGZpbGUg
KG1ha2UgaXQKaW5saW5lKS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KQWxzYS1kZXZlbCBtYWlsaW5nIGxpc3QKQWxzYS1kZXZlbEBhbHNhLXByb2plY3Qu
b3JnCmh0dHBzOi8vbWFpbG1hbi5hbHNhLXByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8vYWxz
YS1kZXZlbAo=
