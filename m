Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD8D154A22
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 18:17:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01DCA16C9;
	Thu,  6 Feb 2020 18:16:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01DCA16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581009456;
	bh=xdrY09A5oLj/iTU1CdriSH/LvxNLCpZEJM+tTz/CuYw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dgv7X3eprLGCfLjnvoHEXUxGXCOFlWsEQqQzxOkHsyrzdgVXellvl9rs2NbgX3Sxk
	 3vE1Z4sYaWBsaLxKGAXIR+LPrxYX7590L1bI6bhq7xtW7VCYpGyhBJBKclexcXJaom
	 q4sFerzDaMt/dtmY3TOZLX1/FgOF4GSs3zrZ65W0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B18CF80162;
	Thu,  6 Feb 2020 18:15:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26088F8015B; Thu,  6 Feb 2020 18:15:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0CBAF80059
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 18:15:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0CBAF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZyWX4Emr"
Received: by mail-lf1-x142.google.com with SMTP id 203so4649961lfa.12
 for <alsa-devel@alsa-project.org>; Thu, 06 Feb 2020 09:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IDKiaCf3ZWSIx1zkWLA7ZSXVihlqFh0aVDFgMk5ixMo=;
 b=ZyWX4Emr9pFEoNGFD10TYSRW9qYN1c0ShrFQ9dDXuoXtdOE373z6p4ixyACSxD17O1
 8cGGIY1nQWNoeSg1jdsHgYymI2+Pxf4Glnb/uELxUoCq7ttHEuGwip+n82hWBI3aOwCv
 FYWbVuWr7GNGi+E6FAlb2PTVpG16vozdDmCkLcsnmZ7Q7TQqr5NOUEpmG8un463GyUOx
 avXpZBsfb72tETgKHz2yOVvvk0T3256DIiMdslHAlYYjovJ4byxd2zbkY9nbOZQkJDnY
 XcEUxuOrkKrlUzagQ6X15E19vgfjZBdRONNZ29uaLDgEsv773bjcpf+N1rIJKZTnBUSE
 wgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IDKiaCf3ZWSIx1zkWLA7ZSXVihlqFh0aVDFgMk5ixMo=;
 b=YBNj2R+HIdwrC5t4pJwuypsTHDy8xsr0i3v8A095FjdIAKun41ua6oKStpCsxAdJA7
 L7L3swSF47A4L6lKhuONXgujewM6g/Ho21w5uzvgQJH/YyUoWOzaW6wj+jAQNcjssQsr
 q0HvOVPw8hvwlOM7K5s4myRk0l9A/asQoQo6lwALrIQARF5acvWf9fEbbUiEQMqowQ23
 Cpq7p15PNHByz7M8TUyS8QEar5+9tzDDZceR7LKUrazzGkHmuuLpgRUFi9SfSHIg/AdZ
 NJqOjugjn2r+RM5rJRi1+7ecGV2zshfVdvQB8MoBHuC5kE477nXAVN++zBtFo8dI+98Z
 Harw==
X-Gm-Message-State: APjAAAWW3eileacGamVv17PVcmQZSWtPuCPodlQId2m0S8w8gSYHvPEO
 sbHYs90zWJpx/4pwVJlBlH4=
X-Google-Smtp-Source: APXvYqzfPy8cc2Cd7kvDWo09wusjOhcwxocF4Z8NcvdXhaSCd8XBCArT0CfOOeEwmm5lKmtRonx8Dw==
X-Received: by 2002:ac2:43a7:: with SMTP id t7mr2362606lfl.125.1581009344755; 
 Thu, 06 Feb 2020 09:15:44 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id y11sm26174lfc.27.2020.02.06.09.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 09:15:44 -0800 (PST)
To: Sameer Pujar <spujar@nvidia.com>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-7-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f8ed8c4a-af40-44b2-b720-4d3a9b660fda@gmail.com>
Date: Thu, 6 Feb 2020 20:15:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1580380422-3431-7-git-send-email-spujar@nvidia.com>
Content-Language: en-US
Cc: jonathanh@nvidia.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, atalambedu@nvidia.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 6/9] ASoC: tegra: add Tegra186 based
	DSPK driver
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

MzAuMDEuMjAyMCAxMzozMywgU2FtZWVyIFB1amFyINC/0LjRiNC10YI6Cj4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgZGV2X3BtX29wcyB0ZWdyYTE4Nl9kc3BrX3BtX29wcyA9IHsKPiArCVNFVF9SVU5U
SU1FX1BNX09QUyh0ZWdyYTE4Nl9kc3BrX3J1bnRpbWVfc3VzcGVuZCwKPiArCQkJICAgdGVncmEx
ODZfZHNwa19ydW50aW1lX3Jlc3VtZSwgTlVMTCkKPiArCVNFVF9MQVRFX1NZU1RFTV9TTEVFUF9Q
TV9PUFMocG1fcnVudGltZV9mb3JjZV9zdXNwZW5kLAo+ICsJCQkJICAgICBwbV9ydW50aW1lX2Zv
cmNlX3Jlc3VtZSkKPiArfTsKCkNvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiB3aHkgZHJpdmVycyBu
ZWVkIHRoZSAibGF0ZSIgc3lzdGVtIHNsZWVwPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpBbHNhLWRldmVsIG1haWxpbmcgbGlzdApBbHNhLWRldmVsQGFs
c2EtcHJvamVjdC5vcmcKaHR0cHM6Ly9tYWlsbWFuLmFsc2EtcHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbHNhLWRldmVsCg==
