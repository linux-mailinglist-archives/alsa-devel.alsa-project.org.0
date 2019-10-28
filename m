Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBE1E720A
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 13:47:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E39001F1E;
	Mon, 28 Oct 2019 13:46:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E39001F1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572266853;
	bh=NFePAc5ignw/bvqW+hv5oi2/+mquvOU7Qel/TJuqNxM=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ti3L4bgzA/rbcpGQb4QJlfRBZzzSEfVXISjnBZptL+kJ8nLGPy0r+yczMNXhjvbnh
	 Q+DP2EEH7S501IxgWtYG3cWovyd0Jb0BuRP+cVqfOvxfdGZQi5s3PoJtxNKWNXBZRF
	 Bw8lV8eiDAsry9o9VEpJ0wiUV5J8snUS8igeo+YA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22450F80361;
	Mon, 28 Oct 2019 13:45:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23002F80361; Mon, 28 Oct 2019 13:45:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C5A7F800E7
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 13:45:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C5A7F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ZoLU5m9G"
Received: by mail-wr1-x443.google.com with SMTP id r1so9719980wrs.9
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 05:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EjO3nRtZRcHpq4gF9qTCncUdsLaN7JBougyYjcKY6iQ=;
 b=ZoLU5m9GxdnwffSu0EW6y0pGEJD2St4BW1Or90pLKllhPiB4f1Di9B3e3e2mqGJjsq
 jsFx8WAxwcc9s/0IgrizLkXgBV5lcpT33SA8sFf2vGjv3kjC/qpC305pVj/XYl/YtpcI
 D6nlH9i0hwED/+2q7/04OYEVNE5pBpqM8rAZrlokoBQb1PeN69+gkewQ756V439YAp8r
 u37qbi4DkpziBHivr9HsgQ1VD9bcuK/oBIqFaia7N/bgibq5DGJDdqU/Tai48T7XcTVr
 OG7fyw4BHSSwOa1jfqymyccf2xA1Vq8/e+ECfuMMcK5s9tDdJjwk3JnJqopKM5cFSC4E
 VltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EjO3nRtZRcHpq4gF9qTCncUdsLaN7JBougyYjcKY6iQ=;
 b=HmrzJxB6L1lb/zLeu95gy27bTSB3AmpwnKn64Dcxw16b5enq206SDS5qrFT9h4dH/i
 5e6eDLbK5PD8V2aLfAJoW0UjejTPp5Km7kG5zqGSukbRreRAhVYxchtcV2af6M4chovR
 B5QxJlhB5Qj8U01HIvrr7PCFzAIh7DCRAf9sAi0/zXgCC343amfhrMfd8beNIVH0BdBz
 mnLqkPCa8LRvZXOkfMZa7RCC+Q6T9jtjIdDjCNf217jcaPgvzTKghkrDi1l+dPefiEfb
 LNDbzsNK9tvTQA5O5L8gH9heUq6VEhcIgEyX1bzbS2qYi1LwLIoJHYXYmNNcVqEqfEkS
 HkjQ==
X-Gm-Message-State: APjAAAWOFLHYdrQgfilFmT7ta0toFrDG4CsKnzlFTzl8BKnMm6WrDtWE
 IqPY03z7UJTYxGDzPq5u3drw/xNOmHo=
X-Google-Smtp-Source: APXvYqx5GBghFKmvy0FXn9fEAyKJ8U0QQT5f2YmoThu0wU+QHGSds58+7CTsU7u+9MwQhikla46hCQ==
X-Received: by 2002:adf:8011:: with SMTP id 17mr15418613wrk.367.1572266743355; 
 Mon, 28 Oct 2019 05:45:43 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id d2sm16183996wmd.2.2019.10.28.05.45.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Oct 2019 05:45:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh@kernel.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
 <20191025204338.GA25892@bogus>
 <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org>
Message-ID: <371955d9-ad2d-5ddc-31b4-710729feae42@linaro.org>
Date: Mon, 28 Oct 2019 12:45:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 lee.jones@linaro.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 01/11] ASoC: dt-bindings: add dt
 bindings for WCD9340/WCD9341 audio codec
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CgpPbiAyOC8xMC8yMDE5IDEyOjQwLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3RlOgo+IEl0cyBQ
aGFuZGxlLgo+IAo+IHNvbWV0aGluZyBsaWtlIHRoaXMgaXMgb2theT8KPiAKPiBzbGltLWlmYy1k
ZXY6Cj4gIMKgICRyZWY6ICcvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxl
LWFycmF5JwoKU29ycnkgdGhpcyBzaG91bGQgbm90IGJlIGFuIGFycmF5LCBzbyBzb21ldGhpbmcg
bGlrZSB0aGlzOgoKICAgc2xpbS1pZmMtZGV2OgogICAgIGRlc2NyaXB0aW9uOiBTTElNQnVzIElu
dGVyZmFjZSBkZXZpY2UgcGhhbmRsZQogICAgICRyZWY6ICcvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy9waGFuZGxlJwoKCj4gIMKgIGRlc2NyaXB0aW9uOiBTTElNQnVzIEludGVyZmFj
ZSBkZXZpY2UgcGhhbmRsZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFsc2EtcHJvamVjdC5v
cmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbHNh
LWRldmVsCg==
